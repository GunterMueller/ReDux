/* ##### INPUT ##### */
/* input.c: Contains the function INPUT which is used to simulate the
   the corresponding Fortran routine. 
   The symbol EOF has two meanings in this file: 
   1) The macro EOF defined in stdio.h
   2) The global ALDES variable EOF
   Therefore, stdio.h is included after the declaration of the variable
   EOF, and the macro EOF is un- and redefined later in the file. */

#ifndef MAXUNIT
/* #include "io.h" */

/* start of "io.h" */
/* This is the header file for input.c and output.c. */

#define MAXUNIT 10    /* Number of simulated i/o-units, ranging from 0 
                        to MAXUNIT-1. */
#define RO 0          /* Read-only flag. */
#define WO 1          /* Write-only flag. */
#define OBUFFSIZE 132 /* Length of ALDES output buffer (OBUFF). */
#define IBUFFSIZE 80  /* Length of ALDES input buffer (IBUFF). */
/* end of "io.h" */

#endif

/* The macro auxiliary_EOF must have the same value as the macro EOF.
This is usually (but not necessary) (-1). */
#define auxiliary_EOF (-1)

#ifndef EOF
#include <stdio.h>
#endif

#include <string.h>

void exit();
void wrt_ln();

#undef EOF
extern int ECHO, EOF, IBUFF[IBUFFSIZE+1], ISIZE, IUNIT, MUNIT, PRNTR;
#define EOF auxiliary_EOF

extern FILE *file_p[MAXUNIT];
extern int   file_f[MAXUNIT];
extern char *file_n[MAXUNIT];
extern char *file_d[MAXUNIT];

static char ibuffc[IBUFFSIZE+2];

void rd_ln(u,s,n)
int  u;   /* Unit number. */
char s[]; /* Buffer for text. */
int  n;   /* Number of characters to be read. */

/* Read line.  Up to n characters are read from unit u and stored in
   s. (A line delimiter is not stored in s.) If no stream is connected 
   to unit u, a file with default name is opened. If such a file doesn't 
   exist, the program is aborted.  If a line contains more than n characters,
   the read line is truncated to the first n characters. The global
   variable EOF is set to 1 if no characters could be read since the end
   of the stream has been detected, otherwise EOF is set to 0. */

{  int i;

   /* Open file if not already open. */
   if ( file_p[u] == NULL )
   {  if ( file_n[u] == NULL )
         file_n[u]=file_d[u];
      file_p[u]=fopen(file_n[u],"r");
      if ( file_p[u] == NULL )
      {  (void) fprintf(stderr,"Cannot open file %s attached to unit %d.\n",
                 file_n[u],u);
         exit(1);
      };
      file_f[u]=RO;
   };

   if ( file_f[u] != RO )   /* Read access? */
   {  (void) fprintf(stderr,
              "Cannot read from file %s, it is opened for write access\n",
              file_n[u]);
      exit(1);
   };

#undef EOF
   EOF=0;

   /* Read line. */
   if (fgets(s,n+1,file_p[u]) == NULL)
   {  if ( feof(file_p[u]) )
      {
         EOF=1;
         s[0]=58;   /* ALDES representation for '@'. This character is rarely */
                    /* used, therefore it is likely to cause an error */
                    /* in most ALDES programs (if the program doesn't check */
                    /* the variable EOF). */
         s[1]='\0';
         return;
      }
      else
      {  (void) fprintf(stderr,
                 "Cannot read from file %s attached to unit %d\n",
                 file_n[u], u);
         exit(1);
      }
   };
#define EOF auxiliary_EOF

   i=strlen(s)-1;
   if ( i>=0 )
   {  if ( s[i] == '\n' )   /* Delete line delimiter if necessary. */
         s[i]='\0';
      else                  /* Skip rest of line. */
         while ( (i=getc(file_p[u])) != EOF && i != '\n' )
            if ( i == EOF && feof(file_p[u]) == 0 )
            {  (void) fprintf(stderr,
                       "Cannot read from file %s attached to unit %d\n",
                       file_n[u], u);
               exit(1);
            }
   }
 }   /* This indentation is needed for ccsplit! */

void INPUT()
/* Input.   The next line is read from the stream connected to
   the unit IUNIT. If no stream is connected to unit OUNIT, a file with
   name fort.<unit number> is opened and connected to OUNIT. If this succeeds,
   the input is taken from that file, otherwise the program is aborted. */

{  int i;

   rd_ln(IUNIT,ibuffc,ISIZE);

   /* Copy char-string into integer-``string''. */
   for ( i=0;  (ibuffc[i] != '\0') && (i<ISIZE);  i++ )
       IBUFF[i+1]=ibuffc[i];

   /* Append blanks. */
   for ( i++; i<=ISIZE;  i++)
      IBUFF[i]=' ';

   /* Write on logfile 9 if input from terminal and no echo. */
   if ( IUNIT == 5 && ECHO != 1 )   
      wrt_ln(9,ibuffc);

   if ( ECHO == 1 )   /* Additional echo output? */
      wrt_ln(MUNIT,ibuffc);
}
