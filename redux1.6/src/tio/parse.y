/********************************************************************************************
 * This file contains the ReDuX-parser.                                                     *
 * It must be translated using YACC or an equivalent LR-parser generator.                   *
 * 09.05.95 C.Sinz									    *
 ********************************************************************************************/

%{
#include <stdio.h>

typedef int AOBJ;  	/* ALDES-objects are integers (or pointers to integers) */

/********** Exported functions **************************************************************/

/* prototypes */
AOBJ YYPARS(AOBJ dt);	/* main parser function */

/********** Interface to ALDES-routines *****************************************************/

/* prototypes of imported functions */

/* needed for tracing purpose only */
extern WRITE(), UWRITE(AOBJ obj);

/* imported from parsax.ald: */
extern AOBJ MKPRFT(AOBJ sig_obj, AOBJ term),		/* make prefix term */
            MKPOFT(AOBJ sig_obj, AOBJ term),		/* make postfix term */
            MKINFT(AOBJ sig_obj, AOBJ lt, AOBJ rt),	/* make infix term */
            MKFUNT(AOBJ sig_obj, AOBJ termlist),	/* make function term */
            MKLSPT(AOBJ sig_obj, AOBJ termlist),	/* make lispfix term */
            MKROFT(AOBJ sig_obj, AOBJ termlist),	/* make roundfix term */
            MKXT(AOBJ sig_obj, AOBJ object),		/* make external term */
            MKBRAT(AOBJ term),		/* make parenthesized term (bracket term) */
            MKTLST(AOBJ termlist, AOBJ term),		/* make term list */
            MKTLS1(AOBJ term),				/* make term list from term */
            MKTLS0(),					/* make empty term list */
            MKAX(AOBJ lt, AOBJ rt, AOBJ vlst, AOBJ nr),  /* make axiom */
            MKALST(AOBJ axlist, AOBJ axiom),		/* make axiom list */
            MKALS1(AOBJ axiom),				/* make axiom list from axiom */
	    MKOALS(AOBJ axiom_list),			/* make ordered axiom list */
	    GTPRSV(),					/* get parser variable dict. */
            MKVLST(AOBJ varnamelist, AOBJ typ),		/* make variable list */
            MKVLS2(AOBJ vlist1, AOBJ vlist2),		/* make variable list from lists */
 	    MKCLST(AOBJ constnamelist, AOBJ typ),	/* make constant list */
	    MKCLS2(AOBJ clist1, AOBJ clist2),           /* make constant list from lists */
	    MKOLST(AOBJ opnms, AOBJ domlist, AOBJ ran), /* make operator list */
	    MKOLS2(AOBJ olist1, AOBJ olist2),		/* make operator list from lists */
	    MKOP(AOBJ opname, AOBJ domlist, AOBJ ran),	/* make operator */
  	    MKCELS(AOBJ coname, AOBJ dom, AOBJ ran),	/* make coercion operator list */
	    MKCEL2(AOBJ colist1, AOBJ colist2),		/* make c.o.list from lists */
	    COEPP(AOBJ dt),			        /* update coercion operators */
	    MKILST(AOBJ idlist, AOBJ id),		/* make identifier list */
	    MKILS1(AOBJ id),				/* make id list from id */
	    MKILS0(),					/* make empty id list */
	    MKEXTL(AOBJ xsorts, AOBJ props),		/* make external type list */
	    MKXTL2(AOBJ xlist1, AOBJ xlist2),		/* make e.t. list from lists */
 	    MKEXPL(AOBJ oplist1, AOBJ oplist2),		/* make coercion prop. list */
	    MKEXTP(AOBJ prop, AOBJ alg),		/* make coercion property */
	    MKFXPL(AOBJ fixsym, AOBJ crs),		/* make fixity property list */
	    FXFIX(AOBJ dt, AOBJ opnames, AOBJ fplist),	/* fix fixity */
	    MKASPL(AOBJ assocprop),			/* make associativity prop. list */
	    FKASC(AOBJ dt, AOBJ opnames, AOBJ aplist),	/* fix associativity */
	    MKUSPL(AOBJ ustatprop),			/* make unif. status prop. list */
	    FXUST(AOBJ dt, AOBJ opnames, AOBJ uplist),	/* fix unification status */
	    MKPREC(AOBJ opnms1, AOBJ opnms2, AOBJ kind),/* make precedence */
	    MKPRCL(AOBJ plist, AOBJ opnames, AOBJ kind),/* make precedence list */
	    FXPREC(AOBJ dt, AOBJ preclist),		/* fix precedence */
	    MKPRPL(AOBJ proplist, AOBJ prop, AOBJ val),	/* make property list */
	    MKPRP1(AOBJ propsym, AOBJ val),		/* make prop. list from prop. */
	    FXPROP(AOBJ dt, AOBJ sig_objlist, AOBJ pl),	/* fix property */
	    MKEDT(),					/* make empty data type */
	    MKEDT2(AOBJ oldDT);				/* make empty dt from old one */
extern void RSTVAR(),					/* reset variables */
	    MKDTNM(AOBJ dt, AOBJ name),			/* make data type name */
	    MKDTSO(AOBJ dt, AOBJ sorts),		/* make data type sorts */
 	    MKDTXS(AOBJ dt, AOBJ xsorts),		/* make data type external sorts */
	    MKDTCO(AOBJ dt, AOBJ consts),		/* make data type constants */
	    MKDTVR(AOBJ dt, AOBJ vars),			/* make data type variables */
	    MKDTOP(AOBJ dt, AOBJ ops),			/* make data type operators */
	    MKDTCE(AOBJ dt, AOBJ coercionops),		/* make data type coercion ops */
	    MKDTAX(AOBJ dt, AOBJ axioms),		/* make data type axioms */
	    ODFFIX(AOBJ ops),				/* add default op. fixity */
	    RMDFFX(AOBJ dt);				/* remove default fixity */

/* imported from check.ald: */
extern AOBJ CHKARY(AOBJ term),				/* check arity of term */
	    CHKTYP(AOBJ term),				/* check types of term */
            CHKALS(AOBJ term),				/* check axiom's left hand side */
	    CHKAX(AOBJ axiom, AOBJ lhsv, AOBJ rhsv),	/* check axiom */
	    CHKVAR(AOBJ dt, AOBJ vars),			/* check variables */
	    CHKCNS(AOBJ dt, AOBJ consts),		/* check constants */
	    CHKOPS(AOBJ dt, AOBJ ops),			/* check operators */
	    CHKOP(AOBJ dt, AOBJ op),			/* check operator */
	    CHKCES(AOBJ dt, AOBJ coercion_ops),		/* check coercion ops */
	    CHKEXT(AOBJ dt, AOBJ external_types),	/* check external types */
	    CHKSRT(AOBJ dt, AOBJ sorts);		/* check types (sorts) */
extern void CHKUSC(AOBJ dt);				/* check for underscore */

/* imported from insert.ald: */
extern AOBJ INSOBJ(AOBJ dt, AOBJ objects),		/* insert objects into dt */
	    INSOB(AOBJ dt, AOBJ object);		/* insert object into dt */

/* imported from ambig.ald: */
extern void CHKAMB(AOBJ dt);				/* check dt for ambiguities */

/* imported from fxpras.ald: */
extern AOBJ FXPRAS(AOBJ term),				/* fix assoc. and prec. */
	    TRMBSO(AOBJ term);				/* remove bracket sig. objects */
extern void FLATAC(AOBJ term);				/* flatten AC infix term */


/* external ReDuX symbols for fixity, associativity, unification status
   and external interface */
extern AOBJ DEF, DFF, DIF, DPF, DLF, DCS, DRF;
extern AOBJ DLA, DRA, DNA, DAC, DCO;
extern AOBJ DXRA, DXWA, DXQA, DXLA, DXFG, DXTA, DXCO;

/* external ReDuX symbols for property declaration */
extern AOBJ DXIA, KBOI, KBOW;

/* ALDES stack for temporary ALDES variables */
extern AOBJ STACK[], INDEX;
extern void IUP();

/* ALDES line number counter & input buffer display */
extern AOBJ ILINE;
extern void DIBUFF();


/********** local variables *****************************************************************/

int ok;				/* variable for type check */
int axnr;               	/* counter for axioms */
AOBJ currDT;	 		/* current datatype */
AOBJ result; 			/* contains parsed term, axiom, data type,... */
AOBJ LV, RV;			/* axiom left resp. right hand side variables */

/********** local functions *****************************************************************/

AOBJ newo(AOBJ o, int f);	/* new local ALDES-object */
void yyerror(char *err_msg);	/* error reporting & recovery */
%}

/********** pseudo tokens **********/

%token STERM SAXIOM SDATATYPE SOPERATOR SOPSET SAXSET
%token SCONSTSET SVARSET SOPRELOPLIST

/********** "real" tokens provided by scanner **********/

%token DATATYPE SORT CONSTANT VARIABLE EXTERNAL OPERATOR AXIOM
%token NOTATION ASSOC PRECEDENCE COERCION END
%token IDENT XIDENT NUMBER MAPSTO ALEFT ARIGHT ANONE
%token XREAD XWRITE XEQ XLT XFG XTERM COERC THEORY UAC UCOM
%token PREFIX POSTFIX INFIX LISPFIX ROUNDFIX CONSTFIX
%token FUNCFIX PROPERTY XINT KBINDEX KBWEIGHT
%token LEQ GEQ

%token EQUAL

%left  INFIXOP
%left  PREFIXOP XPREOP
%left  POSTFIXOP
%token FUNOP LISPOP XFUNOP XLISPOP
%token ROUNDOP XROP
%token VAR CONST EXTERM

%token ERR, TERMERR, MISAXN, MISPAR

%%

/********** Main parser rules ***************************************************************/

/* The pseudo tokens STERM, SAXIOM,... are provided by the scanner (without reading
 * any user-input) to select which sub-parser is to be invoked.
 * They are transmitted to the parser whenever a new  call to the parser is made
 * from an ALDES-program. See scan.l for details.
 */

start: STERM term				{ result=$2; INDEX--; YYACCEPT;		}
     | SAXIOM axiom 				{ result=$2; INDEX--; YYACCEPT;		}
     | SDATATYPE datatype                       { result=$2; INDEX--; YYACCEPT;		}
     | SOPERATOR operator			{ result=$2; INDEX--; YYACCEPT;		}
     | SOPSET opset				{ result=$2; INDEX--; YYACCEPT;		}
     | SAXSET axset				{ result=$2; INDEX--; YYACCEPT;		}
     | SCONSTSET constset			{ result=$2; INDEX--; YYACCEPT;		}
     | SVARSET varset				{ result=$2; INDEX--; YYACCEPT; 	}
     | SOPRELOPLIST opreloplist			{ result=$2; INDEX--; YYACCEPT;		}
     ;


/********** data type parser, start rule **********/
datatype: DATATYPE 				{ currDT=newo(MKEDT(),0);		}
		   xident ';' decls END		{ RMDFFX(currDT); CHKUSC(currDT);
						  MKDTNM(currDT,$3); CHKAMB(currDT);
                                                  COEPP(currDT); $$=currDT;		}
        | error 				{ YYABORT;				}
	;

/********** declarations **********/
decls: decls sortdecl				{ MKDTSO(currDT,$2); INDEX--;		}
     | decls externaldecl			{ MKDTXS(currDT,$2); INDEX--;		}
     | decls vardecl				{ MKDTVR(currDT,$2); INDEX--;		}
     | decls constdecl				{ MKDTCO(currDT,$2); INDEX--;		}
     | decls opdecl				{ MKDTOP(currDT,$2); INDEX--;		}
     | decls coerciondecl			{ MKDTCE(currDT,$2); INDEX--;		}
     | decls precdecl				{ /* nothing */				}
     | decls assocdecl				{ /* nothing */				}
     | decls notationdecl			{ /* nothing */				}
     | decls theorydecl				{ /* nothing */				}
     | decls propdecl				{ /* nothing */				}
     | decls axiomdecl				{ MKDTAX(currDT,$2); INDEX--;		}
     | /* epsilon */
     ;

sortdecl: SORT idents ';'			{ $$=$2;
						  ok=CHKSRT(currDT,$2); if(!ok)YYERROR; }
        ;

externaldecl: EXTERNAL externals		{ $$=$2;	 			}
            ;

vardecl: VARIABLE vars				{ $$=$2;				}
       ;

constdecl: CONSTANT consts			{ $$=$2;				}
         ;

opdecl: OPERATOR operators			{ ODFFIX($2); $$=$2;			}
      ;

coerciondecl: COERCION coercions		{ ODFFIX($2); $$=$2;			}
            ;

precdecl: PRECEDENCE precedences		{ /* nothing */				}
        ;

assocdecl: ASSOC assocs				{ /* nothing */				}
         ;

notationdecl: NOTATION notations		{ /* nothing */				}
       ;

theorydecl: THEORY theories	       		{ /* nothing */				}
         ;

propdecl: PROPERTY properties			{ /* nothing */				}
        ;

axiomdecl: AXIOM axioms				{ $$=$2;	 			}
         ;

externals: externals idents ':' extprops ';'	{ $$=newo(MKEXTL($2,$4),2);
						  ok=CHKEXT(currDT,$$); if(!ok)YYERROR;
						  $$=newo(MKXTL2($1,$$),2);		}
	 | idents ':' extprops ';'		{ $$=newo(MKEXTL($1,$3),2);
						  ok=CHKEXT(currDT,$$); if(!ok)YYERROR;	}
         ;

extprops: extprops ',' extprop		   	{ $$=newo(MKEXPL($1,$3),2);		}
	| extprop				{ $$=$1;				}
	;
	
extprop:  XREAD '=' IDENT			{ $$=newo(MKEXTP(DXRA,$3),0);		}
        | XWRITE '=' IDENT			{ $$=newo(MKEXTP(DXWA,$3),0);		}
        | XEQ '=' IDENT				{ $$=newo(MKEXTP(DXQA,$3),0);		}
	| XLT '=' IDENT      			{ $$=newo(MKEXTP(DXLA,$3),0);		}
        | XFG '=' IDENT				{ $$=newo(MKEXTP(DXFG,$3),0);		}
	| XTERM '=' IDENT			{ $$=newo(MKEXTP(DXTA,$3),0);		}
        ;

/********** variable section **********/
vars: vars xidents ':' IDENT ';' 		{ $$=newo(MKVLST($2,$4),1);
						  ok=CHKVAR(currDT,$$); if(!ok)YYERROR;
						  ok=INSOBJ(currDT,$$); if(!ok)YYERROR;
						  $$=newo(MKVLS2($1,$$),2);		}
    | xidents ':' IDENT ';'			{ $$=newo(MKVLST($1,$3),1);
						  ok=CHKVAR(currDT,$$); if(!ok)YYERROR;
						  ok=INSOBJ(currDT,$$); if(!ok)YYERROR;	}
    ;

/********** constant section **********/
consts: consts xidents ':' IDENT ';'		{ $$=newo(MKCLST($2,$4),1);
						  ok=CHKCNS(currDT,$$); if(!ok)YYERROR;
						  ok=INSOBJ(currDT,$$); if(!ok)YYERROR;
						  $$=newo(MKCLS2($1,$$),2);		}
      | xidents ':' IDENT ';'			{ $$=newo(MKCLST($1,$3),1);
						  ok=CHKCNS(currDT,$$); if(!ok)YYERROR;
						  ok=INSOBJ(currDT,$$); if(!ok)YYERROR;	}
      ;

/********** operator section **********/
operators: operators xidents ':' domainlist MAPSTO range ';'
						{ $$=newo(MKOLST($2,$4,$6),2);
						  ok=CHKOPS(currDT,$$); if(!ok)YYERROR;
						  ok=INSOBJ(currDT,$$); if(!ok)YYERROR;
						  $$=newo(MKOLS2($1,$$),2);		}
         | xidents ':' domainlist MAPSTO range ';' 
						{ $$=newo(MKOLST($1,$3,$5),2);
						  ok=CHKOPS(currDT,$$); if(!ok)YYERROR;
						  ok=INSOBJ(currDT,$$); if(!ok)YYERROR;	}
         ;

/********** coercion operator section **********/
coercions: coercions xident ':' domain MAPSTO range ';'
						{ $$=newo(MKCELS($2,$4,$6),0);
						  ok=CHKCES(currDT,$$); if(!ok)YYERROR;
						  ok=INSOBJ(currDT,$$); if(!ok)YYERROR;
						  $$=newo(MKCEL2($1,$$),2);		}
         | xident ':' domain MAPSTO range ';'	{ $$=newo(MKCELS($1,$3,$5),0);
						  ok=CHKCES(currDT,$$); if(!ok)YYERROR;
						  ok=INSOBJ(currDT,$$); if(!ok)YYERROR;	}
         ;

/********** precedence section **********/
precedences: precedences preclist ';'		{ ok=FXPREC(currDT,$2); INDEX--;
						  if(!ok) YYERROR;			}
           | preclist ';'			{ ok=FXPREC(currDT,$1); INDEX--;
						  if(!ok) YYERROR;			}
           ;

preclist: preclist '<' xidents			{ $$=newo(MKPRCL($1,$3,1),2);		}
        | preclist '=' xidents			{ $$=newo(MKPRCL($1,$3,0),2);		}
        | xidents '<' xidents			{ $$=newo(MKPREC($1,$3,1),2);		}
        | xidents '=' xidents			{ $$=newo(MKPREC($1,$3,0),2);		}
        ;

/********** associativity section **********/
assocs: assocs xidents ':' assoc ';'		{ ok=FXASC(currDT,$2,$4);
						  if(!ok) YYERROR; INDEX-=2;	 	}
      | xidents ':' assoc ';'			{ ok=FXASC(currDT,$1,$3);
						  if(!ok) YYERROR; INDEX-=2;	 	}
      ;

assoc: ALEFT					{ $$=newo(MKASPL(DLA),0);		}
     | ARIGHT					{ $$=newo(MKASPL(DRA),0);		}
     | ANONE					{ $$=newo(MKASPL(DNA),0);		}
     ;

/********** notation section **********/
notations: notations xidents ':' notation ';'	{ ok=FXFIX(currDT,$2,$4);
						  if(!ok) YYERROR; INDEX-=2; 		}
        | xidents ':' notation ';'		{ ok=FXFIX(currDT,$1,$3);
						  if(!ok) YYERROR; INDEX-=2; 		}
        ;

notation: PREFIX				{ $$=newo(MKFXPL(DEF,0),0);		}
        | FUNCFIX  				{ $$=newo(MKFXPL(DFF,0),0);		}
        | POSTFIX			       	{ $$=newo(MKFXPL(DPF,0),0);		}
        | INFIX					{ $$=newo(MKFXPL(DIF,0),0);		}
        | CONSTFIX			       	{ $$=newo(MKFXPL(DCS,0),0); 		}
        | LISPFIX			       	{ $$=newo(MKFXPL(DLF,0),0);		}
        | ROUNDFIX xident		       	{ $$=newo(MKFXPL(DRF,$2),0);		}
   ;

/********** unification status section **********/
theories: theories xidents ':' theory ';'	{ ok=FXUST(currDT,$2,$4);
						  if(!ok) YYERROR; INDEX-=2;	 	}
      | xidents ':' theory ';'			{ ok=FXUST(currDT,$1,$3);
						  if(!ok) YYERROR; INDEX-=2;	 	}
      ;

theory: UAC					{ $$=newo(MKUSPL(DAC),0);		}
      | UCOM					{ $$=newo(MKUSPL(DCO),0);		}
      ;

/********** property section **********/
properties: properties xidents ':' proplist ';'	{ ok=FXPROP(currDT,$2,$4);
						  if(!ok) YYERROR; INDEX-=2;		}
          | xidents ':' proplist ';'		{ ok=FXPROP(currDT,$1,$3);
						  if(!ok) YYERROR; INDEX-=2;		}
          ;

proplist: proplist ',' prop '=' value		{ $$=newo(MKPRPL($1,$3,$5),1);		}
        | proplist ',' IDENT '=' IDENT		{ $$=newo(MKPRPL($1,$3,$5),1);		}
        | prop '=' value			{ $$=newo(MKPRP1($1,$3),0);		}
        | IDENT '=' IDENT                       { $$=newo(MKPRP1($1,$3),0);             }
        ;

prop: XINT					{ $$=DXIA;				}
    | KBINDEX					{ $$=KBOI;				}
    | KBWEIGHT					{ $$=KBOW;				}
    | COERC					{ $$=DXCO;				}
    | XFG					{ $$=DXFG;				}
    ;

value: xident					{ $$=$1;				}
     ;

/********** auxiliary symbols for operator section **********/
domainlist: domainlist2				{ $$=$1;				}
          | /* epsilon */			{ $$=newo(MKILS0(),0);			}
          ;

domainlist2: domainlist2 ',' domain		{ $$=newo(MKILST($1,$3),1);		}
           | domain				{ $$=newo(MKILS1($1),0);		}
           ;

domain: IDENT					{ $$=$1;				}
      ;

range : IDENT					{ $$=$1;				}
      ;

/********** axiom section **********/
axioms: axioms2 				{ $$=newo(MKOALS($1),1);		}
      ;

axioms2: axioms2 axiom2				{ $$=newo(MKALST($1,$2),2); RSTVAR();	}
       | axiom2					{ $$=newo(MKALS1($1),1); RSTVAR(); 	}
       ; 

axiom2: '[' NUMBER ']' 				{ axnr=$2;				}
		      axiom3 ';'       		{ $$=$5;				}
     ;

axiom:						{ axnr=0; 				}
       axiom3 ';'				{ $$=$2;				}
     | error                                    { YYABORT;				}
     ;

axiom3: term2 					{ LV=GTPRSV(); ok=CHKALS($1);
						  if(!ok) YYERROR;             		}
              EQUAL term2			{ $$=newo(MKAX($1,$4,LV,axnr),2);
						  RV=GTPRSV(); ok=CHKAX($$,LV,RV);
						  if(!ok) YYERROR;			}
      ;

/********** term section **********/
term: term2 ';'        				{ $$=$1; 				}
    | error 	  				{ YYABORT; 				}
    ;

term2: term3                     		{ $$=newo(FXPRAS($1),1);
						  $$=newo(TRMBSO($$),1);
						  FLATAC($$); ok=CHKTYP($$); 
						  if(!ok) YYERROR;			}
     ;

term3: VAR 	             			{ $$=newo($1,0);            		}
     | CONST             			{ $$=newo($1,0);            		}
     | '(' term3 ')'      			{ $$=newo(MKBRAT($2),1);		}
     | prefixterm      				{ $$=$1;				}
     | postfixterm				{ $$=$1;				}
     | infixterm                 		{ $$=$1;				}
     | functionterm				{ $$=$1; ok=CHKARY($$);	if(!ok)YYERROR;	}
     | lispfixterm				{ $$=$1; ok=CHKARY($$); if(!ok)YYERROR;	}
     | roundfixterm             		{ $$=$1; ok=CHKARY($$);	if(!ok)YYERROR;	}
     | coercionterm				{ $$=$1;                    		}
     ;

prefixterm: PREFIXOP term3       		{ $$=newo(MKPRFT($1,$2),1);		}
          ;

postfixterm: term3 POSTFIXOP     		{ $$=newo(MKPOFT($2,$1),1);		}
           ;

infixterm: term3 INFIXOP term3    		{ $$=newo(MKINFT($2,$1,$3),2); 		}
         ;

functionterm: FUNOP '(' commatermlist ')'       { $$=newo(MKFUNT($1,$3),1);		}
            ;

lispfixterm: '(' LISPOP termlist ')' 		{ $$=newo(MKLSPT($2,$3),1);		}
           ;

roundfixterm: ROUNDOP commatermlist2 ROUNDOP	{ $$=newo(MKROFT($1,$2),1);
						  ok=CHKMCR($1,$3); if(!ok) YYERROR;	}
            ;

coercionterm: XROP EXTERM XROP           	{ $$=newo(MKXT($1,$2),0);
						  ok=CHKMCR($1,$3); if(!ok) YYERROR;	}
            | XROP EXTERM ROUNDOP           	{ $$=newo(MKXT($1,$2),0);
						  ok=CHKMCR($1,$3); if(!ok) YYERROR;	}
            | XPREOP EXTERM            		{ $$=newo(MKXT($1,$2),0);  		}
	    | XFUNOP '(' EXTERM ')'             { $$=newo(MKXT($1,$3),0);		}
            | '(' XLISPOP EXTERM ')'            { $$=newo(MKXT($2,$3),0);		}
            ;

commatermlist: commatermlist2                  	{ $$=$1;                    		}
             | /*epsilon*/                	{ $$=newo(MKTLS0(),0);      		}
             ;

commatermlist2: commatermlist2 ',' term3       	{ $$=newo(MKTLST($1,$3),2); 		}
     	      | term3                    	{ $$=newo(MKTLS1($1),1);    		}
              ;

termlist: termlist term3                 	{ $$=newo(MKTLST($1,$2),2); 		}
        | /* epsilon */                		{ $$=newo(MKTLS0(),0);      		}
        ;


/********** identifiers and id lists **********/
idents: idents ',' IDENT			{ $$=newo(MKILST($1,$3),1); 		}
      | IDENT					{ $$=newo(MKILS1($1),0);		}
      ;

xident: XIDENT					{ $$=$1;				}
      | IDENT					{ $$=$1;				}
      ;

xidents: xidents ',' xident 			{ $$=newo(MKILST($1,$3),1); 		}
       | xident					{ $$=newo(MKILS1($1),0);		}
       ;


/********** Special parser rules (for sub-section parsers) **********************************/

/********** Operator parser **********/

operator: 					{ currDT=newo(MKEDT2(currDT),0);	}
          operator2 ';'				{ $$=$2; INDEX--;			}
        | error					{ YYABORT;				}

operator2: xident ':' domainlist MAPSTO range
						{ $$=newo(MKOP($1,$3,$5),1);
						  ok=CHKOP(currDT,$$); if(!ok) YYERROR;
						  ok=INSOB(currDT,$$); if(!ok) YYERROR;	}
         ;

/********** Operator set parser **********/

opset:						{ currDT=newo(MKEDT2(currDT),0);	}
       operators 				{ ODFFIX($2); MKDTOP(currDT,$2);	}
                  fxaspr END			{ RMDFFX(currDT); $$=$2; INDEX--;	}
     | error					{ YYABORT;				}
     ;

fxaspr: fxaspr notationdecl			{ /* nothing */				}
      | fxaspr assocdecl			{ /* nothing */				}
      | fxaspr precdecl				{ /* nothing */				}
      | fxaspr theorydecl			{ /* nothing */				}
      | fxaspr propdecl 			{ /* nothing */				}
      | /* epsilon */
      ;

/********** Axiom set parser **********/

axset: axioms END				{ $$=$1;				}
     | error					{ YYABORT;				}
     ;

/********** Constant set parser **********/

constset: consts2 END				{ $$=$1;				}
	| error					{ YYABORT;				}
	;

consts2: consts2 xidents ':' IDENT ';'		{ $$=newo(MKCLST($2,$4),1);
						  ok=CHKCNS(currDT,$$); if(!ok)YYERROR;
						  $$=newo(MKCLS2($1,$$),2);		}
       | xidents ':' IDENT ';'			{ $$=newo(MKCLST($1,$3),1);
						  ok=CHKCNS(currDT,$$); if(!ok)YYERROR; }
       ;

/********** Variable set parser **********/

varset: vars2 END				{ $$=$1;				}
      | error					{ YYABORT;				}
      ;

vars2: vars2 xidents ':' IDENT ';' 		{ $$=newo(MKVLST($2,$4),1);
						  ok=CHKVAR(currDT,$$); if(!ok)YYERROR;
						  $$=newo(MKVLS2($1,$$),2);		}
     | xidents ':' IDENT ';'			{ $$=newo(MKVLST($1,$3),1);
						  ok=CHKVAR(currDT,$$); if(!ok)YYERROR; }
     ;


/********** Operator - relation - operator list parser **********/

opreloplist: xident relation xidents ';'	{ $$=newo(MKOROL($1,$2,$3),2);		}
           | ';'				{ $$=newo(1,0);				}
           | error				{ YYABORT;				}

relation: LEQ					{ $$=newo(MKREL(0),0);			}
        | GEQ					{ $$=newo(MKREL(1),0);			}
        | '~'					{ $$=newo(MKREL(2),0);			}
        | '#'					{ $$=newo(MKREL(3),0);			}
        | '>'					{ $$=newo(MKREL(4),0);			}
        | '<'					{ $$=newo(MKREL(5),0);			}
        ;

%% 

/********** caller's interface ALDES - YACC *************************************************/

/* YYPARS() is to be invoked from ALDES-code, dt is a data type or
 * an empty list if a datatype is to be parsed.
 * It returns an ALDES object (e.g. term, axiom, data type,...)
 * if no parse error occurred, and 0 otherwise.
 */

AOBJ YYPARS(AOBJ dt)
{
  AOBJ i;
  int error;

  i=INDEX;		/* remember stack pointer */

  currDT = dt;		/* set current data type */
  error = yyparse();	/* start parsing */

  if(error)
    {
      if(i>INDEX) { printf("Fatal ALDES-stack error !!!\n"); exit(20); }
      INDEX=i; /* fix aldes stack */
      return 0;
    }

  if(i!=INDEX) { printf("Stack error!!\n"); exit(10); }

  return result;	/* return parsed object */
}

/********** ALDES memory management support *************************************************/

/* New local ALDES object.
 * o is an aldes object (usually a list), that is returned unchanged.
 * f is an integer denoting how many stack cells can be freed
 * before pushing o onto the ALDES stack.
 * This is necessary to prevent the garbage collector from
 * crashing objects not residing on the ALDES stack.
 */
AOBJ newo(AOBJ o, int f)
{
  if(f==0) IUP(1); else IDN(f-1);        /* INDEX=INDEX-f+1; */
  STACK[INDEX] = o;

  return o;
}


/********** error recovery ******************************************************************/

/* yyerror() is used to print out syntactic error messages to the user.
 * On reading terms or axioms all following input upto a ';' is ignored,
 * on reading data types all input is skipped until the keyword 'END' is
 * encountered.
 */
 
void yyerror(char *s)
{
  printf("*** %s in line %d: ", s, ILINE);
  switch(yychar)
    {
    case DATATYPE:   printf("Unexpected keyword 'DATATYPE'.\n"); break;
    case SORT:       printf("Unexpected keyword 'SORT'.\n"); break;
    case CONSTANT:   printf("Unexpected keyword 'CONST'.\n"); break;
    case VARIABLE:   printf("Unexpected keyword 'VAR'.\n"); break;
    case EXTERNAL:   printf("Unexpected keyword 'EXTERNAL'.\n"); break;
    case OPERATOR:   printf("Unexpected keyword 'OPERATOR'.\n"); break;
    case AXIOM:      printf("Unexpected keyword 'AXIOM'.\n"); break;
    case NOTATION:   printf("Unexpected keyword 'NOTATION'.\n"); break;
    case PRECEDENCE: printf("Unexpected keyword 'PREC'.\n"); break;
    case COERCION:   printf("Unexpected keyword 'COERCION'.\n"); break;
    case THEORY:     printf("Unexpected keyword 'THEORY'.\n"); break;
    case ASSOC:      printf("Unexpected keyword 'ASSOC'.\n"); break;
    case PROPERTY:   printf("Unexpected keyword 'PROPERTY'.\n"); break;
    case END:        printf("Unexpected keyword 'END'.\n"); break;
    case MAPSTO:     printf("Unexpected '->'.\n"); break;
    case ALEFT:      printf("Unexpected keyword 'LEFT'.\n"); break;
    case ARIGHT:     printf("Unexpected keyword 'RIGHT'.\n"); break;
    case ANONE:      printf("Unexpected keyword 'NONE'.\n"); break;
    case XREAD:      printf("Unexpected keyword 'XREAD'.\n"); break;
    case XWRITE:     printf("Unexpected keyword 'XWRITE'.\n"); break;
    case XEQ:        printf("Unexpected keyword 'XEQ'.\n"); break;
    case XLT:	     printf("Unexpected keyword 'XLT'.\n"); break;
    case XTERM:      printf("Unexpected keyword 'XTERM'.\n"); break;
    case XFG:        printf("Unexpected keyword 'XFG'.\n"); break;
    case COERC:      printf("Unexpected keyword 'COERC'.\n"); break;
    case PREFIX:     printf("Unexpected keyword 'PREFIX'.\n"); break;
    case FUNCFIX:    printf("Unexpected keyword 'FUNCTION'.\n"); break;
    case POSTFIX:    printf("Unexpected keyword 'POSTFIX'.\n"); break;
    case INFIX:      printf("Unexpected keyword 'INFIX'.\n"); break;
    case LISPFIX:    printf("Unexpected keyword 'LISP'.\n"); break;
    case ROUNDFIX:   printf("Unexpected keyword 'ROUNDFIX'.\n"); break;
    case CONSTFIX:   printf("Unexpected keyword 'CONSTANT'.\n"); break;
    case UAC:        printf("Unexpected keyword 'AC'.\n"); break;
    case UCOM:       printf("Unexpected keyword 'COM'.\n"); break;
    case XINT:       printf("Unexpected keyword 'XINT'.\n"); break;
    case KBWEIGHT:   printf("Unexpected keyword 'KBWEIGHT'.\n"); break;
    case KBINDEX:    printf("Unexpected keyword 'KBINDEX'.\n"); break;
    case IDENT:      printf("Unexpected identifier.\n"); break;
    case XIDENT:     printf("Unexpected special identifier.\n"); break;
    case EQUAL:      printf("Unexpected '=='.\n"); break;
    case INFIXOP:    printf("Unexpected infix operator.\n"); break;
    case PREFIXOP:   printf("Unexpected prefix operator.\n"); break;
    case FUNOP:      printf("Unexpected prefix operator.\n"); break;
    case POSTFIXOP:  printf("Unexpected postfix operator.\n"); break;
    case LISPOP:     printf("Unexpected lispfix operator.\n"); break;
    case ROUNDOP:    printf("Unexpected roundfix operator.\n"); break;
    case XROP:       printf("Unexpected external roundfix operator.\n"); break;
    case XFUNOP:     printf("Unexpected external function operator.\n"); break;
    case XPREOP:     printf("Unexpected external prefix operator.\n"); break;
    case XLISPOP:    printf("Unexpected external lispfix operator.\n"); break;
    case EXTERM:     printf("Unexpected external term.\n"); break;
    case VAR:        printf("Unexpected variable.\n"); break;
    case CONST:      printf("Unexpected constant.\n"); break;
    case '(':        printf("Unexpected '('.\n"); break;
    case ')':        printf("Unexpected ')'.\n"); break;
    case ',':        printf("Unexpected ','.\n"); break;
    case ';':        printf("Unexpected ';'.\n"); break;
    case ':':  	     printf("Unexpected ':'.\n"); break;
    case '<':	     printf("Unexpected '<'.\n"); break;
    case '>':	     printf("Unexpected '>'.\n"); break;
    case '=':	     printf("Unexpected '='.\n"); break;
    case '~':	     printf("Unexpected '~'.\n"); break;
    case '#':	     printf("Unexpected '#'.\n"); break;
    case LEQ:	     printf("Unexpected '<='.\n"); break;
    case GEQ:	     printf("Unexpected '>='.\n"); break;
    case '[':        printf("Unexpected '['.\n"); break;
    case ']':        printf("Unexpected ']'.\n"); break;
    case NUMBER:     printf("Unexpected number.\n"); break;
    case ERR:        printf("Illegal identifier.\n"); break;
    case TERMERR:    printf("Unknown identifier in term.\n"); break;
    case MISAXN:     printf("Missing axiom number.\n"); break;
    case MISPAR:     printf("Missing opening parenthesis '('.\n"); break;
    case 0:          printf("Unexpected end of file.\n"); break;
    default:         printf("\n"); break;
    }
  if(yychar) DIBUFF();
}
