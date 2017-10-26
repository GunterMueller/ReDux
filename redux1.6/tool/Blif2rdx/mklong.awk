# Project: Hardware Verification.
#    program name       : mklong.awk
#                         gawk -f mklong.awk filename
#    specification      : Write each rule in one line.
#                         The output is printed to stdout.
#    programmer         : Werner Lauterbach
#    language           : gawk
#    last change        : 22.03.93
#                         $Date:$
#                         by $Author:$
#    version            : $Revision:$
#    bugs               : none known

BEGIN {
    moreLines = 0;   # moreLines=1 means that a line break within
                     # a rule has been occured.
    L = ""           # Used to collect the lines of a multi-line rule.
}

{
    lastchar = substr($0,length($0),length($0))

    if ( lastchar == "," ) {   # Possible line break within rule.
        L = L $0;
        moreLines = 1
    } else if ( lastchar == ";" ) {   # End of rule found.
        if ( !moreLines )   # Single-line rule.
           print $0
        else {              # Multi-line rule.
           print L $0;
           moreLines = 0;
           L = ""
        }
    } else   # Other line.
       print $0
}






