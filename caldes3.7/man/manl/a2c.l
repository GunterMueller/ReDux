.TH a2c 1 "1994 May 20" Version 3.7

.UC 4
.SH NAME
a2c \- AlDes to C translator, made for the SAC-2 algebraic algorithms. 
.SH SYNOPSIS
.B a2c
[
.B \-i
][[
.I u
]
.I file
]] [
.B \-l
][[
.I u
]
.I file
]] [
.B \-o
][[
.I u
]
.I file
]] [
.B \-e
[
.I n
]] [
.B \-w
[
.I n
]] [
.B \-t
] [
.I id=value...
] [
.I file
]
.br

.SH DESCRIPTION
.I a2c
 translates the 
.I file 
of AlDes algorithms to the C lamguage.
.I a2c
 returns an exit code of 0 to the operating system if no errors occur
during translation and otherwise 1.
If 
.I file
 is not present, 
.I a2c
 translates standard input.
   If an option letter is followed by one or two parameters, there
are no blanks between the letter or between the parameters.

   The options 
.I \-i
, 
.I \-l
 and 
.I \-o
 specify respectively the
initialization-, log- and output-units and/or files. Unit 
.I u
consists
of a single digit. File names may
include path-names. The option 
.I \-e
sets the echo level and the option 
.I \-w
 the warning level of the 
translator. The option 
.I \-t
 puts trace information in each 
translated algorithm. 
   The command line may contain macros of the form 
.I id=value.
 They
have the same effect as declarations 
.I pragma 
.I id=value.
at the beginning of the input file. Pragmas effect in various ways the
process of translation. See section
.I PRAGMAS
 for a description.

.SH DEFAULT FILES
The name 
.I a2c
is generic in the sense that if the name of the executable changes
all default file names change too.
 The default  
initialization file is 
.I a2c.ini
 on unit 
.I CUNIT=3.
 The default log file is 
.I a2c.log
 on 
.I LUNIT=1 
in the current directory.
 Depending on the echo level the translator reports to the message unit
(usually the screen). A log file may be helpful
for collecting warnings and error messages. 
 If the last parameter 
.I file
 of
the command line is present the translation goes by default to
a file with the same name 
.I file
 and the C language extension 
.I .c
on unit 
.I FUNIT=8
 . If input comes from standard input,
translation goes by default to standard output, if there is no 
.I \-o
option specified.

.PP

.SH a2c Options
.TP 31
.BI \-i	
suppress initialization from a file. 


.TP
.BI \-i "file"
use 
.I file
 as initialization file on unit 
.I CUNIT=3.

.TP
.BI \-i "ufile"
	 use 
.I file
 as initialization file on 
.I CUNIT= 
.I u.

.TP
.BI \-l	
suppress translator messages to a log file. 


.TP
.BI \-l "file"
	 use 
.I file
 on 
.I LUNIT=1 
as log file.
 
.TP
.BI \-l "ufile"
	 use 
.I file
 on 
.I LUNIT=
.I u
 as log file. 
     Note that 
.I LUNIT=0 
omits log messages. In this case 
.I file
     may be ommitted.

.TP
.BI \-o	
suppress translation output. 


.TP
.BI \-o "file"
	send translation to 
.I file
 on 
.I FUNIT=8.

.TP
.BI \-o "ufile
	send translation to 
.I file
 on 
.I FUNIT=
.I u.

.TP
.BI \-e	
set the echo level to 0. This suppresses all translator 
messages, except error messages.

.TP
.BI \-e "n"
	set the echo level to 
.I n. 

 Echo level 0 is equivalent to 
.BI \-e. 

 Echo level 1 is the default. The logo and success message
of the translator is given, also each algorithm name after it was parsed
successfully. Error messages and warnings according to the warning level
are reported. 

 Echo level 2 gives in addition for each algorithm 
the translation
time and the number of cells used.  

 Echo level 3 adds finally an 
echo of the input as it is read. Echo of the input can independently 
also be achieved by  ``
.I pragma 
.I ECHO=true
 .''

.TP
.BI \-w	
set the warning level to 0. This suppresses all translator
warnings.

.TP
.BI \-w "n"
	set the warning level to 
.I n
 . Warning level 0 is equivalent
to 
.BI \-w. 

 Warning level 1 is the default. Warnings are given,
except warning no. 2 and no. 12 and warnings on style. 


 Warning level 2 includes warning no. 2 and no. 12.
 Warning no. 2 
reports variables defined which are
not used. It occurs if not all output parameters of a subalgorithm are
needed outside. It may, however, also indicate some (typing) mistake.
 Warning no. 12 complains about common input and output parameters. 
   For the call by value semantics of input parameters of the host 
language C, this is not a problem,  for languages with a call by 
reference semantics this may be a problem.  


 Warning level 3 includes complains about missing comments 
and the use of identifiers against the AlDes conventions. 
 It is recommended before printing an algorithm with LaTeX.
 	
.TP
.BI \-t	
trace flag. All algorithms on input are translated with
trace information. On call the algorithm name and the input parameters,
on exit again the name and the output parameters are printed on the
message unit. The main program must initialize the symbol module with
.I BEGINU
 . Any attempt to trace subalgorithms of the 
.I TRC 
algorithm
causes an infinite loop.
.TP

.SH PRAGMAS
 The following macros are recognized on the command line. They affect 
the behavior of the translator (except 
.I TMU 
and 
.I TNU
) not of the 
generated output prgram.
.TP
.B ECHO=n	
.B n
=1 turns on echoing the input, 
.B n
=0 (default) turns it off.
.TP
.B TRACE=n	 
.B n
=1 turns on the generation of trace information,
.B n
=0 (default) turns it off.
.TP
.B SYINT=n	 
.B n
=2 generates symbol table output in format 
.I a2c.ini(4), 

.B n
=1 (default) generates no additional output.
.TP
.B xUNIT=n	 
.B x 
may be 
.B C, F, I, L, M, O 
and 
.B n 
is a unit number. Set the
.B xUNIT 
to number 
.B n. 
.B C 
is the initialization\-, 
.B F 
the translation output\-,
.B I 
the input\- and 
.B L 
the log\-file, 
.B M 
the message unit and 
.B O 
the output unit.
.TP
.B ISIZE=n	
set the length of the input line to 
.B n. n 
must be less than 256.
 It is not recommended to set 
.B n 
large since the input buffer is filled 
up to ISIZE with blanks.
.TP
.B RMARG=n	
set the right margin of the output to 
.B n.
.TP
.B LMARG=n	
set the left margin of the output to 
.B n.
.TP
.B GCM=n	
.B n
=1 turns the garbage collection message on, 
.B n
=0 (default) off.
.TP
.B RHO=n	
set the cut off for the garbage collector to 
.B n. If the garbage
collector returns less than 
.I NU/RHO
 free cells, the program stops.
.TP
.B TMU=n	
set the stack size 
.I MU 
in the translated output to 
.B n 
(see the note on 
.I TNU
).
.TP
.B TNU=n	
set the size 
.I NU 
of 
.I SPACE 
in the translated output to 
.B n.
.PP
 Note, if the output is bound with a library, some linkers require that
all dimension declarations of the same identifier agree. Other linkers
take the maximal dimension. This option must be handled with care.

.SH EXAMPLES
.IP
.I a2c
.PP
calls the translator interactively. Output is to the screen.
.IP
.I a2c 
.I test.ald
.PP
translates the file test.ald to file i
.I test.c 
where 
.I H 
denotes the extension of the host
language.
.IP
.I a2c 
.I \-i 
.I SYINT=2 
.I si.ald
.PP
translates to file 
.I si.c 
without prior initialization. The output on
.I LUNIT 
can be used as initialization file.
.IP
.I cat 
.I test.h  
.I test.ald |  
.I a2c 
.I \-i 
.I \-otest.c
.PP
translates the header file 
.I test.h 
and then the file 
.I test.ald 
to the
output file 
.I test.c
 . There is no initialization besides 
.I test.h.
.IP
.I a2c 
.I \-e3 
.I test.ald
.PP
 The output to the message unit starts with the echo of the default
initizialiation file 
.I a2c.ini
 . Then the file 
.I test.ald 
is displayed
and translated to the file 
.I test.c
 . After each algorithm name the
time and number of cells used is displayed. Finally, the totals are
given.
.IP
.I a2c 
.I MUNIT=LUNIT
.PP
translates standard input to standard output. Messages go to the log
file 
.I a2c.log. 

.SH EVIRONMENT VARIABLE
.I ALD
points to the AlDes root directory. If set, 
.I a2c
checks \fIALD\fP/ETC for the file
.I a2c.ini.
Otherwise, the current directory is searched.

.SH FILES
.I a2c.ini - default initialization file.

.I a2c.log - default log file.

.SH SEE ALSO
.I ald(1), 
.I a2c.ini(4).

.SH AUTHORS
.I a2c
was written by R"udiger Loos \fIet al.\fP; see the AlDes Report
for details.
