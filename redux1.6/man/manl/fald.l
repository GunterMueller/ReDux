.\" @(#)fald.l 5 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH FALD l "5 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
fald \- find ALDES files recursively
.SH SYNOPSIS
.B fald
.I directory
\&.\|.\|.
.SH DESCRIPTION
.B Fald
recursively descends the directory hierarchy  for  each
directory in the  directory-list, seeking ALDES files,
i.e. files that match
.RB * .ald .
All files found, together with their paths relative to the 
current directory, are displayed.

.B Fald
does
.I not
follow symbolics links to other files or directories.
.PD
.SH "SEE ALSO"
.BR ln (1V)
