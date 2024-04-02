XDITVIEW(1)                                                                             General Commands Manual                                                                            XDITVIEW(1)

NAME
       xditview - display ditroff output

SYNOPSIS
       xditview [ -toolkitoption ... ] [ -option ... ] [ filename ]

DESCRIPTION
       The  xditview program displays ditroff output on an X display.  It uses no special metrics and automatically converts the printer coordinates into screen coordinates; using the user-specified
       screen resolution, rather than the actual resolution so that the appropriate fonts can be found.  If ``-'' is given as the filename, xditview reads from standard input.  If ``|'' is the first
       character of filename, xditview forks sh to run the rest of the ``file name'' and uses the standard output of that command.

OPTIONS
       Xditview accepts all of the standard X Toolkit command line options along with the additional options listed below:

       -page page-number
               This option specifies the page number of the document to be displayed at start up time.

       -resolution screen-resolution
               This specifies the desired screen resolution to use; fonts will be opened by requesting this resolution field in the XLFD names.

       -noPolyText
               Some X servers incorrectly implement PolyText with multiple strings per request.  This option suppresses the use of this feature in xditview.

       -backingStore backing-store-type
               Redisplay can take up to a second or so; this option causes the server to save the window contents so that when it is scrolled around the viewport, the window is painted from contents
               saved in backing store.  backing-store-type can be one of Always, WhenMapped or NotUseful.

       The following standard X Toolkit command line arguments are commonly used with xditview:

       -bg color
               This option specifies the color to use for the background of the window.  The default is white.

       -bd color
               This option specifies the color to use for the border of the window.  The default is black.

       -bw number
               This option specifies the width in pixels of the border surrounding the window.

       -fg color
               This option specifies the color to use for displaying text.  The default is black.

       -fn font
               This option specifies the font to be used for displaying widget text.  The default is fixed.

       -rv     This option indicates that reverse video should be simulated by swapping the foreground and background colors.

       -geometry geometry
               This option specifies the preferred size and position of the window.

       -display host:display
               This option specifies the X server to contact.

       -xrm resourcestring
               This option specifies a resource string to be used.

X DEFAULTS
       This program uses a Dvi widget.  It understands all of the core resource names and classes as well as:

       width (class Width)
               Specifies the width of the window.

       height (class Height)
               Specifies the height of the window.

       foreground (class Foreground)
               Specifies the default foreground color.

       font (class Font)
               Specifies the font to be used for error messages.

       FontMap (class FontMap)
               To associate the ditroff fonts with appropriate X fonts, this string resource contains a set of new-line separated specifications, each of which consists of a ditroff name, some white
               space and an XLFD pattern with * characters in appropriate places to allow all sizes to be listed.  The default fontMap is:

               R    -*-times-medium-r-normal--*-*-*-*-*-*-iso8859-1\n\
               I    -*-times-medium-i-normal--*-*-*-*-*-*-iso8859-1\n\
               B    -*-times-bold-r-normal--*-*-*-*-*-*-iso8859-1\n\
               F    -*-times-bold-i-normal--*-*-*-*-*-*-iso8859-1\n\
               BI   -*-times-bold-i-normal--*-*-*-*-*-*-iso8859-1\n\
               C    -*-courier-medium-r-normal--*-*-*-*-*-*-iso8859-1\n\
               CO   -*-courier-medium-o-normal--*-*-*-*-*-*-iso8859-1\n\
               CB   -*-courier-bold-r-normal--*-*-*-*-*-*-iso8859-1\n\
               CF   -*-courier-bold-o-normal--*-*-*-*-*-*-iso8859-1\n\
               H    -*-helvetica-medium-r-normal--*-*-*-*-*-*-iso8859-1\n\
               HO   -*-helvetica-medium-o-normal--*-*-*-*-*-*-iso8859-1\n\
               HB   -*-helvetica-bold-r-normal--*-*-*-*-*-*-iso8859-1\n\
               HF   -*-helvetica-bold-o-normal--*-*-*-*-*-*-iso8859-1\n\
               N    -*-new century schoolbook-medium-r-normal--*-*-*-*-*-*-iso8859-1\n\
               NI   -*-new century schoolbook-medium-i-normal--*-*-*-*-*-*-iso8859-1\n\
               NB   -*-new century schoolbook-bold-r-normal--*-*-*-*-*-*-iso8859-1\n\
               NF   -*-new century schoolbook-bold-i-normal--*-*-*-*-*-*-iso8859-1\n\
               A    -*-charter-medium-r-normal--*-*-*-*-*-*-iso8859-1\n\
               AI   -*-charter-medium-i-normal--*-*-*-*-*-*-iso8859-1\n\
               AB   -*-charter-bold-r-normal--*-*-*-*-*-*-iso8859-1\n\
               AF   -*-charter-bold-i-normal--*-*-*-*-*-*-iso8859-1\n\
               S    -*-symbol-medium-r-normal--*-*-*-*-*-*-adobe-fontspecific\n\
               S2   -*-symbol-medium-r-normal--*-*-*-*-*-*-adobe-fontspecific\n

USING XDITVIEW WITH DITROFF
       You can use any ditroff output file with xditview, although files which use the fonts appropriate to the fontMap will look more accurate on the screen.  On servers which support scaled fonts,
       all requested font sizes will be accurately reflected on the screen; for servers which do not support scaled xditview will use the closest font from the same family.

SEE ALSO
       X(7), xrdb(1), ditroff(1), X Logical Font Description Conventions

ORIGIN
       Portions of this program originated in xtroff which was derived from suntroff.

COPYRIGHT
       Copyright 1994 X Consortium
       See X(7) for a full statement of rights and permissions.

AUTHORS
       Keith Packard (MIT X Consortium)
       Richard L. Hyde (Purdue)
       David Slattengren (Berkeley)
       Malcom Slaney (Schlumberger Palo Alto Research)
       Mark Moraes (University of Toronto)

X Version 11                                                                                xditview 1.0.4                                                                                 XDITVIEW(1)
