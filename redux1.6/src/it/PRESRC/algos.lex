%START algoname iarguments oarguments junk
%{
/*==================================================================

 Input: on stdin expects a TOC-file, i.e. a file with one
        algorithm header per line
 Output: 1) on stdout for each  algorithm header of the input
            a line of the form
                 algo algoid algotype algoin algoout
            where algo is the algorithm name, algoid is a number
            which uniquely denotes an algorith with algoin input
            paramters, algotyp is 0 if algo is a procedure an 1 if
            it is a function, algoin is the number of input
            parameters of algo and algoout the number of output
            parameters of algo.
          2) the files
             fcalli.case, pcalli.case for 0 <= i <= 3 and
             fcall.case and pcall.case
             for each of the algorithm headers from the input there
             an entry of the form
                     <algoid> do <call of algo>;
             in one of these ?call*.case files.
             If algo is a procedure it is in a pcall*.case file
             else if algo is a function it is in fcall*.case file;
             if algoin < 4  the the entry is in a ?call<algoin>.case
             file otherwise in a ?call.case file.
             

==================================================================*/
#include <string.h>

/* ----------------------------------------------------------------
   open file <a>call<in>.case with option k 
   where <a> = "p" if t = 0 otherwise <a> = "f" and
         <in> = i if i < 4 otherwise <in> = ""
------------------------------------------------------------------*/
FILE *opencase(t,i,k)
     int t,i;
     char k[];
     {  char filename[80];
        if ( t == 0) 
           strcpy(filename,"p");
        else
           strcpy(filename,"f"); 
        strcat(filename,"call");
        switch (i)
        { case 0: strcat(filename,"0"); break;
          case 1: strcat(filename,"1"); break;
          case 2: strcat(filename,"2"); break;
          case 3: strcat(filename,"3"); break;
        }
        strcat(filename,".case");
        return fopen(filename,k);
     }

/* itoa: transform n to string s */
void itoa(n,s)
     int n;
     char s[];
     { int i,j,sign;
       char c;

       if  ((sign = n) < 0)      /* store sign */
           n = -n;                /* take absolute value */
       i = 0;
       do { /* generate digits from left to right */
            s[i++] = n % 10 + '0';
          } while ((n /= 10) > 0);
       if (sign < 0)
          s[i++] = '-'; 
       s[i] = '\0';
       /* reverse s */
       for (j=0, i=i-1; j<i;j++, i--)
           { c=s[j]; s[j]=s[i]; s[i]=c; }
     }
       
/*-----------------------------------------------------------
    make case line form
     algorithm name a, algorithm id n, algrothm type t,
     number of input parameters i and number of output 
     parameters o
------------------------------------------------------------*/
void mkcaseln(a,n,t,i,o,l)
     char a[],l[];
     int t,n,i,o;
     { 
      int j;
      char nu[80];

      itoa(n,nu); strcpy(l,nu);
      strcat(l," do ");
      if ( t == 1 )
        strcat(l,"r:=");
      strcat(l,a);
      strcat(l,"(");
      if ( i == 1 )
         strcat(l,"a1");
      if ( i == 2 )
         strcat(l,"a1,a2");
      if ( i == 3 )
         strcat(l,"a1,a2,a3");
      if ( i > 3 )
         { strcat(l,"a[1]");
           for (j=2;j<=i;j++)
               { strcat(l,",a["); itoa(j,nu); strcat(l,nu); strcat(l,"]"); }
         } 
      if ( (t == 0) && (o > 0) )
         { if (2 + strlen(l) + o*5 > 72 )
              strcat(l,";\n        r[1]");
            else
              strcat(l,";r[1]");
           for (j=2;j<=o;j++)
               { strcat(l,",r["); itoa(j,nu); strcat(l,nu); strcat(l,"]"); }
         }
      strcat(l,");\n");
     }
%}

id        [A-Z][A-Z0-9]*
oid       [A-Za-z][A-Z]*[~^_]*[*']*[0-9]*

%%
  int algotype;         /* algorithm type (function=1 / procedure = 0) */
  int algoid;           /* number of current algorithm                 */
  int algoin;           /* number of input parameters                  */
  int algoout;          /* number of output parameters                 */
  int maxfid[5];        /* maximum function number with index inputs   */
  int maxpid[5];        /* maximum procedure number with index inputs  */
  char algo[21];        /* algorithm name                              */
  FILE *fp;
  char caseline[255];   /* caseline to be entered in casefile          */
  int i,j,e;
  { for (i=0;i<=4;i=i+1) { maxfid[i] = 0; maxpid[i] = 0; }}
  { for (i=0;i<=1;i=i+1) 
        for (j=0;j<=4;j=j+1) fp=opencase(i,j,"w"); e=fclose(fp);
  }
  algotype=0;
  algoin=0;
  algoout=0;
  BEGIN algoname;

<algoname>^" "*{oid}":="" "*   { algotype=1; algoout=1;
                               }
<algoname>{id}         { strcpy(algo,yytext);
                         BEGIN iarguments;
                       }
","                    ;
"("                    ;
<iarguments>" "*{oid}" "*  { algoin++;
                           }
";"                   BEGIN oarguments;
<oarguments>" "*{oid}" "*  { algoout++;
                           }
")"                    {  if ( algoin < 4 )
                            { if (algotype == 1)
                               { maxfid[algoin]++; algoid=maxfid[algoin]; }
                              else
                               { maxpid[algoin]++; algoid=maxpid[algoin]; }
                              mkcaseln(algo,algoid,algotype,algoin,algoout,
                                       caseline);
                              fp=opencase(algotype,algoin,"a");
                              fprintf(fp,caseline);
                              e=fclose(fp);
                            }
                         else
                           { if (algotype == 1)
                               { maxfid[4]++; algoid=maxfid[4]; }
                             else
                               { maxpid[4]++; algoid=maxpid[4]; }
                              mkcaseln(algo,algoid,algotype,algoin,algoout,
                                       caseline);
                              fp=opencase(algotype,algoin,"a");
                              fprintf(fp,caseline);
                              e=fclose(fp);
                           }
                         printf("%s  %d  %d  %d  %d",
                                 algo,algoid,algotype,algoin,algoout);
                         BEGIN junk;
                       }
<junk>[ A-Za-z0-9:./]*      { BEGIN algoname;
                         algotype=0; algoin=0; algoout=0;
                       }

%%
