[ *** Global Safe Variables ***]

[ ******************************************************************** ]
[ ***                       Important Note                         *** ] 
[ ***                       ==============                         *** ]
[ *** Do not use the following local variables:                    *** ]
[ ***                                           d*     (= DLS)     *** ]
[ ***                                           D'*    (= DPS)     *** ]
[ ***                                           D**    (= DSS)     *** ]
[ ***                                           D~*    (= DTS)     *** ]
[ *** The following choices of local variables may cause future    *** ]
[ *** clashes:                                                     *** ]
[ ***          d', d^, d~, d_, and                                 *** ]
[ ***          Dxy where x,y in {',*,^,~,_}                        *** ]
[ ******************************************************************** ]

[Symbols:]
      [Name:   Ext Name:    Kind:        Meaning/Mnemonic:             ]
      [=====   =========    =====        =================             ]
global DAC.  
safe   DAC.  [ "AC"        property     AC-status: unification status  ]
global DAK.
safe   DAK.  [             indicator    Algorithm key (interpreter)    ]
global DAS.
safe   DAS.  [ "AXIOMS"    grammarsym.  axiom symbol                   ]
global DAV.
safe   DAV.  [ "ARGVAR"    indicator    variable of argument type      ]
global DCB.
safe   DCB.  [ ")"         grammarsym.  closing bracket                ]
global DCM.
safe   DCM.  [ user        grammarsym.  comment symbol                 ]
global DCO.
safe   DCO.  [ "COM"       property     comutative: unification status ]
global DCR.
safe   DCR.  [ "ROUND"     indicator.   2nd ROUNDFIX Operator Symbol   ]
global DCS.
safe   DCS.  [ "CONST"     grammarsym.  constant symbol                ]
global DEF.
safe   DEF.  [ "PREFIX"    grammarsym.  Prefix symbol                  ]
global DES.
safe   DES.  [ "END"       grammarsym.  end symbol                     ]
global DFS.
safe   DFS.  [ "FIX"       indicator    Operator Fixing                ]
global DIF.
safe   DIF.  [ "INFIX"     grammarsym.  Infix Symbol                   ]
global DIS.
safe   DIS.  [ "POLY"      indicator    polynomial interpretation      ]
global DLF.
safe   DLF.  [ "LISP"      grammarsym.  Lisp notation symbol           ]
global DLS.
safe   DLS.  [ "-"         grammarsym.  link symbol                    ]
global DNS.
safe   DNS.  [ ":"         grammarsym.  enumeration symbol             ]
global DOB.
safe   DOB.  [ "("         grammarsym.  opening bracket                ]
global DOS.
safe   DOS.  [ "OPS"       grammarsym.  operator symbol                ]
global DPF.
safe   DPF.  [ "POSTFIX"   grammarsym.  Postfix symbol                 ]
global DPS.
safe   DPS.  [ "=="        grammarsym.  prooduction symbol             ]
global DRF.
safe   DRF.  [ "ROUNDDFIX" grammarsym.  Roundfix Symbol                ]
global DRS.
safe   DRS.  [ ","         grammarsym.  repeater symbol                ]
global DSH.
safe   DSH.  [ "HASH"      indicator    suitable for hashing           ]
global DSS.
safe   DSS.  [ "."         grammarsym.  seperator symbol               ]
global DST.
safe   DST.  [ "CSBTERM"   indicatol    constrained subterms           ]
global DTS.
safe   DTS.  [ "TYPE"      grammarsym.  type symbol                    ]
global DUS.
safe   DUS.  [ "USTAT"     indicator    unification status             ]
global DVS.
safe   DVS.  [ "VARS"      grammarsym.  variable symbol                ]
global DXR.
safe   DXR.  [ "EXT.RULE"  indicator    extension rule                 ]
global KIND.
safe   KIND. [             indicator    kind indicator                 ]
global IDENT.
safe   IDENT.[             property     identifyer: kind               ]
global XIDNT.
safe   XIDNT.[             property     extraordinary identifyer: kind ]
global INT.
safe   INT.  [             property     integer: kind                  ]
global GRSYM.
safe   GRSYM.[             property     grammar symbol: kind           ]
global FLAT.
safe   FLAT. [             indicator    external name                  ]
[* external *]
global DXT.
safe   DXT.  [ "EXTERNAL"  grammarsym.  external term symbol           ]
global DXDA.
safe   DXDA. [ "XDEC"      indicator    external type decompose algo   ]
global DXIA.
safe   DXIA. [ "XINT"      indicator    external type interpretation   ]
global DXLA.
safe   DXLA. [ "XLT"       indicator    external type less-than-algo   ]
global DXQA.
safe   DXQA. [ "XEQ"       indicator    external type equal algorithm  ]
global DXRA.
safe   DXRA. [ "XREAD"     indicator    external type read algorithm   ]
global DXWA.
safe   DXWA. [ "XWRITE"    indicator    external type write algorithm  ]
global DXOP.
safe   DXOP. [ "XTOO"      indicator    external type to operator      ]
global DXCO.
safe   DXCO. [ "COERC"     indicator    external type coercion operator]
global DXTA.
safe   DXTA. [ "XTERM"     indicator    external type
                                        term-from-external algorithm   ]
global DXFG.
safe   DXFG. [ "XFG"       indicator    external type free generator   ]
global DXCN.
safe   DXCN. [ "XCONSTRUCTORS" indicator external type constructors
                                        needed vor de-evaluation.]



[Variables used by parser.]
global SYM. safe SYM. [ Symbol scanned last. ]

[Symbols for term orderings.]
global KBOI.  safe KBOI.        [Knuth-Bendix ordering: operator index.]
global KBOW.  safe KBOW.       [Knuth-Bendix ordering: operator weight.]
global POASK. safe POASK. [Path-Ordering: undetermined relations.]
global POGEQ. safe POGEQ. [Path-Ordering: greater operators.]
global POLEQ. safe POLEQ. [Path-Ordering: smaller operators.]
global POSTS. safe POSTS. [Path-Ordering: lexicographical status.]

[Trace flags:]
global AATRC. safe AATRC. [Axiom application trace.]
global CETRC. safe CETRC. [Counter example trace.]
global CPTRC. safe CPTRC. [Critical pair trace.]
global DLTRC. safe DLTRC. [Top set tree node deletion trace. ]
global EXTRC. safe EXTRC. [Node extension trace.]
global IETRC. safe IETRC. [Inessential critical pair trace.]
global PITRC. safe PITRC. [Polynomial interpretation ordering trace.]
global PNTRC. safe PNTRC. [Procedure name trace.]
global POTRC. safe POTRC. [Path ordering trace.]
global STRC.  safe STRC.         [Substitution trace.]
global TOTRC. safe TOTRC. [Term ordering trace.]
global TRC1. safe TRC1.   [Formula reduction trace.]
global TRC2. safe TRC2.   [Theorem derivation trace.]
global TRC3. safe TRC3.   [Proved  theorems  trace.]
global AUTOM. safe AUTOM.       [Automatic mode flag.]
global TETRC. safe TETRC. [Term evaluation trace.]

[Global time accumultators.]
global CTI. safe CTI.  [Copy time.]
global ETI. safe ETI.  [Evaluation time.]
global GTI. safe GTI.  [Ground reducibitilty test time.]
global MTI. safe MTI.  [Matching time.]
global OTI. safe OTI.  [Orientation time.]
global PTI. safe PTI.  [Preconditioning time.]
global RTI. safe RTI.  [Reduction time.]
global STI. safe STI.  [Scheduling time.]
global STPWT. safe STPWT. [Stop watch.]
global UTI. safe UTI.  [Unification time.]

[Global counters.]
global CC. safe CC.  [Connected pair counter.]
global MC. safe MC.  [Match counter.]
global NC. safe NC.  [term/node counter.]
global OC. safe OC.  [Orientation counter.]
global RC. safe RC.  [Redution counter.]
global UC. safe UC.  [Unification counter.]

[!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!]

[--- global variables for parser ---]

[global variables for operator properties
 DOA: operator associativity; DNA: none, DLA: left, DRA: right
 DOP: operator precedence]
global DOA. safe DOA.
global DOP. safe DOP.
global DNA. safe DNA.
global DLA. safe DLA.  
global DRA. safe DRA.

global DFF. safe DFF.    [fixity: function, i.e. prefix with braces]

[terms t in braces (safe terms) are terms with TCONT t and TSIGN
 DBS, where DBS is the bracket signature object.]
global DBS.              [bracket signature object]
global DBN. safe DBN.    [bracket object name]

[operator default indicator properties]
global DDF. safe DDF.    [default fixity; 1: default]

[global variable containing start symbol]
global STSYMB. safe STSYMB.
[parse variable dictionary for exchange: parser - ALDES]
global PDXVRS.

[ambiguity list property]
global DAM. safe DAM.    [ambiguity list]

[global variable containing output mode]
global OTMODE. safe OTMODE.

[Global variable containing information about normalization ]
[strategy.                                                  ]

global NSTR. safe NSTR.

