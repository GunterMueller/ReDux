.\" @(#)typ2rdx.l 25 October 1995 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH TYP2RDX l "25 October 1995" "WSI \*(UT" "ReDuX Tools"
.SH NAME
typ2rdx, typ2rdxdir \- convert old ReDuX data types to new syntax
.SH SYNOPSIS
.B typ2rdx
.IB file-name .typ
[
.IB file-name .typ
\&.\|.\|.
]

.B typ2rdxdir
.I source-directory
.I goal-directory
.SH DESCRIPTION
.B typ2rdx
reads the files 
whose names are given in the argument lists
containing old ReDuX specifications
each of which is assumed to have the suffix 
.B .typ
and converts each of these files to 
a file containing a new ReDuX specification that is stored under the same
name with the exception that the suffix
.B .typ
is replaced by the suffix
.BR .rdx .

.B typ2rdxdir
recursively copies the directory
.I source-directory
to
.I goal-directory
and then converts all files with suffix
.B .typ
assumed to contain old ReDuX data type specifications to
files with suffix
.B .rdx
that contain the same specification in new syntax.
.SH SEE ALSO
.BR dtcv (l)
.SH BUGS
The limitations of dtcv apply.
