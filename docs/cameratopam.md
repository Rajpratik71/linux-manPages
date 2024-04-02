Cameratopam User Manual(0)                                                                                                                                                         Cameratopam User Manual(0)



NAME
       cameratopam - convert raw camera image to PAM


SYNOPSIS
       cameratopam

       [input_file_name]

       [-identify_only] [-quick_interpolate] [-half_size] [-four_color_rgb] [-document_mode] [-balance_auto] [-balance_camera] [-red_scale=float] [-blue_scale=float] [-brightness=fraction] [-no_clip_color]
       [-rgb] [-secondary] [-linear] [-verbose]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign  between  an  option
       name and its value.


DESCRIPTION
       This program is part of Netpbm(1)

       cameratopam converts from any of dozens of raw camera image formats to PAM.

       Digital still cameras often can produce images in a special raw format in addition to something more standard such as TIFF or JFIF (JPEG).  Software supplied with the camera allows you to manipulate
       the image using information which is lost when the camera converts to the common format.  A particular camera model often has a unique raw format.




OPTIONS
       -identify_only
              Report to Standard Error the format of the input image but don't generate an output image.  Program fails if it cannot recognize the format.


       -verbose
              Report to Standard Error details of the processing.


       -quick_interpolate
              Use simple bilinear interpolation for quick results.  The default is to use a slow, high-quality adaptive algorithm.


       -half_size
              Half-size the output image.  Instead of interpolating, reduce each 2x2 block of sensors to one pixel.  Much faster than -quick_interpolate.


       -four_color_rgb
              Interpolate RGB as four colors.  This causes a slight loss of detail, so use this only if you see false 2x2 mesh patterns in blue sky.


       -document_mode
              Show the raw data as a grayscale image with no interpolation.  This is good for photographing black and white documents.


       -balance_auto
              Automatic color balance.  The default is to use a fixed color balance based on a white card photographed in sunlight.


       -balance_camera
              Use the color balance specified by the camera.  If cameratopam can't find this, it prints a warning and reverts to the default.


       -red_scale=float

       -blue_scalefloat
              Further adjust the color balance by multiplying the red and blue channels by these values.  Both default to 1.0.


       -brightness=float
              Change the output brightness.  Default is 1.0.


       -no_clip_color
              By default, cameratoapm clips all colors to prevent pink hues in the highlights.  Combine this option with -brightness=0.25 to leave the image data completely unclipped.


       -rgb   Write raw camera colors to the output file.  By default, cameratoapm converts to sRGB colorspace.


       -secondary
              For cameras based on the Fuji Super CCD SR, this option causes cameratopam to use the secondary sensors, in effect underexposing the image by four stops to reveal detail  in  the  highlights.
              cameratopam silently ignores this option for all other cameras.


       -linear
              This option causes cameratopam to generate a variation on PAM that has 'linear' color samples.  In true PAM, each sample in the image raster is gamma-corrected; i.e. it is essentially propor-
              tional to brightness.  With the linear option, cameratopam generates an image in which the samples are instead proportional to light intensity.

              Without -linear, the image maxval is 255, so the image contains one byte per sample.  With -linear, the maxval is 65535, so the image contains two bytes per sample.

              Without -linear, cameratopam uses a 99th percentile white point.  With -linear, it doesn't.  I don't know what that means.





SEE ALSO
       411toppm(1) , pamflip(1) , pam(5) ,


HISTORY
       cameratopam was new in Netpbm 10.28 (June 2005).

       It was derived from the program dcraw by Dave Coffin ⟨http://www.cybercom.net/~dcoffin/dcraw/⟩ , by Bryan Henderson in April 2005.  Bryan replaced the part that generates the Netpbm output image and
       removed the Adobe Photoshop output function.  Bryan changed the command syntax and made other small changes to make the program consistent with Netpbm.  He also split the source code into manageable
       pieces (dcraw has a single 5000 line source file).



netpbm documentation                                                                            12 April 2005                                                                      Cameratopam User Manual(0)
