WIDGET(1p)                                                     perl/Tk Documentation                                                    WIDGET(1p)

NAME
       widget - Demonstration of Perl/Tk widgets

SYNOPSYS
         widget [ directory ]

DESCRIPTION
       This script demonstrates the various widgets provided by Tk, along with many of the features of the Tk toolkit.  This file only contains
       code to generate the main window for the application, which invokes individual demonstrations.  The code for the actual demonstrations is
       contained in separate ".pl" files in the "widget_lib" directory, which are autoloaded by this script as needed.

       widget looks in the directory specified on the command line to load user contributed demonstrations.  If no directory name is specified
       when widget is invoked and the environment variable WIDTRIB is defined then demonstrations are loaded from the WIDTRIB directory. If
       WIDTRIB is undefined then widget defaults to the released user contributed directory, "widtrib".

   History
        #
        # Stephen O. Lidie, LUCC, 96/03/11.  lusol@Lehigh.EDU
        # Stephen O. Lidie, LUCC, 97/01/01.  lusol@Lehigh.EDU
        # Stephen O. Lidie, LUCC, 97/02/11.  lusol@Lehigh.EDU
        # Stephen O. Lidie, LUCC, 97/06/07.  lusol@Lehigh.EDU
        #     Update for Tk402.00x.  Total revamp:  WidgetDemo, Scrolled, released
        #     composites, -menuitems, qw//, etcetera.  Perl 5.004 required.
        # Stephen O. Lidie, LUCC, 98/03/10.  lusol@Lehigh.EDU
        #     Update for Tk8.
        # Stephen O. Lidie, LUCC, 98/06/26.  Stephen.O.Lidie@Lehigh.EDU
        #     Add Common Dialogs for Tk800.007.
        # Stephen.O.Lidie@Lehigh.EDU, 1999/11/29, Lehigh University.
        #     Demo some "dash patch" changes.
        # Stephen.O.Lidie@Lehigh.EDU, 2000/01/11, Lehigh University.
        #     Update menubar to Tk 8, fix color palette Menubutton demo.
        # Stephen.O.Lidie@Lehigh.EDU, 2000/07/06, Lehigh University.
        #     Remove inswt() from widget and styles.pl to show the proper Perl/Tk
        #     idiom for inserting Text tags.  Various and sundry cleanups.
        # sol0@lehigh.edu, 2003/07/29, Lehigh University Computing Center.
        #     Update for Tk 8.4.4.

AUTHOR
       Steve Lidie <sol0@Lehigh.EDU>

Tk804.033                                                           2013-11-15                                                          WIDGET(1p)
