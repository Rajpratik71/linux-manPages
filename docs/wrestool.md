WRESTOOL(1)                                                   General Commands Manual                                                  WRESTOOL(1)

NAME
       wrestool - extract resources from Microsoft Windows(R) binaries

SYNOPSIS
       wrestool [OPTIONS]... [FILE]...

DESCRIPTION
       This manual page documents briefly the wrestool command.  This manual page was written for the Debian GNU distribution because the original
       program does not have a manual page.

       Wrestool reads 16- or 32-bit Microsoft Windows(R) binaries and lists or extracts the resources they contain. Some  resources  require  pro‐
       cessing before they can be written to files; wrestool is able to do this with icon and cursor resources.

       Filters, specified as command line options, control what resources to extract.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with two dashes (`-').

       -x, --extract
              Extract resources. (By default, resources will be extracted to standard out if --output was not specified.)

       -l, --list
              Output list of resources (default).

       -t, --type=[+|-]ID
              Resource  type  identifier  of affected resources. If preceded with a dash (``-''), id must be numeric; if preceded with a plus sign
              (``+''), id must be a string.

              The type ID may also be the name of a resource type. (If this is the case, a leading dash or plus sign may not be included.) A  list
              of resource types can be found in the ``Resource Types'' section.

       -n, --name=[+|-]ID
              Resource name identifier of affected resources. Like the --type option, a leading dash or plus sign controls the datatype of the id.

       -L, --language=[+|-]ID
              Resource language identifier. Has no effect when processing 16-bit libraries.

       -a, --all
              Perform operation on all resource (default).

       -o, --output=PATH
              Where  to place extracted resources. If ``PATH'' does not refer to an existing directory, and does not end with a slash (``/''), all
              output will be written to the file ``PATH''. (This means that if you extract multiple resources, PATH will contain the last resource
              only.)

       -R, --raw
              Do  not  parse  resource  contents - extract raw data. (This option will probably be replaced with --format=raw in future version of
              icoutils.)

       -v, --verbose
              Explain what is being done. The verbose option may be specified more than once, like ``-vv'', to make wrestool even more verbose.

       --help Display a help message and exit.

       --version
              Output version information and exit.

RESOURCE TYPES
       The wrestool program recognizes the resource types listed below.  The ids of these resources are always numeric and not strings.

       cursor (1)
              A single cursor bitmap image. Read as part of group_cursor resources.

       bitmap (2)
              A bitmap image.

       icon (3)
              A single icon bitmap image. Read as part of group_icon resources.  This resource is similar to  cursor  resources;  cursors  contain
              four additional bytes of hotspot coordinates.

       menu (4)
              Resources for menus (in popup and menubars).  Currently wrestool does not support this resource type.

       dialog (5)
              Definitions (widgets with locations) for dialog boxes.  Currently wrestool does not support this resource type.

       string (6)
              The string table resource, containing a number of unicode strings. Currently wrestool does not support this resource type.

       fontdir (7)
              The  font directory, containing information on a number of font resources (8). Non-TTF font (.FON) files are actually libraries with
              resources in them. Currently wrestool does not support this resource type.

       font (8)
              A single font - the contents of a .FNT file. Read as part of fontdir resources. Currently wrestool does not  support  this  resource
              type.

       accelerator (9)
              Keyboard accelerator tables.  Currently wrestool does not support this resource type.

       rcdata (10)
              Arbitrary resource data, user-defined. There are no restrictions to the format of these resources.

       messagelist (11)
              Not supported.

       group_cursor (12)
              A set of cursors. With a few modifications (and with cursor resources), this resource can be extracted as a .CUR file.

       group_icon (14)
              A set of icons. With a few modifications (and with icons resources), this resource can be extracted as a .ICO file.

       version (16)
              Version  information, stored as binary data. Could be extracted without modifications, but the data is of probably little use.  Cur‐
              rently wrestool does not support this resource type.

       dlginclude (17)
              Not supported.

       plugplay (19)
              Not supported.

       vxd (20)
              Not supported.

       anicursor (21)
              Animated cursors. Currently wrestool does not support animated cursor or icons, nor does icotool.

       aniicon (22)
              Animated icons. I have only seen these in Windows(R) 3.x.  Currently wrestool does not support animated cursor or  icons,  nor  does
              icotool.

EXAMPLES
       List all resources in file `write.exe':
         $ wrestool -l write.exe
         --type=3 --name=1 --lang=1033 [type=icon offset=0x3120 size=752]
         --type=3 --name=2 --lang=1033 [type=icon offset=0x3410 size=304]
         --type=14 --name=1 --lang=1033 [type=group_icon offset=0x3540 size=34]
         --type=16 --name=1 --lang=1033 [type=version offset=0x3564 size=808]

       List all (group-) icon resource in file `write.exe':
         $ wrestool -l --type=group_icon write.exe
         --type=14 --name=1 --lang=1033 [type=group_icon offset=0x3540 size=34]

       Extract all icons to current directory, naming the destination files `write.exe_T_N.ico':
         $ wrestool -x --output=. -t14 write.exe
         $ ls *.ico
         write.exe_14_1.ico

SEE ALSO
       extresso(1), genresscript(1), icotool(1).

AUTHOR
       This manual page was written by Colin Watson <cjwatson@debian.org> for the Debian GNU system (but may be used by others). It was later mod‐
       ified by Oskar Liljeblad <oskar@osk.mine.nu>.

COPYRIGHT
       Copyright © 2001 Colin Watson

       Copyright © 2001 Oskar Liljeblad

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

TRADEMARKS
       Windows is a registered trademark of Microsoft Corporation in the United States and other countries.

wrestool (icoutils)                                               April 18, 2005                                                       WRESTOOL(1)
