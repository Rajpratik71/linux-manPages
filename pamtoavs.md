Pamtoavs User Manual(0)                                                                                                                                                               Pamtoavs User Manual(0)



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"> <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">



NAME
       pamtoavs - convert a Netpbm image to an AVS X image



SYNOPSIS
       pamtoavs [netpbmfile]



DESCRIPTION
       This program is part of Netpbm(1)

       pamtoavs  reads a Netpbm image as input and produces a Stardent <acronym xml:lang="en" title="Application Visualization System">AVS</acronym> X image as output. AVS X images are one of the few image
       formats Gnuplot ⟨http://www.gnuplot.info/⟩  v4.2 and later can use.

       netpbmfile is the input file, which defaults to Standard Input.  Output is always on Standard Output.

       Try the following:

           gnuplot> plot 'myimage.avs' binary filetype=avs with rgbimage

       See the Gnuplot manual (1)
        for more information.



AUTHOR
       Copyright © 2010 Scott Pakin, scott+pbm@pakin.org.



SEE ALSO
       avstopam(1) , gnuplot ⟨http://www.gnuplot.info/⟩ , pam(5)



netpbm documentation                                                                           7 February 2010                                                                        Pamtoavs User Manual(0)
