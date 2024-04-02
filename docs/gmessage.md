GXMESSAGE(1)                                                                                                                          GXMESSAGE(1)

NAME
       gxmessage - a GTK-based xmessage clone

SYNOPSIS
       gxmessage [OPTIONS] message ...
       gxmessage [OPTIONS] -file FILENAME

DESCRIPTION
       gxmessage opens a window to display a message obtained from the command line, from a file, or from stdin. The window includes a row of but‐
       tons, each of which causes the program to exit with a different return code.

       The GNU Info entry for gxmessage contains detailed information and examples.

OPTIONS
       gxmessage should accept any option xmessage would, although some (such as -bw and -xrm) are silently ignored. Options supported  by  gxmes‐
       sage are as follows:

       -bg COLOR
              Sets the background color of the message to COLOR. Examples: red, "#c90", "#446a7e".

       -borderless
              Opens the gxmessage window without the usual window frame. This option is not compatible with xmessage.

       -buttons BUTTON_LIST
              Defines the buttons to be created. BUTTON_LIST is a comma-separated list of LABEL:VALUE pairs, one for each button. The LABEL is the
              text that appears on the button. The VALUE (0..255) is the code the program will exit with if that button  is  pressed.  Commas  and
              colons  can  be  escaped  using  backslashes  (\).  As  well  as  ordinary  text,  the  LABEL can specify a GTK "stock" button, like
              "GTK_STOCK_CANCEL", or it can include an underscore (_) to specify a keyboard accelerator. If VALUEs are omitted,  they  default  to
              101, 102, 103, etc., in order. If no -buttons option is given, BUTTON_LIST defaults to "okay:0".

                   gxmessage -buttons "Foo:42,Bar:63" "Example"
                   echo $?

                   gxmessage -buttons "_Foo,_Bar" "Example"
                   echo $?

                   gxmessage "Example"
                   echo $?

                   gxmessage -buttons "GTK_STOCK_OK:0" "Example"
                   echo $?

                   gxmessage -buttons "Hello\, world" "Example"

       -center
              Opens the gxmessage window in the middle of the screen.

       -default LABEL
              Opens  the  gxmessage  window  with input focused on the specified button.  LABEL is one of the LABELs in BUTTON_LIST (see -buttons,
              above).

       -display DISPLAY
              Specifies the X display to use.

       -encoding CHARSET
              Specifies the encoding of the message text. By default, the message text is assumed to match the encoding  of  the  current  locale.
              This option is not compatible with xmessage.

       -entry
              Adds  a  text  entry  box  to the gxmessage window. When the window closes, any text in the entry box will be copied to stdout. This
              option is not compatible with xmessage and can't be used at the same time as the -print option.

       -entrytext TEXT
              Same as -entry, but sets the default entry box contents to TEXT.  This option is not compatible with xmessage.

       -fg COLOR
              Sets the message text color to COLOR.

       -file FILENAME
              Causes the named file to be used as the message source. If a dash (-) is used in place of FILENAME, the message will  be  read  from
              stdin.

       -fn | -font FONT
              Specifies the message font, using GTK2's font specification system. For example, -font "serif italic 14". (GTK2's font system is not
              compatible with xmessage. See the Compatibility section, below, for a workaround.)

       -geometry GEOMETRY
              Sets the window's size (position is ignored by gxmessage). Example: -geometry 400x200

       -help
              Displays basic usage information then exits.

       -iconic
              Opens the gxmessage window in its iconized (minimized) state.

       -name NAME
              Sets the gxmessage window's name to NAME.

       -nearmouse
              Opens the gxmessage window near the mouse pointer.

       -noescape
              Prevents the window closing if the ESC key is pressed. This option only works if a  file  named  /usr/share/gxmessage/allow_noescape
              exists.  This option is not compatible with xmessage.

       -nofocus
              Prevents the gxmessage window from receiving focus when it opens.  This option is not compatible with xmessage.

       -ontop
              Attempts to keep the gxmessage window in front of other windows.  This option is not compatible with xmessage.

       -print
              Writes the LABEL of the selected button to stdout.

       -sticky
              Causes the gxmessage window to appear on all workspaces.  This option is not compatible with xmessage.

       -timeout SECONDS
              Automatically  closes  the  gxmessage  window with an exit code of 0 if no button is pressed within SECONDS seconds. (The -entry and
              -entrytext options cause -timeout to be ignored.)

       -title TITLE
              Sets the gxmessage window's title to TITLE.

       -version
              Displays the program's version number and Copyright details, then exits. This option is not compatible with xmessage.

       -wrap
              Causes lines to wrap rather than exceed the width of the window. This option is not compatible with xmessage.

GTK DEFAULTS
       The program's default appearance can be adjusted using GTK resource files.  The main text display widget is named gxmessage-textview.   The
       text entry widget is named gxmessage-entry.

            # Example: ~/.gtkrc-2.0

            style "gxmsg" {
                text[NORMAL]   = "#cc9900"
                base[NORMAL]   = "#660000"
                text[SELECTED] = "#660000"
                base[SELECTED] = "#cc9900"
                font_name      = "monospace"
            }
            widget "*.gxmessage-textview" style  "gxmsg"
            widget "*.gxmessage-entry"    style  "gxmsg"

EXIT STATUS
       If a button is pressed, the program returns the value assigned to that button.  The default "okay" button returns 0.

       If a timeout event occurs, the program returns 0.

       If an error occurs, or if the window is closed without a button-press or timeout event, the program exits with code 1. Pressing the ESC key
       also causes the program to exit with code 1.

COMPATIBILITY WITH XMESSAGE
       Fall back to xmessage if gxmessage isn't available:

            #! /bin/sh
            XMESSAGE=$(which gxmessage) || XMESSAGE=xmessage
            $XMESSAGE "hello, world"

       If you specify fonts, check which program you're using:

            font="monospace 14"
            [ "$XMESSAGE" = xmessage ] && font="fixed"
            $XMESSAGE ${font:+-fn "$font"} "hello, world"

       Don't use double-dashed command line options:

            $XMESSAGE "hello, world" -buttons good
            $XMESSAGE "hello, world" --buttons bad

       Don't use the gxmessage-specific options:

            -entry, -entrytext, -borderless, -wrap,
            -encoding, -nofocus, -noescape, -ontop,
            -sticky, -version, -h, -?

BUGS
       The position component of -geometry values is ignored by gxmessage.

       For some reason, opening the gxmessage window with no button set to be the default causes GTK to emit a "beep" sound.

       If you discover other bugs in the most recent version of gxmessage, please get in touch.

SEE ALSO
       xmessage(1), zenity(1), dialog(1)

       The GNU Info entry for gxmessage contains detailed information and examples.

AUTHORS
       Timothy Musson <trmusson@gmail.com>

COPYRIGHT NOTICE
       Copyright © 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2012 Timothy Richard Musson

       Copying and distribution of this file, with or without modification, are permitted provided the copyright notice and this notice  are  pre‐
       served.

                                                                February 25th, 2012                                                   GXMESSAGE(1)
