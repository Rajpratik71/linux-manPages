XLOGO(1)                                                                                General Commands Manual                                                                               XLOGO(1)

NAME
       xlogo - X Window System logo

SYNOPSIS
       xlogo [-toolkitoption ...]

DESCRIPTION
       The xlogo program displays the X Window System logo.

OPTIONS
       Xlogo accepts all of the standard X Toolkit command line options, as well as the following:

       -render This option indicates that the logo should be drawn with anti-aliased edges using the RENDER extension.

       -sharp  If -render is also specified, this forces the edges to be rendered in sharp mode, (ie. 1-bit alpha channel).

       -shape  This option indicates that the logo window should be shaped rather than rectangular.

RESOURCES
       The  default width and the default height are each 100 pixels.  This program uses the Logo widget in the Athena widget set.  It understands all of the Simple widget resource names and classes
       as well as:

       foreground (class Foreground)
               Specifies the color for the logo.  The default is depends on whether reverseVideo is specified.  If reverseVideo is specified the default is XtDefaultForeground, otherwise the default
               is XtDefaultBackground.

       shapeWindow (class ShapeWindow)
               Specifies that the window is shaped to the X logo.  The default is False.

WIDGETS
       In  order  to specify resources, it is useful to know the hierarchy of the widgets which compose xlogo.  In the notation below, indentation indicates hierarchical structure.  The widget class
       name is given first, followed by the widget instance name.

       XLogo  xlogo
            Logo  xlogo

ENVIRONMENT
       DISPLAY to get the default host and display number.

       XENVIRONMENT
               to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

FILES
       /etc/X11/app-defaults/XLogo
              specifies required resources

SEE ALSO
       X(7), xrdb(1)

AUTHORS
       Ollie Jones of Apollo Computer and Jim Fulton of the MIT X Consortium wrote the logo graphics routine, based on a graphic design by Danny Chong and Ross Chapman of Apollo Computer.

X Version 11                                                                                  xlogo 1.0.4                                                                                     XLOGO(1)
