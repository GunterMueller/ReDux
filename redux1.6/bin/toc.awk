#
BEGIN {FOUND=0}
/^[^\[]/ {FOUND=0}
 /^                    [A-Za-z]/ { H=$0; FOUND=1 }
 /^\[/ {if (FOUND==1) {print FILENAME," = " H; FOUND=0} }

