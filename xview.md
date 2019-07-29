XLI(1)                                                                                     General Commands Manual                                                                                     XLI(1)



NAME
       xli, xsetbg, xview - load images into an X11 window or onto the root window

SYNOPSIS
       xli [global_options] {[image_options] image ...}
       xli [global_options] [image_options] stdin < image

DESCRIPTION
       xli displays images in an X11 window or loads them onto the root window.  See the IMAGE TYPES section below for supported image types.

       If the filename stdin is given, xli will read the image from standard input.

       If  the  destination  display  cannot  support the number of colors in the image, the image will be dithered (monochrome destination) or have its colormap reduced (color destination) as appropriate.
       This can also be done forcibly with the -halftone, -dither, and -colors options.

       A variety of image manipulations can be specified, including gamma correction, brightening, clipping, dithering, depth-reduction, rotation, and zooming.  Most  of  these  manipulations  have  simple
       implementations; speed was opted for above accuracy.

       If  you are viewing a large image in a window, the initial window will be at most 90% of the size of the display unless the window manager does not correctly handle window size requests or if you've
       used the -fullscreen or -fillscreen options.  You may move the image around in the window by dragging with the first mouse button.  The cursor will indicate which directions you may drag, if any.

       When the keyboard focus is in the window you can:
       Type 'q' or '^C' to exit xli.
       Type space, 'n' or 'f' to move to the next image in the list.
       Type 'b' or 'p' to move to the previous image in the list.
       Type . to reload the image.
       Type l to rotate the image anti-clockwise.
       Type r to rotate the image clockwise.
       Type 0 to set the images assumed gamma to your display gamma
              (usually darkens images)
       Type 1 to set the images assumed gamma to 1.0
              (usually lightens images)
       Type 5-2 to lighten the image (5 in small steps, up to 2 in large steps)
       Type 6-9 to darken the image (6 in small steps, up to 9 in large steps)

       A wide variety of common image manipulations can be done by mixing and matching the available options.  See the section entitled HINTS FOR GOOD IMAGE DISPLAYS for some ideas.

       Xsetbg is equivalent to xli -onroot -quiet and xview is equivalent to xli -view -verbose.

RESOURCE CLASS
       xli uses the resource class name _XSETROOT_Id for window managers which need this resource set.

GLOBAL OPTIONS
       The following options affect the global operation of xli.  They may be specified anywhere on the command line.

       -default
              Set the root background to the default root weave.  This is the same as xsetroot with no arguments.

       -debug Talk to the X server in synchronous mode.  This is useful for debugging.  If an X error is seen while in this mode, a core will be dumped.

       -dumpcore
              Signals will not be trapped, and instead a coredump will occur.

       -display display_name
              X11 display name to send the image(s) to.

       -dispgamma Display_gamma
              Specify the gamma correction value appropriate for the display device.  This overides the value read from the environment variable DISPLAY_GAMMA, or the default value of 2.2, which is approx-
              imately correct for many displays. A value of between 1.6 and 2.8 is reasonable. If individual images are too bright or dark, use the -gamma option.

       There  is  an image provided with xli called 'chkgamma.jpg' that lets you set the display gamma reasonably accurately.  This file contains two grayscale ramps. The ramps are chosen to look linear to
       the human eye, one using continuous tones, and the other using dithering.  When the display gamma is correct, then the two ramps should look symmetrical, and the point at  which  they  look  equally
       bright should be almost exactly half way from the top to the bottom. (To find this point it helps if you move away a little from the screen, and de-focus your eyes a bit.)

       If  the  equal  brightness  point  is  above center increase the gamma, and decrease it if it is below the center. The value will usually be around 2.2 Once you've got it right, you can set the DIS-
       PLAY_GAMMA environment variable in your .profile

       -fillscreen
              Use the whole screen for displaying an image. The image will be zoomed so that it just fits the size of the screen. If -onroot is also specified, it will be  zoomed  to  completely  fill  the
              screen.

       -fit   Force image to use the default visual and colormap.  This is useful if you do not want technicolor effects when the colormap focus is inside the image window, but it may reduce the quality of
              the displayed image.  This is on by default if -onroot or -windowid is specified.

       -fork  Fork xli.  This causes xli to disassociate itself from the shell.  This option automatically turns on -quiet.

       -fullscreen
              Use the whole screen for displaying an image. The image will be surrounded by a border if it is smaller than the screen. If -onroot is also specified, the image will be zoomed so that it just
              fits the size of the screen.

       -geometry WxH[{+-X}{+-}Y]
              This  sets  the  size  of the window onto which the images are loaded to a different value than the size of the image.  When viewing an image in a window, this can be used to set the size and
              position of the viewing window.  If the size is not specified in the geometry, (or is set to 0), then the size will be chosen to be small enough to able to fit the window in  the  screen  (as
              usual).

       -goto image_name
              When  the  end of the list of images is reached, go to image image_name.  This is useful for generating looped slideshows.  If more than one image of the same name as the target exists on the
              argument list, the first in the argument list is used.

       -help [option ...]
              Give information on an option or list of options.  If no option is given, a simple interactive help facility is invoked.

       -identify
              Identify the supplied images rather than display them.

       -install
              Forcibly install the images colormap when the window is focused.  This violates ICCCM standards and only exists to allow operation with naive window managers.  Use this option  only  if  your
              window manager does not install colormaps properly.

       -list  List the images which are along the image path.

       -onroot
              Load image(s) onto the root window instead of viewing in a window.  This option automatically sets the -fit option.  This is the opposite of -view.  XSetbg has this option set by default.  If
              used in conjunction with -fullscreen, the image will be zoomed to just fit. If used with -fillscreen, the image will be zoomed to completely fill the screen. -border, -at,  and  -center  also
              affect the results.

       -path  Displays the image path and image suffixes which will be used when looking for images.  These are loaded from ~/.xlirc and optionally from a system wide file (normally /usr/lib/xlirc).

       -pixmap
              Force the use of a pixmap as backing-store.  This is provided for servers where backing-store is broken (such as some versions of the AIXWindows server).  It may improve scrolling performance
              on servers which provide backing-store.

       -private
              Force the use of a private colormap.  Normally colors are allocated shared unless there are not enough colors available.

       -quiet Forces xli and xview to be quiet.  This is the default for xsetbg, but the others like to whistle.

       -supported
              List the supported image types.

       -verbose
              Causes xli to be talkative, telling you what kind of image it's playing with and any special processing that it has to do.  This is the default for xview and xli.

       -version
              Print the version number and patchlevel of this version of xli.

       -view  View image(s) in a window.  This is the opposite of -onroot and the default for xview and xli.

       -visual visual_name
              Force the use of a specific visual type to display an image.  Normally xli tries to pick the best available image for a particular image type.  The available visual types  are:   DirectColor,
              TrueColor, PseudoColor, StaticColor, GrayScale, and StaticGray.  Nonconflicting names may be abbreviated and case is ignored.

       -windowid hex_window_id
              Sets  the  background  pixmap of a particular window ID.  The argument must be in hexadecimal and must be preceded by "0x" (eg -windowid 0x40000b.  This is intended for setting the background
              pixmap of some servers which use untagged virtual roots (eg HP-VUE), but can have other interesting applications.

PERSISTENT IMAGE OPTIONS
       The following options may precede each image.  They take effect from the next image, and continue until overridden or canceled with -newoptions.

       -border color
              This sets the background portion of the window or clipped image which is not covered by any images to be color.

       -brighten percentage
              Specify a percentage multiplier for a color images colormap.  A value of more than 100 will brighten an image, one of less than 100 will darken it.

       -colors n
              Specify the maximum number of colors to use in the image.  This is a way to forcibly reduce the depth of an image.

       -cdither

       -colordither
              Dither the image with a Floyd-Steinberg dither if the number of colors is reduced.  This will be slow, but will give a better looking result with a restricted color set.  -cdither  and  -col-
              ordither are equivalent.

       -delay secs
              Sets xli to automatically advance to the following image, secs seconds after the next image file is displayed.

       -dither
              Dither  a color image to monochrome using a Floyd-Steinberg dithering algorithm.  This happens by default when viewing color images on a monochrome display.  This is slower than -halftone and
              affects the image accuracy but usually looks much better.

       -gamma Image_gamma
              Specify the gamma of the display the image was intended to be displayed on.  Images seem to come in two flavors: 1) linear color images, produced by ray tracers, scanners etc. These  sort  of
              images generally look too dark when displayed directly to a CRT display. 2) Images that have been processed to look right on a typical CRT display without any sort of processing. These images
              have been 'gamma corrected'. By default, xli assumes that 8 bit images have been gamma corrected and need no other processing. 24 bit images are assumed to be linear.  If a  linear  image  is
              displayed  as  if it is gamma corrected it will look too dark, and a gamma value of 1.0 should be specified, so that xli can correct the image for the CRT display device. If a gamma corrected
              image is displayed as if it were a linear image, then it will look too light, and a gamma value of (approximately) 2.2 should be specified for that image.  Some formats (RLE) allow the  image
              gamma  to  be  embedded  as  a comment in the file itself, and the -gamma option allows overriding of the file comment.  In general, values smaller than 2.2 will lighten the image, and values
              greater than 2.2 will darken the image.  In general this will work better than the -brighten option.

       -gray  Convert an image to grayscale.  This is very useful when displaying colorful images on servers with limited color capability.  The optional spelling -grey may also be used.

       -idelay secs
              Set the delay to be used for this image to secs seconds (see -delay).  If -delay was specified, this overrides it.  If it was not specified, this sets the automatic  advance  delay  for  this
              image while others will wait for the user to advance them.

       -smooth
              Smooth a color image.  This reduces blockiness after zooming an image up.  If used on a monochrome image, nothing happens.  This option can take awhile to perform, especially on large images.
              You may specify more than one -smooth option per image, causing multiple iterations of the smoothing algorithm.

       -title window_title
              Set the titlebar of the window used to display the image.  This will overide any title that is read from the image file. The title will also be used for the icon name.

       -xpm color_context_key
              Select the prefered xpm colour map. XPM files may contain more than one color mapping, each mapping being appropriate for a particular visual.  Normally xli will select  an  apropriate  color
              mapping  from that supported by the XPM file by checking on the default X visual class and depth.  This option allows the user to overide this choice.  Legal values of  color_context_key are:
              m, g4, g and c.  m = mono, g4 = 4 level gray, g = gray, c = color ).

       -xzoom percentage
              Zoom the X axis of an image by percentage.  A number greater than 100 will expand the image, one smaller will compress it.  A zero value will be ignored.  This option, and the related  -yzoom
              are useful for correcting the aspect ratio of images to be displayed.

       -yzoom percentage
              Zoom the Y axis of an image by percentage.  See -xzoom for more information.

       -zoom percentage
              Zoom  both  the  X and Y axes by percentage.  See -xzoom for more information.  Technically the percentage actually zoomed is the square of the number supplied since the zoom is to both axes,
              but I opted for consistency instead of accuracy.

       -newoptions
              Reset options that propagate.  The -bright, -colors, -colordither, -delay, -dither, -gamma, -gray, -normalize, -smooth, -xzoom, -yzoom, and -zoom options normally propagate to  all  following
              images.

LOCAL IMAGE OPTIONS
       The following options may precede each image.  These options are local to the image they precede.

       -at X,Y
              Indicates coordinates to load the image at X,Y on the base image.  If this is an option to the first image, and the -onroot option is specified, the image will be loaded at the given location
              on the display background.

       -background color
              Use color as the background color instead of the default (usually white but this depends on the image type) if you are transferring a monochrome image to a color display.

       -center
              Center the image on the base image loaded.  If this is an option to the first image, and the -onroot option is specified, the image will be centered on the display background.

       -clip X,Y,W,H
              Clip the image before loading it.  X and Y define the upper-left corner of the clip area, and W and H define the extents of the area.  A zero value for W or  H  will  be  interpreted  as  the
              remainder of the image.  Note that X and Y may be negative, and that W and H may be larger than the image. This causes a border to be placed around the image. The border color may be set with
              the -border option.

       -expand
              Forces the image (after all other optional processing) to be expanded into a True Color (24 bit) image. This is useful on systems which support 24 bit color, but where  xli  might  choose  to
              load a bitmap or 8 bit image into one of the other smaller depth visuals supported on your system.

       -foreground color
              Use  color  as  the foreground color instead of black if you are transferring a monochrome image to a color display.  This can also be used to invert the foreground and background colors of a
              monochrome image.

       -halftone
              Force halftone dithering of a color image when displaying on a monochrome display.  This option is ignored on monochrome images.  This dithering algorithm blows an image up by sixteen  times;
              if you don't like this, the -dither option will not blow the image up but will take longer to process and will be less accurate.

       -invert
              Inverts a monochrome image.  This is shorthand for -foreground white -background black.

       -merge Merge  this image onto the base image after local processing.  The base image is considered to be the first image specified or the last image that was not preceded by -merge.  If used in con-
              junction with -at and -clip, very complex images can be built up.  Note that the final image will be the size of the first image, and that subsequent merged images  overlay  previous  images.
              The  final image size can be altered by using the -clip option on the base image to make it bigger or smaller.  This option is on by default for all images if the -onroot or -windowid options
              are specified.

       -name image_name
              Force the next argument to be treated as an image name.  This is useful if the name of the image is -dither, for instance.

       -normalize
              Normalize a color image.

       -rotate degrees
              Rotate the image by degrees clockwise.  The number must be a multiple of 90.

EXAMPLES
       To load the rasterfile "my.image" onto the background and replicate it to fill the entire background:

            xli -onroot my.image

       To load a monochrome image "my.image" onto the background, using red as the foreground color, replicate the image, and overlay "another.image" onto it at coordinate (10,10):

            xli -foreground red my.image -at 10,10 another.image

       To center the rectangular region from 10 to 110 along the X axis and from 10 to the height of the image along the Y axis:

            xli -center -clip 10,10,100,0 my.image

       To double the size of an image:

            xli -zoom 200 my.image

       To halve the size of an image:

            xli -zoom 50 my.image

       To brighten a dark image:

            xli -brighten 150 my.image

       To darken a bright image:

            xli -brighten 50 my.image

HINTS FOR GOOD IMAGE DISPLAYS
       Since images are likely to come from a variety of sources, they may be in a variety of aspect ratios which may not be supported by your display.  The -xzoom and -yzoom options can be used to  change
       the  aspect  ratio of an image before display.  If you use these options, it is recommended that you increase the size of one of the dimensions instead of shrinking the other, since shrinking looses
       detail.  For instance, many GIF and G3 FAX images have an X:Y ratio of about 2:1.  You can correct this for viewing on a 1:1 display with either -xzoom 50 or -yzoom 200 (reduce X axis to 50% of  its
       size and expand Y axis to 200% of its size, respectively) but the latter should be used so no detail is lost in the conversion.

       When  zooming color images up you can reduce blockiness with -smooth.  For zooms of 300% or more, I recommend two smoothing passes (although this can take awhile to do on slow machines).  There will
       be a noticeable improvement in the image.

       You can perform image processing on a small portion of an image by loading the image more than once and using the -merge, -at and -clip options.  Load the image, then merge it with a  clipped,  pro-
       cessed version of itself.  To brighten a 100x100 rectangular portion of an image located at (50,50), for instance, you could type:

            xli my.image -merge -at 50,50 -clip 50,50,100,100 -brighten 150 my.image

       If you're using a display with a small colormap to display colorful images, try using the -gray option to convert to grayscale.

XLITO
       xlito (XLoadImageTrailingOptions) is a separate utility that provides a file format independent way of marking image files with the appropriate options to display correctly.  It does this by append-
       ing to file a string specified by the user, marked with some magic numbers so that this string can be extracted by a program that knows where to look. Since almost all image files have some sort  of
       image  size specifier, the programs that load or manipulate these files do not look beyond the point at which they have read the image, so trailing information can safely be appended to the file. If
       appending this information causes trouble with other utilities, it can simply be deleted.

       xli will recognize these trailing options at the end of the image files, and will treat the embedded string as if it were a sequence of command  line  IMAGE  OPTIONS.  Any  GLOBAL  OPTIONS  will  be
       ignored, and the IMAGE OPTIONS are never propagated to other images.

       Trailing options can be examined with:

            xlito image_file ...

       Changed or added with:

            xlito -c "string of options" image_file

       And deleted with:

            xlito -d image_file ...

       For example, if you have a gif file fred.gif which is too dark and is the wrong aspect ratio, then it may need to be viewed with:

            xli -yzoom 130 -gamma 1.0 fred.gif

       to get it to look OK. These options can then be appended to the file by:

            xlito -c "-yzoom 130 -gamma 1.0" fred.gif

       and from then on xli will get the appropriate options from the image file itself.  See the  xlito manual entry for more details about this utility.


PATHS AND EXTENSIONS
       The  file ~/.xlirc (and optionally a system-wide file) defines the path and default extensions that xli will use when looking for images.  This file can have two statements: "path=" and "extension="
       (the equals signs must follow the word with no spaces between).  Everything following the "path=" keyword will be prepended to the supplied image name if the supplied name does not specify an exist-
       ing  file.  The paths will be searched in the order they are specified.  Everything following the "extension=" keyword will be appended to the supplied image name if the supplied name does not spec-
       ify an existing file.  As with paths, these extensions will be searched in the order they are given.  Comments are any portion of a line following a hash-mark (#).

       The following is a sample ~/.xlirc file:

         # paths to look for images in
         path= /usr/local/images
               /home/usr1/guest/madd/images
               /usr/include/X11/bitmaps

         # default extensions for images; .Z is automatic; scanned in order
         extension= .csun .msun .sun .face .xbm .bm

       Versions of xli prior to version 01, patchlevel 03 would load the system-wide file (if any), followed by the user's file.  This behavior made it difficult for the user to configure  her  environment
       if she didn't want the default.  Newer versions will ignore the system-wide file if a personal configuration file exists.

IMAGE TYPES
       xli currently supports the following image types:

         CMU Window Manager raster files
         Faces Project images
         Fuzzy Bitmap (.fbm) images
         GEM bit images
         GIF images (Including GIF89a compatibility)
         G3 FAX images
         JFIF style jpeg images
         McIDAS areafiles
         MacPaint images
         Windows, OS/2 RLE Image
         Monochrome PC Paintbrush (.pcx) images
         Photograph on CD Image
         Portable Bitmap (.pbm, .pgm, .ppm) images
         Sun monochrome rasterfiles
         Sun color RGB rasterfiles
         Targa (.tga) files
         Utah Raster Toolkit (.rle) files
         X pixmap (.xpm) files (Version 1, 2C and 3)
         X10 bitmap files
         X11 bitmap files
         X Window Dump (except TrueColor and DirectColor)

       Normal,  compact, and raw PBM images are supported.  Both standard and run-length encoded Sun rasterfiles are supported.  Any image whose name ends in .Z is assumed to be a compressed image and will
       be filtered through "uncompress". If HAVE_GUNZIP is defined in the Makefile.std make file, then any image whose name ends in

       Any file that looks like a uuencoded file will be decoded automatically.

AUTHORS
       The original Author is:
       Jim Frost
       Saber Software
       jimf@saber.com

       Version 1.16 of xli is derived from xloadimage 3.01 has been brought to you by:
       Graeme Gill
       graeme@labtam.oz.au

       Version 1.17 of xli is derived from xli 1.16 by
       smar@reptiles.org

       For a more-or-less complete list of other contributors (there are a lot of them), please see the README file enclosed with the distribution.

FILES
            xli                      - the image loader and viewer
            xsetbg                  - pseudonym which quietly sets the background
            xview                   - pseudonym which views in a window
            xlito                   - the trailing options utility
            /usr/lib/X11/Xli        - default system-wide configuration file
            ~/.xlirc                - user's personal configuration file

COPYRIGHT
       Copyright (c) 1989, 1990, 1991, 1992, 1993 Jim Frost, Graeme Gill and others.

       Xli is copywritten material with a very loose copyright allowing unlimited modification and distribution if the copyright notices are left intact.  Various portions are copywritten by  various  peo-
       ple,  but  all use a modification of the MIT copyright notice.  Please check the source for complete copyright information.  The intent is to keep the source free, not to stifle its distribution, so
       please write to me if you have any questions.

BUGS
       Zooming dithered images, especially downwards, is UGLY.

       Images can come in a variety of aspect ratios.  Xli cannot detect what aspect ratio the particular image being loaded has, nor the aspect ratio of the destination display, so images  with  differing
       aspect  ratios  from  the  destination display will appear distorted.  The solution to this is to use xlito to append the appropriate options to the image file. See HINTS FOR GOOD IMAGE DISPLAYS and
       XLITO for more information.

       The GIF format allows more than one image to be stored in a single GIF file, but xli will only display the first.

       One of the pseudonyms for xli, xview, is the same name as Sun uses for their SunView-under-X package.  This will be confusing if you're one of those poor souls who has to use Sun's XView.

       Some window managers do not correctly handle window size requests.  In particular, many versions of the twm window manager use the MaxSize hint instead of the PSize hint, causing  images  which  are
       larger  than the screen to display in a window larger than the screen, something which is normally avoided.  Some versions of twm also ignore the MaxSize argument's real function, to limit the maxi-
       mum size of the window, and allow the window to be resized larger than the image.  If this happens, xli merely places the image in the upper-left corner of the  window  and  uses  the  zero-value'ed
       pixel for any space which is not covered by the image.  This behavior is less-than-graceful but so are window managers which are cruel enough to ignore such details.

       The  order in which operations are performed on an image is independent of the order in which they were specified on the command line.  Wherever possible I tried to order operations in such a way as
       to look the best possible (zooming before dithering, for instance) or to increase speed (zooming downward before compressing, for instance).

       Display Gamma should setable in the ~/.xlirc file.

       Embedded trailing options overide the command line Image Options. Command line options should really overide trailing options.



                                                                                                 27 Jul 1994                                                                                           XLI(1)
