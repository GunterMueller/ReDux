.\" @(#)dtcv.l 18 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH DTCV l "18 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
dtcv \- convert old ReDuX data types (*.typ) to new syntax (*.rdx)
.SH SYNOPSIS
.B dtcv
.I file-name
.SH DESCRIPTION
.B Dtvc
reads 
.IB file-name
which is assumed to contain a ReDuX data type in old syntax
and writes the ReDuX data type in new syntax to standard output.
.SH BUGS
.B dtcv
There are several limitations which data types can be converted!
These limitations comprise:
(1) no postfix operators with arity other than one,
(2) all axioms must start on a separate line,
(3) postfix operators at the end of an axiom must not
start on a new line
(4) there must not be an identifier named "&@&@&@"
(5) Input specifications may not be too big.
