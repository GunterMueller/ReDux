%start global vardecl algorithm
aid [A-Za-z]+[_^~]*['*]*[0-9]*
 /* aid: ALDES identifier. */
%{ 
char text[80]="";   /* Buffer for optional command line argument. */
void skipcom()
/* Skip comment.  Read text until a closing `]' is found. Nested
comments are allowed. */
{
   int c;
   for (;;)
   {
      c=input();
      if (c==EOF) {fprintf(stderr,"EOF found within comment.\n"); exit(1); };
      if (c=='[') skipcom();
      if (c==']') return;
   };
};
%}
%%
 char vartype[80];   /* Buffer for variable type (`global' or `safe'). */
 BEGIN global;

<global>"["   { skipcom();};
<global>"global"|"safe"   { strcpy(vartype,yytext); BEGIN vardecl;}
<global>^" "{15,16}" "*({aid}" "*":="" "*)?{aid}("("|".")   BEGIN algorithm;
<global>.|\n   ;
<vardecl>{aid}   { printf("%s ",vartype); ECHO; printf(" %s\n",text); };
<vardecl>"."   BEGIN global;
<vardecl>"["   skipcom();
<vardecl>.|\n   ;
<algorithm>([^|]|("|"[^|]))   ;
<algorithm>"||"\ *\n   BEGIN global;
%%
main(argc,argv)
int argc;
char *(argv[]);
{
   if (argc>2) {fprintf(stderr,"Usage: aglobs [text]\n");   exit(1);};
   if (argc==2) 
   {
      if (strlen(argv[1])>79) {fprintf(stderr,"Text too long.\n"); exit(1);};
      strcpy(text,argv[1]);
   };
   yylex();
}

