.\" @(#)aldr.l 16 Sep 1995 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH ALDR l "16 September 1995" "WSI \*(UT" "ReDuX Tools"
.SH NAME
aldr \- translate and link ALDES, C and object files with ReDuX libraries
.SH SYNOPSIS
.B aldr
[
.B \-1\||\|O\||\|A\||\|B
]
[
.B \-S
]
[
.B \-R\||\|\-r
]
[
.B \-L
]
[
.B \-9
]
.if n .ti +5
[
.B \-sun4\||\|\-sun10\||\|\-slow\||\|\-i486
]
.if n .ti +5
.if t .ti +.5i
[
[
.I header
|
.I program
]
\&.\|.\|.
]
[
.I archive
\&.\|.\|.
]
.if n .ti +5
[
.I input
\&.\|.\|.
]
[
.I output
]
.SH DESCRIPTION
If no options are given,
.B aldr
translates the given ALDES programs to corresponding
programs in
.I "back end code"
(C or FORTRAN).
These programs are splitted into files containing only one function
which are compiled with the back end compiler
(either
.BR gcc ,
.B cc
or
.BR f77 ).
The resulting object code files are archived into the local
library
.BR liblocal.a .

The WSI-CA installation of 
.B aldr
uses 
.B gcc
as back end compiler and ALDES version 3.7 as front end compiler.

Subsequently, the program is linked into
an executable file
.B a.out
which is run using specified
input and output files.
.B Stdin
and
.B stdout
are the default I/O files.

Binding is from library archive files named
.B libsac2.a
and
.B liblow.a 
that contain the SAC-2 system and the low systems bs, lp and sy
as object code.
If option 
.B \-R
is not chosen, the ReDuX libraries
.BR libax.a ,
.BR libco.a ,
.BR libintdummy.a ,
.BR libtp2.a ,
.BR libsacr.a , 
.BR libto.a ,
.B libtc.a
and
.B libac.a
are linked too.
.SS Arguments
.PD 0
.TP 10
.I header
is a file with extension
.BR .h .
It contains ALDES source code, usually
macro definitions and declarations of global variables.
Header files are concatenated in the order of their occurrence in the
argument list in front of all ALDES source files following 
in the argument list.
.TP
.I program 
is a file name argument with or without extension.
The extension 
.B .ald
stands for an ALDES source file,
the extension
.B .c
or
.B .f
stands for an back end source file and
the extension 
.B .o
stands for an object file.

File name arguments without extension are assumed to be ALDES source files
with extension 
.BR .ald .

File name arguments with the extension 
.B .i
are assumed to be ALDES source files (with extension
.BR .ald )
containing
.B  [ #include
\&.\|.\|.
.B ]
comments. These comments are processed by
.B rincl
before the file is passed to the ALDES-to-back end translator.

Files name arguments with extension
.B .t
are assumed to be ALDES source file (with extension
.BR .ald )
for which the trace mechanism shall be activated.
.TP
.I archive
is an archive with extension
.BR .a .
.TP
.I input 
are  input files with extension
.BR .in .
These files will be concatenated in the order of their occurrence 
in the argument list and redirected to the standard input of 
compiled program.
.TP
.I output 
is an output file with extension
.BR .out .
The output of the compiled program will be redirected to this file.
.PD
.LP
.SH OPTIONS
.TP 1i
.B \-1
Only back end code is produced.
.TP
.B \-O
Only object code is produced.
.TP
.B \-A
Only the local library
.B liblocal.a
is produced.
.TP
.B \-B
Only a binary (executable) program is produced.
.TP
.B \-S
No back end code splitting.
.TP
.B \-R
No ReDuX libraries will be linked.
.TP
.B \-r
A dummy library instead of the ReDuX interpreter module will be linked.
.TP
.B \-L
No
.B liblocal.a
is produced.
Binding is done from the object files (both those resulting from compilation
and those listed in the argument list), the libraries listed in the
argument list and the SAC-2  and ReDuX libraries.
.TP
.B \-9
I/O-routines which do 
.I not 
record all standard input and output are linked to the program.
By default I/O-routines that record all standard input and output to 
a log file called
.IB program-name .log
are linked.
.RI ( program-name
is the name of the executable.)
.TP
.B \-i486
Use assembler library with 80486-code of
.B dpr
and
.BR dqr .
This library can be used with an 80386 processor and all successing
Intel processors.
.TP
.B \-sun4
Use assembler library with Sun4-code of
.B dpr
and
.B dqr
\(em this is the default in the WSI-CA installation.
.TP
.B \-sun10
Use assembler library with Sparc10-code of
.B dpr
and
.BR  dqr .
.TP
.B \-slow
Use library for
.B dpr
and
.B dqr
derived from
ALDES code of 
.B dpr
and
.BR dqr .
.SH FILES
.PD 0
.TP 20
.BI i_ "ALDES-file" .ald
Temporary files with such names are generated if ALDES file names
are passed with extension
.BR .i .
.TP 
.IB "algorithm-name" .c
Such temporary files are generated for each ALDES 
.I algorithm
if back end code splitting is not turned off.
They are the result of
.B aldr
if the
.B \-1
option is used.
.TP
.IB "ALDES-file" .c ,
.TP
.BI i_ "ALDES-file" .c
Such temporary files are generated for each ALDES
.I  file
if back end code splitting is turned off.
They are the result of
.B aldr
if the
.B \-1
option is used.
.TP
.IB "object-file" .o
Such temporary files are generated by the back end compiler.
.I object-file
may either be of the form
.IR "algorithm-name" ,
.I "ALDES-file"
or
.BI i_ "ALDES-file"
depending of back end files produced by
.BR aldr .
Object files are the final result of 
.B aldr
if the option
.B \-O
is used.
.TP
.B liblocal.a
local object code library created or updated by 
.B aldr
if option
.B \-L
is not supplied.
It is the final result of
.B aldr
if the option
.B \-A
is used.
.TP
.B a.out 
executable program produced by
.BR aldr .
If the option
.B \-B
is supplied 
.B a.out 
is not started.
.TP
.B a.out.log
log file in which all standard I/O is recorded when running
.B a.out
unless option
.B \-9
is supplied.
.PD
.SH "SEE ALSO"
.BR cc (1),
.BR ccsplit (l),
.BR f77 (1),
.BR fsplit (1),
.BR gcc (1),
.BR rincl (l)
.SH BUGS
There is no assembler subroutine for 
.BR dqr .
A subroutine written in ALDES is used instead.
