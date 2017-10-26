.\" @(#)ReDuX_programs.l 15 jan 1997 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH REDUX_PROGRAMS l "17 January 1997" "WSI \*(UT" "ReDuX Tools"
.SH NAME
ReDuX_programs, ac, ic, tc, to, trd, ts, uc \- the ReDuX demo programs
.SH SYNOPSIS
.PD 0
.if n .TP 6
.if t .TP 4.5
.B ac
[
.I spec-file
[
.I algos-file
[
.I log-file
[
.I input-file
]]]]
.TP
.B ev
[
.I spec-file
[
.I algos-file
[
.I log-file
[
.I input-file
]]]]
.TP
.B ic
[
.I spec-file
[
.I input-file
]]]
.TP
.B tc
[
.I spec-file
[
.I algos-file
[
.I log-file
[
.I input-file
]]]]
.TP
.B to
[
.I spec-file
[
.I log-file
[
.I input-file
]]]
.TP
.B trd
[
.I spec-file
[
.I algos-file
[
.I log-file
[
.I input-file
]]]]
.TP
.B ts
[
.I spec-file
[
.I log-file
[
.I input-file
]]]
.TP
.B uc
[
.I spec-file
[
.I log-file
[
.I input-file
]]]
.PD
.SH DESCRIPTION
This is the manual page for the ReDuX demo programs. 
They are intended to both show how to use the ReDuX algorithms
and solve some interesting problems in the area
of term rewriting.
This manual page gives a short summary on
the characteristics of the respective demo programs.
For a more thorough description, refer to
.I The ReDuX User Guide
which is supplied with the ReDuX system.

Each of the programs needs a file with a ReDuX data type 
whose name is passed as first command line argument.
If no
.I spec-file
is supplied, a default file name is assumed:
Its name is determined by appending
.B .in
to the name of the demo program, i.e. the program
.B ac
would search for the file
.BR ac.in .

Some of the programs need a second file, the so-called
.IR algos-file .
It contains information concerning SAC-2 and ReDuX algorithms that are needed
for the ReDuX interpreter module.
If no value for
.I algos-file
is supplied, the default is the name of the demo program with
.B .algos
appended to it, i.e. the program
.B ac
writes to the algos file
.BR ac.algos
by default.


All of the programs produce a log-file.
If this 
.I log-file
is not specified in the command line
the default is the name of the demo program with
.B .log
appended to it, i.e. the program
.B ac
writes to the log file
.BR ac.log
by default.

The input for the dialogs of the demo programs may be be read from
a file 
.I input-file
instead of from
.I stdin .

To simplify handling with the input files, for each demo program
a shell script is supplied which bears the same name as the demo program
but spelled in upper case, i.e. the shell script for
.B ac
is named
.BR AC .
.SS The AC-Rewrite Laboratory (ac)
This program is used for several kinds of computations with data types
that contain associative and commutative (AC) and commutative
(COM) operators. These computations include an implementation of the
Peterson-Stickel completion algorithm.
.SS The EV-Rewrite Laboratory (ev)
The
.BR ev  -program 
is a modified version of the AC-Rewrite Laboratory that 
supports fast normalizations based on partial evaluation domains.
.SS Inductive Completion (ic)
The
.BR ic -program
allows the user to experiment with an inductive completion
algorithm.
.SS The Term Completion Program (tc)
This program is used to experiment with the term completion algorithms
implemented in the ReDuX systems. There are four different variants of
the Knuth-Bendix procedure that can be selected.
.SS The Term Ordering Program (to)
The
.BR to -program
is used to experiment interactively with the term ordering
algorithms implemented in the ReDuX system.
.SS Random Term Generation (trd)
This program is mainly used to generate files with random terms.
Two variants of the random term generation algorithm can be selected.
.SS Ground Normal Form Analysis (ts)
This program allows to analyze the set of ground normal forms of an
algebraic specification. It works for left-linear term rewriting systems
and
.I well-behaved
non-left-linear systems. In case of a method failure a warning is
output. The program has three variants of an algorithm to compute
top sets, top set trees and ground normal form grammars.
.SS Unfailing Completion (uc)
This program is similar to the
.B tc
program, but it is enhanced by an unfailing completion
procedure. It has an experimental status and is not documented in
.IR "The ReDuX User Guide" .
.SH FILES
.PD 0
.TP 22
.IB REDUX /demo
Directory with the ReDuX demo programs.
.RI ( REDUX
stands for the directory where the ReDuX system is installed.)
.TP
.IB REDUX /olddemo
Directory with the ReDuX demo programs using the old specification parser.
.TP
.IB REDUX /spec
Standard directory for ReDuX data type files.
.TP
.IB REDUX /src/it/algos
Standard
.IR algos-file .
.TP
.IB REDUX /typ
Standard directory for ReDuX data type files for the old specification parser.
.PD
.SH "SEE ALSO"
.BR AC (l),
.BR EV (l),
.BR IC (l),
.BR start_redux (l),
.BR TC (l),
.BR TO (l),
.BR TRD (l),
.BR TS (l),
.BR UC (l).
.br
.I The ReDuX User Guide
