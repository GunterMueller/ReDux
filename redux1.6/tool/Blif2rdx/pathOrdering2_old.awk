# Project: Hardware Verification.
#    program name       : pathOrdering2.awk
#                         gawk -f pathOrdering2.awk filename
#    specification      : 1) For each rule in the input-file
#                            with contents S(t) of the LHS-
#                            operator (latch) one line will be
#                            added to the file pathOrdering.sed
#                            to delete the line:
#                               LHS-operator > RHS-operator.
#                         2) Finish file for ac.
#                         The output is printed to stdout and
#                         the file pathOrdering.sed.
#    programmer         : Werner Lauterbach
#    language           : gawk
#    last change        : 22.03.93
#                         $Date:$
#                         by $Author:$
#    version            : $Revision:$
#    bugs               : none known

BEGIN {
   first = 1
}
   /[0-9]+\)/ {
      if (match($2,/V[0-9]+[(]S[(]t[)][)]|Out[0-9]+[(]S[(]t[)][)]/) != 0) {
         match($2,/V[0-9]+|Out[0-9]+/)
         A = substr($2,RSTART,RLENGTH)
         if (match($4,/^V[0-9]+[(]t[)]|^Out[0-9]+[(]t[)]|^In[0-9]+[(]t[)]/) != 0) {
         match($4,/^V[0-9]+|^Out[0-9]+|^In[0-9]+/)
         B = substr($4,RSTART,RLENGTH)
#            print B " > " A "."
            if (first == 1) {
               print "/" A " > " B "/d" > "pathOrdering.sed"
               first = 0
            } else {
               print "/" A " > " B "/d" >> "pathOrdering.sed"
            }
         }
      }
   }
END { print "."
      print "s"
      print "p"
      print "Y"
      print "o"
#      print "k"
#      print "n"
#      print "n"
#      print "\r"
#      print "\r"
#      print "n"
#      print "d"
#      print "o"
      print "q"
}
