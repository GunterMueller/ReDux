/* ##### OUTPUT ##### */
#ifndef EOF
#include <stdio.h>
#endif

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

extern int EJECT, OBUFF[OBUFFSIZE+1], OPOS, OUNIT, PRNTR;

void exit();
void CLOSE();

/* file_p[i] is the file pointer to the file connected to unit i
   if such a file exists, NULL otherwise. */
FILE *file_p[MAXUNIT]=
      { stderr,
        NULL, NULL, NULL, NULL, 
        stdin, stdout,
        NULL, NULL, NULL };

/* file_f[i] is a flag indicating that the file can read or written.
   file_f[i] = RO:  Read only
   file_f[i] = WO:  Write only. */
int file_f[MAXUNIT]=
    { WO, 
      0, 0, 0, 0,
      RO, WO,
      0, 0, 0 };

/* file_n[i] is a pointer to a string containing the file name
   on unit i if such a file exists, NULL otherwise. */
char *file_n[MAXUNIT]=
      { "Standard error stream",
        NULL, NULL, NULL, NULL,
        "Standard input stream", "Standard output stream",
        NULL, NULL, NULL };

/* file_d[i] is a pointer to the default file name which is used
   if the file has not been opened explicitly by a OPEN-statement. */
char *file_d[MAXUNIT]=
      { "file.0",
        "file.1", "file.2", "file.3", "file.4",
        "file.5", "file.6",
        "file.7", "file.8", "file.9" };

/* Temporary output buffer containing char representation of OBUFF. */
static char obuffc[OBUFFSIZE+2];   /* One char for newline and nullbyte. */

void wrt_ln(u,s)
int u;    /* Unit number. */
char s[]; /* Text to be written. */

/* Write line.  The string s is written to the stream 
   connected to unit u. If no stream is connected to unit u, a file 
   with default name is created and connected to this unit. */

{  if (u<0 || u>=MAXUNIT )   /* Unit number in range? */
   {  (void) fprintf(stderr,
              "wrt_ln: Unit number %d not allowed (0<= Unit number <%d).\n",
              u,MAXUNIT);
       exit(1);
   };

   /* Open file if not already open. */
   if ( file_p[u] == NULL )
   {  if ( file_n[u] == NULL )
         file_n[u]=file_d[u];
      file_p[u]=fopen(file_n[u],"w");
      if ( file_p[u] == NULL )
      {  (void) fprintf(stderr,"Cannot open file %s attached to unit %d.\n",
                 file_n[u],u);
         exit(1);
      };
      file_f[u]=WO;
   };

   if ( file_f[u] != WO )   /* Write access? */
   {  (void) fprintf(stderr,
              "Cannot write to file %s, it is opened for read access\n",
              file_n[u]);
      exit(1);
   };

   /* Write string. */
   if ( fputs(s,file_p[u]) == EOF || putc('\n',file_p[u]) == EOF )
   {  (void) fprintf(stderr,"Cannot write to file %s attached to unit %d.\n",
              file_n[u], u);
      exit(1);
   };
 }   /* This indentation is needed for ccsplit! */

void OUTPUT()
/* Output.   The text in OBUFF is written to the stream connected to
   the unit OUNIT. If no stream is connected to unit OUNIT, a file is
   created and connected to OUNIT.*/

{  int i;

   if ( OPOS == 0 )   /* Output buffer empty? */
      return;

   /* Copy integer-``string'' into char-string. */
   for (i=1;  i<=OPOS;  i++)
      obuffc[i-1] = OBUFF[i];
   obuffc[i-1] = '\0';

   if ( OUNIT != PRNTR )   /* Output not to printer. */
   {  wrt_ln(OUNIT,obuffc);
      if ( OUNIT == 6 )   /* Write on logfile if output to terminal. */
         wrt_ln(9,obuffc);
   } 
   else   /* Output to printer. */
   {  if ( EJECT == 1 )
      {  wrt_ln(OUNIT,"\f");   /* Write form feed. */
         EJECT=0;
      };
      wrt_ln(OUNIT,obuffc);
   }
 }   /* This indentation is needed for ccsplit! */

void OPEN(u,s)
int u;    /* Unit number. */
char s[]; /* File name. */
/* Open file.   A file with name s is adjoined to the unit number u.
   The file will be opened if a read/write operation is performed.
   This function replaces the Fortran standard function OPEN. */
{
   if (u<0 || u>=MAXUNIT )   /* Unit number in range? */
   {  (void) fprintf(stderr,
              "OPEN: Unit number %d not allowed. (0<= Unit number <%d).\n",
              u,MAXUNIT);
      exit(1);
   };
   if ( file_p[u] != NULL )   /* Unit number already used? */
      CLOSE(u);
   file_n[u]=s;
 }   /* This indentation is needed for ccsplit! */

void CLOSE(u)
int u;   /* Unit number. */
/* Close file.  The file adjoined to unit number u is closed.
   Replaces the Fortran standard function CLOSE. */
{
   if (u<0 || u>=MAXUNIT )   /* Unit number in range? */
   {  (void) fprintf(stderr,
              "CLOSE: Unit number %d not allowed. (0<= Unit number <%d).\n",
              u,MAXUNIT);
      exit(1);
   };

   if ( file_p[u] == NULL )   /* Is a file connected to unit u? */
   {  (void) fprintf(stderr,
              "CLOSE: There is no file attached to unit number %d.\n", u);
      exit(1);
   };

   /* Close and detach file. */
   if ( fclose(file_p[u]) == EOF )
   {  (void) fprintf(stderr,"Cannot close file %s attached to unit %d.\n",
              file_n[u],u);
      exit(1);
   };
   file_p[u]=NULL;
   file_n[u]=NULL;
}
