/* ##### IO ##### */
/* io.c: Contains the function IO which is used to implement the
   the system dependent ALDES routines.
   The semantics is defined in fp.for.
   The global ALDES variable was renamed to ENDF.
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/*  #include "io.h" */

/* Start io.h */
/* This is the header file for input.c and output.c. */

#define MAXUNIT 10    /* Number of simulated i/o-units, ranging from 0 
                        to MAXUNIT-1. */
#define BUFFSIZE 256  /* Length of ALDES buffers (IBUFF/OBUFF). */

#define Read_only  0
#define Write_only 1

#define Input   0 
#define Create  1
#define Output  2 
#define Screen  3 
#define Cmdline 4
#define Open    5
#define Close   6
#define Environment 7
#define IOInit 8

/* End of io.h */

#include <time.h>
#include <sys/times.h>
int CLOCK();

/* uncomment one */
/*
     clock call for the SAC-2 system under Windows NT
     return ((int) ((clock()*1000)/CLOCKS_PER_SEC));
*/
/*
     clock call for the SAC-2 system ANSI C
     return ((int) ((clock()*1000)/CLK_TCK));
*/
/*
     clock call for the SAC-2 system under UNIX
     long acctime; struct tms tbuf;
     acctime = times(&tbuf);
     return (tbuf.tms_utime * 20);
*/

int CLOCK() {
/* returns the time since process startup in milliseconds */
     long acctime; struct tms tbuf;
     acctime = times(&tbuf);
     return (tbuf.tms_utime * 20);
} /* clock */

#define IOERR(number,strng,unit)                                       \
{                                                                      \
fprintf(stderr,"IO error number %d: %s %d\n",number,strng,unit);       \
 if ( LUNIT != MUNIT && LUNIT != 0 && f_ptr[LUNIT] != NULL )           \
 fprintf(f_ptr[LUNIT],"IO error number %d: %s %d\n",number,strng,unit);\
  exit(1);                                                            \
}

#define IOERRF(number,strng,unit)                                      \
{                                                                      \
fprintf(stderr,"IO error number %d: %s %s\n",number,strng,unit);       \
if ( LUNIT != MUNIT && LUNIT != 0 && f_ptr[LUNIT] != NULL )            \
fprintf(f_ptr[LUNIT],"IO error number %d: %s %s\n",number,strng,unit); \
  exit(1);                                                            \
}

int IO(u, k)
int u;
int k;

/* u is a unit number, k is for input=0, keyboard=1, output=2,
screen=3, cmdline=4, open=5, close=6, environment=7, IOinit=8. 
The result is 0 for ENDF, and 1 otherwise.
An exception is k=Cmdline with a negative value
for u. In this case the result is the number of arguments on
the command line. */
{ 
  extern int ECHO, ENDF, IBUFF[BUFFSIZE+1], IPOS, ISIZE, MUNIT, PRNTR;
/* CHANGE                              ^^ added */
  extern int EJECT, OBUFF[BUFFSIZE+1], OPOS, LUNIT, PRNTR;
/* CHANGE                         ^^ added */
  extern int ARGC;
  extern char * ARGV[20];

  int i, mode, n, result;
  char *s;
  char cbuff[BUFFSIZE];
   /* Temporary buffer containing char representation of IBUFF/OBUFF. */

  /* f_ptr[i] is the file pointer to the file connected to unit i
     if such a file exists, NULL otherwise. */
  static FILE *f_ptr[MAXUNIT]=
        { /* stderr */ NULL,
          NULL, NULL, NULL, NULL,
          /* stdin */ NULL, 
          /* stdout */ NULL,
          NULL, NULL, NULL };

  /* f_flag[i] is a flag indicating that the file can read or written.
     f_flag[i] = Read_only:  Read only
     f_flag[i] = Write_only:  Write only. */
  static int f_flag[MAXUNIT]=
      { Write_only,
        0, 0, 0, 0,
        Read_only, Write_only,
        0, 0, 0 };

    /* f_name[i] is a pointer to a string containing the file name
     on unit i if such a file exists, NULL otherwise. */
  static char *f_name[MAXUNIT]=
        { "Standard error stream",
          NULL, NULL, NULL, NULL,
          "Standard input stream", "Standard output stream",
          NULL, NULL, NULL };

  /* default_name[i] is a pointer to the default file name which is used
     if the file has not been opened explicitly by a OPEN-statement. */
  static char *default_name[MAXUNIT]=
        { "file.0",
          "file.1", "file.2", "file.3", "file.4",
          "file.5", "file.6",
          "file.7", "file.8", "file.9" };

   result=1;

   if ( k != Cmdline )
     if ( u<0 || u>=MAXUNIT )   /* Unit number in range? */
       IOERR(1,"u out of range, u=",u);

   if (k == Create) {
     mode=Write_only;
     k=Open;
   } else
   if (k == Open)
     mode=Read_only;

   switch (k)  {
     default:
       IOERR(2,"k out of range, k=",k);
     case Input: {

     if ( f_ptr[u] == NULL )    /* Open file if not already open. */
        i=IO(u,Open);

     if ( f_flag[u] != Read_only )    /* Read access? */
       IOERRF(3,"Cannot read from file (write only): ", f_name[u]);

     /* Read line. */
     if (fgets(cbuff,BUFFSIZE,f_ptr[u]) == NULL) {
       if ( feof(f_ptr[u]) ) {
         ENDF=1;
         IBUFF[1]='@';
         break;
      } else
         IOERRF(4,"Cannot read from file: ",f_name[u]);
    } else
    ENDF=0;

    n=strlen(cbuff);
    for (i=n;i;i--) {
      IBUFF[i]=cbuff[i-1];                     /* ALDES convention*/
      if ( IBUFF[i] < ' ' )                    /* Assume ASCII */
         IBUFF[i]=' ';                         /* strip control chars*/
    };

    for ( i=n+1; i<=ISIZE;  i++)          /* Append blanks. */
      IBUFF[i]=' ';
    break;
    };

    case Output: {

    /* The text in OBUFF is written to the stream connected to
       the unit u. If no stream is connected to u, a file is
       created and connected to u.*/

     if ( OPOS == 0 )   /* Output buffer empty? */
        break;

     /* Copy integer-``string'' into char-string. */
     for (i=1;  i<=OPOS;  i++)
        cbuff[i-1] = OBUFF[i];
     cbuff[i-1] = '\0';


     if ( f_ptr[u] == NULL )     /* Open file if not already open. */
	i=IO(u,Create);

     if ( f_flag[u] != Write_only )     /* Write access? */
        IOERRF(5,"Cannot write to file (read only): ",f_name[u]);

      /* Write string. */
      if ( u == PRNTR && EJECT == 1 ) {
        if ( fputs("\f",f_ptr[u]) == EOF )
          IOERRF(6,"cannot write to file: ",f_name[u]);
        EJECT=0;
      };
      if ( fputs(cbuff,f_ptr[u]) == EOF || putc('\n',f_ptr[u]) == EOF )
        IOERRF(6,"cannot write to file: ",f_name[u]);
      break;
    };

    case Screen: {
	break;
    };


    case Open: { /* A file with name in OBUFF[1,...,OPOS] is opened. */
       if ( f_ptr[u] != NULL )   /* if unit number already used, */
          i=IO(u,Close);         /* close */

       if ( OPOS>0 ) {           /* get non-NULL file name from OBUFF */
	 for (i=1; i<=OPOS; i++)
	   cbuff[i-1]=OBUFF[i];
	   cbuff[OPOS]='\0';
           f_name[u]=cbuff;
       }
       else
         f_name[u]=default_name[u];/* if NULL take default name */
       if (mode == Read_only)
         f_ptr[u]=fopen(f_name[u],"r");
       else
         f_ptr[u]=fopen(f_name[u],"w");
       if ( f_ptr[u] == NULL )
          IOERRF(8,"Cannot open file: ",f_name[u]);
       f_flag[u]=mode;
       break;
     };

      case Cmdline: {
        if ( u<0 ) {
          result=ARGC;
          break;
        };
        if ( u>=ARGC )
	  IOERR(9,"parameter number larger than ARGC=",ARGC);
        s=ARGV[u]; n=strlen(s); result=n;
        if ( n > ISIZE )
          IOERR(10,"command line argument too long: ",n);
        for ( i=1; i<=n; i++ )
          IBUFF[i]=s[i-1];
        for ( i=n+1; i<=ISIZE; i++)
          IBUFF[i]=' ';
        IPOS=0;
        break;
     };

      case Close: {
        if ( f_ptr[u] != NULL ) {
          if ( fclose(f_ptr[u]) == EOF )
            IOERRF(11,"cannot close file",f_name[u]);
          f_ptr[u]=NULL;
          f_name[u]=NULL;
        };
        break;
      };

      case Environment: {
       n = 0;
       if ( OPOS>0 ) {           /* get non-NULL name from OBUFF */
	      for (i=1; i<=OPOS; i++)
	         cbuff[i-1]=OBUFF[i];
	      cbuff[OPOS]='\0';
          s=getenv(cbuff); 
          if (s != 0) n=strlen(s);
       }; 
       result=n;
       if ( n > ISIZE )
          IOERR(10,"environment value too long: ",n);
       for ( i=1; i<=n; i++ )
          IBUFF[i]=s[i-1];
       for ( i=n+1; i<=ISIZE; i++)
          IBUFF[i]=' ';
       IPOS=0;
       break;
      };
     case IOInit: {
       /* for gcc 2.9x stdin, stdou and stderr are no constants and
          f_ptr fields cannot be initialized with these values.
       */
       f_ptr[0]=stderr; f_ptr[5]=stdin; f_ptr[6]=stdout;
      };
  };
  return result;
};
