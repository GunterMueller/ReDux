.\" @(#)asplit.l 11 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH ASPLIT l "11 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
asplit \- split an ALDES file into a separate file for each algorithm
.SH SYNOPSIS
.B asplit
.SH DESCRIPTION
.B Asplit
reads an ALDES source text from the standard input.
It attempts to split the input in separate algorithm files
of the form
.IB "algorithm name" .ald .
Each algorithm is prepended with all external declarations of global
variables that occur before this algorithm in the input.
Those declarations are additionally collected in the file
.BR globals .
.SH "SEE ALSO"
.BR fsplit (1)
.SH BUGS
.B Asplit
assumes that at least 15 blanks precede each algorithm name in
the input.
