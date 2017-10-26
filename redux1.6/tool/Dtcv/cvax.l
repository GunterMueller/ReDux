/* Convert data types from old to new style, axiom part.
 * NOTE: All axioms must start on a separate line!
 *       Postfix operators at the end of an axiom must not
 *       start on a new separate line!
 */

%{
#include <stdio.h>

int parcnt = 0;   /* parentheses counter */
int equal  = 0;   /* equality sign '==' in axiom seen */
int eoa    = 0;   /* end of axiom */
char c;

%}

LETTER    [a-zA-Z]
DIGIT     [0-9]
NUMBER    {DIGIT}+

NAME      {LETTER}({LETTER}|{DIGIT})*
SPECIAL   [\+\*\\/\$\!\"\#\%\&\'\;\<\>\?\@\[\]\^\_\`\{\|\}\~]
SNAME     (\=?{SPECIAL}({SPECIAL}|\=|{DIGIT}|{LETTER})*)|\=

/* environments */

%x AXNR
%x AXIOM
%x FINAL

%%

<INITIAL>AXIOMS		printf("AXIOM"); BEGIN(AXNR);
<INITIAL,AXNR>END	printf("END"); BEGIN(FINAL);
<INITIAL>\n             /* ignore newlines */
<INITIAL>.	        /* ignore everything until "AXIOMS" occurred */
<AXNR>{NUMBER}		yytext[yyleng]=0; printf("[%s]", yytext);
<AXNR>\)	        parcnt=0; equal=0; eoa=0; BEGIN(AXIOM);
<AXNR>%% 	  	{ putchar(' '); putchar('%'); putchar('%');
                          while((c=input())!='\n') putchar(c); putchar('\n'); }
<AXNR>[ \v\t\n]+	printf("%s", yytext);
<AXIOM>{SNAME}|{NAME}   printf("%s", yytext); if(equal && parcnt==0) eoa=1;
<AXIOM>{NUMBER}         printf("%s", yytext); if(equal && parcnt==0) eoa=1;
<AXIOM>\(		printf("("); parcnt++; eoa=0;
<AXIOM>\)		printf(")"); --parcnt; if(equal && parcnt==0) eoa=1;
<AXIOM>\,		printf(",");
<AXIOM>==		printf("=="); equal=1;
<AXIOM>[ \t]*%%	        { if(eoa) { printf(";"); BEGIN(AXNR); }
		          putchar(' '); putchar('%'); putchar('%');
			  while((c=input())!='\n') putchar(c); putchar('\n'); }
<AXIOM>[ \v\t]+		printf("%s", yytext);
<AXIOM>\n		if(eoa) { printf(";\n"); BEGIN(AXNR); } else printf("\n");
<AXIOM>.                printf("???");
<FINAL>.		printf("%s",yytext);
%%
