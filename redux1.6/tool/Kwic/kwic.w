\documentstyle{article}

\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}
\setlength{\topmargin}{0in}
\addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}
\setlength{\textheight}{8.9in}
\setlength{\textwidth}{6.5in}
\setlength{\marginparwidth}{0.5in}

\title{A KWIC Index Generator}
\date{\today}
\author{Jochen Walter}

\begin{document}
\maketitle
\tableofcontents

\section{Program Description}
\subsection{Synopsis}
\begin{description}
\item[kwic] [ {\bf -w} {\it width} ] [ {\bf -f} {\it skip-focus} ]
[ {\bf -F} {\it focus-column} ]
[ {\bf -s} {\it skip-module} ] [ {\bf -S} {\it module-column} ]
[ {\bf -c} ]\\{}
[ {\bf -x} {\it filename} ] [ {\bf -W} ] [ {\bf -Q} ]
\end{description}

\subsection{Description}
{\tt  Kwic}
generates a KWIC (keywords in context) index of a text read from
{\bf standard input}
onto
{\bf standard output}.
It
has three phases: The first does the rotation, generating one
line for each word in the input line except for words
which are contained in the exclusion file (see option
{\tt -x}).
The rotated lines are then sorted. Finally, the sorted lines
are formatted as KWIC index.

The output lines are sorted on a character-by-character basis,
starting with the focus column. The default collating sequence is
the sequence of ASCII characters with lower case letters mapped
to upper case ones.

The program is based on an example given in \cite{awk}.

\subsection{Options}
\begin{description}
\item[-w {\em width}:]
Set output width to
{\em  width}
characters. Default value is 80.
\item[-f {\em skip-focus}:]
Set the number of columns left blank before the focus column to
{\em skip-focus}.
Default is 2.
\item[-F {\em focus-column}:]
Select
{\em focus-column}
as the column for the focus. The default is the middle
of the output lines.
\item[-s {\em skip-module}:]
Set the number of columns left blank before the column for the
module name (see option
{\tt -Q})
to
{\em skip-module}.
Default is 1.
\item[-S {\em module-column}:]
Set the column for the module name to
{\em module-column}.
The default is
{\em width}
decreased by one, i.e. there are two columns for the module name.

\item[-c:]
Do not ignore case of letters in the sorting phase.
\item[-x {\em filename}:]
Exclude lines with one of the words in this file in the focus position
from the KWIC index.
The file must contain one word per line.
No exclusion file is used if
{\bf -}
is used for
{\em filename}.
If this option is not
selected, the program assumes the default file name
{\tt SKIPWORDS}.
It is considered an error if
{\em filename}
does not exist.
If this option is not selected and file
{\tt SKIPWORDS}
does not exist, a warning is issued, but the program continues to run.

\item[-W:]
Enable wrapping. Free space on each line is used to print the part
of the left or right context that is too long.
The wrapped part is separated by
``\verb*/\ /''
if text is wrapped to the left hand side
or by 
``\verb*/ \/''
if text is wrapped to the right hand side.

\item[-Q:]
The first word in each input line is considered as module name
which is to be printed in the last columns of the output lines.
\end{description}

\subsection{Files}
\begin{description}
\item[./SKIPWORDS]
is the default name for the exclusion file.
\end{description}

\section{The Program}
In this section, the global program lay-out is given. The whole program
is a Bourne shell script, but large parts of it are indeed programs
in the {\tt awk} programming language.
The file is named {\tt kwic.proto} because it is intended to be a
prototype which is processed by the ReDuX installation {\tt make}
file to yield the actual shell script.
Note that in the {\tt nuweb} macros which form the pipe no (unmasked)
line feed characters are allowed!
@o kwic.proto
@{#!/bin/sh
# kwic -- generate KWIC index
# Usage: kwic [-w n] [-f n] [-F n] [-s n] [-S n] [-c] [-x filename] [-W] [-Q]
# Do not modify this file, modify kwic.w instead!
@<Set system parameters@>
@<Process command line@>
@<Set derived system parameters@>
@<Check if parameters are valid@>
@<Create temporary files@>
@<Create intermediate kwic listing@> |
@<Sort intermediate kwic listing@> |
@<Format and print result@> |
@<Strip trailing blanks@>
@<Delete temporary files@>
@}

\subsection{Set System Parameters}
Here we initialize several variables with default values. Most of them can
be overridden by command line options.

\begin{description}
\item[AWK] contains the name of the awk program, either {\tt awk},
{\tt gawk} or {\tt nawk}. Since the name of the used awk program
is to be inserted by the ReDuX installation {\tt make} file,
we don't give the name of the program, but a pattern that will be
replaced by the actual value.
If the output of this {\tt nuweb} file is not to be processed by
the installation {\tt make} file, the right hand side of the assignment
must be set to an appropriate value.
@d Set system parameters
@{ AWK=AWK
#^^^^^^^          Only to be modified by the ReDuX 
#                 installation make file!
@| AWK @}

\item[USAGE] contains a string which explains the command line options
of this program.
@d Set system parameters
@{USAGE="Usage: $0 [-w n] [-f n] [-F n] [-s n] [-S n] [-c] [-x filename] [-W] [-Q]"
@| USAGE @}

\item[width] contains the total width of the output.
@d Set system parameters
@{width=80
@| width @}

\item[skipfocus] holds the number of blanks which separate the focus
column from the left part of each output line.
@d Set system parameters
@{skipfocus=2
@| skipfocus @}

\item[skipmodname] contains the number of blanks which separate
the module name from the other part of an output line.
@d Set system parameters
@{skipmodname=1
@| skipmodname @}

\item[printmodname:] If this variable is set to 1, the program assumes that
the first entry in every input line contains a module name which is to
be appendend to the output lines. If it contains 0, there is no special
treatment of the first field of the input lines.
@d Set system parameters
@{printmodname=0
@| printmodname @}

\item[wrap:] If this variable is set to 1, long lines are wrapped,
i.\,e.\ free space in each line is used to hold text that is to large to
fit in the appropriate column.
If it is set to 0, no wrapping is done.
@d Set system parameters
@{wrap=0
@| wrap @}

\item[sortopt] contains the command line options for the {\tt sort} program.
Usually it is set to {\tt -f} so that lower case letters are
folded into the equivalent upper case letters when sorting,
so that, e.\,g., ``b'' is sorted the same way ``B'' is.
If this behaviour is not desired, {\tt sortopt} must be set
to the empty string.
@d Set system parameters
@{sortopt=-f
@| sortopt @}
\end{description}

\subsection{Process Command Line}
The command line is parsed and shell variables are set according to
the command line options.
The variables {\tt OPTARG} and {\tt OPTIND} are set by {\tt getopts}.
The last statement shifts the command line so that all (already
processed) command line options are discarded.

@d Process command line
@{while getopts w:f:F:s:S:cx:WQ c
do
   case $c in
   w)   width=$OPTARG;;
   f)   skipfocus=$OPTARG;;
   F)   focus=$OPTARG;;
   s)   skipmodname=$OPTARG;;
   S)   modname=$OPTARG;;
   c)   sortopt="";;
   x)   skipwords=$OPTARG;;
   W)   wrap=1;;
   Q)   printmodname=1;;
   \?)  echo $USAGE
        exit 2;;
   esac
done
shift `expr $OPTIND - 1`
@| c OPTARG OPTIND skipwords @}

\subsection{Set Derived System Parameters}
In this section, several shell variables are defined whose values are
derived from the values of previously defined shell variables.
If they have already values due to command line options, their values
are left untouched.
\begin{description}
\item[focus] contains the focus column, i.\,e.\ the column in which
the right part of an entry starts. Normally, this is the middle of
the output lines.
@d Set derived system parameters
@{focus=${focus:-`expr $width / 2`}
@| focus @}

\item[modname] contains the column
in which the module name should be
printed. Usually the module name comprises two letters,
so {\tt modname} is set to the value of {\tt width} decreased by
one.
@d Set derived system parameters
@{modname=${modname:-`expr $width - 1`}
@| modname @}
\end{description}

\subsection{Check if Parameters are Valid}

First, it is checked if any arguments which are not command line
options are passed to the shell script.
@d Check if parameters are valid
@{if [ $# -ne 0 ]; then
   echo "Illegal arguments found:" $* 1>&2
   echo $USAGE 1>&2
   exit 2
fi
@}

Then it is verified that the number of blanks in front of the focus
is non-negative.
@d Check if parameters are valid
@{if [ $skipfocus -lt 0 ]; then
   echo "Number of blanks in front of focus must be non-negative!" 1>&2
   echo $USAGE 1>&2
   exit 2
fi
@}

Next, we check if the focus column is set so that at least the blanks
in front of it can be printed.
@d Check if parameters are valid
@{if [ $focus -le $skipfocus ]; then
   echo "Focus column too far to the left!" 1>&2
   echo $USAGE 1>&2
   exit 2
fi
@}

The next three tests are irrelevant if no module names are to be
printed.
We check if the number of blanks in front of the module name
is non-negative.
@d Check if parameters are valid
@{if [ \( $printmodname -eq 1 \) -a \( $skipmodname -lt 0 \) ]; then
   echo "Number of blanks in front of module name must be non-negative!" 1>&2
   echo $USAGE 1>&2
   exit 2
fi
@}

Now we check if the column for the module name is chosen appropriately:
@d Check if parameters are valid
@{if [ \( $printmodname -eq 1 \) -a \( `expr $focus + $skipmodname` -gt $modname \) ]; then
   echo "Column for module name too far to the left!" 1>&2
   echo $USAGE 1>&2
   exit 2
fi
@}

Then we check if the output width is large enough for the module name.
@d Check if parameters are valid
@{if [ \( $printmodname -eq 1 \) -a \( $modname -gt $width \) ]; then
   echo "Output width too small!" 1>&2
   echo $USAGE 1>&2
   exit 2
fi
@}

Finally, we check if the output width is large enough to
allow the focus column to be printed:
@d Check if parameters are valid
@{if [ $focus -gt $width ]; then
   echo "Output width too small!" 1>&2
   echo $USAGE 1>&2
   exit 2
fi
@}

\subsection{Handling of Temporary Files}
First, we define four macros for the temporary files.
The first two macros hold the base names for the two temporary files.
(They are needed in one of the {\tt awk} programs, where the slashes
({\tt /}) in the full paths would cause harm.)
@d Tmp data file
@{kwicdata@}

@d Tmp skipwords file
@{kwicskipwords@}

The next two macros hold the full names. The expression \verb/$$/
which expands to the shell's process number is used to ensure unique file names
even if two instances of the program are run at the same time.
@d Tmp data file, full name
@{/tmp/@<Tmp data file@>.$$@}

@d Tmp skipwords file, full name
@{/tmp/@<Tmp skipwords file@>.$$@}

Next, we define a trap which deletes the temporary files even if the shell
script terminates abnormally, e.\,g.\ if the user presses Control-C.
@d Create temporary files
@{trap '@<Delete temporary files@>' 1 2 15
@}

Then two temporary files are created. The first one holds the skip words.
If the user didn't use the {\tt -x} option, the program assumes that a
file named {\tt SKIPWORDS} in the local directory is used.
If such a file exists, it is copied to the {\tt /tmp} directory.
Otherwise, a warning message is issued and an empty file is created.

If a file name is given in the command line, there are two possible
cases: Either the file name is {\tt -} which means that an empty file is
created in the {\tt /tmp} directory. Otherwise, the given file is 
copied to the {\tt /tmp} directory.
If the file doesn't exist, an error message is printed and the program
is aborted.

The error message that is output by {\tt cp} if a file does not exist
is redirected to {\tt /dev/null}.
@d Create temporary files
@{if [ -z "$skipwords" ]; then
   cp SKIPWORDS  @<Tmp skipwords file, full name@> 2>/dev/null || {
      echo "Warning: File SKIPWORDS not found." 1>&2
      cp /dev/null @<Tmp skipwords file, full name@>
   }
else
   if [ $skipwords = - ]; then skipwords=/dev/null; fi
   cp $skipwords @<Tmp skipwords file, full name@> 2>/dev/null || {
      echo "Error: File $skipwords not found." 1>&2
      echo $USAGE 1>&2
      exit 2
   }
fi
@}

Now we create a temporary file which holds the input lines which
are read from {\em stdin}.
The TAB character and blanks have special meanings for
the KWIC index generator. Therefore, the input lines must
be pre-processed to ensure correct program behaviour.
First, all TAB characters are replaced by blanks.
Inn a second step, {\tt sed} is used to remove any leading and trailing
blanks. Finally, all sequences of more than one blank is replaced by a
single blank.

@d Create temporary files
@{tr '\011'  ' ' |
sed -e 's/^ *//' -e 's/ *$//' -e 's/  */ /g' > @<Tmp data file, full name@>
@}

Finally, there is a macro that contains a command to delete the
temporary files.
@d Delete temporary files
@{rm -f @<Tmp data file, full name@> @<Tmp skipwords file, full name@>
@}

\subsection{Create Intermediate KWIC Listing}

The first {\tt awk} program reads skip words and stores them in an array from
the first file. Then is reads and proccesses data from the second file.
The contents of the shell variable {\tt printmodname} is passed to the
{\tt awk} variable {\tt PRINTMODNAME} so that the {\tt awk}
program can access them.

@d Create intermediate kwic listing
@{$AWK 'FILENAME ~ /@<Tmp skipwords file@>/ { @<Read skip words@> }
     FILENAME ~ /@<Tmp data file@>/ { @<Read and process data@> }
    ' PRINTMODNAME=$printmodname @<Tmp skipwords file, full name@> \
    @<Tmp data file, full name@> @| PRINTMODNAME @}

If there are any skip words, then {\tt nosw} (number of skip words)
$>0$ and they are hold in {\tt skpw[1]} $\ldots$ {\tt skpw[nosw]}.
A blank is appended to each skip word to simplify searches in the array
of skip words.
@d Read skip words
@{skpw[++nosw] = $0 " ";
@| skpw nosw @}

After the skip words have been read, each line of input is
scanned for blanks which denote the beginning
of a word. If a blank is found, the line is processed further.
@d Read and process data
@{@<Begin with next input line@>
for (i=length(data); i>0; i--) {
   if (substr(data,i,1) == " ")
      @<Process rotated line@>
}
@| i @}

The variable {\tt data} contains the line which is rotated and
entered in the KWIC index, {\tt modulename} contains a module name
which is printed as suffix on each line in the KWIC index.
(If {\tt kwic} is called without the option {\tt -Q}, {\tt modulename}
is set to the empty string.)
@d Begin with next input line
@{if ( PRINTMODNAME == 1) {
   modulename = $1;
   data = substr($0,length(modulename)+2);
} else {
   modulename = "";
   data = $0;
}
i=0;
@<Process rotated line@>
@| modulename data @}

The variable {\tt lcolumn} contains the left column of the KWIC index,
{\tt rcolumn} holds the right column. A blank is appended to
{\tt rcolumn} to simplify the search in the list of skip words.
@d Process rotated line
@{{  lcolumn = substr(data,1,i-1);
   rcolumn = substr(data,i+1) " ";
   @<Print KWIC entry@>
}
@}

If the the processed line does not start with a word from
the list of skip words, is it printed.
@d Print KWIC entry
@{found = 0;
@<Search for skip word@>
if (found == 0)
   print substr(rcolumn,1,length(rcolumn)-1)  "\t" lcolumn "\t" modulename
@| found @}

We check if the entry starts with one of the words in the list
of skip words. To avoid that a short word (e.\,g.\ ``a'')
causes that all words which start with this word (e.\,g.\ ``axiom'')
are omitted, we appended a blank to all skip words.
This doesn't work if the entry consists of only one word.
As a remedy for this case, we appended a blank to the entry
which is discarded before it is output.
@d Search for skip word
@{for (j=nosw; 0<j; j--) {
   if ( index(rcolumn,skpw[j])==1 ) {
      found=1;
      break;
   }
}
@| j @}

\subsection{Sort Intermediate KWIC Listing}

The rotated lines are piped through {\tt sort}. The shell variable
{\tt sortopt} determines if lower case letters are mapped to upper
case ones while the sorting phase.
@d Sort intermediate kwic listing
@{sort $sortopt@}

\subsection{Format and Print Result}
This invocation of {\tt awk} formats the sorted KWIC listing
and prints it to the standard output.
@d Format and print result
@{$AWK '
   BEGIN { FS="\t"; }
   { @<Print one line@> }
   ' WIDTH=$width FOCUS=$focus SKIPFOCUS=$skipfocus \
     MODNAME=$modname SKIPMODNAME=$skipmodname \
     PRINTMODNAME=$printmodname WRAP=$wrap@|
WIDTH FOCUS SKIPFOCUS MODNAME SKIPMODNAME PRINTMODNAME WRAP @}

The variable {\tt lwidth} contains the number of columns for the left
part of each output line (i.\,e. to the left of the focus and the
blanks which separate the focus from the left part).  The variable {\tt
rwidth} holds the width of the right part of each output line
(excluding the module name and the blanks which separate the module
name from the rest of the line).

@d Print one line
@{lwidth=FOCUS-SKIPFOCUS-1
if ( PRINTMODNAME == 1 )
   rwidth=(MODNAME-SKIPMODNAME-1)-(FOCUS-1);
else
   rwidth=WIDTH-(FOCUS-1);
@| lwidth rwidth @}

The variables {\tt llength} and {\tt rlength} hold the length of the
text for left and the right column.
In {\tt lexceed} and {\tt rexceed} the parts of the text which
don't fit in the regular space are kept.

@d Print one line
@{llength=length($2)
rlength=length($1)
lexceed=substr($2,1,llength-lwidth)
rexceed=substr($1,rwidth+1)
@| llength rlength lexceed rexceed @}

After these auxiliary variables have been initialized,
the three parts of a line are printed.
@d Print one line
@{@<Print left part of line@>
@<Print right part of line@>
@<Print module name@>
@}

Three cases must be distinguished for the left part of a line:
First, the text may be too long to fits into its field. In this case,
the longest postfix that fits is taken.

The next case is that the text
fits in its field, and there is no wrapping from the right part
(either because there is not enough space left (at least three free
columns are needed!), the right part fits into
its field, or {\tt kwic} has been called without the {\tt -W} option.
In this case the text is printed right-justified.

The most complicated case arises if a part of the right column must be
wrapped into the field for the left part of the line.

@d Print left part of line
@{if ( llength > lwidth )
   printf("%s",substr($2,llength-(lwidth-1)));
else if ( llength > lwidth-3 || rexceed=="" || WRAP==0 )
   printf("%" lwidth-llength "s%s","",$2);
else
   @<Print left part of line, wrapping@>
@}

Here we must distinguish two cases: Either the wrapped part fits
completely into the remaining space of the field for the left part,
or it must be truncated. In the former case, the wrapped part,
``\verb*/\ /'', a sufficient number of blanks and the
left part of the line is printed.

In the latter case, the longest prefix of the wrapped part,
``\verb*/\ /'', and the left part is printed.

@d Print left part of line, wrapping
@{if ( length(rexceed)+2 <= lwidth-llength )
   printf("%s\\ %" lwidth-llength-(length(rexceed)+2) "s%s",rexceed,"",$2);
else
   printf("%s\\ %s",substr(rexceed,1,lwidth-llength-2),$2);
@}

Now the blanks in front of the focus column are printed.
@d Print right part of line
@{printf("%" SKIPFOCUS "s","");
@}

Then the right part of the KWIC entry is printed. There are the same
three cases as in the case of the left part.
@d Print right part of line
@{if ( rlength > rwidth )
   printf("%s",substr($1,1,rwidth));
else if ( rlength > rwidth-3 || lexceed=="" || WRAP==0 )
   printf("%s%" rwidth-rlength "s", $1, "")
else
   @<Print right part of line, wrapping@>
@}

If the right part is printed with a wrapped part from the left hand
side,
there are again two cases that are similar to the two cases above. Only
the sequence of the printed strings is reversed.
@d Print right part of line, wrapping
@{if ( length(lexceed)+2 <= rwidth-rlength )
   printf("%s%" rwidth-rlength-length(lexceed)-2 "s \\%s",$1,"",lexceed);
else
   printf("%s \\%s",$1,substr(lexceed,length(lexceed)-(rwidth-rlength-2)+1));
@}

Finally, the module name and some blanks to separate the module name
from the right part of the output line must be printed if {\tt kwic}
was called with option {\tt -Q}. A newline character completes
the output line.
@d Print module name
@{if ( PRINTMODNAME == 1 ) {
   printf("%" SKIPMODNAME "s","");
   printf("%s",substr($3,1,WIDTH-(MODNAME-1)));
}
printf("\n");
@}

\subsection{Strip Trailing Blanks}

If no module names are printed, the output may contain trailing blanks
because the program pads the output so that each line ends in the same
column. These blanks are removed by a call to {\tt sed}.
@d Strip trailing blanks
@{sed 's/ *$//'@}

\begin{appendix}

\section{Indices} \label{indices}

\subsection{Macros}

@m

\subsection{Identifiers}

@u

\begin{thebibliography}{9}
\bibitem{awk}
Alfred V.~Aho, Brian W.~Kernighan, Peter J.~Weinberger:
The AWK Programming Language,
Addison-Wesley 1988
\end{thebibliography}

\end{appendix}

\end{document}
