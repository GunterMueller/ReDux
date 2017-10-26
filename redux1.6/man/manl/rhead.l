.\" @(#)rhead.l 18 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH RHEAD l "18 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
rhead \- collect headers of ReDuX algorithms
.SH SYNOPSIS
.B rhead
.I module-name
[
.I path
]
.SH DESCRIPTION
.B Rhead
produces a file named
.IB module-name .hd
containing an entry for each ALDES algorithm in the ReDuX module
located in
.IR path / module-name .
If
.I path
is not given in the command line,
.B rhead
assumes the source directory of the given ReDuX installation.

For the WSI-CA installation of ReDuX, the source texts are located in
.BR /usr/local/redux/src .

The algorithms of the module are assumed to be in files matched by
.RB * .ald
in the directory
.IR path / module-name
and its subdirectories.

For each detected algorithm, a line consisting of the algorithm name
and the
.I expanded
algorithm name 
(the first part of the main comment of a well-designed ALDES algorithm)
is written to
the output file.
.SH SEE ALSO
.BR headers (l)
.SH BUGS
.B Rhead
assumes that at least 15 blanks precede each algorithm name in
the input.
Furthermore, it assumes that the expanded algorithm name is
separated from the specification part of an algorithm main
comment by a period and at least two blanks.
