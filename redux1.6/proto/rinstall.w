\documentstyle{article}

\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}
\setlength{\topmargin}{0in}
\addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}
\setlength{\textheight}{8.9in}
\setlength{\textwidth}{6.5in}
\setlength{\marginparwidth}{0.5in}

\title{The ReDuX Installation {\tt make} File}
\date{\today}
\author{}

\begin{document}
\pagenumbering{roman}
\maketitle
\tableofcontents

\section{Introduction}
\pagenumbering{arabic}
\subsection{General Information}
This is the ReDuX installation {\tt make} file. Its purpose is to do a complete
installation of the ReDuX system. To perform this task, it calls other
{\tt make} files, especially the ReDuX main {\tt make} file.

These {\tt make} files and several other files must be modified by the
current {\tt make} file to reflect the directory structure of the system
on which the ReDuX system ought to be installed.

Note that the term ``macro'' has two meanings in this {\tt nuweb}
file: Sometimes it is used to reference a {\tt nuweb} macro, 
sometimes it is used to reference a {\tt make} macro.

\subsection{Installing the ReDuX System}
Before the ReDuX installation {\tt make} file is run, parts of it must be
changed. All modifications are described in Section~\ref{PublicPartOfMakeFile},
so the rest of this file need not to be read.

If the {\tt nuweb} tool for literate programming\footnote{{\tt nuweb}
by Preston Briggs is a simple, programming language independent
tool for literate programming. It can be obtained by anonymous ftp from
one of the CTAN (Comprehensive \TeX\ Archive Network) ftp servers:
\begin{center}
\begin{tabular}{|c|c|c|}
\hline
ftp host & CTAN root & Institution and Sponsor\\
\hline\hline
ftp.tex.ac.uk & pub/archive & Aston Univ./UK TeX U.G.\\
ftp.dante.de & soft/tex & DANTE e.V.\\
ftp.shsu.edu & tex-archive & Sam Houston State Univ.\\
\hline
\end{tabular}
\end{center}}
is installed on the local system, the modification can be made in file
{\tt rinstall.w}. A run of {\tt nuweb} produces the file {\tt Makefile}
which can then be run. If {\tt nuweb} is not installed on the local system,
the changes must be made in the distributed version of the
file {\tt Makefile}.
The appropriate definitions are at the beginning of the file.

The manual pages (in directory {\tt ReDuX/man}) are not installed by
this installation {\tt make} file. This can be accomplished either
by copying the files in the system manual page directory
or by adding the path to the {\tt MANPATH} shell variable.

\section{The {\tt make} file}
\subsection{Public Part}
\label{PublicPartOfMakeFile}
In this section, macros that must be modified and targets are defined.
The other parts of this document contain
the internal part of the {\tt make} file and are only of interest for
maintaining this {\tt make} file.

\subsubsection{Macros Concerning the ReDuX System}
In this section, several macros are defined which describe
directories of the ReDuX system or other installation-dependent
data. They must be modified to reflect the properties of
the local system.

Note that these macros are used in calls to {\tt sed} where the
exclamation mark is used to terminate regular expressions. Therefore
exclamation marks are not allowed in these definitions.
Most macros are used within double quotes, so their definitions
must not contain any double quote character ({\tt "}).
Single quotes ({\tt '}) are not allowed here since the {\tt sed}
commands are already contained in single quotes.
\begin{description}
\item[ALDESPATH] is the directory which holds the ALDES translator
   and the SAC-2 system.
   @d Public {\tt make} macros
   @{#Directory for the ALDES translator and the SAC-2 system:
ALDESPATH = /usr/local/caldes3.7
@| ALDESPATH @}

\item[RDXPATH] is the ReDuX main directory.
   @d Public {\tt make} macros
   @{#Main directory of the ReDuX system:
RDXPATH = /usr/local/redux1.6
@| RDXPATH @}

\item[DPQR] is a string that indicates what library is to be used
   as default library for SAC-2 low-level routines.
   A portable ALDES version is supplied with the SAC-2 system.
   This version is used as default library if the macro is set to
   {\tt dpqr-slow}. If assembler versions are available, this macro
   should be set to the name of that library.
   @d Public {\tt make} macros
   @{#Default library for SAC-2 low-level arithmetic routines:
# default
DPQR = dpqr-slow
# for sun4c architectures (ELCs, Sparc2)
DPQR = dpqr-sun4
# for sun4m architectures (Sparc10)
#DPQR = dpqr-sun10
# for 80486 architectures
#DPQR = dpqr-i486
@| DPQR @}

\item[CLOCKSCALING] contains a non-negative integral value,
   the scaling factor for the timing function {\tt CLOCK}.
   This function determines the used
   time since process startup by a call to the system function {\tt times}(3).
   The value returned by this function is multiplied by {\tt
   CLOCKSCALING} to yield a value in milliseconds. On SUN systems,
   the system clock returns the time measured in
   $\frac{1}{60} \mbox{s}  = 16\frac{2}{3}\mbox{s}$, so {\tt CLOCKSCALING}
   should be set to 17. 

   If no timing facility is available. {\tt CLOCKSCALING}
   can be set to 0. Then a dummy function that returns always 0 is used.
   If the system has a timing function other than {\tt times}(3),
   a new {\tt CLOCK} function must be written.
   Section~\ref{GenerateCLOCK} gives some hints.
   @d Public {\tt make} macros
   @{# For SUN 4 architectures under SunOS
# CLOCKSCALING = 17
# For IBM RS/6000,  PC/Linux and Sun under Solaris 2.x
CLOCKSCALING = 10
# Use a dummy function (if no timing facility is available)
# CLOCKSCALING = 0
@| CLOCKSCALING @}
\end{description}

\subsubsection{System Dependent Tools}
This section contains the name of UNIX standard tools. 
They can be replaced by the corresponding GNU utilities.

\begin{description}
\item[AWK] is the name of the awk tool, either the original
   {\tt awk}, the new awk ({\tt nawk}) or GNU awk ({\tt gawk}).
   It must be given as absolute path name.
   The tools in the {\tt Blif2rdx} directory don't work with 
   {\tt awk}. Use one of the newer awk versions if you need those tools.
   The absolute path of the appropriate program must be given!
   @d Public {\tt make} macros
   @{# Use old awk
#AWK = /usr/bin/awk
# Use new awk
#AWK = /usr/bin/nawk
# Use GNU awk
AWK = /usr/local/bin/gawk
@| AWK @}

\item[BE] is the name of  the back end compiler.  If other
   compilers than GNU C should be used, the corresponding line must be
   modified accordingly, e.\,g.\ the line read {\tt BE = cc} if the
   standard UNIX C compiler shall be used.
   Note that the new ReDuX parser needs an ANSI C compiler.
   @d Public {\tt make} macros
   @{#Back end (C) compiler:
# GNU C compiler
BE = gcc
# Standard C compiler
#BE = cc
@| BE @}

\item[CPP] is the name of  the C preprocessor. It is used in the {\tt
   rincl} tool. If the GNU preprocessor is used, the option {\tt
   -traditional} should be used.
   @d Public {\tt make} macros
   @{#C preprocessor:
# GNU C preprocessor
#CPP = ccpp -traditional
# Standard C preprocessor
CPP = cpp
@| CPP @}

\item[OPTIMIZE:] This definition contains the optimization flag for the C
   compiler selected in the previous definition. If no optimization is
   desired, everything to the right of the equals sign must be
   deleted.
   @d Public {\tt make} macros
   @{#Optimization option for C compiler:
#Reasonable optimization on Sun 3 or Sun 4
OPTIMIZE = -O2
#For Supersparc processors (e.g. Sparc 10)
#OPTIMIZE = -O2 -msupersparc
# For PC with 80486 running Linux:
#OPTIMIZE = -O2 -m486
# no optimization
#OPTIMIZE =
@| OPTIMIZE@}

\item[LEX] is the name of the lexical analysis program
   generator.  The ReDuX parser uses some features of GNU {\tt flex} that are
   not provided by the standard {\tt lex}.
   @d Public {\tt make} macros
   @{#Name of lex-tool:
#GNU LEX tool
LEX = flex
@| LEX@}

\item[LEXLIB] contains the name of the library which is to be linked to a
   program which contains a lexical analyzer generated by
   {\tt flex}. On our system, for GNU flex the archive file's
   path must be given explicitly.  This is achieved by the definition
   {\tt LEXLIB = -L/usr/local/gnu/lib/flex -lfl}.
   @d Public {\tt make} macros
   @{#Lex library:
#LEXLIB = -ll
#GNU LEX library
LEXLIB = -L/usr/local/gnu/lib/flex -lfl
@| LEXLIB@}

\item[RANLIB\_NEEDED] is a flag indicating if the {\tt ranlib}
   program is needed. If it is set to 1, the {\tt ranlib}
   program will be invoked by several shell scripts.
   A value of 0 avoids the calls to {\tt ranlib}.
   On SunOS~4, {\tt RANLIB\_NEEDED} must be set to 1.
   On SunOS~5/Solaris, it must be set to 0. AIX has a {\tt ranlib}
   command, but it is not needed.
   @d Public {\tt make} macros
   @{# Flag indicating if ranlib is needed
# ranlib is needed: SunOS 4
RANLIB_NEEDED = 1
# ranlib is not needed: Solaris, AIX
#RANLIB_NEEDED = 0
@| RANLIB_NEEDED@}

\item[YACC] contains the name of the parser generator.
   The data type conversion tool ({\tt tool/Dtcv}) needs {\tt bison}
   to compile properly. (It can, however, be modified to compile with
   the standard {\tt yacc}. See the directions in the appropriate
   source files.)
   @d Public {\tt make} macros
   @{#Name of parser generator:
#Standard UNIX yacc
#YACC = yacc
#GNU parser generator
YACC = bison
@| YACC@}

\item[YACCFLAGS] holds the command line options for the parser generator.
   The option {\tt -d} is mandatory!
   @d Public {\tt make} macros
   @{#Flags for the parser generator:
#For standard UNIX yacc
#YACCFLAGS = -d
#For GNU bison
YACCFLAGS = -d -y
@}


\item[BEO] contains command line options which are passed to the
   back end compiler. The main purpose is to select what kind of linkage is
   to be performed, either static linkage or dynamic linkage.
   If the macro is initialized with the empty string, dynamic linking is
   used. For static linkage, {\tt BEO} must contain a system dependent
   command line option. If GNU C is used, this option is {\tt -static}.
   For the SUN~4 C~compiler, the option is {\tt -Bstatic}.
   Static linking should be used if program timings are done.
   @d Public {\tt make} macros
   @{#Linkage option for the C compiler:
#use static linkage for GNU C compiler
BEO = -static
#use static linkage for standard Unix C compiler
#BEO = -Bstatic
#use dynamic linkage
#BEO=#
@| BEO @}

\item[FILEPERM] is the access mode for readable and
   executable files that are generated by this {\tt make} file.
   Usually it should be set to 755 so that everyone
   on the system can read and execute the files, but for private
   installations (i.\,e.\ installations in someone's home directory),
   {\tt FILEPERM} may be set to 700 or 750.
   @d Public {\tt make} macros
   @{#Access mode for executables generated by this make file:
FILEPERM = 755
@| FILEPERM@}
\end{description}

\subsubsection{Public Targets}
The targets in this section are intended to be used in the command line.
All other targets in this {\tt make} file are auxiliary targets for
internal use.
\begin{description}
\item[all:] This targets performs the complete ReDuX installation.
   Since it is the first targets in the {\tt make} file, it is built if no
   targets are supplied in the command line.
   @d Targets to be used in the command line
   @{all: tools libs demo 
@}

\item[tools:] If this target is activated, shell scripts, {\tt make}
   files and {\tt lex} programs are created.
   @d Targets to be used in the command line
   @{tools: @<List of tools@>
	-cd $(RDXTOOLPATH)/Dtcv; make all
@}

\item[libs:] All library and object files of the ReDuX system are
   made. To perform this task, the ReDuX main {\tt make} file is run.
   This is the most time consuming target in this {\tt make} file.
   @d Targets to be used in the command line
   @{libs: tools $(RDXIOPATH)/io.C
	cd $(RDXMAKEPATH); make all
@}

\item[demo:] The ReDuX demo programs and small shell scripts to ease
   working with them are generated.
   @d Targets to be used in the command line
   @{demo: tools libs
	cd $(RDXDEMOPATH); make all
@}

\item[olddemo:] The ReDuX demo programs with the old parser and small
   shell scripts to ease working with them are generated.
   @d Targets to be used in the command line
   @{olddemo: tools libs
	cd $(RDXOLDDEMOPATH); make all
@}

\item[mostlyclean:] Tools and {\tt make} files that were are generated by
   a run of this {\tt make} file are removed. The return status of the
   commands is ignored to ensure that {\tt make} doesn't abort if some
   files do not exist.
   @d Targets to be used in the command line
   @{mostlyclean:
@<Commands to delete tools@>
@}

   We put the commands that delete the tools into an extra code macro
   because they are also used in the definition of the next target.
   (We can't make {\tt clean} depend on {\tt mostlyclean}
   because this would destroy the {\tt make} files that are used
   in the commands for target {\tt clean} before those commands are
   executed.)

   @d Commands to delete tools
   @{	-cd $(RDXTOOLPATH)/Dtcv; if [ -f Makefile ]; then make clean; fi
	rm -f @<List of tools@>
@}


\item[clean:] Files that were are generated by a run of this {\tt
   make} file are removed. The return status of the commands is 
   ignored to ensure that {\tt make} doesn't abort if some files do
   not exist.
   @d Targets to be used in the command line
   @{clean:
	-cd $(RDXMAKEPATH); \
	   if [ -f Makefile ]; then make cleanmak; make clean; fi
	-cd $(RDXDEMOPATH); if [ -f Makefile ]; then make clean; fi
	-cd $(RDXOLDDEMOPATH); if [ -f Makefile ]; then make clean; fi
	rm -f $(RDXIOPATH)/io.C
	@<Commands to delete tools@>
@}
\end{description}

\subsection{System Maintenance}
In this section, some macros and targets are defined that are not
intended to be used for installing the ReDuX system, but as an aid for
maintaining it.

\subsubsection{Macros}

The following macro contains a list of all ReDuX modules written in the
ALDES programming language. The module names are the subdirectories of the
ReDuX source directory ({\tt ReDuX/src}). The headers directory is not
included in this list because it is treated as a special case in the
shell scripts.
@d Private {\tt make} macros
@{AMODULES = ac acn ax co ev ic ini it rd tc tio to tp uc
@}

The next definition holds a list of ReDuX modules written in C.
@d Private {\tt make} macros
@{CMODULES = io
@}

This macro avoids trouble on systems where the {\tt SHELL} variable
might be inherited from the environment.
@d Private {\tt make} macros
@{SHELL = /bin/sh
@}

\subsubsection{Targets}
Then we define two targets. The first one creates back-up copies for
all shell scripts and {\tt make} files that are overwritten by the
installation {\tt make} file.

@d Targets for system maintenance
@{backup:
	for i in @<List of shell scripts@> @<List of {\tt make} files@>; do \
	   if [ -f $$i ]; then cp $$i $$i.bak; fi;\
	done
@}

The second one removes those back-up copies.

They can be useful if one of the shell scripts or {\tt  make} files
shall be changed: The changes can be made in  the shell scripts
until all bugs are removed. Then they can be inserted in the prototypes.
To avoid that the experimental versions are overwritten if the
installation {\tt make} file is run, back-up copies can be created by
issuing the command {\tt make backup}.
@d Targets for system maintenance
@{cleanbackup:
	for i in @<List of shell scripts@> @<List of {\tt make} files@>; do \
	   rm -f $$i.bak; \
	done
@}

\subsection{Structure of the {\tt make} File}
@o Makefile -t
@{@<Public {\tt make} macros@>
@<Private {\tt make} macros@>
@<Targets to be used in the command line@>
@<Targets for system maintenance@>
@<Targets to generate shell scripts@>
@<Targets to generate {\tt make} files@>
@<Targets to generate {\tt lex} programs@>
@<Target to generate {\tt clock.C}@>
@}

\subsection{Paths}
In this section, several macros are defined which contain
directories of the ReDuX system. They are derived from the definition
of public macros above and should not be modified.
\begin{description}
\item[RDXPROTOPATH:] In this directory, prototypes to some shell
   scripts and {\tt make} files are located. This {\tt make} file will
   copy versions of these files in which the path names are modified
   according to the data given in Section~\ref{PublicPartOfMakeFile}.
   Files in this directory must not be modified. Rather, copies of
   these files may be modified. (Otherwise, the installation {\tt make} file
   may not be able to perform the appropriate text substitutions.)
   @d Private {\tt make} macros
   @{RDXPROTOPATH = $(RDXPATH)/proto
@| RDXPROTOPATH@}

\item[RDXBINPATH] contains shell scripts that allow to work with the
   ReDuX system.
   @d Private {\tt make} macros
   @{RDXBINPATH = $(RDXPATH)/bin
@| RDXBINPATH@}

\item[RDXMAKEPATH] contains the ReDuX main {\tt make} file. This {\tt
   make} file will be created by the ReDuX installation {\tt make} file from
   a prototype located in RDXPROTOPATH.
   @d Private {\tt make} macros
   @{RDXMAKEPATH = $(RDXPATH)/mak
@| RDXMAKEPATH@}

\item[RDXITPATH] is the directory in which the ReDuX interpreter
   {\tt make} file is located.
   @d Private {\tt make} macros
   @{RDXITPATH = $(RDXPATH)/src/it/PRESRC
@| RDXITPATH@}

\item[RDXIOPATH] is the directory in which the ReDuX I/O function
   (as source code) is located.
   @d Private {\tt make} macros
   @{RDXIOPATH = $(RDXPATH)/src/io
@| RDXIOPATH@}

\item[RDXDEMOPATH] holds the ReDuX demo programs which are created by
   a {\tt make} file which in turn is created by this {\tt make} file.
   @d Private {\tt make} macros
   @{RDXDEMOPATH = $(RDXPATH)/demo
@| RDXDEMOPATH@}

\item[RDXOLDDEMOPATH] holds versions of the ReDuX demo programs that
   work with the old parser.
   @d Private {\tt make} macros
   @{RDXOLDDEMOPATH = $(RDXPATH)/olddemo
@| RDXOLDDEMOPATH@}

\item[RDXTOOLPATH] contains subdirectories in which several ReDuX tools
   are located.
   @d Private {\tt make} macros
   @{RDXTOOLPATH = $(RDXPATH)/tool
@| RDXTOOLPATH@}
\end{description}

\subsection{Generate ReDuX Tools and {\tt clock.C}}
First a list of all tools is defined.
Note that no (unmasked) line feeds are allowed in this list of file names!
@d List of tools
@{@<List of shell scripts@> \
@<List of {\tt make} files@> \
@<List of {\tt lex} programs@>@}

\subsubsection{Generate Shell Scripts}
For each of the shell scripts that are generated by the installation
{\tt make} file, we define a macro. If a new shell script is to be
added, three things need to be done: A macro for the shell script must be
defined, the new macro must be inserted in the definition
of the macro that contains a list of all shell script (see below),
and a rule for the new shell script must be written (see below).
@d ald3.7
@{$(RDXBINPATH)/ald3.7@}

@d aldr
@{$(RDXBINPATH)/aldr@}

@d blif2rdx
@{$(RDXTOOLPATH)/Blif2rdx/blif2rdx@}

@d blif2typ
@{$(RDXTOOLPATH)/Blif2rdx/blif2typ@}

@d cvcoerc
@{$(RDXTOOLPATH)/Dtcv/cvcoerc@}

@d dtcv
@{$(RDXTOOLPATH)/Dtcv/dtcv@}

@d dtcvdir
@{$(RDXTOOLPATH)/Dtcv/dtcvdir@}

@d GetPathOrdering
@{$(RDXTOOLPATH)/Blif2rdx/GetPathOrdering@}

@d GetPathOrdering\_old
@{$(RDXTOOLPATH)/Blif2rdx/GetPathOrdering_old@}

@d kwic
@{$(RDXTOOLPATH)/Kwic/kwic@}

@d mhead
@{$(RDXBINPATH)/mhead@}

@d mksrt
@{$(RDXTOOLPATH)/Dtcv/mksrt@}

@d regrep
@{$(RDXBINPATH)/regrep@}

@d rglobs
@{$(RDXBINPATH)/rglobs@}

@d rgrep
@{$(RDXBINPATH)/rgrep@}

@d rhead
@{$(RDXBINPATH)/rhead@}

@d rincl
@{$(RDXBINPATH)/rincl@}

@d rkwic
@{$(RDXBINPATH)/rkwic@}

@d rmcomm
@{$(RDXTOOLPATH)/Dtcv/rmcomm@}

@d start\_redux
@{$(RDXBINPATH)/start_redux@}

@d toc
@{$(RDXBINPATH)/toc@}

@d typ2rdx
@{$(RDXBINPATH)/typ2rdx@}

@d typ2rdxdir
@{$(RDXBINPATH)/typ2rdxdir@}

The following {\tt nuweb} macro contains a list of all shell scripts.
Prototypes of all these shell scripts are hold in the
directory {\tt RDXPROTOPATH}.  For each file, there is a prototype with file
extension {\tt .proto}.
@d List of shell scripts
@{@<ald3.7@> \
@<aldr@> \
@<blif2rdx@> \
@<blif2typ@> \
@<cvcoerc@> \
@<dtcv@> \
@<dtcvdir@> \
@<GetPathOrdering@> \
@<GetPathOrdering\_old@> \
@<kwic@> \
@<mhead@> \
@<mksrt@> \
@<regrep@> \
@<rglobs@> \
@<rgrep@> \
@<rhead@> \
@<rincl@> \
@<rkwic@> \
@<rmcomm@> \
@<start\_redux@> \
@<toc@> \
@<typ2rdx@> \
@<typ2rdxdir@> \
@}

All substitutions in the shell scripts are performed and the modified
versions of the prototypes are written to the desired places.
Modifications in the shell scripts must be performed in the prototypes,
otherwise all changes are lost if the installation {\tt make} file
is run! (There seems to be no POSIX.2-compliant method to do
the substitutions with only one rule, so we have a separate one for every shell
script.)
@D Targets to generate shell scripts
@{@<ald3.7@>: $(RDXPROTOPATH)/ald3.7.proto
@<Commands to generate a shell script@>

@<aldr@>: $(RDXPROTOPATH)/aldr.proto
@<Commands to generate a shell script@>

@<blif2rdx@>: $(RDXPROTOPATH)/blif2rdx.proto
@<Commands to generate a shell script@>

@<blif2typ@>: $(RDXPROTOPATH)/blif2typ.proto
@<Commands to generate a shell script@>

@<cvcoerc@>: $(RDXPROTOPATH)/cvcoerc.proto
@<Commands to generate a shell script@>

@<dtcv@>: $(RDXPROTOPATH)/dtcv.proto
@<Commands to generate a shell script@>

@<dtcvdir@>: $(RDXPROTOPATH)/dtcvdir.proto
@<Commands to generate a shell script@>

@<GetPathOrdering@>: $(RDXPROTOPATH)/GetPathOrdering.proto
@<Commands to generate a shell script@>

@<GetPathOrdering\_old@>: $(RDXPROTOPATH)/GetPathOrdering_old.proto
@<Commands to generate a shell script@>

@<kwic@>: $(RDXPROTOPATH)/kwic.proto
@<Commands to generate a shell script@>

@<mksrt@>: $(RDXPROTOPATH)/mksrt.proto
@<Commands to generate a shell script@>

@<mhead@>: $(RDXPROTOPATH)/mhead.proto
@<Commands to generate a shell script@>

@<regrep@>: $(RDXPROTOPATH)/regrep.proto
@<Commands to generate a shell script@>

@<rglobs@>: $(RDXPROTOPATH)/rglobs.proto
@<Commands to generate a shell script@>

@<rgrep@>: $(RDXPROTOPATH)/rgrep.proto
@<Commands to generate a shell script@>

@<rhead@>: $(RDXPROTOPATH)/rhead.proto
@<Commands to generate a shell script@>

@<rincl@>: $(RDXPROTOPATH)/rincl.proto
@<Commands to generate a shell script@>

@<rkwic@>: $(RDXPROTOPATH)/rkwic.proto
@<Commands to generate a shell script@>

@<rmcomm@>: $(RDXPROTOPATH)/rmcomm.proto
@<Commands to generate a shell script@>
@}

For the {\tt start\_redux} shell script, special commands
to create the actual script from the prototype are used.
The first reason for this is that the syntax for assignment to
environment variables is different form that of normal shell variables.
The second reason is that this shell script must be applied using the
C-shell's {\tt source} command. To avoid invocation without the
{\tt source} command, the executable bits are unset.
@d Targets to generate shell scripts
@{@<start\_redux@>: $(RDXPROTOPATH)/start_redux.proto
	sed -e 's!setenv REDUX REDUX!setenv REDUX $(RDXPATH)!' \
	    -e '/modified by the ReDuX/s/Only to be/The previous line was/' $? > $@@
	chmod $(FILEPERM) $@@
	chmod a-x $@@
@}

For the following targets, the normal commands can be used:
@D Targets to generate shell scripts
@{@<toc@>: $(RDXPROTOPATH)/toc.proto
@<Commands to generate a shell script@>

@<typ2rdx@>: $(RDXPROTOPATH)/typ2rdx.proto
@<Commands to generate a shell script@>

@<typ2rdxdir@>: $(RDXPROTOPATH)/typ2rdxdir.proto
@<Commands to generate a shell script@>
@}

Here is the {\tt sed} command that performs all text substitutions in the
shell scripts.
The last command in the call to {\tt sed} modifies
comment lines that were misleading if left unchanged.
@d Commands to generate a shell script
@{	sed -e '/ALDES=ALDES/s!=ALDES!="$(ALDESPATH)"!' \
	    -e '/AMODULES=AMODULES/s!=AMODULES!="$(AMODULES)"!' \
	    -e '1s|^#!AWK|#!$(AWK)|' \
	    -e '/AWK=AWK/s!=AWK!="$(AWK)"!' \
	    -e '/BE=BE/s!=BE!="$(BE)"!' \
	    -e '/CPP=CPP/s!=CPP!="$(CPP)"!' \
	    -e '/BEO=BEO/s!=BEO!="$(BEO)"!' \
	    -e '/CMODULES=CMODULES/s!=CMODULES!="$(CMODULES)"!' \
	    -e '/DPQR=DPQR/s!=DPQR!="$(DPQR)"!' \
	    -e '/LEXLIB=LEXLIB/s!=LEXLIB!="$(LEXLIB)"!' \
	    -e '/optimize=OPTIMIZE/s!=OPTIMIZE!="$(OPTIMIZE)"!' \
	    -e '/RANLIB_NEEDED=RANLIB_NEEDED/s!=RANLIB_NEEDED!=$(RANLIB_NEEDED)!' \
	    -e '/RDX=RDX/s!=RDX!="$(RDXPATH)"!' \
	    -e '/modified by the ReDuX/s/Only to be/The previous line was/' $? > $@@
	chmod $(FILEPERM) $@@
@}

\subsubsection{Generate {\tt make} Files}
Due to the fact that the names of the {\tt make} files are used
several times within this file, {\tt nuweb} macros are defined
to make modifications easier. If a new {\tt make} file must be added,
the same changes to this {\tt make} file must be made as in the case
of a new shell script.

@d ReDuX Dtcv {\tt make} file
@{$(RDXTOOLPATH)/Dtcv/Makefile@}

@d ReDuX demo {\tt make} file
@{$(RDXDEMOPATH)/Makefile@}

@d ReDuX interpreter {\tt make} file
@{$(RDXITPATH)/Makefile@}

@d ReDuX main {\tt make} file
@{$(RDXMAKEPATH)/Makefile@}

@d ReDuX olddemo {\tt make} file
@{$(RDXOLDDEMOPATH)/Makefile@}

This macro comprises a list of the {\tt make} files which are
generated by this {\tt make} file. In contrast to the shell scripts,
all {\tt make} files bear
the same name, so their prototypes must have modified names.
@d List of {\tt make} files
@{@<ReDuX Dtcv {\tt make} file@> \
@<ReDuX demo {\tt make} file@> \
@<ReDuX interpreter {\tt make} file@> \
@<ReDuX main {\tt make} file@> \
@<ReDuX olddemo {\tt make} file@>@} 

For each of the {\tt make} files, we have on rule:

@d Targets to generate {\tt make} files
@{$(RDXTOOLPATH)/Dtcv/Makefile: $(RDXPROTOPATH)/Dtcv_Makefile.proto
@<Commands to generate a {\tt make} file@>

$(RDXDEMOPATH)/Makefile: $(RDXPROTOPATH)/demo_Makefile.proto
@<Commands to generate a {\tt make} file@>

$(RDXITPATH)/Makefile: $(RDXPROTOPATH)/it_Makefile.proto
@<Commands to generate a {\tt make} file@>

$(RDXMAKEPATH)/Makefile: $(RDXPROTOPATH)/mak_Makefile.proto
@<Commands to generate a {\tt make} file@>

$(RDXOLDDEMOPATH)/Makefile: $(RDXPROTOPATH)/olddemo_Makefile.proto
@<Commands to generate a {\tt make} file@>
@}

We define a {\tt nuweb} macro with the statements to create
a {\tt make} file.
@d Commands to generate a {\tt make} file
@{	sed -e '/ALDES = ALDES/s!= ALDES!=$(ALDESPATH)!' \
	    -e '/BE = BE/s!= BE!= $(BE)!' \
	    -e '/BEO = BEO/s!= BEO!= $(BEO)!' \
	    -e '/DPQR = DPQR/s!= DPQR!= $(DPQR)!' \
	    -e '/LEX = LEX/s!= LEX!= $(LEX)!' \
	    -e '/LEXLIB = LEXLIB/s!= LEXLIB!= $(LEXLIB)!' \
	    -e '/OPTIMIZE = OPTIMIZE/s!= OPTIMIZE!= $(OPTIMIZE)!' \
	    -e '/YACC = YACC/s!= YACC!= $(YACC)!' \
	    -e '/YACCFLAGS = YACCFLAGS/s!= YACCFLAGS!= $(YACCFLAGS)!' \
	    -e '/RANLIB_NEEDED = RANLIB_NEEDED/s!= RANLIB_NEEDED!= $(RANLIB_NEEDED)!' \
	    -e '/RDX = RDX/s!= RDX!= $(RDXPATH)!' \
	    -e '/modified by the ReDuX/s/Only to be/The previous line was/' $? > $@@
	chmod $(FILEPERM) $@@
	chmod a-x $@@
@}
\subsubsection{Generate {\tt lex} Programs}
Again, for each of the lex programs there is a macro:
@d aglobs
@{$(RDXBINPATH)/aglobs@}

@d asplit
@{$(RDXBINPATH)/asplit@}

@d headers
@{$(RDXBINPATH)/headers@}

The following macro is a list of all ReDuX tools that are produced
from {\tt lex} programs:

@d List of {\tt lex} programs
@{@<aglobs@> \
@<asplit@> \
@<headers@> \
@}

The following {\tt make} rules generate executables
from {\tt lex} source programs.
@d Targets to generate {\tt lex} programs
@{@<aglobs@>: $(RDXTOOLPATH)/Aglobs/aglobs.lex
@<Commands to generate a {\tt lex} program@>

@<asplit@>: $(RDXTOOLPATH)/Asplit/asplit.lex
@<Commands to generate a {\tt lex} program@>

@<headers@>: $(RDXTOOLPATH)/Head/headers.lex
@<Commands to generate a {\tt lex} program@>
@}

The commands to perform this task are contained in the following macro:
@d Commands to generate a {\tt lex} program
@{	$(LEX) -t $? > $@@.c
	cd `dirname $@@`; $(BE) $(OPTIMIZE) $@@.c $(LEXLIB) -o $@@
	rm -f $@@.c
	chmod $(FILEPERM) $@@
@}

\subsubsection{Generate {\tt clock.C}}
\label{GenerateCLOCK}
In this section, a file in the ReDuX source directory is generated 
from a prototype located in the prototype directory.
It contains the {\tt CLOCK} function.
There are two cases:
\begin{enumerate}
\item
{\tt CLOCKSCALING} is set to a positive, integral number. Then 
a the {\tt CLOCK} function calls a system routine that delivers
the CPU time used so far. The value of {\tt CLOCKSCALING}
is used as scaling factor for the value returned by the system
routine.

\item
If {\tt CLOCKSCALING} is set to 0,  a dummy function that returns
always 0 is used as {\tt CLOCK} function.
\end{enumerate}

@d Target to generate {\tt clock.C}
@{$(RDXIOPATH)/io.C: $(RDXPROTOPATH)/io.C.proto
	sed -e 's/#define CLOCKSCALING CLOCKSCALING/#define CLOCKSCALING $(CLOCKSCALING)/' \
	    -e '/modified by the ReDuX/s/Only to be/The previous line was/' \
	       $? > $@@; \
	chmod $(FILEPERM) $@@
	chmod a-x $@@
@}

If the supplied {\tt CLOCK} function doesn't work on the target system
and timing shall not be disabled by setting {\tt CLOCKSCALING}
to 0, a new function must be written.
Some examples for {\tt CLOCK} functions are given in the prototype
file {\tt io.C.proto} in the prototype directory.
The preprocessor macro {\tt CLOCKSCALING} can be used by the
programmer.

\section{Indices} \label{indices}

\subsection{Macros}

@m

\subsection{Identifiers}

@u

\end{document}
