%START coment algorithm global flag
%{

/* Last modification 29.1.1994 (Jochen Walter):
   Single pipe symbols (|) are now copied to the output files.
   (They can occur in comments, e.g. as notation for the absolute
   value.)
*/

#include <string.h>

char *tr(s) 
/* Transform string to lower case. */
char *s;
{
int j;
for (j=0;j<=strlen(s);j++) 
   if ('A'<=s[j] && s[j]<='Z') s[j]=s[j]-'A'+'a';
}
%}
%%
 int com, i, c;
 char name[20], hold[80];
 FILE *gin, *out,*gout, *fopen();
 gout = fopen("globals","w");
 if (gout == NULL) 
 {
    fprintf(stderr,"Error: Cannot open %s.","globals");
    fprintf(stderr," asplit aborted.\n");
    exit(1);
 }
 BEGIN global;
 com=0;

<global,coment>"["      {com++;BEGIN coment;REJECT;}
<global,coment>"]"      {com--;if (com == 0)  BEGIN global; REJECT; }
<global>^" "{15,16}" "*/[a-zA-Z].*(\(|\.)       {BEGIN flag;
                        fclose(gout);
                        strcpy(hold,yytext);
                        }
<flag>. {strcat(hold,yytext); /*Remember everything up to name of algorithm.*/
                        /*This can't be pushed out, because name of alg. is not */
                        /*known up to now.*/
                        }
<flag>[a-zA-Z][a-zA-Z0-9]*(\(|\.)       {yyless(yyleng-1); 
                        /*yytext contains name of algorithm*/
                        strcpy(name,yytext);strcat(name,".ald");tr(name);
                        fprintf(yyout,"Building: %s\n",name);
                        /*open new algorithm file:*/
                        out = fopen(name,"w");
                        if (out == NULL) 
                        {
                           fprintf(stderr,"Error: Cannot open %s.",name);
                           fprintf(stderr," asplit aborted.\n");
                           exit(1);
                        }
                        gin = fopen("globals","r");
                        if (gin == NULL) 
                        {
                           fprintf(stderr,"Error: Cannot open %s.","globals");
                           fprintf(stderr," asplit aborted.\n");
                           exit(1);
                        }
                        c = fgetc(gin);   /*Copy globals to algorithm file:*/
                        while (c != EOF) {fputc(c,out);c = fgetc(gin);}
                        fclose(gin);
                        /*Push out the hold-space:*/
                        fprintf(out,"%s",hold); 
                        fprintf(out,"%s",yytext);
                        BEGIN algorithm;
                        }
<algorithm>[^|] {
                        /*Copy to algorithm file*/
                        fprintf(out,"%s",yytext);
                        }
<algorithm>"||"\ *\n    {
                        /*End of alg. has been detected. Close alg.-file*/
                        /*and start global modus*/
                        fprintf(out,"%s",yytext);
                        fclose(out);
                        gout = fopen("globals","a");
                        if (gout == NULL) 
                        {
                           fprintf(stderr,"Error: Cannot open %s.","globals");
                           fprintf(stderr," asplit aborted.\n");
                           exit(1);
                        }
                        BEGIN global;
                        }
<algorithm>"|" {
                        /*Copy to algorithm file*/
                        fprintf(out,"%s",yytext);
                        }
<global,coment>.|\n     {/*copy global-text to globalfile*/
                        fprintf(gout,"%s",yytext);
                        }
