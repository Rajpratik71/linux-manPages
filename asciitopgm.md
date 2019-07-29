Asciitopgm User Manual(0)                                                                                                                                                           Asciitopgm User Manual(0)



NAME
       asciitopgm - convert ASCII graphics into a PGM


SYNOPSIS
       asciitopgm [-d divisor] height width [asciifile]


DESCRIPTION
       This program is part of Netpbm(1)

       asciitopgm  reads  ASCII  data as input and produces a PGM image with pixel values which are an approximation of the 'brightness' of the ASCII characters, assuming black-on-white printing.  In other
       words, a capital M is very dark, a period is very light, and a space is white.

       Obviously, asciitopgm assumes a certain font in assigning a brightness value to a character.

       asciitopgm considers ASCII control characters to be all white.  For a lower case character, It assigns a special brightnesses which has nothing to do with what it  looks  like  printed.   asciitopgm
       takes the ASCII character code from the lower 7 bits of each input byte.  But it warns you if the most significant bit of any input byte is not zero.

       The output image is height pixels high by width pixels wide, truncating and padding with white on the right and bottom as necessary.

       The  divisor  value is an integer (decimal) by which the blackness of an input character is divided; the default value is 1.  You can use this to adjust the brightness of the output: for example, if
       the image is too bright, increase the divisor.

       In a sort of reminiscence of Fortran line printer carriage control, where a line starts with + (plus), asciitopgm combines it with the previous row of output instead of generating a new  row.   This
       allows a larger range of gray values.  (In Fortran carriage control, the first character of every line sent to the printer tells how much to advance the paper, with + meaning not at all, so that the
       rest of the characters on the line overstrike the ones already on the paper.  What asciitopgm does is rather different in that asciitopgm does not reserve the first character of every line that way.
       If the first character is anything but +, asciitopgm considers it just to be first character of the image.

       If you're looking for something that creates an image of text, with that text specified in ASCII, that is something quite different.  Use pbmtext for that.


SEE ALSO
       pbmtoascii(1) , pbmtext(1) , pgm(5)



AUTHOR
       Wilson H. Bent. Jr. (whb@usc.edu)



netpbm documentation                                                                           20 January 2011                                                                      Asciitopgm User Manual(0)
