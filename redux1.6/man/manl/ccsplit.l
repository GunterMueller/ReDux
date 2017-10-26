.\" @(#)ccsplit.l 18 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH CCSPLIT l "18 November 1993" "WSI \*(UT" "ALDES Tools"
.SH NAME
ccsplit \- split an C file into a separate file for each function
.SH SYNOPSIS
.B ccsplit
.SH DESCRIPTION
.B Ccsplit
reads an C source text from the standard input.
It attempts to split the input in separate function files
with names of the form
.IB "function-name" .ald
which are created in the current directory.
.SH "SEE ALSO"
.BR fsplit (1)
.SH BUGS
.B Ccsplit
doesn't parse the input, it assumes a special lay-out
of the C program. Therefore it works only for C code
generated by the ALDES-C translator.

The existence of files is checked by opening them for read access.
This can fail if there are files without read-permission in the current
directory.  