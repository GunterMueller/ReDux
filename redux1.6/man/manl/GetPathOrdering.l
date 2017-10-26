.\" @(#)GetPathOrdering.l 20 Jan 1996 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH GETPATHORDERING l "20 January 1996" "WSI \*(UT" "ReDuX Tools"
.SH NAME
GetPathOrdering \- produce a path-ordering from a ReDuX specification file produced by blif2rdx
.SH SYNOPSIS
.B GetPathOrdering
.I filename
.SH DESCRIPTION
.B GetPathOrdering
produces a file that is used as input-file for ReDuX programs and
that describes the path-ordering of the file
.IR filename .
The latter file is an output file from
.BR blif2rdx (l)
or a normalized derivative thereof. Each rule of the input file
.I filename
must be on one line or each line-break but the last one must end with a
comma.
.SH FILES
.TP
.IB filename .PathOrdering
the output-file
.TP
.B pathOrdering1.awk
awk script for first pass
.TP
.B pathOrdering2.awk
awk script for second pass
.TP
.B mklong.awk
awk script to write each rule into one line
.TP
.IB filename .mklong
temporary file, each rule is written into one line
.TP
.B pathOrdering.tmp
temporary file, output of
.B pathOrdering1.awk
and
.B pathOrdering2.awk
.TP
.B pathOrdering.sed
is a temporary sed file, produced by
.BR pathOrdering2.awk .
This sed file deletes some lines in the temporary file
.BR  pathOrdering.tmp .
.PD
.SH BUGS
So far a recursive path ordering is used  to prove the termination
of the term rewriting system. This is not sound for general term
rewriting systems modulo AC but it proves the termination of the
special BLIF netlist generated  systems.
.SH "SEE ALSO"
.BR blif2rdx (l)
.SH REFERENCE
Jochen Walter and Reinhard Buendgen,
.BR "The ReDuX User Guide" ,
Technical Report 93-12, Wilhelm-Schickard-Institut, Universitaet Tuebingen,
D-72076 Tuebingen, 1993. 
.SH AUTHOR
Werner Lauterbach, lauterba@informatik.uni-tuebingen.de
