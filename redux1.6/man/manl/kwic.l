.\" @(#)kwic.l 18 Nov 1994 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH KWIC l "18 November 1994" "WSI \*(UT" "ReDuX Tools"
.SH NAME
kwic \- generate KWIC (keyword in context) index
.SH SYNOPSIS
.B kwic
[
.B \-w
.I width
]
[
.B \-f
.I skip-focus
]
[
.B \-F
.I focus-column
]
.if n .ti +5
[
.B \-s
.I skip-module
]
[
.B \-S
.I module-column
]
.if t .ti +.5i
[
.B \-c
]
.if n .ti +5
[
.B \-x
.I filename
]
[
.B \-W
]
[
.B \-Q
]
.SH DESCRIPTION
.B Kwic
generates a KWIC (keywords in context) index of a text read from
.B standard input
onto
.BR "standard output" .
It
has three phases: The first does the rotation, generating one
line for each word in the input line except for words
which are contained in the exclusion file (see option
.BR \-x ).
The rotated lines are then sorted. Finally, the sorted lines
are formatted as KWIC index.

The output lines are sorted on a character-by-character basis,
starting with the focus column. The default collating sequence is
the sequence of ASCII characters with lower case letters mapped
to upper case ones.
.SH OPTIONS
.if n .TP 1.7i
.if t .TP 1.3i
.BI \-w " width"
Set output width to
.I width
characters. Default value is 80.
.TP
.BI \-f " skip-focus"
Set the number of columns left blank before the focus column to
.IR skip-focus .
Default is 2.
.TP
.BI \-F " focus-column"
Select
.I focus-column
as the column for the focus. The default is the middle
of the output lines.
.TP
.BI \-s " skip-module"
Set the number of columns left blank before the column for the
module name (see option
.BR \-Q )
to
.IR skip-module .
Default is 1.
.TP
.BI \-S " module-column"
Set the column for the module name to
.IR module-column .
The default is
.I width
decreased by one, i.e. there are two columns for the module name.
.TP
.B \-c
Do not ignore case of letters in the sorting phase.
.TP
.BI \-x " filename"
Exclude lines with one of the words in this file in the focus position
from the KWIC index.
The file must contain one word per line.
No exclusion file is used if
.B \-
is used for
.IR filename .
If this option is not
selected, the program assumes the default file name
.BR SKIPWORDS .
It is considered an error if
.I filename
does not exist.
If this option is not selected and file
.B SKIPWORDS
does not exist, a warnig is issued, but the program continues to run.
.TP
.B \-W
Enable wrapping. Free space on each line is used to print the part
of the left or right context that is too long.
The wrapped part is separated by
.RB `` "\e " ''
if text is wrapped to the left hand side
or by 
.RB `` " \e" ''
if text is wrapped to the right hand side.
.TP
.B \-Q
The first word in each input line is considered as module name
which is to be printed in the last columns of the output lines.
.SH FILES
.PD 0
.if n .TP 1.7i
.if t .TP 1.3i
.B ./SKIPWORDS
is the default name for the exclusion file.
.PD
.SH "SEE ALSO"
.BR rhead (1)
