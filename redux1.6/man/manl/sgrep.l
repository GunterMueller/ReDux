.\" @(#)sgrep.l 9 Dec 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH SGREP l "9 December 1993" "WSI \*(UT" "ALDES Tools"
.SH NAME
sgrep, segrep \- recursive grep in SAC-2 source code
.SH SYNOPSIS
.B sgrep
.I expr
[
.B low\||\|sac2\||\|bs\||\|lp\||\|sy\||\|an\||\|ar\||\|co\||\|la\||\|pf\||\|pg\||\|po\||\|rr\||
.if n .ti +5
.I directory
]
.LP
.B segrep
.I expr
[
.B low\||\|sac2\||\|bs\||\|lp\||\|sy\||\|an\||\|ar\||\|co\||\|la\||\|pf\||\|pg\||\|po\||\|rr\||
.if n .ti +5
.I directory
]
.SH DESCRIPTION
Commands of the
.B sgrep
family 
search all
.B SAC-2
source files for lines
that contain a match for the given
.I expr.
If any lines match, they are printed.
.B Segrep
patterns are full regular expressions including alternation.
.B Sgrep
patterns are fixed strings \- no regular expression meta characters 
are supported.

If one of the names 
.B low
or
.B sac2
is provided in the command line as second argument,
only the low system (consisting of basic algorithms for input, output,
list processing and symbol handling) or the virtual
.B SAC-2
system is scanned.

If one of the names
.BR bs ,
.BR lp ,
.B sy
is used as a second argument, only the
.IR "basic system" ,
the
.I list processing system
or the
.I symbol system
of the low system are scanned.
If one of the names
.BR an ,
.BR ar ,
.BR co ,
.BR la ,
.BR pf ,
.BR pg ,
.B po
or
.B rr
is used, only the according
.B SAC-2
subsystem is scanned.

If
.I directory
is provided as second argument, then this directory is
searched recursively for files whose names are matched by
.RB * .ald .
.PD
.SH "SEE ALSO"
.BR egrep (1),
.BR fald (l),
.BR fgrep (1),
.BR rgrep (l)
