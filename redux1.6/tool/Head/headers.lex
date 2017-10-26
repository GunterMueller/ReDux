%START glocom global header algo headcom firsts firstc comm hrest instrg exdec decom

%%
 int com;
 BEGIN global;
 com=0;

<global>"["      {com++;BEGIN glocom;}
<glocom>"["      com++;
<glocom>"]"      {com--;if (com == 0)  BEGIN global; }
<glocom>[^\[\]]*           ;
<glocom>[^\[\]]*\n         ;
<global>\n                 ;
<global>.                  ;
<global>^" "{15}" "*/[A-Za-z].*(\(|\.)   BEGIN header; 
<global>array      BEGIN exdec;
<global>const      BEGIN exdec;
<global>safe       BEGIN exdec;
<global>global     BEGIN exdec;
<global>instrinsic BEGIN exdec;
<global>pragma     BEGIN exdec;
<exdec>"["         {BEGIN decom; com++;}
<exdec>[^.\[]*             ;
<exdec>[^.\[]*\n           ;
<exdec>"."        BEGIN global;
<decom>"["      com++;
<decom>"]"      {com--;if (com == 0)  BEGIN exdec; }
<decom>[^\[\]]*           ;
<decom>[^\[\]]*\n         ;
<header>[A-Z][A-Za-z0-9]*/"." { ECHO; printf(" "); BEGIN hrest; }
<header>[A-Za-z][A-Za-z0-9'*^~_]*" "*":="" "*   ;
<header>[A-Z][A-Za-z0-9]*/"("   { ECHO; printf(" "); BEGIN hrest; }
<hrest>" "*"("[^)]*/")"    ;
<hrest>")"" "*\n   { BEGIN headcom; }
<hrest>"."" "*\n   { BEGIN headcom; }
<headcom>^" "*             ;
<headcom>^" "*\n           ;
<headcom>"["     {BEGIN firsts; com++; }
<headcom>[^ \[]  {printf("UNDOKUMENTED\n"); BEGIN algo;}
<firsts>". "\n   {printf("\n"); BEGIN comm;}
<firsts>". ]"    {printf("\n"); com--; BEGIN algo;}
<firsts>".  "    {printf("\n"); BEGIN comm;}
<firsts>"."\n    {printf("\n"); BEGIN comm;}
<firsts>".]"     {printf("\n"); com--; BEGIN algo;}
<firsts>"["      {ECHO; BEGIN firstc; com++; }
<firsts>\n       printf(" ");
<firsts>"]"      {printf(" BAD_SPECIFICATION\n"); com--; BEGIN algo;}
<firstc>"["      {ECHO; com++;}
<firstc>"]"      {ECHO; com--; if (com == 1) BEGIN firsts;}
<algo>[^|"'\[]*              ;
<algo>[^|"'\[]*\n            ;
<algo>"'"."'"                ;
<algo>'              ;
<algo>\"         BEGIN instrg;
<algo>"||"          BEGIN global;
<algo>"["        {com++; BEGIN comm;}
<comm>"["         com++;
<comm>"]"        {com--; if (com == 0)  BEGIN algo;}
<comm>[^\[\]]*               ;
<comm>[^\[\]]*\n             ;
<instrg>[^"]*               ;
<instrg>\"     BEGIN algo;

