# Project: Hardware Verification.
#    program name       : blif2rdx.awk
#                         gawk -f blif2rdx.awk filename
#    specification      : Blif2rdx translates BLIF into an 
#                         algebraic spezification for ReDuX.
#                         Output file: filename.2AS.
#                         The supported subset of BLIF:
#                         .model
#                            with .inputs .outputs .clock.
#                            Only one .model with one .clock is
#                            supported!
#                         .names
#                         .latch I O i
#                            with i in {0,1}.
#                         .latch I O i type control
#                            with i in {0,1}, type in {fe,re} and 
#                            control being a clockname.
#                            All .latch must have the same type
#                            and the same control. If .clock is
#                            defined in .model control must be
#                            this clock.
#    programmer         : Werner Lauterbach
#    language           : gawk
#    last change        : 28.01.93
#                         $Date:$
#                         by $Author:$
#    version            : $Revision:$
#    bugs               : none known

BEGIN {
# Initialisierung.
   FS=" "
   RS="\n"
   numVar=0
   numModInpVar=0
   numModOutpVar=0
   numRules=0
   numLatches=0
   numClocks=0
   mainModel=1
   modelName=""
   clock=""
   type=""
   errorStr=""
}

{

if (NR == 1) { # Liest File-Bezeichner.
   file=$2
}

if ($0 == "") { # Ueberspringt die Leerzeilen.
   getline
}

if ($1 == ".model") {
# Spezifikation: Wenn mainModel==1 (Es wird nur ein Modell, das"Hauptmodell"
#    unterstuetzt.), werden die in .input angegebenen Variablen in modInpVar[]
#    und die in .output in modInpVar[] abgelegt. Da nur eine Uhr unterstuetzt
#    wird, werden die Uhren in .clock gezaehlt und mit einer Fehlermeldung
#    abgebrochen, wenn mehr als eine Uhr erkannt wird.
# Input:
#    clock          string            Enthaelt den Namen der Uhr.
#    mainModel      boolean           1==true, wenn noch kein Modell vorkam.
#    numModInpVar   integer           Anzahl der Modell-Input-Variablen.
#    numModOutpVar  integer           Anzahl der Modell-Output-Variablen.
#    modInpVar[]    list of string    Modell-Input-Variablen.
#    modOutpVar[]   list of string    Modell-Output-Variablen.
# Output:
#    modelName      string            Enthaelt den Namen des "Hauptmodells".
# Variablen:
#    i              integer           Zaehler fuer Schleifen
#    numClocks      integer           Anzahl der Uhren.
# begin of .model
   if (mainModel == 1) {
      mainModel=0
      modelName=$2
      getline
      while (($1 == "")||($1 == ".inputs")||($1 == ".outputs")||($1 == ".clock")) {
         if ($1 == ".inputs") {
            i=2
            while (i < NF) {
               numModInpVar++
               modInpVar[numModInpVar]=$i
               i++
            }
            if ($NF != "\\") {
               numModInpVar++
               modInpVar[numModInpVar]=$NF
               getline
            } else {
               getline
               while ($NF == "\\") {
                  i=1
                  while (i < NF) {
                     numModInpVar++
                     modInpVar[numModInpVar]=$i
                     i++
                  }
                  getline                
               }
               while (i <= NF) {
                  numModInpVar++
                  modInpVar[numModInpVar]=$i
                  i++
               }
            }
         }
         if ($1 == ".outputs") {
            i=2
            while (i < NF) {
               numModOutpVar++
               modOutpVar[numModOutpVar]=$i
               i++
            }
            if ($NF != "\\") {
               numModOutpVar++
               modOutpVar[numModOutpVar]=$NF
               getline
            } else {
               getline
               while ($NF == "\\") {
                  i=1
                  while (i < NF) {
                     numModOutpVar++
                     modOutpVar[numModOutpVar]=$i
                     i++
                  }
                  getline                
               }
               while (i <= NF) {
                  numModOutpVar++
                  modOutVar[numModOutpVar]=$i
                  i++
               }
            }
         }
         if ($1 == ".clock") {
            i=2
            if (clock == "") {
               clock=$2
            }
            while (i < NF) {
                  numClocks++
                  i++               
            }
            if ($NF != "\\") {
               numClocks++
               i++
               getline
            } else {
               getline
            }
            while ($NF == "\\") {
               i=1
               while (i < NF) {
                  numClocks++
                  i++               
               }
               getline
            }
            while (i <= NF) {
                  numClocks++
                  i++               
            }
         }
         while ($1 == "") { getline }
      }
   } else {
      getline
      while (($1 == "")||($1 == ".inputs")||($1 == ".outputs")||($1 == ".clock")) {
         if ($1 == ".clock") {
            i=2
            if (clock == "") {
               clock=$2
            }
            while (i < NF) {
                  numClocks++
                  i++               
            }
            if ($NF != "\\") {
               numClocks++
               i++
               getline
            } else {
               getline
            }
            while ($NF == "\\") {
               i=1
               while (i < NF) {
                  numClocks++
                  i++               
               }
               getline
            }
            while (i <= NF) {
                  numClocks++
                  i++               
            }
         }
         while ($1 == "") { getline }
      }
   }
   if (numClocks > 1) {
      error("More then one clock is not realized in this implementation.")
      exit
   }
} # end of .model

if ($1 == ".names") {
# Spezifikation: Uebersetzt .name und speichert neu vorkommende Variablen ab.
# Input:
#    numRules       integer           Anzahl der Regeln fuer die algebraische
#                                     Spezifikation.
# Output:
#    rules[]        list of string    Regeln fuer die algebraische Spezifikation.
# Variablen:
#    numCurVar      integer           Anzahl der in .name vorkommenden Variablen.
#    pos            integer           Zaehler fuer Schleifen: Gibt die Position in der
#                                     Eingabezeile an.
# begin of .name
   numCurVar=0
   pos=2
   while (pos < NF) { 
      storeNewVar($pos)
      pos++
   }
   if ($NF != "\\") {
      storeNewVar($NF)
   } else {
      getline
      while ($NF == "\\") {
         pos=1
         while (pos < NF) { 
            storeNewVar($pos)
            pos++
         }
         getline
      }
      while (pos <= NF) { 
         storeNewVar($pos)
         pos++         
      }
   }
   makeRule() # Gleichung bilden und in rules[] ablegen.
} # end of .name

if ($1 == ".latch") {
# Spezifikation: Uebersetzt .latch und speichert neu vorkommende Variablen ab.
#    Allgemeine Form: .latch <input> <output> [<type> <control>][<init-val>]
#    Unterstuetzte Formen: .latch I O i                mit i in {0, 1}
#                          .latch I O i type control   mit i in {0, 1},
#                                 und type in { fe, re }. Alle .latch
#                                 den gleichen Type haben.
#                                 control: Die in der Variabelen clock
#                                 angegebene Uhr. Ist clock="", so wird
#                                 clock=control gesetzt.
# Input:
#    numVar         integer           Anzahl/Nummer der verschiedenen bereits 
#                                     in var[] eingelesenen Variablen.
#    numLatches     integer           Anzahl der Latches.
#    latches[]      list of string    Enthaelt die zu den Latches gehoerenden
#                                     Gleichungen.
# Output:
# Variablen:
#    outpVar        string            Bezeichner fuer die Output-Variable.
#    inpVar         string            Bezeichner fuer die Input-Variable.
#    listID         string            Identifikator der Liste (In, Out, V).
#    listPos        integer           Nummer der Variablen.
# begin of .latch
   if ($NF == "\\") {
      error("'\\' is not realized in this implementation of .latch!")
      exit
   }
   if (NF == 6) {                  # latch mit type ist re oder fe und control.
      if (clock == "") {
         clock=$5
      }
      if (type == "") {
         type=$4
      }
      if (type != $4 || clock != $5) {
	 printf("$4: "); printf($4)
	 printf("type: "); printf(type)
	 printf("$5: "); printf($5)
	 printf("clock: "); printf(clock)
         error("There are two incompartible types of .latch!")
         exit
      }
      if (type == $4 && clock == $5 && ($4 == "fe" || $4 == "re")) {
         if (knownVar($2) == 0) { # Output von knownVar: listID, listPos.
            storeNewVar($2)
            inpVar="V" numVar
         } else {
            inpVar=listID listPos
         }
         if (knownVar($3) == 0) { # Output von knownVar: listID, listPos.
            storeNewVar($3)
            outpVar="V" numVar
         } else {
            outpVar=listID listPos
         }
         if ($NF == "0") {                   # .latch I O type control 0
            numLatches++
            latches[numLatches]=outpVar "(0) == L"
            numLatches++
            latches[numLatches]=outpVar "(S(t)) == " inpVar "(t)"
         }
         if ($NF == "1") {                   # .latch I O type control 1
            numLatches++
            latches[numLatches]=outpVar "(0) == H"
            numLatches++
            latches[numLatches]=outpVar "(S(t)) == " inpVar "(t)"
         }
         if ($NF == "2") {                   # .latch I O type control 2
            error("This type (.latch I O type control 2) of latch is not realized in this implementation!")
            exit
         }
         if ($NF == "3") {                   # .latch I O type control 3
            error("This type (.latch I O type control 3) of latch is not realized in this implementation!")
            exit
         }
      }
      if ($4 == "ah" || $4 == "al" || $4 == "as") {    # type ist ah, al, as
         error("This type (.latch with type in {ah, al, as}) of latch is not realized in this implementation!")
         exit
      }
   }
   if (NF == "5") {                   # .latch I O 3
      error("This type (.latch type control I O) of latch is not realized in this implementation!")
      exit
   }
   if (NF == 4) {                       # .latch I O i
      if (type == "") {
        type="notdef"
      }
      if (type != "notdef") {
         error("There are two incompartible types of .latch!")
         exit
      } else {
         if (knownVar($2) == 0) { # Output von knownVar: listID, listPos.
            storeNewVar($2)
            inpVar="V" numVar
         } else {
            inpVar=listID listPos
         }
         if (knownVar($3) == 0) { # Output von knownVar: listID, listPos.
            storeNewVar($3)
            outpVar="V" numVar
         } else {
            outpVar=listID listPos
         }
         if ($NF == "0") {                   # .latch I O 0
            numLatches++
            latches[numLatches]=outpVar "(0) == L"
            numLatches++
            latches[numLatches]=outpVar "(S(t)) == " inpVar "(t)"
         }
         if ($NF == "1") {                   # .latch I O 1
            numLatches++
            latches[numLatches]=outpVar "(0) == H"
            numLatches++
            latches[numLatches]=outpVar "(S(t)) == " inpVar "(t)"
         }
         if ($NF == "2") {                   # .latch I O 2
            error("This type (.latch I O 2) of latch is not realized in this implementation!")
            exit
         }
         if ($NF == "3") {                   # .latch I O 3
            error("This type (.latch I O 3) of latch is not realized in this implementation!")
            exit
         }
      }
   }
   if (NF == 3) {                       # .latch I O entspricht .latch I O 3
      error("This type (.latch I O) of latch is not realized in this implementation!")
      exit
   }
} # end of .latch

#
# not implemented elements of BLIF
#

if ($1 == ".exdc") { # begin of .exdc
   error("External don't cares (.exdc) are not realized in this implementation!")
   exit
} # end od .exdc
if ($1 == ".gate") { # begin of .gate
   error("Gates (.gate) are not realized in this implementation!")
   exit
} # end of .gate
if ($1 == ".mlatch") { # begin of .mlatch
   error("mlatches (.mlatch) are not realized in this implementation!")
   exit
} # end of .mlatch
if ($1 == ".subckt") { # begin of .subckt
   error("Model (subcircuit) references (.subckt) are not realized in this implementation!")
   exit
} # end of .subckt
if ($1 == ".search") { # begin of .search
   error("Subfile references (.search) are not realized in this implementation!")
   exit
} # end of .search
if ($1 == ".start_kiss") { # begin of .start_kiss
   error("Finite state machine descriptions (.start_kiss) are not realized in this implementation!")
   exit
} # end of .start_kiss
if ($1 == ".cycle") { # begin of .cycle
   error("Clock constraints (.cycle) are not realized in this implementation!")
   exit
} # end of .cycle
if ($1 == ".clock_event") { # begin of .clock_event
   error("Clock constraints (.clock_event) are not realized in this implementation!")
   exit
} # end of .clock_event
if ($1 ~ /.area|.delay|.wire.*|.input_.*|.default_.*|.output_.*/) {
# begin of delay constraints
   error("Delay constraints are not realized in this implementation!")
   exit
} # end of delay constraints

}

function knownVar(variable) {
# Spezifikation:
#    Durchsucht die Listen inpVar, outpVar, modInpVar und modOutpVar nach
#    dem Vorkommen von variable. Wenn variable in einer der Listen vorkommt
#    wird 1=true zurueckgegeben, sonst 0=false.
# Input:   
#    numInpVar      integer           Anzahl der Variablen.
#    numModInpVar   integer           Anzahl der Modell-Input-Variablen.
#    numModOutpVar  integer           Anzahl der Modell-Output-Variablen.
#    var[]          list of string    Variablen.
#    modInpVar[]    list of string    Modell-Input-Variablen.
#    modOutpVar[]   list of string    Modell-Output-Variablen.
# Output:
#    listID         string            Identifikator der Liste (In, Out, V).
#    listPos        integer           Nummer der Variablen.
# Variablen:
#    found          boolean           Rueckgabewert (b=1=TRUE Variable in einer
#                                     Liste gefinden; b=0=FALSE sonst).
#    i              integer           Zaehler fuer Schleifen.
# begin of knownVar
   found=0
   i=1
   while (i<=numModInpVar) {
      if (modInpVar[i] == variable) {
         found=1
         listID="In"
         listPos=i
         break
      }
      i++
   }
   i=1
   while (i<=numModOutpVar) {
      if (found == 1) {
         break
      }
      if (modOutpVar[i] == variable) {
         found=1
         listID="Out"
         listPos=i
         break
      }
      i++
   }
   i=1
   while (i<=numVar) {
      if (found == 1) {
         break
      }
      if (var[i] == variable) {
         found=1
         listID="V"
         listPos=i
         break
      }
      i++
   }
   return found
} # end of knownVar

function error(errorMessage) {
# Spezifikation:
#    Speichert die erste Fehlermeldung zur Ausgabe.
# begin of error
   errorStr=(errorMessage)
} # end of error

function makeRule() {
# Spezifikation:
#    Bildet die zu .name gehoerige Gleichung und speichert sie als String in
#    rules[].
# Input:   
#    curVar[]       list of integer   Liste der in .name vorkommenden Variablen.
#    rules[]        list of string    Liste der Regeln, die durch die .name 
#                                     beschrieben werden.
#    numRules       integer           Anzahl der Regeln.
# Output:
#    rules[]        list of string    Liste der Regeln, die durch die .name 
#                                     beschrieben werden.
#    numRules       integer           Anzahl der Regeln.
# Variablen:
#    numLines       integer           Anzahl der Zeilen.
#    lines[]        list of strings   Speichert die verundeten Zeilen 
#                                     fuer die Veroderung.
# begin of makeRule
   numLines=0
   getline
   while (match($0, /[0,1,-]+/) || ($0 == "" && numLines == 0)) {
      numLines++
      lines[numLines]=praefixAndOfLine()
      if ($NF == "\\") {
         error("'\\' is not realized in this implementation of makeRule.")
         exit
      }
      getline
   }
   numRules++
   # Gleichung in rules ablegen.
   rules[numRules]=curVar[numCurVar] "(t) == " praefixOrOfLines()
} # end of makeRule

function praefixAndOfLine() {
# Spezifikation:
#    Bildet die "Verundung einer Zeile" und gibt sie an praefixAndOfLine()
#    zurueck.
#    Nicht unterstuetzt "-".
# Input:   
#    curVar[]       list of integer   Liste der in .name vorkommenden Variable.
# Output:
#    praefixAndOfLine   string        Verundung der Zeile.
# Variablen:
#    lineVal        boolean           "Wert" der Zeile 0=Zeile muss negiert werden.   
#    fPos           integer           Feld-Position.
#    val            boolean           "Wert" der Variablen.
#    a              string            "Verundete Zeile".
# begin of praefixAndOfLine
   lineVal=1
   if (NF == 2) {
      if ($2 == "0") {
         lineVal=0                      # make negation of the line
      }
      fPos=1
      while (fPos <= RLENGTH) {
         val=substr($1,fPos,1)
         if (fPos == 1) {
            if (RLENGTH == 1) {
               if (lineVal == 1) {
                  if (val == "1") { a=curVar[fPos] "(t)" }
                  if (val == "0") { a="not(" curVar[fPos] "(t))" }
                  if (val == "-") { a="H" }
               }
               if (lineVal == 0) {
                  if (val == "1") { a="not(" curVar[fPos] "(t))" }
                  if (val == "0") { a=curVar[fPos] "(t)" }
                  if (val == "-") { a="L" }
               }
            }
            if (RLENGTH >= 2) {
               if (lineVal == 1) {
                  if (val == "1") { a="and(" curVar[fPos] "(t),#)" }
                  if (val == "0") { a="and(not(" curVar[fPos] "(t)),#)" }
                  if (val == "-") { a="and(H,#)" }
               }
               if (lineVal == 0) {
                  if (val == "1") { a="not(and(" curVar[fPos] "(t),#))" }
                  if (val == "0") { a="not(and(not(" curVar[fPos] "(t)),#))" }
                  if (val == "-") { a="not(and(H,#))" }
               }
            }
         }
         if (fPos > 1 && fPos < RLENGTH) {
            if (val == "1") { sub(/#/,"and(" curVar[fPos] "(t),#)",a) }
            if (val == "0") { sub(/#/,"and(not(" curVar[fPos] "(t)),#)",a) }
            if (val == "-") { sub(/#/,"and(H,#)",a) }
         }
         if (fPos == RLENGTH) {
            if (val == "1") { sub(/#/,curVar[fPos] "(t)",a) }
            if (val == "0") { sub(/#/,"not(" curVar[fPos] "(t))",a) }
            if (val == "-") { sub(/#/,"H",a) }
         }
         fPos++
      }
   }
   if (NF == 1) {
      if ($1 == "1") { a="H" }
      if ($1 == "0") { a="L" }
      if ($1 == "-") { }
   }
   if ($0 == "") { a="L" }
   return a
} # end of praefixAndOfLine

function praefixOrOfLines() {
# Spezifikation:
#    Bildet die zu .name gehoerige rechte Gleichungseite und gibt sie in
#    praefixOrOfLines() zurueck.
# Input:   
#    curVar[]    list of integer  Liste der in .name vorkommenden Variablen.
# Output:
#    praefixOrOfLines  string     Veroderung der Zeilen.
# Variablen:
#    numLines    integer          Anzahl der Zeilen
#    lines[]     list of strings  Speichert die verundeten Zeilen. 
#    o           string           Veroderung der Zeilen.
#    i           integer          Hilfsvariable
# begin of praefixOrOfLines
   i=1; o=""
   while (i <= numLines) {
      if ((i == 1) && (numLines > 1) && (i<numLines)) {
         o="or("lines[i]",#)"
      }
      if ((i == 1) && (numLines == 1)) {
         o=lines[i]
      }
      if ((i > 1) && (i != numLines)) { 
         sub(/#/,"or("lines[i]",#)",o)
      }
      if ((i > 1) && (i == numLines)) {
         sub(/#/,lines[i],o)
      }
      i++
   }
   return o
} # end of or

function storeNewVar(blifVar) {
# Spezifikation:
#    Wenn blifVar eine bisher nicht vorgekommene Variable ist, wird sie in
#    im Feld var[] abgelegt.
# Input:
#    numCurVar      integer           Anzahl der in .name vorkommenden Variablen.
#    var[]          list of string    Liste der Variablen, die keine Modell-
#                                     Variablen sind.
#    numVar         integer           Anzahl/Nummer der verschiedenen bereits 
#                                     in var[] eingelesenen Variablen.
# Output:
#    curVar[]       list of integer   Nimmt alle in .name vorkommenden Variablen 
#                                     auf, fuer die Bildung der Regel in makeRule.
#    var[]          list of string    Liste der Variablen, die keine Modell-
#                                     Variablen sind.
# Variablen:
#    pos            integer           Position in der Textzeile.
#    listID         string            Identifikator der Liste (In, Out, V).
#    listPos        integer           Nummer der Variablen.
# begin of storeNewVar
   if (knownVar(blifVar) == 1) {
      numCurVar++
      curVar[numCurVar]=listID listPos
   }
   else {
      numVar++
      var[numVar]=blifVar
      numCurVar++
      curVar[numCurVar]="V" numVar; 
   }
} # end of storeNewVar

END {
# Spezifikation:
#    Bilde die algebraische Spezifikation aus var, modInputVar, modOutputVar,
#    rules, latches und speichere sie im File blif.out.
# Input:
# Output:
# Variablen:

fname = file ".2AS"
vfname = "BLIF_" file ".variables"

if (errorStr != "") {
   print("### " file) > fname
   print("blif2rdx: Error: " errorStr) > "/dev/stderr"
   print("Error: " errorStr) > fname
   print("TYPE " file ".") >> fname
} else {
   print("### " file) > fname
   print("TYPE " file ".") >> fname
}

print("CONSTS") >> fname
print("   0-TIME.") >> fname
print("   L,H-SIGNAL") >> fname
print("VARS") >> fname
print("   t-TIME.") >> fname
print("   P,Q,R-SIGNAL") >> fname
print("OPS") >> fname
print("   S(TIME)-TIME.") >> fname
print("   not(SIGNAL)-SIGNAL.") >> fname
print("   or(SIGNAL,SIGNAL)-SIGNAL.") >> fname
print("   and(SIGNAL,SIGNAL)-SIGNAL USTAT:AC.") >> fname
print("   imply(SIGNAL,SIGNAL)-SIGNAL.") >> fname
print("   equal(SIGNAL,SIGNAL)-SIGNAL.") >> fname
print("   xor(SIGNAL,SIGNAL)-SIGNAL USTAT:AC.") >> fname
   i=1
   while (i < numModInpVar) {
      print("   In" i "(TIME)-SIGNAL.") >> fname
      i++
   }
   if (numModInpVar > 0 && (numModOutpVar > 0 || numVar > 0)) {
      print("   In" numModInpVar "(TIME)-SIGNAL.") >> fname
   } else if (numModInpVar > 0 && numModOutpVar == 0 && numVar == 0) {
      print("   In" numModInpVar "(TIME)-SIGNAL") >> fname
   }
   i=1
   while (i < numModOutpVar) {
      print("   Out" i "(TIME)-SIGNAL.") >> fname
      i++
   }
   if (numModOutpVar > 0 && numVar > 0) {
      print("   Out" numModOutpVar "(TIME)-SIGNAL.") >> fname
   } else if (numModOutpVar == 0 && numVar == 0) {
      print("   Out" numModOutpVar "(TIME)-SIGNAL") >> fname
   }
   i=1
   while (i < numVar) {
      print("   V" i "(TIME)-SIGNAL.") >> fname
      i++
   }
   if (numVar > 0) { print("   V" numVar "(TIME)-SIGNAL") >> fname }
print("AXIOMS") >> fname
print("   1)  or(P,Q) == xor(and(P,Q),xor(P,Q))") >> fname
print("   2)  imply(P,Q) == xor(and(P,Q),xor(P,H))") >> fname
print("   3)  equal(P,Q) == xor(P,xor(Q,H))") >> fname
print("   4)  not(P) == xor(P,H)") >> fname
print("   5)  xor(P,L) == P") >> fname
print("   6)  xor(P,P) == L") >> fname
# print("   7)  xor(Q,xor(P,P)) == Q") >> fname
print("   7)  and(P,H) == P") >> fname
print("   8)  and(P,P) == P") >> fname
# print("   10) and(Q,and(P,P)) == and(Q,P)") >> fname
print("   9)  and(P,L) == L") >> fname
print("   10) and(P,xor(Q,R)) == xor(and(P,Q),and(P,R))") >> fname
   i=11;r=1
   while (r <= numRules) {
      print("   " i ") " rules[r] "") >> fname
      i++;r++
   }
   l=1
   while (l <= numLatches) {
      print("   " i ") " latches[l] "") >> fname
      i++;l++
   }
   print("END") >> fname
   

   print("    Variables of BLIF_" file ".typ\n") > vfname
   print("        Input Variable(s):") >> vfname
   i=1
   while (i <= numModInpVar) {
      print("            In" i ":\t" modInpVar[i]) >> vfname
      i++
   }
   print("\n        Output Variable(s):") >> vfname
   i=1
   while (i <= numModOutpVar) {
      print("            Out" i ":\t" modOutpVar[i]) >> vfname
      i++
   }
   print("\n        Internal Variable(s):") >> vfname
   i=1
   while (i <= numVar) {
      print("            V" i ":\t" var[i]) >> vfname
      i++
   }
}

#  LocalWords:  FS RS numVar
