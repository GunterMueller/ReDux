# Project: Hardware Verification.
#    program name       : preblif.awk
#                         gawk -f preblif.awk filename
#    specification      : set a new line before each BLIF
#                         statement 
#    programmer         : Werner Lauterbach
#    language           : gawk
#    last change        : 22.01.93 
#                         $Date:$
#                         by $Author:$
#    version            : $Revision:$
#    bugs               : none known

BEGIN {
   FS=" "
   RS="\n"
}

{
   if (NR == 1) {
      file = FILENAME
      if (index(file,"/") != 0) {
         n=split(file,f,"/")
         file = f[n]
      }
      if (index(file,".blif") != 0) {
         n=split(file,f,".blif")
         file = f[1]
         preblifOut = file ".PRE"
      }
   print("### " file) > preblifOut
   }
   if (($1 == ".model") || 
      ($1 == ".inputs") || 
      ($1 == ".outputs") || 
      ($1 == ".clock") || 
      ($1 == ".end") || 
      ($1 == ".names") || 
      ($1 == ".latch") || 
      ($1 == ".exdc") || 
      ($1 == ".gate") || 
      ($1 == ".mlatch") || 
      ($1 == ".subckt") || 
      ($1 == ".search") || 
      ($1 == ".start_kiss") ||
      ($1 == ".cycle") || 
      ($1 == ".clock_event") || 
      ($1 ~ /.area|.delay|.wire.*|.input_.*|.default_.*|.output_.*/)) {
      if (match($0,/^#/) == 0) {
         print("") >> preblifOut
         print($0) >> preblifOut
      }
   } else {
     if (match($0,/^#/) == 0) {
      print($0) >> preblifOut
     }
   }
}
END {
}
