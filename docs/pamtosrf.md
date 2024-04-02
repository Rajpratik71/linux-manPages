Pamtosrf User Manual(0)                                                                                                                                                               Pamtosrf User Manual(0)



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"> <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">



NAME
       pamtosrf - convert a sequence of Netpbm images to a SRF image file



SYNOPSIS
       pamtosrf [-verbose] [netpbmfile]



DESCRIPTION
       This program is part of Netpbm(1)

       pamtosrf  reads  a  Netpbm image stream as input and produces a an SRF image file as output.  I don't know exactly what SRF is, but on popular use of it is in Garmin vehicle information files, which
       tell a GPS receiver how to depict a vehicle on its display.

       An SRF file can contain multiple images; each image in a multi-image Netpbm input stream becomes one image in the SRF.

       pamtosrf does not care how many images there are or what their dimensions or content are.  However, a Garmin vehicle information file has specific requirements, so if  you  don't  make  your  Netpbm
       input conform, neither will your SRF output.  For such a file, you should have two image: the first for 3D oblique views of the vehicle and the second for overhead views.  Each image is a horizontal
       concatenation of 36 square images, each rotated 10 degrees from the previous, thereby covering the full 360 degree circle.  You could create this concatenation with pnmcat -lr and you  could  create
       the invidual views with pnmrotate.


       One way to use pamtosrf is to get an SRF file, convert it to PAM with srftopam, manipulate it, then convert it back with pamtosrf.

       netpbmfile is the input stream, which defaults to Standard Input.  Output is always on Standard Output.



OPTIONS
       -verbose
              Issue informational messages about the input and the conversion process.





SEE ALSO
       ·

              srftopam(1)


       ·

              pnmcat(1)


       ·

              pam(5)




HISTORY
       srftopam was new in Netpbm 10.55 (June 2011).

       It was contributed by Mike Frysinger.



netpbm documentation                                                                             27 May 2011                                                                          Pamtosrf User Manual(0)
