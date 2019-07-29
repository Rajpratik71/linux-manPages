Pammixinterlace User Manual(0)                                                                                                                                                 Pammixinterlace User Manual(0)



NAME
       pammixinterlace - mix adjacent lines to merge interlaced images


SYNOPSIS
       pammixinterlace

       [-filter={linear, fir, ffmpeg}]

       [-adaptive]

       [infile]



DESCRIPTION
       This program is part of Netpbm(1)

       pammixinterlace  is  meant  to operate on an image which is the interlacing of two images, where raster rows 0, 2, 4, etc. are from one image and rows 1, 3, 5, etc. are from another.  (See below for
       why you might expect to encounter such an image).

       pammixinterlace makes each row of the output a mixture of the corresponding row of the input and its two neighbors.  It uses half of the main row and a quarter each of the two neighbor rows.

       This can be useful if the image is a video capture from an interlaced video source.  In that case, each row shows the subject 1/60 second before or after the two rows that surround it.  If the  sub-
       ject is moving, this can detract from the quality of the image.

       In  video  data streams, you often find each frame contains only half the rows of the image -- the odd half or the even half.  The displayer of the stream displays the rows in their proper positions
       on a CRT as they come in.  When you display the rows in this order, the CRT has less flicker because a particular area of the screen gets refreshed twice as often.  In the process of capturing  such
       a  stream,  computers  often  generate the interlaced image of the type that pammixinterlace works with.  But this interlaced image, when displayed on a CRT, does not look the same as if a displayer
       were rendering the stream directly on a CRT as it arrived, because of the timing of when the various pixels get drawn and subsequently fade.  That's why you need something like pammixinterlace.

       You may prefer the effect of simply extracting one of two images.  You can do that with pamdeinterlace.



OPTIONS
       -filter={linear,fir,ffmpeg}
              This option chooses between one of the three filtering mechanisms.  linear is a linear-blend formula.  fir is a size-5 FIR low-pass filter, and ffmpeg is a formula pulled from the  documenta-
              tion of the program ffmpeg ⟨http://ffmpeg.mplayerhq.hu⟩ .

              The default is fir.


       -adaptive
              This option turns on "adaptive" filtering mode.  In this mode pammixinterlace modifies only pixels that are obviously part of a "comb" pattern.





SEE ALSO
       pamdeinterlace(1) , pam(5)

       pnm(5)



netpbm documentation                                                                           22 February 2007                                                                Pammixinterlace User Manual(0)
