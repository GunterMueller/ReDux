# include "stdio.h"
# define U(x) x
# define NLSTATE yyprevious=YYNEWLINE
# define BEGIN yybgin = yysvec + 1 +
# define INITIAL 0
# define YYLERR yysvec
# define YYSTATE (yyestate-yysvec-1)
# define YYOPTIM 1
# define YYLMAX BUFSIZ
# define output(c) putc(c,yyout)
# define input() (((yytchar=yysptr>yysbuf?U(*--yysptr):getc(yyin))==10?(yylineno++,yytchar):yytchar)==EOF?0:yytchar)
# define unput(c) {yytchar= (c);if(yytchar=='\n')yylineno--;*yysptr++=yytchar;}
# define yymore() (yymorfg=1)
# define ECHO fprintf(yyout, "%s",yytext)
# define REJECT { nstr = yyreject(); goto yyfussy;}
int yyleng; extern char yytext[];
int yymorfg;
extern char *yysptr, yysbuf[];
int yytchar;
FILE *yyin = {stdin}, *yyout = {stdout};
extern int yylineno;
struct yysvf { 
	struct yywork *yystoff;
	struct yysvf *yyother;
	int *yystops;};
struct yysvf *yyestate;
extern struct yysvf yysvec[], *yybgin;
# define alg 2
# define noalg 4
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
# define YYNEWLINE 10
yylex(){
int nstr; extern int yyprevious;
BEGIN noalg;
while((nstr = yylook()) >= 0)
yyfussy: switch(nstr){
case 0:
if(yywrap()) return(0); break;
case 1:
{
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
break;
case 2:
{ ; /* Skip lines consisting of white space. */ }
break;
case 3:
case 4:
  { macroi++; 
                         if ( macroi > MAXMAC )
                         { fputs("Maxiaml number of macros exceeded:\n",stderr);
                           fputs(yytext,stderr);
                           exit(1);
                         };
                         strcpy(macros[macroi],yytext);
                       }
break;
case 5:
 { fputs("Textline outside of algorithm encountered:\n",stderr);
               fputs(yytext,stderr);
               exit(1);
             }
break;
case 6:
  {  /* End of algorithm encountered. */
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
break;
case 7:
   {  /* Write one line to opfile. */
                if ( fputs(yytext,opfile) == EOF )
                {  fprintf(stderr,"Cannot write to file %s",fname);
                   exit(1);
                };
             }
break;
case -1:
break;
default:
fprintf(yyout,"bad switch yylook %d",nstr);
} return(0); }
/* end of yylex */
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
int yyvstop[] = {
0,

7,
0,

2,
5,
0,

6,
7,
0,

5,
0,

4,
5,
0,

3,
5,
0,

1,
5,
0,
0};
# define YYTYPE char
struct yywork { YYTYPE verify, advance; } yycrank[] = {
0,0,	0,0,	4,7,	0,0,	
6,10,	7,7,	10,10,	32,32,	
0,0,	36,36,	0,0,	4,8,	
9,15,	6,11,	7,8,	10,16,	
32,35,	12,11,	36,38,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	19,22,	9,9,	6,12,	
22,25,	25,28,	6,13,	12,12,	
28,31,	31,34,	34,37,	14,19,	
37,39,	40,41,	41,42,	42,43,	
43,44,	4,7,	6,14,	6,10,	
7,7,	10,10,	32,32,	39,40,	
36,36,	44,45,	45,46,	46,47,	
47,48,	40,40,	48,49,	49,50,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	49,49,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
21,24,	13,17,	17,20,	20,23,	
29,32,	30,33,	13,18,	23,26,	
33,36,	24,27,	0,0,	18,21,	
26,29,	0,0,	0,0,	0,0,	
0,0,	0,0,	27,30,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	4,9,	0,0,	
0,0};
struct yysvf yysvec[] = {
0,	0,	0,
yycrank+0,	0,		0,	
yycrank+0,	0,		0,	
yycrank+0,	0,		0,	
yycrank+-1,	0,		0,	
yycrank+0,	0,		0,	
yycrank+-3,	0,		0,	
yycrank+-4,	0,		0,	
yycrank+0,	0,		yyvstop+1,
yycrank+-2,	yysvec+7,	0,	
yycrank+-5,	0,		0,	
yycrank+0,	0,		yyvstop+3,
yycrank+-7,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+0,	0,		yyvstop+6,
yycrank+0,	0,		yyvstop+9,
yycrank+-1,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+-2,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+-2,	yysvec+10,	0,	
yycrank+-2,	yysvec+10,	0,	
yycrank+-1,	yysvec+10,	0,	
yycrank+-5,	yysvec+10,	0,	
yycrank+-3,	yysvec+10,	0,	
yycrank+-5,	yysvec+10,	0,	
yycrank+-6,	yysvec+10,	0,	
yycrank+-6,	0,		0,	
yycrank+-7,	yysvec+10,	0,	
yycrank+-7,	yysvec+10,	0,	
yycrank+0,	0,		yyvstop+11,
yycrank+-8,	0,		0,	
yycrank+-12,	yysvec+10,	0,	
yycrank+0,	0,		yyvstop+14,
yycrank+-7,	yysvec+10,	0,	
yycrank+-13,	yysvec+10,	0,	
yycrank+-11,	yysvec+10,	0,	
yycrank+-12,	yysvec+10,	0,	
yycrank+-13,	yysvec+10,	0,	
yycrank+-22,	yysvec+10,	0,	
yycrank+-23,	yysvec+10,	0,	
yycrank+-27,	yysvec+10,	0,	
yycrank+-18,	yysvec+10,	0,	
yycrank+-15,	yysvec+10,	0,	
yycrank+-53,	yysvec+10,	0,	
yycrank+0,	0,		yyvstop+17,
0,	0,	0};
struct yywork *yytop = yycrank+126;
struct yysvf *yybgin = yysvec+1;
char yymatch[] = {
00  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,012 ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,'0' ,01  ,01  ,01  ,01  ,01  ,
01  ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,'0' ,01  ,01  ,01  ,01  ,01  ,
0};
char yyextra[] = {
0,0,0,0,0,0,0,0,
0};
#ifndef lint
static	char ncform_sccsid[] = "@(#)ncform 1.6 88/02/08 SMI"; /* from S5R2 1.2 */
#endif

int yylineno =1;
# define YYU(x) x
# define NLSTATE yyprevious=YYNEWLINE
char yytext[YYLMAX];
struct yysvf *yylstate [YYLMAX], **yylsp, **yyolsp;
char yysbuf[YYLMAX];
char *yysptr = yysbuf;
int *yyfnd;
extern struct yysvf *yyestate;
int yyprevious = YYNEWLINE;
yylook(){
	register struct yysvf *yystate, **lsp;
	register struct yywork *yyt;
	struct yysvf *yyz;
	int yych, yyfirst;
	struct yywork *yyr;
# ifdef LEXDEBUG
	int debug;
# endif
	char *yylastch;
	/* start off machines */
# ifdef LEXDEBUG
	debug = 0;
# endif
	yyfirst=1;
	if (!yymorfg)
		yylastch = yytext;
	else {
		yymorfg=0;
		yylastch = yytext+yyleng;
		}
	for(;;){
		lsp = yylstate;
		yyestate = yystate = yybgin;
		if (yyprevious==YYNEWLINE) yystate++;
		for (;;){
# ifdef LEXDEBUG
			if(debug)fprintf(yyout,"state %d\n",yystate-yysvec-1);
# endif
			yyt = yystate->yystoff;
			if(yyt == yycrank && !yyfirst){  /* may not be any transitions */
				yyz = yystate->yyother;
				if(yyz == 0)break;
				if(yyz->yystoff == yycrank)break;
				}
			*yylastch++ = yych = input();
			yyfirst=0;
		tryagain:
# ifdef LEXDEBUG
			if(debug){
				fprintf(yyout,"char ");
				allprint(yych);
				putchar('\n');
				}
# endif
			yyr = yyt;
			if ( (int)yyt > (int)yycrank){
				yyt = yyr + yych;
				if (yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transitions */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					goto contin;
					}
				}
# ifdef YYOPTIM
			else if((int)yyt < (int)yycrank) {		/* r < yycrank */
				yyt = yyr = yycrank+(yycrank-yyt);
# ifdef LEXDEBUG
				if(debug)fprintf(yyout,"compressed state\n");
# endif
				yyt = yyt + yych;
				if(yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transitions */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					goto contin;
					}
				yyt = yyr + YYU(yymatch[yych]);
# ifdef LEXDEBUG
				if(debug){
					fprintf(yyout,"try fall back character ");
					allprint(YYU(yymatch[yych]));
					putchar('\n');
					}
# endif
				if(yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transition */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					goto contin;
					}
				}
			if ((yystate = yystate->yyother) && (yyt= yystate->yystoff) != yycrank){
# ifdef LEXDEBUG
				if(debug)fprintf(yyout,"fall back to state %d\n",yystate-yysvec-1);
# endif
				goto tryagain;
				}
# endif
			else
				{unput(*--yylastch);break;}
		contin:
# ifdef LEXDEBUG
			if(debug){
				fprintf(yyout,"state %d char ",yystate-yysvec-1);
				allprint(yych);
				putchar('\n');
				}
# endif
			;
			}
# ifdef LEXDEBUG
		if(debug){
			fprintf(yyout,"stopped at %d with ",*(lsp-1)-yysvec-1);
			allprint(yych);
			putchar('\n');
			}
# endif
		while (lsp-- > yylstate){
			*yylastch-- = 0;
			if (*lsp != 0 && (yyfnd= (*lsp)->yystops) && *yyfnd > 0){
				yyolsp = lsp;
				if(yyextra[*yyfnd]){		/* must backup */
					while(yyback((*lsp)->yystops,-*yyfnd) != 1 && lsp > yylstate){
						lsp--;
						unput(*yylastch--);
						}
					}
				yyprevious = YYU(*yylastch);
				yylsp = lsp;
				yyleng = yylastch-yytext+1;
				yytext[yyleng] = 0;
# ifdef LEXDEBUG
				if(debug){
					fprintf(yyout,"\nmatch ");
					sprint(yytext);
					fprintf(yyout," action %d\n",*yyfnd);
					}
# endif
				return(*yyfnd++);
				}
			unput(*yylastch);
			}
		if (yytext[0] == 0  /* && feof(yyin) */)
			{
			yysptr=yysbuf;
			return(0);
			}
		yyprevious = yytext[0] = input();
		if (yyprevious>0)
			output(yyprevious);
		yylastch=yytext;
# ifdef LEXDEBUG
		if(debug)putchar('\n');
# endif
		}
	}
yyback(p, m)
	int *p;
{
if (p==0) return(0);
while (*p)
	{
	if (*p++ == m)
		return(1);
	}
return(0);
}
	/* the following are only used in the lex library */
yyinput(){
	return(input());
	}
yyoutput(c)
  int c; {
	output(c);
	}
yyunput(c)
   int c; {
	unput(c);
	}
