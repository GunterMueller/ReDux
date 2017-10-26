/********************************************************************************************
 * This file contains the ReDuX-scanner                                                     *
 * It must be translated using FLEX, as it uses some features which are not provided by     *
 * the standard LEX scanner generator!                                                      *
 * 10.05.95 C.Sinz                                                                          *
 ********************************************************************************************/

%{
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include "y.tab.h"

typedef int AOBJ;  	/* ALDES-objects are integers (or pointers to integers) */

/********** Exported functions **************************************************************/

/* prototypes */
int yylex(void);	/* main scanner function */
AOBJ YYINPT();		/* read next character from input stream */
void YYUNPT(AOBJ c);	/* put character c back to input stream */

/********** Imported ALDES-functions ********************************************************/

/* prototypes of imported functions */
/* imported from parsax.ald: */
extern AOBJ MKINDT(AOBJ name[], AOBJ len),	/* make identifier */
            MKNUM(AOBJ digits[], AOBJ len);	/* make number */
/* imported from symlist.ald: */
extern void STLUP(AOBJ dt, AOBJ c, AOBJ *token, AOBJ *coerc, AOBJ *yylval, AOBJ *n);
						/* symbol table look-up */
/* imported from extern.ald: */
extern AOBJ XTREAD(AOBJ function);		/* external object read */

/* imported from SAC-2 low-level: */
extern AOBJ CREAD(),				/* character read */
	    READ();				/* read next input line */

/* imported symbols: */
extern AOBJ ENDF;       /* ALDES end of file marker */
			/* return values from symbol table look-up: */
extern AOBJ DCS,	/* constant */
	    DVS,	/* variable */
	    DEF,	/* prefix operator */
	    DFF,	/* function operator */
	    DIF,	/* infix operator */
	    DPF,	/* postfix operator */
	    DLF,	/* lispfix operator */
	    DRF;	/* roundfix operator */
extern AOBJ STSYMB;     /* start symbol passed to lexical analyser, see below */
extern AOBJ ILINE;      /* ALDES line number counter */

/********** prototypes for local functions **************************************************/

AOBJ *yyconvert(char *s);	/* convert string to array of integers */

/********** local variables *****************************************************************/

AOBJ tok;		/* token number */
int idlen;		/* length of identifier found in symbol list */
int lac;                /* number of look-ahead characters */
int i;      		/* auxiliary variable */
extern int yylval;      /* 'value' of current token */
extern AOBJ currDT;     /* data type currently under construction */
static int currEnv,     /* current environment */
           dummyEnv;	/* dummy environment */
int *s;			/* string for identifier conversion */

/* for external terms */
static AOBJ fun;	/* coercion function */
static int coercion;	/* bool. val., indicates whether a scanned symbol is a coercion op. */
static AOBJ roundfix_open_read; /* opening external roundfix operator symbol already read */

/********** scanner adaption routines *******************************************************/

/* the lexical analyser is called by a wrapper function yylex()
 * defined later, which calls lexer().
 */

#undef YY_DECL
#define YY_DECL int lexer(void)

/* use SAC-2's CREAD instead of C's getch() and read only one
 * character at once.
 * The number of look-ahead characters `lac' is incremented. (See also
 * the definition of RETALAC below.
 */

#undef YY_INPUT
#define YY_INPUT(buf,result, max_size) \
   { \
     int c = CREAD(); lac++;\
     result = (ENDF ? YY_NULL : (buf[0] = c, 1)); \
   }

/* RETALAC: return after adapting number of look-ahead characters.
 * In order to get access to the number of look-ahead characers used by the scanner,
 * which is needed when an external (ALDES/SAC-2) parser is called, the following macro
 * decrements the number of look-ahead characters by the length of the scanned token.
 * It must be used whenever the scanner usually would return a token.
 */

#define RETALAC(tok)   { lac -= yyleng; return (tok); }


/********** end of C definition section *****************************************************/
%}

/********** regular definitions *************************************************************/

LETTER    [a-zA-Z]
DIGIT     [0-9]
EXTENSION [\!\@\$\^\&\*\_\+\|\~\[\]\{\}\'\"\.\/\?\>\\\#]
ALL       {EXTENSION}|{LETTER}|{DIGIT}|[\<\=\:\`\-\%]
SPECIAL   {EXTENSION}|\`{ALL}
SPECIALI  {SPECIAL}|[\<\=\:\-]
SPECIAL1  {SPECIAL}|[\<\=\-]
SPECIAL2  {SPECIAL}|[\<\=]
SPECIAL3  {SPECIAL}|[\<\=\-]
SPECIAL4  {SPECIAL}|[\:\-]
SPECIAL5  {SPECIAL}|[\<\-]
SPECORL   [\!\@\$\^\&\*\_\+\|\[\]\{\}\'\"\.\/\?\\\:\`\-]|\`{ALL}

/********** environments ********************************************************************/

/* external ALDES/SAC2 objects */
%x EXT FEXT LEXT
/* 'normal' term */
%x T
/* axioms: AX2='in' axiom, AX1='between' axioms */
%s AX1
%x AX2
/* datatype, context dependent, see manual.
    SP1: constant, variable, notation, thoery and associativity section
    SP2: operator and coercion section: signature
    SP3: operator and coercion section: operator identifier and colon
    SP4: precedence section
    SP5: external and property section */
%s SP1 SP2 SP3 SP4 SP5
/* operator relation operator list */
%s ORL

%%

 /* data type's tokens */
[ \v\t\n]+       lac -= yyleng;  /* eat up white spaces */
<AX1,AX2,T,INITIAL,SP1,SP2,SP3,SP4,SP5,ORL>"%%"	READ(); yyrestart(yyin); lac=0;  /*line-comment*/
DATATYPE         BEGIN(INITIAL);		RETALAC(DATATYPE);
SORT             BEGIN(INITIAL); 		RETALAC(SORT);
CONST            BEGIN(SP1);     		RETALAC(CONSTANT);
VAR              BEGIN(SP1);     		RETALAC(VARIABLE);
EXTERNAL         BEGIN(SP5); 			RETALAC(EXTERNAL);
OPERATOR         BEGIN(SP3);     		RETALAC(OPERATOR);
AXIOM            BEGIN(AX1);       		RETALAC(AXIOM);
NOTATION         BEGIN(SP1);     		RETALAC(NOTATION);	/* former FIXITY */
PREC             BEGIN(SP4);     		RETALAC(PRECEDENCE);
COERCION         BEGIN(SP3);     		RETALAC(COERCION);
THEORY           BEGIN(SP1);     		RETALAC(THEORY);       	/* former USTAT */
ASSOC            BEGIN(SP1);     		RETALAC(ASSOC);
PROPERTY         BEGIN(SP5);     		RETALAC(PROPERTY);
<SP2>"->" 	   				RETALAC(MAPSTO);
LEFT             				RETALAC(ALEFT);
RIGHT            				RETALAC(ARIGHT);
NONE             				RETALAC(ANONE);
XREAD            				RETALAC(XREAD);
XWRITE           				RETALAC(XWRITE);
XEQ              				RETALAC(XEQ);
XLT              				RETALAC(XLT);
PREFIX           				RETALAC(PREFIX);
FUNCTION					RETALAC(FUNCFIX);
POSTFIX          				RETALAC(POSTFIX);
INFIX            				RETALAC(INFIX);
LISP             				RETALAC(LISPFIX);
ROUNDFIX         				RETALAC(ROUNDFIX);
CONSTANT        				RETALAC(CONSTFIX);
AC               				RETALAC(UAC);
COM              				RETALAC(UCOM);
XINT             				RETALAC(XINT);
KBINDEX          				RETALAC(KBINDEX);
KBWEIGHT         				RETALAC(KBWEIGHT);
COERC						RETALAC(COERC);
XTERM						RETALAC(XTERM);
XFG						RETALAC(XFG);


<INITIAL,SP1,SP2,SP3,SP4,SP5,AX1>END		RETALAC(END);

,                				RETALAC(',');
<SP1,SP2,SP5,INITIAL>:	 			RETALAC(':');
<SP3>:		BEGIN(SP2);			RETALAC(':');
<SP1,SP3,SP4,SP5,ORL,INITIAL>;         		RETALAC(';');
<SP2>;		BEGIN(SP3);			RETALAC(';');
<SP4>\<          				RETALAC('<');
<SP4,SP5,INITIAL>=   				RETALAC('=');

 /* operator relation operator list section */
<ORL>">="					RETALAC(GEQ);
<ORL>"<="					RETALAC(LEQ);
<ORL>\>						RETALAC('>');
<ORL>\<						RETALAC('<');
<ORL>\~						RETALAC('~');
<ORL>\#						RETALAC('#');


<INITIAL,SP1,SP2,SP3,SP4,SP5,ORL>((`?=`?=)|(`%`?%)). RETALAC(ERR); /* no ids starting with == or %% */


 /* identifiers */
{LETTER}({LETTER}|{DIGIT})*             { yylval=MKIDNT(s=yyconvert(yytext), yyleng);
                                          free(s); RETALAC(IDENT);  }
<INITIAL>({LETTER}|{DIGIT}|{SPECIALI})+ { yylval=MKIDNT(s=yyconvert(yytext), yyleng);
                                          free(s); RETALAC(XIDENT); }
<SP1>({LETTER}|{DIGIT}|{SPECIAL1})+     { yylval=MKIDNT(s=yyconvert(yytext), yyleng);
                                          free(s); RETALAC(XIDENT); }
<SP2>({LETTER}|{DIGIT}|{SPECIAL2})+     { yylval=MKIDNT(s=yyconvert(yytext), yyleng);
                                          free(s); RETALAC(XIDENT); }
<SP3>({LETTER}|{DIGIT}|{SPECIAL3})+     { yylval=MKIDNT(s=yyconvert(yytext), yyleng);
                                          free(s); RETALAC(XIDENT); }
<SP4>({LETTER}|{DIGIT}|{SPECIAL4})+     { yylval=MKIDNT(s=yyconvert(yytext), yyleng);
                                          free(s); RETALAC(XIDENT); }
<SP5>({LETTER}|{DIGIT}|{SPECIAL5})+     { yylval=MKIDNT(s=yyconvert(yytext), yyleng);
                                          free(s); RETALAC(XIDENT); }
<ORL>({LETTER}|{DIGIT}|{SPECORL})+	{ yylval=MKIDNT(s=yyconvert(yytext), yyleng);
                                          free(s); RETALAC(XIDENT); }

<T,AX1,AX2>[ \v\t\n]+			lac -= yyleng; /* eat up white spaces */

 /* axiom's tokens */
<AX1>\[					RETALAC('[');
<AX1>\]					BEGIN(AX2); RETALAC(']');
<AX1>({DIGIT})+				yylval=MKNUM(yyconvert(yytext),yyleng); RETALAC(NUMBER);
<AX1>.					RETALAC(MISAXN);

<INITIAL,SP1,SP2,SP3,SP4,SP5,ORL>.	RETALAC(ERR);

 /* term's tokens */
<T,AX2>\(		RETALAC('(');
<T,AX2>\)		RETALAC(')');
<T,AX2>\,		RETALAC(',');
<T,AX2>;		if(currEnv==T) BEGIN(T); else BEGIN(AX1); RETALAC(';');
<AX2>==			RETALAC(EQUAL);
<T,AX2>.		{ /* symbol table look-up */
			  /* search in symbol table */
			  STLUP(currDT, yytext[0], &tok, &coercion, &yylval, &idlen);
                          /* adapt number of look-ahead characters */
                          lac -= idlen;
			  /* switch, depending on token */
			  if(tok==DCS) return CONST;
			  if(tok==DVS) return VAR;
			  /* `normal' operator */
			  if(!coercion)
			    {
			      if(tok==DEF) return PREFIXOP;
			      if(tok==DFF) return FUNOP;
			      if(tok==DIF) return INFIXOP;
			      if(tok==DPF) return POSTFIXOP;
			      if(tok==DLF) return LISPOP;
			      if(tok==DRF) { /* could be closing coercion roundfix operator */
					     if(roundfix_open_read) roundfix_open_read = 0;
					     return ROUNDOP; }
			      return TERMERR;
			    }
			  /* coercion operator */
			  if(tok==DEF) { BEGIN(EXT); fun=yylval; return XPREOP; }
			  if(tok==DFF) { BEGIN(FEXT); fun=yylval; return XFUNOP; }
			  if(tok==DLF) { BEGIN(LEXT); fun=yylval; return XLISPOP; }
			  if(tok==DRF)
			  { /* external roundfix operator */
			    /* NOTE: external roundfix operators can't be nested! */
			    if(!roundfix_open_read)
                            { /* opening roundfix operator */
			      BEGIN(EXT); fun=yylval;
                            }
                            /* toggle opening/closing roundfix symbol */
			    roundfix_open_read = 1 - roundfix_open_read;
			    return XROP;
			  }
			  return TERMERR;   /* unknown identifier */
			}
<EXT>.			{ /* external term parse */
		          /* push look-ahead characters back to input stream */
			  for(i=0; i<lac; i++) BKSP();
			  /* read external term, coercion function is `fun' */
			  yylval=XTREAD(fun);
			  /* reset input stream to continue with flex scanner */
			  yyrestart(yyin);
			  /* reset to caller's environment */
			  BEGIN(currEnv);
                          /* reset number of look-ahead characters */
                          lac=0;
			  return EXTERM;
			}
<FEXT>[ \v\t\n]*\(	BEGIN(EXT); RETALAC('(');
<FEXT>.			return MISPAR;

<LEXT>[ \v\t\n]+	lac -= yyleng; BEGIN(EXT); 
<LEXT>.			BEGIN(EXT);
%%

/********** wrapper functions for ALDES code ************************************************/

/* read the next character of the input stream */
int YYINPT()
{
  return input();
}

/* push the character c, which was read last, back to the input stream */
void YYUNPT(int c)
{
  unput(c);
}

/********** interface FLEX - YACC ***********************************************************/

/* Wrapper function to allow multiple start symbols.
 * The first call of the scanner yylex() from the parsing routine causes the
 * scanner to return a pseudo-token, which must have been set before by the
 * calling ReDuX-function.
 * These pseudo-tokens are STERM, SAXIOM, SDATATYPE,..., as below.
 * The value of the pseudo-token is encoded into the global variable STSYMB
 * which is set by the calling routine.
 * Depending on this token the parser is forced to start the specified parser.
 */

int yylex(void)
{
  int tok;

  if(STSYMB)
  { /* first token returned by yylex() must be a pseudo-token
       denoting a start symbol */
     yyrestart(yyin);  		/* reset input stream */
     lac=0;             	/* reset number of input characters */
     roundfix_open_read = 0; 	/* reset roundfix toggle */
     ILINE = 0;         	/* reset line number counter */
     switch(STSYMB)
       {
       case  1: tok = STERM; BEGIN(T); currEnv=T; break;
       case  2: tok = SAXIOM; BEGIN(AX2); currEnv=AX2; break;
       case  3: tok = SDATATYPE; currEnv=AX2; break;
       case  4: tok = SOPERATOR; BEGIN(SP2); break;
       case  5: tok = SOPSET; BEGIN(SP2); break;
       case  6: tok = SAXSET; BEGIN(AX1); currEnv=AX2; break;
       case  7: tok = SCONSTSET; BEGIN(SP1); break;
       case  8: tok = SVARSET; BEGIN(SP1); break;
       case  9: tok = SOPRELOPLIST; BEGIN(ORL); break;
       default: tok = ERR;   /* internal error (but not reported so!) */
       }
     STSYMB = 0;
     return tok;
  }
  else
  { /* normal lexical analyser */
    tok = lexer();
    /*printf("token: %d, yyleng=%d\n", tok,yyleng); printf("yylval: ");
    UWRITE(yylval);*/
    return tok;
  }
}


/********** conversion string -> array of int ***********************************************/

/* yyconvert converts a null-terminated string s to an array of
 * integers ai.
 * ai[0] is not used, because ALDES-arrays start with index 1.
 */
AOBJ *yyconvert(char *s)
{
  AOBJ *ai,*a;

  a = ai = malloc(sizeof(int)*(strlen(s)+1));
  if(a==NULL) { fprintf(stderr, "Couldn't allocate memory!\n"); exit(30); }
  while(*s) *(++ai)=*s++;

  return a;
}
