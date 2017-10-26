.\" @(#)rgrep.l 4 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH RGREP l "4 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
rgrep, regrep \- recursive grep in ReDuX source code
.SH SYNOPSIS
.B rgrep
.I expr
[
.BI hd\||\|ac\||\|ax\||\|co\||\|ic\||\|tc\||\|to\||\|\|tp\|| directory
]
.LP
.B regrep
.I expr
[
.BI hd\||\|ac\||\|ax\||\|co\||\|ic\||\|tc\||\|to\||\|\|tp\|| directory
]
.SH DESCRIPTION
Commands of the
.B rgrep
family 
search all ReDuX source files for lines
that contain a match for the given
.I expr.
If any lines match, they are printed.
.B Regrep
patterns are full regular expressions including alternation.
.B Rgrep
patterns are fixed strings \- no regular expression meta characters 
are supported.

If one of the options 
.BR ac ,
.BR ax ,
.BR co ,
.BR ic ,
.BR tc ,
.B to
or
.B tp
is used, only the according ReDuX subsystem is scanned.
If  the option
.B hd
is used, the ReDuX header files are scanned.
If
.I directory
is provided as second argument, then this directory is
searched recursively for files which match *.ald.
.PD
.SH "SEE ALSO"
.BR egrep (1),
.BR fald (l),
.BR fgrep (1)
