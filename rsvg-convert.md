rsvg-convert(1)                                               General Commands Manual                                              rsvg-convert(1)

NAME
       rsvg-convert - turn SVG files into raster images.

SYNOPSIS
       rsvg-convert [options] in.svg > out.png

DESCRIPTION
       Converts SVG images into PNG raster images, PDF, PS, or SVG vector images, or dumps of Cairo XML or recording surfaces.

   OPTIONS
       -d --dpi-x number
              Set the X resolution of the image in pixels per inch. RSVG's current default is 90dpi

       -p --dpi-y number
              Set the Y resolution of the image in pixels per inch. RSVG's current default is 90dpi

       -x --x-zoom number
              X Zoom factor, as a percentage. If unspecified, 1.0 is used as the default.

       -y --y-zoom number
              Y Zoom factor, as a percentage. If unspecified, 1.0 is used as the default.

       -z ---zoom number
              Zoom factor, as a percentage. If unspecified, 1.0 is used as the default.

       -w --width integer
              Specify how wide you wish the image to be. If unspecified, the natural width of the image is used as the default.

       -h --height integer
              Specify how tall you wish the image to be. If unspecified, the natural height of the image is used as the default.

       -f --format [png, pdf, ps, svg, xml, recording]
              Specify the output format you wish the image to be saved in. If unspecified, PNG is used as the default.

       -o --output filename
              Specify the output filename. If unspecified, outputs to stdout.

       -a --keep-aspect-ratio
              Specify that the aspect ratio is to be preserved. If unspecified, aspect ratio will not be preserved.

       -b --background-color [black, white, #abccee, #aaa...]
              Specify the background color. If unspecified, none is used as the default.

       --base-uri uri
              Specify the base URI for SVG files. If unspecified, none is used as the default.

       -v --version
              Display what version of rsvg this is.

MORE INFORMATION
       http://librsvg.sourceforge.net/ http://www.w3.org/TR/SVG11/ http://www.gnome.org/

AUTHORS
       Dom Lachowicz (cinamod@hotmail.com), Caleb Moore (c.moore@student.unsw.edu.au), and a host of others.

                                                                                                                                   rsvg-convert(1)
