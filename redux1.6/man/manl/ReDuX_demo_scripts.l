.\" @(#)ReDuX_demo_scripts.l 18 Oct 1995 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH REDUX_DEMO_SCRIPTS l "18 October 1995" "WSI \*(UT" "ALDES Tools"
.SH NAME
ReDuX_demo_scripts, AC, IC, TC, TO, TRD, TS, UC \- shell scripts to
simplify usage of the ReDuX demo programs
.SH SYNOPSIS
.PD 0
.if n .TP 6
.if t .TP 6.5
.B AC
[
.I filename
|
.B \-D
[
.I directory
]]
.TP
.B EV
[
.I filename
|
.B \-D
[
.I directory
]]
.TP
.B IC
[
.I filename
|
.B \-D
[
.I directory
]]
.TP
.B TC
[
.I filename
|
.B \-D
[
.I directory
]]
.TP
.B TO
[
.I filename
|
.B \-D
[
.I directory
]]
.TP
.B TRD
[
.I filename
|
.B \-D
[
.I directory
]]
.TP
.B TS
[
.I filename
|
.B \-D
[
.I directory
]]
.TP
.B UC
[
.I filename
|
.B \-D
[
.I directory
]]
.PD
.SH DESCRIPTION
This is the manual page for the ReDuX demo shell scripts. 
Each of the shell scripts calls a ReDuX demo program with the same name
as the shell script, but spelled in lower case letters, i.e. the
script named
.B AC
calls
.BR ac .

Each of the demo programs needs a data type file and some of them
.RB ( ac ,
.B tc
and
.BR trd )
need a second file, the 
.IR algos-file .
The demo shell scripts assume that the data type file for a demo
program bears the same name as the demo program with suffix
.BR .in .
If no such file exists, a symbolic link to a data type file can be
created with the shell scripts.
If a demo program needs an
.I algos-file
and there is no file called
.B algos
in the current directory,
the default
.I algos-file
.IB REDUX /src/it/algos
is used.
.RI ( REDUX
stands for the ReDuX installation directory.)

If one of the shell scripts is called without any command line arguments,
it directly starts the corresponding demo program.
(If no data type file exists, the shell scripts issues
an error message and aborts.)

If a
.I filename
argument is supplied,
the shell script searches for files named
.I filename
in directory
.IB REDUX /spec
and its subdirectories.
If the command line parameter
.I filename
doesn't has the extension
.BR .rdx ,
this suffix is appended before the file search is done.
For each of the found files, the user is asked if this data type
shall be used.
A symbolic link to the requested file is created.

If the option
.B \-D
is given,
the shell script searches in
.I directory
(default directory is the ReDuX data type directory
.IR  REDUX /spec\fR)
for files with file name extension
.BR .rdx .
A list of all data types found is displayed and the user is prompted
to enter one of these data type names.
.SH FILES
.PD
.TP 22
.IB REDUX /demo
Directory with the ReDuX demo programs.
.RI ( REDUX
stands for the directory where the ReDuX system is installed.)
.TP
.IB REDUX /olddemo
Directory with the ReDuX demo programs using the old specification
parser.
The shell scripts in this directory assume that the ReDuX
programs are in the current directory.
.TP
.IB REDUX /spec
Standard directory for ReDuX data type files.
.TP
.IB REDUX /src/it/algos
Standard
.IR algos-file .
.TP
.IB REDUX /typ
Standard directory for ReDuX data type files for the old specification
parser.
.PD
.SH "SEE ALSO"
.BR ac (l),
.BR ic (l),
.BR tc (l),
.BR to (l),
.BR trd (l),
.BR ts (l),
.BR uc (l).
.br
.I The ReDuX User Guide
