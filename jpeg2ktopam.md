Jpeg2ktopam User Manual(0)                                                                                                                                                         Jpeg2ktopam User Manual(0)



NAME
       jpeg2ktopam - convert JPEG-2000 code stream to PAM/PNM


SYNOPSIS
       jpeg2ktopam [-verbose] [-debuglevel=number] filename


OPTION USAGE
       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       jpeg2ktopam converts the named JPEG-2000 file (JP2 or JPC), or Standard Input if no file is named, to a PBM, PGM, PPM, or PAM file on Standard Output.

       The JPEG-2000 specification specifies two different formats: JP2 and JPEG-2000 code stream (JPC).  JP2 represents a visual image quite specifically, whereas JPC is a more or less arbitrary array  of
       codes.  A JP2 image contains a JPC stream and metadata describing how that stream represents a visual image.  jpeg2ktopam converts both.

       If  the color space identified in the image is grayscale (JAS_IMAGE_CS_GRAY), jpeg2ktopam generates a PGM image, unless the image contains only one bit per pixel, in which case jpeg2ktopam generates
       PBM.  If the color space is RGB (JAS_IMAGE_CS_RGB), jpeg2ktopam generates a PPM image.  If the input image is anything else, jpeg2ktopam generates a PAM image with no tuple type identified.

       In the PGM and PPM cases, jpeg2ktopam assumes the intensity values in the input image have the same meaning as for PGM and PPM.  One thing that implies  is  the  ITU-R  Recommendation  BT.709  color
       space, which means the assumption is false for JP2 input.  JP2 input uses SRGB color encoding.  So if you use jpeg2ktopam to convert a JP2 image to PPM, it changes the visual image (slightly) -- the
       colors in the output are not the same as in the input.

       In the PAM image, the output samples are numerically identical to the input samples.  If the input samples are signed, they are represented in two's complement form in the output (because  PAM  sam-
       ples are always unsigned).  The PAM plane numbers are identical to the JPC component numbers.

       A JPEG-2000 image has a "precision," which is the number of bits used for each code (in Netpbm lingo, "sample").  Actually, each component has a separate precision.  The maxval of a PGM, PPM, or PAM
       output is the largest number you can represent in the JPEG-2000 precision of the JPEG-2000 component with the greatest precision.  The samples in all components are scaled to that maxval.  So if the
       red  component  has a precision of 4 bits and the green component has a precision of 6 bits, the maxval is 63 and the red component codes from the JPEG-2000 image are multiplied by 63/15 to generate
       the output samples.

       jpeg2ktopam interprets the JPEG-2000 input with the Jasper JPEG-2000 library ⟨http://www.ece.uvic.ca/~mdadams/jasper/⟩ .  See documentation of the library for details on  what  jpeg2ktopam  handles.
       Note that the Jasper library contains facilities for writing PNM images, but jpeg2ktopam does not use those.  It uses the Netpbm library instead.  Note that the makers of the Jasper library write it
       "JasPer," but Netpbm documentation follows standard American English typography rules, which don't allow that kind of capitalization.

       Use pamtojpeg2k to convert in the other direction.

       The program jasper, which is packaged with the Jasper JPEG-2000 library, also converts between JPEG-2000 and PNM formats.  Because it's packaged with the library, it may  exploit  it  better,  espe-
       cially recently added features.  However, since it does not use the Netpbm library to read and write the Netpbm formats, it doesn't do as good a job on that side.


OPTIONS
       -verbose
              This option causes jpeg2ktopam to issue informational messages about the conversion process.


       -debuglevel=number
              This option controls debug messages from the Jasper library.  jpeg2ktopam passes number as the debug level to the Jasper JPEG-2000 decoder.




EXAMPLES
         jpeg2ktopam myimg.jpc >myimg.ppm



ABOUT JPEG-2000
       See thepamtojpeg2kmanual(1)

       for general information on JPEG-2000 compression and the JPEG-2000 formats.



SEE ALSO
       pamtojpeg2k(1) , pnmtopeg(1) , ppm(5) , pgm(5) , pbm(5) , pam(5) ,


History
       jpeg2ktopam was added to Netpbm in Release 10.12 (November 2002).

       Before Netpbm 10.49 (December 2009), jpeg2ktopam could not convert a JP2 file -- only JPC.



netpbm documentation                                                                           08 October 2009                                                                     Jpeg2ktopam User Manual(0)
