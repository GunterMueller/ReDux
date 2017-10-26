.\" @(#)scat.l 16 Dec 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH SCAT l "16 December 1993" "WSI \*(UT" "ALDES Tools"
.SH NAME
scat \- find and display ALDES source text of a SAC-2 algorithm
.SH SYNOPSIS
.B scat
.I algorithm-name
[
.I path
]
.SH DESCRIPTION
If
.B scat
is called with one argument,
it searches for a file whose name is matched by
.IB algorithm-name .ald
in the standard
.B SAC-2
source directory and its subdirectories.
Each source file contains one algorithm with the same name as the file.
.I Algorithm-name
has to be written in lower case letters and without file name extension.

For the WSI-CA installation of
.BR scat ,
the default directory for the
.B SAC-2
system is
.BR /usr/local/caldes .

If
.I path
is provided as a second argument,
.B scat
searches that directory for files.
It is assumed that it is structured like the standard
.B SAC-2
directory.

.\".SH ENVIRONMENT
.\"If
.\".B scat
.\"is called with one argument and the shell variable
.\".B ALDES
.\"is set,
.\".B scat
.\"searches the path given in
.\".BR ALDES .
.PD
.SH "SEE ALSO"
.BR regrep (l),
.BR rgrep (l)
