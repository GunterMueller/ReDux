.\" @(#)tl.l 25 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH TL l "25 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
tl \- extract information from ReDuX data type files
.SH SYNOPSIS
.B tl
[
.B \-a
]
[
.B \-b
]
[
.B \-d
]
[
.B \-k
]
[
.B \-o
]
[
.B \-A
]
[
.B \-h
]
.if n .ti +5
[
.I directory
]
.SH DESCRIPTION
.B Tl
searches for information lines in ReDuX data type files.
Information lines are comments which contain a special
.IR keyword .
A list of all keywords is given below.
For all files matching
.RB * .typ
in
.I directory
(and its subdirectories),
the file name and all information lines are written to
.BR stdout .
If
.I directory
is not provided in the command line, the current
directory is used.
.SS KEYWORDS
.TP 10
.B AUTHOR
The author keyword is used to indicate the author of the
algebraic data type.
.TP
.B BIBTEX
This entry allows to store the BibTeX-keyword for the text
in which the data type is given.
.TP
.B DESCRIPTION
This keyword is intended to hold a description of the
algebraic data type in the file.
.TP
.B KEYWORDS
This entry can be used to give some keywords to characterize
the given date type.
.TP
.B ORIGIN
This entry allows to store the source of the data type.
It can be used if there is no BibTeX entry for the reference.
.TP
.B STATUS
This is a special keyword. The rest of the line with this keyword
is displayed after the file name. It is used to hold information
about the data type like ``complete'', ``incomplete'' or ``divergent''.
.LP
The keywords must be written in upper case letters.
It is possible to use multiple information lines with the
same keyword, but they should begin with line numbers because the output
is sorted. (See the example below.)
.SS EXAMPLE
Suppose the current directory contains only the following
ReDuX data type file:

.nf
# comment symbol
TYPE PEANOL.
# DESCRIPTION1 peano specification of
# DESCRIPTION2 + and *
# STATUS completed
CONSTS 
  0 \- PEANOL 
VARS 
  A,B,C,D,E \- PEANOL
OPS 
  *(PEANOL,PEANOL) \- PEANOL.
  +(PEANOL,PEANOL) \- PEANOL.
  S(PEANOL) \- PEANOL 
AXIOMS
  1) +(0,A) =\|= A
  2) +(S(B),A) =\|= S(+(B,A))
  3) *(0,A) =\|= 0
  4) *(S(B),A) =\|= +(*(B,A),A)
END
.fi

Then the command
.B tl\0\-A
yields the subsequent output:

.nf
FILE: [./typ/peanol.typ]  completed
DESCRIPTION1 peano specification of
DESCRIPTION2 + and *

.SH OPTIONS
.TP 1i
.B \-a
Write information of
.B AUTHOR
keyword.
.TP
.B \-b
Write information of
.B BIBTEX
keyword.
.TP
.B \-d
Write information of
.B DESCRIPTION
keyword.
.TP
.B \-k
Write information of
.B KEYWORDS
keyword.
.TP
.B \-o
Write information of
.B ORIGIN
keyword.
.TP
.B \-A
The same as all options above.
.TP
.B \-h
This options prints a short help message.
.LP
If no option is given in the command line, the default option
.B \-d
is chosen.
