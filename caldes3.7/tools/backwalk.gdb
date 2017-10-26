gdb -batch -x PHBINPATH/backwalk1 a.out core | egrep '^[#][0-9]*' | uniq |\
awk 'BEGIN {ORS=""; print "back walk follows...\n"} NR != NF {print $4,"-> "} NR == NF {print $4}\
END{print "\n"}'
