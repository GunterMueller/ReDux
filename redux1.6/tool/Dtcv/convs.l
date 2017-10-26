/* convs.l:
 * Convert signature part of data types, scanner.
 * 19.04.95 Carsten Sinz
 */

%{
/* The following #define must be removed when YACC is used instead of BISON
 * to translate the parser. Warnings in this case can be ignored.
 */
#define YYSTYPE char*

/* The following line must be inserted when YACC is used instead of BISON.
 */
/* extern char *yylval; */

#include <string.h>
#include "y.tab.h"

char c,str[256];
int i=0, firsttok=1;
char *comment;
int tkrd = 0;  /* token read? */
#undef YY_DECL
#define YY_DECL int lexer(void)

extern void prnl();

/*
^"%%"    { str[0]='%'; str[1]='%'; i=2; while((c=input())!='\n') str[i++]=c; str[i]=0;
            if(firsttok) { printf("%s\n", str); firsttok=0; } else printf("\n%s",str); }
*/

%}

LETTER    [a-zA-Z]
DIGIT     [0-9]
NUMBER    {DIGIT}+

NAME      {LETTER}({LETTER}|{DIGIT})*
SPECIAL   [\+\*\\/\$\!\"\#\%\&\'\;\<\>\?\@\[\]\^\_\`\{\|\}\~\=]
SNAME     {SPECIAL}({SPECIAL}|{DIGIT}|{LETTER})*

%%
[ \v\t]+
[\n]+     tkrd=0;
"%%"      { if(comment && tkrd) { str[0]=','; i=1; } else { str[0]='%'; str[1]='%'; i=2; }
            while((c=input())!='\n') str[i++]=c; str[i]=0;
            if(tkrd)
	      if(comment) strcat(comment,strdup(str)); else comment=strdup(str);
            else { if(comment) printf("\t%s",comment);
                   if(firsttok) printf("%s\n",str); else printf("\n%s",str);
                   comment=0; }
	    tkrd=0;
	  }
TYPE      tkrd=1; return TYPE;
EXTERNAL  tkrd=1; return EXTERNAL;
XREAD:    tkrd=1; return XREAD;
XWRITE:   tkrd=1; return XWRITE;
XEQ:      tkrd=1; return XEQ;
XLT:      tkrd=1; return XLT;
XTERM:    tkrd=1; return XTERM;
XFG:      tkrd=1; return XFGX;
CONSTS    tkrd=1; return CONSTS;
VARS      tkrd=1; return VARS;
AXIOMS    tkrd=1; return AXIOMS;
END       tkrd=1; return END;
OPS       tkrd=1; return OPS;
USTAT     tkrd=1; return USTAT;
FIX       tkrd=1; return FIX;
ROUND     tkrd=1; return ROUND;
XINT      tkrd=1; return XINT;
COERC     tkrd=1; return COERC;
XFG       tkrd=1; return XFG;
\(	  tkrd=1; return '(';
\)        tkrd=1; return ')';
\.        tkrd=1; return '.';
\,        tkrd=1; return ',';
\-        tkrd=1; return '-';
\:        tkrd=1; return ':';
==        tkrd=1; return EQUAL;
{NUMBER}  tkrd=1; yylval=strdup(yytext); return NUMBER;
{NAME}    tkrd=1; yylval=strdup(yytext); return IDENT;
{SNAME}   tkrd=1; yylval=strdup(yytext); return XIDENT;

%%

int yylex(void)
{ 
  int tok;

  yylval=NULL;
  tok = lexer();
/*  printf("Token: %d %s\n",tok, yylval);*/
  if(firsttok) firsttok=0;

  return tok;
}
