XKBPRINT(1)                                                                             General Commands Manual                                                                            XKBPRINT(1)

NAME
       xkbprint - print an XKB keyboard description

SYNOPSIS
       xkbprint [options] source [ output_file ]

DESCRIPTION
       The  xkbprint command generates a printable or encapsulated PostScript description of the XKB keyboard description specified by source.  The source can be any compiled keymap (.xkm) file that
       includes a geometry description or an X display specification.  If an output_file is specified, xkbprint writes to it.  If no output file is specified, xkbprint creates replaces the extension
       of  the source file with .ps or .eps depending on the requested format.  If the source is a non-local X display (e.g.:0), xkbprint appends the appropriate prefix to the display specification,
       replacing the colon with a dash.  For a local display, xkprint uses server-n where n is the number of the display.

OPTIONS
       -?, -help
               Prints a usage message.

       -color  Print using the colors specified in the geometry file;  by default, xkbprint prints a black-and-white image of the keyboard.

       -dflts  Attempt to compute default names for any missing components, such as keys.

       -diffs  Show symbols only where they are explicitly bound.

       -eps    Generate an encapsulated PostScript file.

       -fit    Fit the keyboard image on the page (default).

       -full   Print the keyboard at full size.

       -grid res
               Print a grid with resmm resolution over the keyboard.

       -if fontName
               Specifies an internal PostScript type 1 font to dump to the specified output file or to fontName.pfa, if no output file is specified.  No keyboard description is printed if an  inter‐
               nal font is dumped.

       -label type
               Specifies the labels to be printed on keys;  legal types are: none, name,code,symbols.

       -lc <locale>
               Specifies a locale in which KeySyms should be resolved.

       -level1 Generate level 1 PostScript.

       -level2 Generate level 2 PostScript.

       -lg group
               Print symbols in keyboard groups starting from group.

       -ll level
               Print symbols starting from shift level level.

       -mono   Generate black-and-white image of keyboard (default).

       -n num  Print num copies.

       -nkg num
               Print the symbols in num keyboard groups.

       -npk num
               Number of keyboard images to print on each page; for EPS files, this specifies the total number of keyboard images to print.

       -o file Write output to file.

       -Rdirectory
               Use directory as the root directory; all path names are interpreted relative to directory.

       -pict which
               Controls use of pictographs instead of keysym names where available.  which can be any of all, none, or common(default).

       -synch  Forces synchronization for X requests.

       -version
               Print out the program version and exit.

       -w level
               Sets warning level (0 for no warning, 10 for all warnings).

SEE ALSO
       X(7),xkbcomp(1)

COPYRIGHT
       Copyright 1995, Silicon Graphics Computer Systems Copyright 1995, 1998  The Open Group
       See X(7) for a full statement of rights and permissions.

AUTHOR
       Erik Fortune, Silicon Graphics

X Version 11                                                                                xkbprint 1.0.4                                                                                 XKBPRINT(1)
