Sunicontopnm User Manual(0)                                                                                                                                                       Sunicontopnm User Manual(0)



NAME
       sunicontopnm - convert a Sun icon into a Netpbm image



SYNOPSIS
       sunicontopnm [iconfile]



DESCRIPTION
       This program is part of Netpbm(1)

       sunicontopnm reads a Sun icon as input and produces a PBM or PGM image as output.

       If the input is of the Depth=8 variety, the output is PGM.  Otherwise, it is PBM.  Before Netpbm 10.53 (December 2010), the program would not work on a Depth=8 icon.

       If  the  input  is  color, the output is still PGM (the program can't do any better because developers haven't figured out how).  If you know the palette used by the Sun icon image, you can use pam-
       lookup to convert the PGM output to the proper color Netpbm image.



ABOUT SUN ICONS
       It seems that this icon format was used in Sunview and was usable in its successor Openlook/Openwindows in Sun 4.1.1, which offered backward compatibility for Sunview,  including  the  icons.   Sun-
       view's desktop was monochrome.  OpenWindows had color icons.  Sun 4 came with OpenWindows.  OpenWindows appears to have been an X-based gui so presumably the icons were mostly XPM files.

       So in addition to sunicontopnm, you should try xpmtoppm and xbmtopbm on icons from a Sun Workstation.



SEE ALSO
       pbmtosunicon(1) , winicontoppm(1) , xpmtoppm(1) , xbmtoppm(1) , infotopam(1) , pbm(5)

       pgm(5)



HISTORY
       Jef Poskanzer wrote the program under the name icontopbm in 1988.

       In October 2010, Prophet Of The Way (afu@wta.att.ne.jp) converted it to use the more recent 'packed PBM' library functions, thus speeding it up

       Netpbm  10.53  (December  2010)  renamed the program to sunicontopnm.  This name reflects the fact that there are lots of kinds of icons in the world besides the Sun variety, Windows ones being most
       popular.  It also takes into account the new Depth=8 capability (see below).

       Netpbm 10.53 (December 2010) added the ability to work with Depth=8 icon input and input with 32 bit 'items.'  Whereas the previous program always produced PBM output, the new program  produced  PGM
       in the Depth=8 case.



netpbm documentation                                                                           23 October 2010                                                                    Sunicontopnm User Manual(0)
