Srftopam User Manual(0)                                                                                                                                                               Srftopam User Manual(0)



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"> <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">



NAME
       srftopam - convert a SRF image file to Netpbm images



SYNOPSIS
       srftopam [-verbose] [netpbmfile]



DESCRIPTION
       This program is part of Netpbm(1)

       srftopam reads a SRF image file as input and produces a multi-image stream of PAM images as output.

       This  program  performs  the inverse of the conversion that pamtosrf does.  See that program's manual for more information about SRF and the relationship between the SRF and Netpbm representation of
       the images.

       netpbmfile is the input stream, which defaults to Standard Input.  Output is always on Standard Output.



OPTIONS
       -verbose
              Issue informational messages about the input and the conversion process.





SEE ALSO
       ·

              pamtosrf(1)


       ·

              pamdice(1)


       ·

              pamsplit(1)


       ·

              pam(5)




HISTORY
       srftopam was new in Netpbm 10.55 (June 2011).

       It was contributed by Mike Frysinger.



netpbm documentation                                                                             27 May 2011                                                                          Srftopam User Manual(0)
