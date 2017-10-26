.\" @(#)headers.l 12 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH HEADERS l "12 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
headers \- extract algorithm headers from ALDES source text
.SH SYNOPSIS
.B headers
.SH DESCRIPTION
.B Headers
reads an ALDES source text from the standard input.
It attempts to find the algorithm name and the
.I expanded
algorithm name
(the first part of the main comment
of a well-designed ALDES algorithm) for each algorithm in the input.

For each detected algorithm, a line consisting of the algorithm name
and the expanded algorithm name is written to
.BR stdout .
.SH BUGS
.B Headers
assumes that at least 15 blanks precede each algorithm name in
the input.
Furthermore, it assumes that the expanded algorithm name is
separated from the specification part of an algorithm main
comment by a period and at least two blanks.
