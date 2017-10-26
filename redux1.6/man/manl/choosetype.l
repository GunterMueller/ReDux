.\" @(#)choosetype.l 5 Nov 1993 WSI Universitaet Tuebingen
.if t .ds UT Universitaet Tuebingen
.if n .ds UT Uni Tuebingen
.TH CHOOSETYPE l "5 November 1993" "WSI \*(UT" "ReDuX Tools"
.SH NAME
choosetype \- copy ReDuX data type from type-directory to ./file.4
.SH SYNOPSIS
.B choosetype
[
.I directory
]
.SH DESCRIPTION
.B Choosetype
lists all files matching
.RB * .typ
in
.I directory
(default is
.BR ./typ ).
The user can enter one of the displayed data type names.
Then
.B choosetype
copies the corresponding file to
.B file.4
in the current directory.
The (empty) file
.BI _type_is_ "type name" _
is updated accordingly. It states which data type is
stored in
.BR file.4 .
.PD
.SH BUGS
The file
.BI _type_is_ "type name" _
must be present before 
.B choosetype
is called. It can be created by typing
.RB `` echo\0>\0_type_is_ ''
at the command shell prompt.
