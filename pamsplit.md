Pamsplit User Manual(0)                                                                                                                                                               Pamsplit User Manual(0)



NAME
       pamsplit - split a multi-image Netpbm file into single-image files


SYNOPSIS
       pamsplit

       [netpbmfile

       [ output_file_pattern]]

       [-padname=n]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pamsplit reads a PNM or PAM stream as input.  It copies each image in the input into a separate file, in the same format.

       netpbmfile is the file name of the input file, or - to indicate Standard Input.  The default is Standard Input.

       output_file_pattern tells how to name the output files.  It is the file name of the output file, except that the first occurrence of '%d' in it is replaced by the image sequence number  in  unpadded
       ASCII decimal, with the sequence starting at 0.  If there is no '%d' in the pattern, pamsplit fails.

       The default output file pattern is 'image%d'.

       The  -padname option specifies to how many characters you want the image sequence number in the output file name padded with zeroes.  pamsplit adds leading zeroes to the image sequence number to get
       up to at least that number of characters.  This is just the number of characters in the sequence number part of the name.  For example, pamsplit -  outputfile%d.ppm  -padname=3  would  yield  output
       filenames outputfile000.ppm, outputfile001.ppm, etc.

       The default is no padding (equivalent to -padname=0).

       The -padname option was new in Netpbm 10.23 (July 2004).  Before that, there was never any padding.

       Note that to do the reverse operation (combining multiple single-image Netpbm files into a multi-image one), there is no special Netpbm program.  Just use cat.

       If you just want to find out basic information about the images in a stream, you can use pamfile on the stream.

       To extract images from a stream and generate a single stream containing them, use pampick.

       To run a program on each image in a stream without the hassle of temporary files, use pamexec.



SEE ALSO
       pamfile(1) , pampick(1) , pampick(1) , pnm(5) , pam(5) , cat man page



netpbm documentation                                                                            11 August 2011                                                                        Pamsplit User Manual(0)
