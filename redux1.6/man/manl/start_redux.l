.\" @(#)start_redux.l 11 Oct 1995 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH START_REDUX l "11 October 1995" "WSI \*(UT" "ReDuX Tools"
.SH NAME
start_redux \- initialize shell variables to work with the ReDuX system
.SH SYNOPSIS
.B source
.IB REDUX /bin/start_redux
.br
.RI ( REDUX
is the ReDuX installation directory.)
.SH DESCRIPTION
Some environment variables are set to values suitable for
working with the ReDuX system.

The environment variable
.B REDUX
is set to the ReDuX installation directory.

Paths with ReDuX executables are prepended to the environment
variable
.B PATH
unless this variable already contains these paths.

If the environment variable
.B MANPATH
is set, the ReDuX manual pages path is prepended to its value unless
it already contains this path.
If the variable
.B MANPATH
is not set, it is set to a path that contains the ReDuX manual pages
and two other directories
.RB ( /usr/man
and 
.BR /usr/local/man ).
The latter ones may not be suitable on all systems. On those systems,
.BR man (1)
and
.BR xman (1)
may not find all manual pages after
.B start_redux
has been loaded.
To avoid this behavior, the variable
.B MANPATH
should be set to a sensible value before
.B start_redux
is sourced, e.g. in your
.B .cshrc
or
.B .login
file.
See the manual page of
.BR man (1)
for sensible values on your system.

If the ReDuX system is to be used on a regular basis,
.B start_redux
should be sourced in the
.B .cshrc
or
.B .login
file.
If
.BR xman (1)
is used, it must be started
.I after
.B start_redux
has been loaded.

Note that
.B start_redux
must be applied using the csh's source command. To prevent
execution as a shell script (i.e. as an own process),
it is not executable.
.SH "SEE ALSO"
.BR aldr (l)
(and all other ReDuX tools),
.BR csh (1),
.BR man (1),
.BR ReDuX_demo_scripts (l),
.BR ReDuX_programs (l),
.BR xman (1).
.br
.I The ReDuX User Guide
