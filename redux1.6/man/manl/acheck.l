.\" @(#)acheck.l 30 May 1995 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH ACHECK l "30 May 1995" "WSI \*(UT" "ALDES Tools"
.SH NAME
acheck \- check ALDES source code
.SH SYNOPSIS
.B acheck
[
.B \-b
]
[
.B \-t
]
[
.I filename
\&.\|.\|.
]
.SH DESCRIPTION
.B Acheck
reads the given files (standard input if
.I filename
is omitted) and displays a warning message for each incorrect line.
An input line is considered incorrect if it isn't terminated with
a line feed (LF) character, if it contains non-printable characters,
or if it is longer than 72 characters.
In the warning messages, non-printable characters are displayed
as ``[]''.
.SH OPTIONS
.TP 1i
.B \-b
Does not remove trailing blanks before line lengths are checked.
.TP
.B \-t
Considers TABs to be non-printable characters.
