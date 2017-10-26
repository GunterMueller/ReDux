# Project: Hardware Verification.
#    program name       : pathOrdering1.awk
#                         gawk -f pathOrdering1.awk filename
#    specification      : 1) Initialization for ac.
#                         2) For each rule in the input-file
#                            the top operator of the LHS is
#                            set to be greater then each
#                            operator of the RHS. If the
#                            contents of the top operator of
#                            the LHS is S(t) (not t) S is also
#                            greater.
#                            The output is printed to stdout.
#    programmer         : Werner Lauterbach
#    language           : gawk
#    last change        : 22.03.93
#                         $Date:$
#                         by $Author:$
#    version            : $Revision:$
#    bugs               : none known

BEGIN { numOrder = 0
        print ""
        print "i"
        print "i"
        print "P"
        print "Y"
        print "1"
        print "1"
        print "1"
        print "l"
        print "or > xor."
        print "or > and."
        print "imply > xor."
        print "imply > and."
        print "imply > H."
        print "equal > xor."
        print "equal > H."
        print "not > xor."
        print "not > H."
        print "xor > L."
        print "and > L."
        print "and > xor."
}
   /[0-9]+\)/ { 
      if (match($2,/V[0-9]+|Out[0-9]+/) != 0) {
         A = substr($2,RSTART,RLENGTH) # LHS operator
         # All identifiers of the RHS are set to be lower then the LHS-operator.
         # If the contents of the LHS-operator is S(t) and not t, S must be also greater.
         B = $4 # RHS
         while (match(B,/V[0-9]+|Out[0-9]+|In[0-9]+|S|not|and|or|xor|equal|imply|L|H/) != 0) {
            BI = substr(B,RSTART,RLENGTH) # Operator
            B = substr(B,RSTART+RLENGTH) # Reductum
            order = A " > " BI "."
            if (knownOrd(order) == 0) {
               numOrder++
               orderList[numOrder] = order
               print order
            } 
            if (match($2,/S/) != 0) {
               order =  "S > " BI "."
               if (knownOrd(order) == 0) {
                  numOrder++
                  orderList[numOrder] = order
                  print order
               }
            }
         }
      }
   }

function knownOrd(order) {
   found=0
   i=numOrder
   while (i>=1) {
      if (orderList[i] == order) {
         found=1
         break
      }
      i--
   }
   return found
}

END {}
