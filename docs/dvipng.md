DVIPNG(1)                                                                                       User commands                                                                                       DVIPNG(1)



NAME
       dvipng - A DVI-to-PNG translator

SYNOPSIS
       dvipng [options] filename

       dvipng [options] [filename] -

DESCRIPTION
       This program makes PNG and/or GIF graphics from DVI files as obtained from TeX and its relatives.

       If GIF support is enabled, GIF output is chosen by using the dvigif binary or with the --gif option.

       The benefits of dvipng/dvigif include

       ·   Speed. It is a very fast bitmap-rendering code for DVI files, which makes it suitable for generating large amounts of images on-the-fly, as needed in preview-latex, WeBWorK and others.

       ·   It does not read the postamble, so it can be started before TeX finishes. There is a --follow switch that makes dvipng wait at end-of-file for further output, unless it finds the POST marker
           that indicates the end of the DVI.

       ·   Interactive query of options. dvipng can read options interactively through stdin, and all options are usable. It is even possible to change the input file through this interface.

       ·   Supports PK, VF, PostScript Type1, and TrueType fonts, subfonts (i.e., as used in CJK-LaTeX), color specials, and inclusion of PostScript, PNG, JPEG or GIF images.

       ·   and more...

OPTIONS
       Many of the parameterless options listed here can be turned off by suffixing the option with a zero (0); for instance, to turn off page reversal, use -r0.  Such options are marked with a trailing *.

       -   Read additional options from standard input after processing the command line.

       --help
           Print a usage message and exit.

       --version
           Print the version number and exit.

       -bd num
       -bd color_spec
       -bd 'num color_spec'
           Set the pixel width of the transparent border (default 0). Using this option will make the image edges transparent, but it only affects pixels with the background color. Giving a color_spec will
           set the fallback color, to be used in viewers that cannot handle transparency (the default is the background color). The color spec should be in TeX color \special syntax, e.g., 'rgb 1.0 0.0
           0.0'. Setting the fallback color makes the default border width 1 px.

       --bdpi num
           This option only has an effect when using bitmapped (PK) fonts. The option sets the base (Metafont) resolution, both horizontal and vertical, to num dpi (dots per inch). This option is necessary
           when manually selecting Metafont mode with the --mode option (see below).

       -bg color_spec
           Choose background color for the images. This option will be ignored if there is a background color \special in the DVI. The color spec should be in TeX color \special syntax, e.g., 'rgb 1.0 0.0
           0.0'. You can also specify 'Transparent' or 'transparent' which will give you a transparent background with the normal background as a fallback color. A capitalized 'Transparent' will give a
           full-alpha transparency, while an all-lowercase 'transparent' will give a simple fully transparent background with non-transparent antialiased pixels. The latter would be suitable for viewers
           who cannot cope with a true alpha channel.  GIF images do not support full alpha transparency, so in case of GIF output, both variants will use the latter behaviour.

       -d num
           Set the debug flags, showing what dvipng (thinks it) is doing. This will work unless dvipng has been compiled without the "DEBUG" option (not recommended). Set the flags as you need them, use -d
           -1 as the first option for maximum output.

       -D num
           Set the output resolution, both horizontal and vertical, to num dpi (dots per inch).

           One may want to adjust this to fit a certain text font size (e.g., on a web page), and for a text font height of font_px pixels (in Mozilla) the correct formula is

                   <dpi> = <font_px> * 72.27 / 10 [px * TeXpt/in / TeXpt]

           The last division by ten is due to the standard font height 10pt in your document, if you use 12pt, divide by 12. Unfortunately, some proprietary browsers have font height in pt (points), not
           pixels. You have to rescale that to pixels, using the screen resolution (default is usually 96 dpi) which means the formula is

                   <font_px> = <font_pt> * 96 / 72 [pt * px/in / (pt/in)]

           On some high-res screens, the value is instead 120 dpi. Good luck!

       --depth*
           Report the depth of the image. This only works reliably when the LaTeX style preview.sty from preview-latex is used with the active option. It reports the number of pixels from the bottom of the
           image to the baseline of the image. This can be used for vertical positioning of the image in, e.g., web documents, where one would use (Cascading StyleSheets 1)

                   <IMG SRC="<filename.png>" STYLE="vertical-align: -<depth>px">

           The depth is a negative offset in this case, so the minus sign is necessary, and the unit is pixels (px).

       --dvinum*
           Set this option to make the output page number be the TeX page numbers rather than the physical page number. See the -o switch.

       -fg color_spec
           Choose foreground color for the images. This option will be ignored if there is a foreground color \special in the DVI. The color spec should be in TeX color \special syntax, e.g., 'rgb 1.0 0.0
           0.0'.

       --follow*
           Wait for data at end-of-file. One of the benefits of dvipng is that it does not read the postamble, so it can be started before TeX finishes. This switch makes dvipng wait at end-of-file for
           further output, unless it finds the POST marker that indicates the end of the DVI. This is similar to tail -f but for DVI-to-PNG conversion.

       --freetype*
           Enable/disable FreeType font rendering (default on). This option is available if the FreeType2 font library was present at compilation time.  If this is the case, dvipng will have direct support
           for PostScript Type1 and TrueType fonts internally, rather than using gsftopk for rendering the fonts. If you have PostScript versions of Computer Modern installed, there will be no need to
           generate bitmapped (PK) variants on disk of these. Then, you can render images at different (and unusual) resolutions without cluttering the disk with lots of bitmapped fonts.  Note that if you
           have both FreeType and T1lib on your system, FreeType will be preferred by dvipng. If you for some reason would want to use T1lib rendering, use this option.

       --gamma num
           Control the interpolation of colors in the greyscale anti-aliasing color palette.  Default value is 1.0.  For 0 < num < 1, the fonts will be lighter (more like the background), and for num > 1,
           the fonts will be darker (more like the foreground).

       --gif*
           The images are output in the GIF format, if GIF support is enabled.  This is the default for the dvigif binary, which only will be available when GIF support is enabled. GIF images are palette
           images (see the --palette option) and does not support true alpha channels (see the --bg option). See also the --png option.

       --height*
           Report the height of the image. This only works reliably when the LaTeX style preview.sty from preview-latex is used with the active option. It reports the number of pixels from the top of the
           image to the baseline of the image. The total height of the image is obtained as the sum of the values reported from --height and --depth.

       -l [=]num
           The last page printed will be the first one numbered num. Default is the last page in the document.  If num is prefixed by an equals sign, then it (and the argument to the -p option, if
           specified) is treated as a physical (absolute) page number, rather than a value to compare with the TeX \count0 values stored in the DVI file.  Thus, using -l =9 will end with the ninth page of
           the document, no matter what the pages are actually numbered.

       --mode mode
           This option only has an effect when using bitmapped (PK) fonts. Use mode as the Metafont device name for the PK fonts (both for path searching and font generation). This needs to be augmented
           with the base device resolution, given with the --bdpi option. See the file <ftp://ftp.tug.org/tex/modes.mf> for a list of resolutions and mode names for most devices.

       -M* This option only has an effect when using bitmapped (PK) fonts. It turns off automatic PK font generation (mktexpk).

       --nogs*
           This switch prohibits the internal call to GhostScript for displaying PostScript specials. --nogs0 turns the call back on.

       --nogssafer*
           Normally, if GhostScript is used to render PostScript specials, the GhostScript interpreter is run with the option -dSAFER. The --nogssafer option runs GhostScript without -dSAFER. The -dSAFER
           option in Ghostscript disables PostScript operators such as deletefile, to prevent possibly malicious PostScript programs from having any effect.

       --norawps*
           Some packages generate raw PostScript specials, even non-rendering such specials.  This switch turns off the internal call to GhostScript intended to display these raw PostScript specials.
           --norawps0 turns the call back on.

       -o name
           Send output to the file name. A single occurrence of %d or %01d, ..., %09d will be exchanged for the physical page number (this can be changed, see the --dvinum switch). The default output
           filename is file%d.png where the input DVI file was file.dvi.

       -O x-offset,y-offset
           Move the origin by x-offset,y-offset, a comma-separated pair of dimensions such as .1in,-.3cm.  The origin of the page is shifted from the default position (of one inch down, one inch to the
           right from the upper left corner of the paper) by this amount.

       -p [=]num
           The first page printed will be the first one numbered num. Default is the first page in the document.  If num is prefixed by an equals sign, then it (and the argument to the -l option, if
           specified) is treated as a physical (absolute) page number, rather than a value to compare with the TeX \count0 values stored in the DVI file.  Thus, using -p =3 will start with the third page
           of the document, no matter what the pages are actually numbered.

       --palette*
           When an external image is included, dvipng will automatically switch to truecolor mode, to avoid unnecessary delay and quality reduction, and enable the EPS translator to draw on a transparent
           background and outside of the boundingbox. This switch will force palette (256-color) output and make dvipng revert to opaque clipped image inclusion. This will also override the --truecolor
           switch if present.

       --picky*
           No images are output when a warning occurs. Normally, dvipng will output an image in spite of a warning, but there may be something missing in this image. One reason to use this option would be
           if you have a more complete but slower fallback converter. Mainly, this is useful for failed figure inclusion and unknown \special occurrences, but warnings will also occur for missing or
           unknown color specs and missing PK fonts.

       --png*
           The images are output in the PNG format. This is the default for the dvipng binary. See also the --gif option.

       -pp firstpage-lastpage
           Print pages firstpage through lastpage; but not quite equivalent to -p firstpage -l lastpage. For example, when rendering a book, there may be several instances of a page in the DVI file (one in
           "\frontmatter", one in "\mainmatter", and one in "\backmatter"). In case of several pages matching, -pp firstpage-lastpage will render all pages that matches the specified range, while -p
           firstpage -l lastpage will render the pages from the first occurrence of firstpage to the first occurrence of lastpage.  This is the (undocumented) behaviour of dvips. In dvipng you can give
           both kinds of options, in which case you get all pages that matches the range in -pp between the pages from -p to -l. Also multiple -pp options accumulate, unlike -p and -l.  The - separator can
           also be :. Note that -pp -1 will be interpreted as "all pages up to and including 1", if you want a page numbered -1 (only the table of contents, say) put -pp -1--1, or more readable, -pp -1:-1.

       -q* Run quietly.  Don't chatter about pages converted, etc. to standard output; report no warnings (only errors) to standard error.

       -Q num
           Set the quality to num. That is, choose the number of antialiasing levels for bitmapped fonts (PK) and fonts rendered using T1lib, to be num*num+1. The default value is 4 which gives 17 levels
           of antialiasing for antialiased fonts from these two. If FreeType is available, its rendering is unaffected by this option.

       -r* Toggle output of pages in reverse/forward order. By default, the first page in the DVI is output first.

       --strict*
           The program exits when a warning occurs. Normally, dvipng will output an image in spite of a warning, but there may be something missing in this image. One reason to use this option would be if
           you have a more complete but slower fallback converter. See the --picky option above for a list of when warnings occur.

       -T image_size
           Set the image size to image_size which can be either of bbox, tight, or a comma-separated pair of dimensions hsize,vsize such as .1in,.3cm. The default is bbox which produces a PNG that includes
           all ink put on the page and in addition the DVI origin, located 1in from the top and 1in from the left edge of the paper. This usually gives whitespace above and to the left in the produced
           image. The value tight will make dvipng only include all ink put on the page, producing neat images.

       --t1lib*
           Enable T1lib font rendering (default on). This option is available if the T1lib font library was present at compilation time. If this is the case, dvipng will have direct support for PostScript
           Type1 fonts internally, rather than using gsftopk for rendering the fonts. If you have PostScript versions of Computer Modern installed, there will be no need to generate bitmapped variants on
           disk of these.  Then, you can render images at different (and unusual) resolutions without cluttering the disk with lots of bitmapped fonts. Note that if you have both FreeType and T1lib on your
           system, FreeType will be preferred by dvipng, and if you for some reason rather want to use T1lib, give the option --freetype0 (see above).

       --truecolor*
           This will make dvipng generate truecolor output. Note that truecolor output is automatic if you include an external image in your DVI, e.g., via a PostScript special (i.e., the graphics or
           graphicx package). This switch is overridden by the --palette switch.

       -v* Enable verbose operation. This will currently indicate what fonts is used, in addition to the usual output.

       --width*
           Report the width of the image. See also --height and --depth.

       -x num
           This option is deprecated; it should not be used. It is much better to select the output resolution directly with the -D option. This option sets the magnification ratio to num/1000 and
           overrides the magnification specified in the DVI file.  Must be between 10 and 100000.  It is recommended that you use standard magstep values (1095, 1200, 1440, 1728, 2074, 2488, 2986, and so
           on) to help reduce the total number of PK files generated.  num may be a real number, not an integer, for increased precision.

       -z num
           Set the PNG compression level to num. This option is enabled if your libgd is new enough. The default compression level is 1, which selects maximum speed at the price of slightly larger PNGs.
           For an older libgd, the hard-soldered value 5 is used. The include file png.h says "Currently, valid values range from 0 - 9, corresponding directly to the zlib compression levels 0 - 9 (0 - no
           compression, 9 - "maximal" compression). Note that tests have shown that zlib compression levels 3-6 usually perform as well as level 9 for PNG images, and do considerably fewer calculations. In
           the future, these values may not correspond directly to the zlib compression levels."

NOTES
       The full manual is accessible in info format, on most systems by typing

               info dvipng

COPYRIGHT
       This program is released under the GNU Lesser General Public License version 3, see the COPYING file in the dvipng distribution or <http://www.gnu.org/licenses/gpl.html>.

       Copyright (c) 2002-2010 Jan-AAke Larsson



dvipng 1.14                                                                                       2010-12-15                                                                                        DVIPNG(1)
