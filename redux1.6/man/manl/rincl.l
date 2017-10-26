.\" @(#)rincl.l 5 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH RINCL l "5 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
rincl \- perform non-recursive includes in ALDES programs
.SH SYNOPSIS
.B rincl
[
.I input file
[
.I output file
] ]
.SH DESCRIPTION
.B Rincl
performs non-recursive includes in ALDES programs.
If an ALDES-comment of the form
.BI "[ #include ``" "file name" ".h'' ]"
or
.BI "[ #include " "file name" ".h ]"
occurs at the beginning of a line,
this comment is replaced by the contents of
.IR "file name" .
.I File name
is supposed to begin with a letter and to consist of
letters or digits.

If no command line arguments are given,
.B rincl
reads from
.B stdin
and writes to
.BR stdout .
If only
.I input file
is provided on the
command line, then
.BI i_ "input file"
is the output file.
If
.I input file
and
.I output file
are given,
.B rincl
reads from
.I input file
and writes to
.IR output file .

The pseudo input/output file 
.RB `` \- ''
stands for
.B stdin
and/or
.B stdout
respectively.
.SH NOTES
.B Rincl
is a shell script which uses
.B cpp
to perform the includes.
It can be modified to use the macro processor
.B m4
instead.

If
.B cpp
is used, the include files are searched for in
.B . 
and the ReDuX include directory
.BR (src/include) .
If
.B m4
is used, the include files are searched for in the current
directory.
.SH "SEE ALSO"
.BR cpp (1),
.BR m4 (1v)
.SH BUGS
If the preprocessor
.B cpp
is used the original code may not contain a line
beginning with
.RB `` #\0 ''
and a number.
