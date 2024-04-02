TTMKFDIR(1)                                                                                General Commands Manual                                                                                TTMKFDIR(1)



NAME
       ttmkfdir - Utility to create fonts.scale files for truetype fonts

SYNOPSIS
       ttmkfdir [OPTION]

DESCRIPTION
           Originally  written by Joerg Pommnitz, ttmkfdir is a tool to create valid and complete fonts.scale file from TrueType fonts. It is very useful when you plan to use a TrueType enabled font server
       that is based on the X11R6 sample implementation (xfsft for instance). Great care has been taken to correctly identify the encodings that a given TrueType font supports.

       The ttmkfdir comes with Red Hat Linux has experienced quite some modifications or improvements, include:

       - migration to FreeType 2 library

       - more accurate checking for big font files

       - support for both two X core font backends, Freetype and XTT

       - Truetype collection(ttc) font file support

       - additional CJK friendly features

       - bug fixes



OPTIONS
       Here is the detailed usage of Red Hat version of ttmkfdir.

       -h, --help
              It shows the menus and combo box in iok UI

       -e, --encoding <encodings.dir>
              ttmkfdir is doing its job by checking  each  TrueType  font  file  against  fontenc  layer,  please  refer  www.xfree86.org/current/fonts.html  for  details.  Default  encodings.dir  file  is
              /usr/X11R6/lib/X11/fonts/encodings/encodings.dir

       -o, --output
              Specify output, default is fonts.scale in the current directory

       -d, --font-dir
              Specify TrueType font directory, default is the current directory

       -f, --default-foundry
              Specify name of the default font foundry, default is "misc"

       -m, --max-missing
              Specify the maximum number of missing characters per encoding, default is 5. This option applies to the encoding that has less than 256 codepoint definitions.

       -a, --max-missing-percentage
              Specify the maximum percentage of missing characters per encoding, default is 2. This option applies to the encoding that has more than 256 codepoint definitions.

       -b, --font-backend
              For X FreeType backend, use value "1", for XTT backend use value "2", default value is 1. When you have TrueType Collection font(.ttc), you need to use this option.

       -x, --additional-entries
              Additional  entries  mean  those  extra  TTCaps stuff for XTT backend, mainly for bold and italic font support. Or for FreeType backend, because FreeType still doesn't support bold and italic
              font, ttmkfdir can generate extra "dummy" XLFDs, so applications who asking those fonts won't complain.

              Default value is "0" means off,otherwise use "1" to switch it on.

       -c, --completeness
              use less strict completeness tests for encoding tables

       -p, --panose
              use panose information


AUTHOR
       Yu Shao <yshao@redhat.com> and Pravin Satpute <psatpute@redhat.com>

LICENSE
       GNU Library General Public License



                                                                                                March 28, 2013                                                                                    TTMKFDIR(1)
