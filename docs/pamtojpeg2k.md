Pamtojpeg2k User Manual(0)                                                                                                                                                         Pamtojpeg2k User Manual(0)



NAME
       pamtojpeg2k - convert PAM/PNM image to a JPEG-2000 code stream


SYNOPSIS
       pamtojpeg2k   [-imgareatlx=column]  [-imgareatly=row]  [-tilegrdtlx=column]  [-tilegrdtly=row]  [-tilewidth=columns]  [-tileheight=rows]  [-prcwidth=columns]  [-prcheight=rows]  [-cblkwidth=columns]
       [-cblkheight=rows] [-mode={integer|int|real}] [-compression=ratio] [-ilyrrates=ratestring] [-numrlvls=number]  [-progression={lrcp|rlcp|rpcl|pcrl|cprl}]  [-numgbits=number]  [-nomct]  [-sop]  [-eph]
       [-lazy] [-termall] [-segsym] [-vcausal] [-pterm] [-resetprob] [-verbose] [-debuglevel=number] filename

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pamtojpeg2k converts the named PBM, PGM, PPM, or PAM file, or Standard Input if no file is named, to a JPEG-2000 code stream (JPC) file on Standard Output.

       The JPEG-2000 specification specifies two separate formats: JP2 and JPEG-2000 code stream (JPC).  JP2 represents a visual image quite specifically, whereas JPC is a more or less arbitrary  array  of
       codes.   pamtojpeg2k  can't  produce  a JP2, but the JPC image that pamtojpeg2k produces is very similar to a JP2 if the input is a PBM, PGM, or PPM image or equivalent PAM image.  One difference is
       that the RGB intensity values in a JP2 are SRGB values, while pamtojpeg2k produces ITU-R Recommendation BT.709 values.  Those are very similar, but not identical.  Another difference is that  a  JP2
       can contain extra information about an image that JPC cannot.

       When the input is a PAM image other than a PBM, PGM, or PPM equivalent, the JPC raster produced contains whatever the PAM raster does.  It can have any number of planes with any meanings; the planes
       are in the same order in the JPC output as in the PAM input.

       A JPC image has a "precision," which is the number of bits used for each code (in Netpbm lingo, "sample").  Actually, it has a separate precision for each component.  pamtojpeg2k uses for the preci-
       sion of every component the least number of bits that can represent the maxval of the input image.  A JPC image does not have an independent concept of maxval; the maxval of a JPC sample is the max-
       imum value that the number of bits specified by the precision can represent in pure binary code.  E.g. if the precision is 4, the maxval is 15.  pamtojpeg2k does of course scale  the  sample  values
       from the input maxval to the output maxval.  Example: The input maxval is 99.  This means JPC precision is 7 bits and the JPC maxval is 127.  A sample value of 33 in the input becomes a sample value
       of 43 in the output.

       pamtojpeg2k generates the JPC output with the Jasper JPEG-2000 library ⟨http://www.ece.uvic.ca/~mdadams/jasper/⟩ .  See documentation of the library for details on what pamtojpeg2k  produces.   Note
       that  the  Jasper  library  contains  facilities for reading PNM images, but pamtojpeg2k does not use those.  It uses the Netpbm library instead.  Note that the makers of the Jasper library write it
       "JasPer," but Netpbm documentation follows standard American English typography rules, which don't allow that kind of capitalization.

       Use jpeg2ktopam to convert in the other direction.

       The program jasper, which is packaged with the Jasper JPEG-2000 library, also converts between JPEG-2000 and PNM formats.  Because it's packaged with the library, it may  exploit  it  better,  espe-
       cially recently added features.  However, since it does not use the Netpbm library to read and write the Netpbm formats, it doesn't do as good a job on that side.

       Another  format  with goals similar to those of JPEG-2000 but that allows for faster encoding and decoding, is JPEG-LS.  CharLS ⟨http://charls.codeplex.com⟩  is a package of software for using JPEG-
       LS.



OPTIONS
       Most of the options are identical in name and function to options that the Jasper library JPC encoder subroutine takes.   See  Jasper  documentation  ⟨http://www.ece.uvic.ca/~mdadams/jasper/⟩    for
       details.  Here, we document only options that are not direct analogs of Jasper options.




       -compression=ratio
              ratio  is  a  floating point number that specifies the compression ratio.  pamtojpeg2k will adjust quality as necessary to ensure that you get this compression ratio.  E.g. 4 means the output
              will be about one fourth the size in bytes of the input file.

              The ratio concerns just the raster part of the image, with the denominator being what the raster would take if it were encoded the most naive way possible (e.g. 3 bytes per  pixel  in  8-bit-
              per-sample  RGB).  It does, however, include metadata that is part of the compressed raster.  Because of that, it may not be possible to give you your requested compression ratio at any qual-
              ity.  If it isn't, pamtojpeg2k fails with a message saying so.

              If you don't specify this option, pamtojpeg2k gives you the best compression it can without losing any quality.  Because of the metadata issue described above, this  may  mean,  for  a  small
              image, the image actually expands.

              Note that though the Jasper library takes a compression factor, this option specifies a compression ratio.  The compression factor is the multiplicative inverse of (1 divided by) the compres-
              sion ratio.

              Before Netpbm 10.61 (December 2012), the default was a compression ratio of 1, and if pamtojpeg2k could not make the output that small, it just made it as small as it could, with  zero  qual-
              ity.  You know this is happening when you see the warning message, 'empty layer generated.'


       -verbose
              This option causes pamtojpeg2k to issue informational messages about the conversion process.


       -debuglevel=number
              This option controls debug messages from the Jasper library.  pamtojpeg2k passes number as the debug level to the Jasper JPC encoder.




EXAMPLES
       This example compresses losslessly.

         pamtojpeg2k myimg.ppm >myimg.jpc

       jpeg2ktopam will recreate myimg.ppm exactly.

       This example compresses the file to one tenth its original size, throwing away information as necessary.

         pamtojpeg2k -compression=10 myimg.pgm >myimg.jpc



ABOUT JPEG-2000
       JPEG-2000  is  a  format that compresses a visual image (or a similar set of data) into a minimal number of bytes for storage or transmission.  In that, its goal is similar to JPEG.  It has two main
       differences from JPEG.

       One difference is that it does a much better job on most images of throwing out information in order to achieve a smaller output.  That means when you reconstruct the image from the  resulting  com-
       pressed  file, it looks a lot closer to the image you started with JPEG-2000 than with JPEG, for the same compressed file size.  Or, looked at another way, with JPEG-2000 you get a much smaller file
       than with JPEG for the same image quality.

       The second difference is that with JPEG-2000, you decide how much compression you want and the compressor adjusts the quality to meet your requirement, whereas with JPEG, you decide how much quality
       you  want  and the compressor adjusts the size of the output to meet your requirement.  I.e. with JPEG-2000, the quality of the result depends on the compressibility of the input, but with JPEG, the
       size of the result depends on the compressibility of the input.

       With JPEG-2000, you can specify lossless compression, thus making it compete with GIF and PNG.  With standard JPEG, you always lose something.  (There are rumored to be  variations  of  JPEG  around
       that are lossless, though).

       JPEG  is  much  older  than  JPEG-2000 and far more popular.  JPEG is one of the half dozen most popular graphics formats and virtually all graphics facilities understand it.  JPEG-2000 is virtually
       unknown.

       There is no compatibility between JPEG and JPEG-2000.  Programs that read JPEG do not automatically read JPEG-2000 and vice versa.



SEE ALSO
       jpeg2ktopam(1) , pnmtopeg(1) , ppm(5) , pgm(5) , pbm(5) , pam(5) ,


History
       pamtojpeg2k was added to Netpbm in Release 10.12 (November 2002).



netpbm documentation                                                                           31 January 2014                                                                     Pamtojpeg2k User Manual(0)
