Pamfix User Manual(0)                                                                                                                                                                   Pamfix User Manual(0)



NAME
       pamfix - repair a Netpbm image with various corruptions


SYNOPSIS
       pamfix

       [-verbose]

       [netpbmfile]



DESCRIPTION
       This program is part of Netpbm(1)

       pamfix  reads  a stream that is mostly a Netpbm image but may have certain types of corruptions and produces a valid Netpbm image that preserves much of the information in the original.  In particu-
       lar, Netpbm salvages streams that are truncated and that contain illegally large sample values.

       pamfix looks at only on the first image in a multi-image stream.



   Truncated stream
       This is an stream that is missing the last part.  Netpbm corrects this by creating an output image that simply has fewer rows.

       You select this kind of repair with a -truncate option.

       The header of a Netpbm image implies how large the image must be (how many bytes the file must contain).  If the file is actually smaller than that, a Netpbm program that tries  to  read  the  image
       fails,  with  an  error  message  telling  you that it couldn't read the whole file.  The data in the file is arranged in row order, from top to bottom, and the most common reason for the file being
       smaller than its header says it should be is because the bottommost rows are simply missing.  So pamfix assumes that is the case and generates a new image with  just  the  rows  that  are  readable.
       (technically, that means the output's header indicates a smaller number of rows and omits any partial last row).

       The  most  common  way for a Netpbm file to be small is that something interrupted the program that generated it before it was finished writing the file.  For example, the program ran out of its own
       input or encountered a bug or ran out of space in which to write the output.

       Another problem pamfix deals with is where the file isn't actually too small, but because of a system error, a byte in the middle of it cannot be read (think of  a  disk  storage  failure).   pamfix
       reads the input sequentially until it can't read any further, for any reason.  So it treats such an image as a truncated one, ignoring all data after the unreadable byte.

       But  be  aware  that  an image file is sometimes too small because of a bug in the program that generated it, and in that case it is not simply a matter of the bottom of the image missing, so pamfix
       simply creates a valid Netpbm image containing a garbage picture.

       If you want to test an image file to see if it is corrupted by being too small, use pamfile --allimages .  It fails with an error message if the file is too small.

       If you want to cut the bottom off a valid Netpbm image, use pamcut.



   Excessive Sample Value
       This is a stream that contains a purported sample value that is higher than the maxval of the image.

       The header of a Netpbm image tells the maxval of the image, which is a value that gives meaning to all the sample values in the raster.  The sample values represent a fraction of the  maxval,  so  a
       sample value that is greater than the maxval makes no sense.

       A regular Netpbm program fails if you give it input that contains a value larger than the maxval where a sample value belongs.

       pamfix has three ways of salvaging such a stream:



       ·      Clip to the maxval.  Request this with -clip.

       ·      Raise the maxval, thus lowering the fraction represented by every sample in the image.  Request this with -changemaxval.

       ·      Truncate the image at the first invalid sample value.  Request this with -truncate and neither -clip nor -changemaxval.


       You cannot specify both -clip and -changemaxval.



SEE ALSO
       pnm(5) , pam(5) , pamcut(1) , pamfile(1) ,


HISTORY
       pamfix  was new in Netpbm 10.66 (March 2014).  But it grew out of pamfixtrunc, which was new in Netpbm 10.38 (March 2007) and did only the truncated image repair (and for invalid sample values would
       simply pass them through to its output, generating an invalid Netpbm image).



netpbm documentation                                                                            06 March 2014                                                                           Pamfix User Manual(0)
