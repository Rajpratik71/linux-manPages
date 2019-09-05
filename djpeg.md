DJPEG(1)                                                      General Commands Manual                                                     DJPEG(1)

NAME
       djpeg - decompress a JPEG file to an image file

SYNOPSIS
       djpeg [ options ] [ filename ]

DESCRIPTION
       djpeg decompresses the named JPEG file, or the standard input if no file is named, and produces an image file on the standard output.  PBM‐
       PLUS (PPM/PGM), BMP, GIF, Targa, or RLE (Utah Raster Toolkit) output format can be selected.  (RLE is supported only if the URT library  is
       available.)

OPTIONS
       All  switch names may be abbreviated; for example, -grayscale may be written -gray or -gr.  Most of the "basic" switches can be abbreviated
       to as little as one letter.  Upper and lower case are equivalent (thus -BMP is the same as -bmp).   British  spellings  are  also  accepted
       (e.g., -greyscale), though for brevity these are not mentioned below.

       The basic switches are:

       -colors N
              Reduce image to at most N colors.  This reduces the number of colors used in the output image, so that it can be displayed on a col‐
              ormapped display or stored in a colormapped file format.  For example, if you have an 8-bit display, you'd need to reduce to 256  or
              fewer colors.

       -quantize N
              Same as -colors.  -colors is the recommended name, -quantize is provided only for backwards compatibility.

       -fast  Select  recommended  processing  options for fast, low quality output.  (The default options are chosen for highest quality output.)
              Currently, this is equivalent to -dct fast -nosmooth -onepass -dither ordered.

       -grayscale
              Force grayscale output even if JPEG file is color.  Useful for viewing on monochrome displays; also, djpeg runs noticeably faster in
              this mode.

       -rgb   Force RGB output even if JPEG file is grayscale.  This is provided to support applications that don't want to cope with grayscale as
              a separate case.

       -scale M/N
              Scale the output image by a factor M/N.  Currently supported scale factors are M/N with all M from 1 to 16, where N  is  the  source
              DCT  size, which is 8 for baseline JPEG.  If the /N part is omitted, then M specifies the DCT scaled size to be applied on the given
              input.  For baseline JPEG this is equivalent to M/8 scaling, since the source DCT size for baseline JPEG is 8.  Scaling is handy  if
              the image is larger than your screen; also, djpeg runs much faster when scaling down the output.

       -bmp   Select  BMP  output  format  (Windows flavor).  8-bit colormapped format is emitted if -colors or -grayscale is specified, or if the
              JPEG file is grayscale; otherwise, 24-bit full-color format is emitted.

       -gif   Select GIF output format.  Since GIF does not support more than 256 colors, -colors 256 is assumed (unless  you  specify  a  smaller
              number of colors).

       -os2   Select  BMP  output  format (OS/2 1.x flavor).  8-bit colormapped format is emitted if -colors or -grayscale is specified, or if the
              JPEG file is grayscale; otherwise, 24-bit full-color format is emitted.

       -pnm   Select PBMPLUS (PPM/PGM) output format (this is the default format).  PGM is emitted if the JPEG file is grayscale or if  -grayscale
              is specified; otherwise PPM is emitted.

       -rle   Select RLE output format.  (Requires URT library.)

       -targa Select  Targa  output  format.   Grayscale format is emitted if the JPEG file is grayscale or if -grayscale is specified; otherwise,
              colormapped format is emitted if -colors is specified; otherwise, 24-bit full-color format is emitted.

       Switches for advanced users:

       -dct int
              Use integer DCT method (default).

       -dct fast
              Use fast integer DCT (less accurate).

       -dct float
              Use floating-point DCT method.  The float method is very slightly more accurate than the int method, but is much slower unless  your
              machine  has  very  fast  floating-point  hardware.   Also  note  that results of the floating-point method may vary slightly across
              machines, while the integer methods should give the same results everywhere.  The fast integer method is much less accurate than the
              other two.

       -dither fs
              Use Floyd-Steinberg dithering in color quantization.

       -dither ordered
              Use ordered dithering in color quantization.

       -dither none
              Do  not  use dithering in color quantization.  By default, Floyd-Steinberg dithering is applied when quantizing colors; this is slow
              but usually produces the best results.  Ordered dither is a compromise between speed and quality; no dithering is fast  but  usually
              looks  awful.  Note that these switches have no effect unless color quantization is being done.  Ordered dither is only available in
              -onepass mode.

       -map file
              Quantize to the colors used in the specified image file.  This is useful for producing multiple files with identical color maps,  or
              for forcing a predefined set of colors to be used.  The file must be a GIF or PPM file. This option overrides -colors and -onepass.

       -nosmooth
              Don't use high-quality upsampling.

       -onepass
              Use  one-pass instead of two-pass color quantization.  The one-pass method is faster and needs less memory, but it produces a lower-
              quality image.  -onepass is ignored unless you also say -colors N.  Also, the one-pass method is always used  for  grayscale  output
              (the two-pass method is no improvement then).

       -maxmemory N
              Set  limit  for  amount of memory to use in processing large images.  Value is in thousands of bytes, or millions of bytes if "M" is
              attached to the number.  For example, -max 4m selects 4000000 bytes.  If more space is needed, temporary files will be used.

       -outfile name
              Send output image to the named file, not to standard output.

       -verbose
              Enable debug printout.  More -v's give more output.  Also, version information is printed at startup.

       -debug Same as -verbose.

EXAMPLES
       This example decompresses the JPEG file foo.jpg, quantizes it to 256 colors, and saves the output in 8-bit BMP format in foo.bmp:

              djpeg -colors 256 -bmp foo.jpg > foo.bmp

HINTS
       To get a quick preview of an image, use the -grayscale and/or -scale switches.  -grayscale -scale 1/8 is the fastest case.

       Several options are available that trade off image quality to gain speed.  -fast turns on the recommended settings.

       -dct fast and/or -nosmooth gain speed at a small sacrifice in quality.  When producing a color-quantized image, -onepass -dither ordered is
       fast  but much lower quality than the default behavior.  -dither none may give acceptable results in two-pass mode, but is seldom tolerable
       in one-pass mode.

       If you are fortunate enough to have very fast floating point hardware, -dct float may be even faster than -dct fast.  But on most  machines
       -dct  float is slower than -dct int; in this case it is not worth using, because its theoretical accuracy advantage is too small to be sig‐
       nificant in practice.

ENVIRONMENT
       JPEGMEM
              If this environment variable is set, its value is the default memory limit.  The value is specified as described for the  -maxmemory
              switch.   JPEGMEM  overrides  the  default  value  specified  when the program was compiled, and itself is overridden by an explicit
              -maxmemory.

SEE ALSO
       cjpeg(1), jpegtran(1), rdjpgcom(1), wrjpgcom(1)
       ppm(5), pgm(5)
       Wallace, Gregory K.  "The JPEG Still Picture Compression Standard", Communications of the ACM, April 1991 (vol. 34, no. 4), pp. 30-44.

AUTHOR
       Independent JPEG Group

BUGS
       To avoid the Unisys LZW patent (now expired), djpeg produces uncompressed GIF files.  These are larger than they should be, but  are  read‐
       able by standard GIF decoders.

                                                                   26 July 2015                                                           DJPEG(1)
