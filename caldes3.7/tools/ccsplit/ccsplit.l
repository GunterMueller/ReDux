%START alg noalg
%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
#define MAXFNUM 999   /* Largest number for creating a filename
                         zzz<fnum>.c */
#define MAXMAC 10
int l,r,i,macroi,fnum,
    macroi = 0, /* number of macros found so far */
    fnum = 0;   /* First unused number for creating a file name
                   zzz<fnum>.c */
char fname[100];   /* Name of output file. */
char macros[MAXMAC][100];  /* macro declarations (#include/#define)   */
FILE *opfile;   /* Output file. */
void mkfile();
%}
%%
 BEGIN noalg;
<noalg>^\/\*" "#####" "[A-Za-z0-9]+" "#####" "\*\/" "*\n {
            /* Find algorithm name. */
            for (l=0; ! isalnum(yytext[l]); l++)
               ;
            for (r=l; yytext[r] != ' '; r++)
               ;
            /* Store algorithm name in fname. */
            for (i=l; i<r; i++)
               fname[i-l]=( isupper(yytext[i]) ? tolower(yytext[i])
                                               : yytext[i]) ; 
            fname[r-l]='\0';
            mkfile(fname);
            for (i=1; i <= macroi; i++)
                { if ( fputs(macros[i],opfile) == EOF )
                     {  fprintf(stderr,"Cannot write to file %s",fname);
                        exit(1);
                     };
                };
            if ( fputs(yytext,opfile) == EOF /* ||
                 fputs("\n",opfile) == EOF*/ )
            {  fprintf(stderr,"Cannot write to file %s",fname);
               exit(1);
            };
            BEGIN alg;
          } 
<noalg>^" "*\n { ; /* Skip lines consisting of white space. */ }
<noalg>^\#include.*\n |
<noalg>^\#define.*\n   { macroi++; 
                         if ( macroi > MAXMAC )
                         { fputs("Maxiaml number of macros exceeded:\n",stderr);
                           fputs(yytext,stderr);
                           exit(1);
                         };
                         strcpy(macros[macroi],yytext);
                       }
<noalg>^.*\n  { fputs("Textline outside of algorithm encountered:\n",stderr);
               fputs(yytext,stderr);
               exit(1);
             }
<alg>^\}" "*\n   {  /* End of algorithm encountered. */
                   if ( fputs(yytext,opfile) == EOF ||
                        fputs("\n",opfile) == EOF )
                   { fprintf(stderr,"Cannot write to file %s",fname);
                     exit(1);
                   };
                   if ( fclose(opfile) == EOF)
                   { fprintf(stderr,"Cannot close output file %s",fname);
                     exit(1);
                   };
                   BEGIN noalg;
                }
<alg>^.*\n    {  /* Write one line to opfile. */
                if ( fputs(yytext,opfile) == EOF )
                {  fprintf(stderr,"Cannot write to file %s",fname);
                   exit(1);
                };
             }
%%
void mkfile(f)
char f[];
/* Make file.  f is filename. Then mkfile opens a file with this name
   if such a file doesn't exist already. Otherwise it tries to find an
   unused name of the form zzz<number>.c. If this succeeds, this file is
   opened. If there is no such file name, the programm is aborted.
   The filepointer to the opened file is stored in the global variable
   opfile. */
{
   strcat(f,".c");
   if ( printf("%s",f) == EOF )
   {  fputs("Cannot write to stdout.",stderr);
      exit(1);
   };
   /* Test if file aleady exists. */
   if ( access(f,F_OK) == -1  )   /* File does not exist. */
   {  if ( putchar('\n') == EOF )
      {  fputs("Cannot write to stdout.",stderr);
         exit(1);
      };
      if ( (opfile=fopen(f,"w")) != NULL )
         return;
      else
      {  fprintf(stderr,"Cannot open file %s\n",f);
         exit(1);
      }
   };  
   /* Find first unused file name of the form zzzddd.c
      where d are digits. */
   for ( ;  fnum<=MAXFNUM;  fnum++)
   {  sprintf(f,"zzz%03d.c",fnum);
      if ( (opfile=fopen(f,"r")) != NULL )   /* File already exists. */
      {  if ( fclose(opfile) == EOF)
         { fprintf(stderr,"Cannot close file %s\n",f); 
           exit(1);
         }
      }
      else   /* File doesn't exist. */
      {  if ( (opfile=fopen(f,"w")) != NULL )
         {  if ( printf(" already exists, put in %s\n",f) == EOF )
            {  fputs("Cannot write to stdout.",stderr);
               exit(1);
            };
            return;
         }
         else
         {  fprintf(stderr,"Cannot open file %s\n",f);
            exit(1);
         }
      }
    }
}
