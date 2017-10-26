.\" @(#)blif2rdx.l 8 Nov 1994 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH BLIF2RDX l "8 November 1994" "WSI \*(UT" "ReDuX Tools"
.SH NAME
blif2rdx \- translates file in BLIF format into an algebraic specification for ReDuX 
.SH SYNOPSIS
.B blif2rdx
[
.I -l ISIZE
]
.I filename
.SH DESCRIPTION
.B Blif2rdx
translates file 
.I filename
using a subset of the Berkeley Logic
Interchange Format (BLIF) into an algebraic specification for the ReDuX term
rewriting system, which can be used to verify circuits. The output-file has
the prefix
.B BLIF_
followed by the
.IR filename ,
without the extension .blif called as 
.BR modelname ,
and the postfix
.BR .rdx .
.PD
.LP
.SH OPTIONS
.TP
.I "-l ISIZE"
The argument
.I ISIZE
expects an integer, that determines the width of the lines of the algebraic
specification.
.I ISIZE
is preset to 80, which is the usual input width of ReDuX programs.
.SH RESTRICTIONS
.TP
The supported subset of BLIF statements is:
.TP
.B .model
.br
with substatements
.B .inputs .outputs .clock .end
allowed.
.br
Only one .model statement with one .clock substatement is supported!
.TP
.B .names
.TP
.B .latch
I O i
.br
with i in {0,1}
.TP
.B .latch
I O i type control
.br
with i in {0,1}, type in {fe,re} and control being a clockname.
.br
All
.B .latch
statements must have the same type and the same control parameters.
If
.B .clock
is defined in
.B .model
control must be this clock.
.SH FILES
.TP
.B preblif.awk
awk script to set a new line before each BLIF statement
.TP
.B blif2rdx.awk
awk script to translate the BLIF file
.TP
.B postblif.awk
awk script to cut all lines to ISIZE
.TP
.IB modelname .PRE
temporary file, output from
.BR preblif.awk ,
input of
.B blif2rdx.awk
.TP
.IB modelname .2AS
temporary file, output from
.BR blif2rdx.awk ,
input of
.B postblif.awk
.TP
.BI BLIF_ modelname .rdx
output of
.B postblif.awk
.TP
.BI BLIF_ modelname .variables
output of
.BR blif2rdx.awk .
This file gives a reference of the hardware variables
and their representation in ReDuX.
.PD
.SH "SEE ALSO"
.BR GetPathOrdering (l)
.SH REFERENCE
.BR "Berkeley Logic Interchange Format (BLIF)" ,
University of California, Berkeley, July 23, 1991.

Jochen Walter and Reinhard Buendgen,
.BR "The ReDuX User Guide" ,
Technical Report 93-12, Wilhelm-Schickard-Institut, Universitaet Tuebingen,
D-72076 Tuebingen, 1993. 
.SH AUTHOR
Werner Lauterbach, lauterba@informatik.uni-tuebingen.de
