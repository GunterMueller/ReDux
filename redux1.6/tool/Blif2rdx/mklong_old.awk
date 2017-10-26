# Project: Hardware Verification.
#    program name       : mklong_old.awk
#                         gawk -f mklong_old.awk filename
#    specification      : Write each rule in one line.
#                         The output is printed to stdout.
#                         (For data types in the old syntax.)
#    programmer         : Werner Lauterbach
#    language           : gawk
#    last change        : 22.03.93
#                         $Date:$
#                         by $Author:$
#    version            : $Revision:$
#    bugs               : none known

BEGIN {
    moreLines = 0;
    L = ""
}

{
    lastchar = substr($0,length($0),length($0))

    if ( lastchar == "," ) {
        L = L $0;
        moreLines = 1
    }

    if ( lastchar == ")" && !moreLines ) {
	print $0
    }

    if ( lastchar == ")" && moreLines ) {
	print L $0;
	moreLines = 0;
	L = ""
    }
    
    if ( lastchar != "," && lastchar != ")" ) {
	print $0
    }
}
