# Project: Hardware Verification.
#    program name       : postblif.awk
#                         gawk -f ISIZE=$ISIZE postblif.awk filename
#    specification      : cut all lines to ISIZE
#    programmer         : Werner Lauterbach
#    language           : gawk
#    last change        : 22.01.93
#                         $Date:$
#                         by $Author:$
#    version            : $Revision:$
#    bugs               : none known

BEGIN {
   if (ISIZE == "") {
      ISIZE = 80 
   }
}

NR == 1 {
   fname = "BLIF_" $2 ".typ"
   getline
}

NR == 2 {
   print($0) > fname
}

NR > 2 {
   if (length <= ISIZE) {print($0) >> fname}
   if (length > ISIZE) {
      line = $0
      CutLine(line)
   }
}

function CutLine (str) {
   num=split(str, lines, ",")
   i=1
   newLine=""
   while (i <= num) {
      while (length(newLine)+length(lines[i])+1 < ISIZE && i <= num) {
         if (newLine != "") {
            newLine=newLine "," lines[i]
         } else {
            newLine=lines[i]
         }            
         i++
      }
      if (i <= num) {
         print newLine "," >> fname
      } else {
         print newLine >> fname
      }            
      newLine=""
   }
}

END {}
