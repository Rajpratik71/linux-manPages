ICOTOOL(1)                                                    General Commands Manual                                                   ICOTOOL(1)

NAME
       icotool - Convert and create Win32 icon and cursor files

SYNOPSIS
       icotool [OPTION]... [FILE]...

DESCRIPTION
       This manual page document describes the icotool command.

       The  icotool  program  converts and creates icon (.ico) and cursor (.cur) files. At the moment icons can only be created from and extracted
       into PNG files. This is done using libpng.

       Icon and cursor files are used mainly on the Microsoft Windows(R) platform. Each icons or cursors file may contain multiple images of vari‐
       ous  resolutions  and  with different number of colors. Cursor files differ from icon files in that they also contain information about the
       hotspot of each image.

       Recent versions of Microsoft's Internet Explorer use icons for small site logotypes. The browser fetches a file called favicon.ico  from  a
       web  site,  and  uses  the  images  in this file to represent the site in menus and site lists. (This file is placed in the web site's root
       directory, like any other file.) Browsers like Galeon have copied this behaviour and now also fetches .ico files  and  use  them  for  site
       logotypes.

       As  each  icon or cursor file may contains multiple images of different dimensions and depth, a conversion may result in multiple PNG files
       being created. Correspondingly, multiple PNG files can be specified when creating an icon/cursor file.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with two dashes (`-').

       -x, --extract
              This option tells icotool that images from all icon/cursor files given on the command line are to be extracted. Filter options  (see
              below) can be used to control what images that will be extracted.

       -l, --list
              This options tells icotool that images in all given icon/cursor files are to be listed. The output will look something like this:

                --icon --index=1 --width=16 --height=16 --bit-depth=4 --palette-size=16
                --icon --index=2 --width=32 --height=32 --bit-depth=8 --palette-size=256

       -c, --create
              This  options  tells icotool to create an icon/cursor file using all the PNG files given on the command line, in the order they were
              specified.  The number of bits per pixel used in the icon/cursor file will depend on the number of colors used in the PNG file.  (If
              the  PNG  image  has  an  indexed palette, it doesn't necessarily mean that the same palette will be used in the created icon/cursor
              file.)

       -i, --index=N
              When listing or extracing files, this options tell icotool to list or extract only the N'th image in each file. The first image  has
              index 1.

              This option has no effect in create mode.

       -w, --width=PIXELS
              Similar to --index, but this option allows the image width to be matched instead. This option has no effect in create mode.

       -h, --height=PIXELS
              Similar to --index, but this option allows the image height to be matched instead. This option has no effect in create mode.

       -b, --bit-depth=COUNT
              Similar  to  --index, but this option allows the number of bits per pixel in the image to be matched instead. Valid values are 1, 2,
              4, 8, 16, 24 and 32.

              In create mode, this option will allow you to specify a minimum bit depth for images in the icon file.

       -p, --palette-size=PIXELS
              Similar to --index, but this option allows the number of colors in the image palette to be matched instead. Images  with  24  or  32
              bits in icon/cursor files do not have a palette, and will therefore have a palette size equal to 0.

              This option has no effect in create mode.

       -X, --hotspot-x=COORD
              Similar  to  --index,  but  this  option allows the x-coordinate of the hotspot to be matched. This option only has effect on cursor
              files.

              In create mode, this can be used to specify the hotspot x-coordinate.

       -Y, --hotspot-y=COORD
              Similar to --index, but this option allows the y-coordinate of the hotspot to be matched. This option  only  has  effect  on  cursor
              files.

              In create mode, this can be used to specify the hotspot y-coordinate.

       --icon This  option  specifies that only icon files are to be listed or extracted.  In create mode, this option can be used to specify that
              an icon (instead of a cursor) is to be created. (This is default in create mode.)

       --cursor
              This option specifies that only cursor files are to be listed or extracted.  In create mode, this can be used to specify that a cur‐
              sor (instead of an icon) is to be created.

       -t, --alpha-threshold=LEVEL
              Specifies  the  maximal  alpha  level  in the PNG image for portions which shall become transparent in the icon created. The default
              value is 127.  This is only used when creating icon files.

       -o, --output=PATH
              In extract mode, this option specifies a directory where extracted files are to be created. If PATH does not exist,  it  is  assumed
              that it refers to a non-existing file instead. The first image matched will be extracted to the file with that name.

              In  create  mode, this option specified the name of the output file.  The default is to write the binary data to standard out (which
              icotool will refuse if standard out is the terminal).

              If PATH is `-', then all output will be printed to standard out.

              This option has no effect in list mode.

       -r, --raw=FILENAME
              Store input file as raw PNG (Vista icons).

       --help Show summary of options.

       --version
              Output version information and exit.

EXAMPLES
       List all images in the file `demo.ico':
         $ icotool -l demo.ico
         --icon --index=1 --width=16 --height=16 --bit-depth=4 --palette-size=16
         --icon --index=2 --width=32 --height=32 --bit-depth=4 --palette-size=16
         --icon --index=3 --width=48 --height=48 --bit-depth=4 --palette-size=16
         --icon --index=4 --width=16 --height=16 --bit-depth=8 --palette-size=256
         --icon --index=5 --width=32 --height=32 --bit-depth=8 --palette-size=256
         --icon --index=6 --width=48 --height=48 --bit-depth=8 --palette-size=256

       List only 16-color images in `demo.ico':
         $ icotool -l --palette-size=16 demo.ico
         --icon --index=1 --width=16 --height=16 --bit-depth=4 --palette-size=16
         --icon --index=2 --width=32 --height=32 --bit-depth=4 --palette-size=16
         --icon --index=3 --width=48 --height=48 --bit-depth=4 --palette-size=16

       Extract all images to current directory, naming the destination files `demo.ico_I_WxHxD.xpm':
         $ icotool -x -o . demo.ico
         $ ls *.png
         demo_1_16x16x4.png  demo_3_48x48x4.png  demo_5_32x32x8.png
         demo_2_32x32x4.png  demo_4_16x16x8.png  demo_6_48x48x8.png

       Extract all 256-color icon images in all .ico files in the current directory, placing the extracted images in `img/'
         $ icotool -x -o img/ -p 256 *.ico

       Create an icon named `favicon.ico' with two images:
         $ icotool -c -o favicon.ico mysite_32x32.png mysite_64x64.png

AUTHOR
       The icoutils were written by Oskar Liljeblad <oskar@osk.mine.nu>.

COPYRIGHT
       Copyright © 1998 Oskar Liljeblad

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

TRADEMARKS
       Windows is a registered trademark of Microsoft Corporation in the United States and other countries.

icotool (icoutils)                                                April 18, 2005                                                        ICOTOOL(1)
