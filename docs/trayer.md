TRAYER(1)                                                     General Commands Manual                                                    TRAYER(1)

NAME
       trayer - a lightweight GTK2-based systray for UNIX desktop

SYNOPSIS
       trayer -h
       trayer -v
       trayer  [--edge  left|right|top|bottom|none]  [--align  left|right|center]  [--margin <size>] [--widthtype request|pixel|percent ] [--width
       <size>] [--heighttype <pixel>] [--height <size>]  [--SetDockType  true|false]  [--SetPartialStrut  true|false]  [--transparent  true|false]
       [--alpha  <value>]  [--tint  <color>]  [--distance  <length>]  [--distancefrom left|right|top|bottom|none] [--expand true|false] [--padding
       <size>]

DESCRIPTION
       trayer is a small program designed to provide system tray similar to these in GNOME / KDE desktop environments for  window  managers  which
       does not support that function. It is similar to other applications such as peksystray and docker.

       System  tray  is a place, where many applications put their icons, so they are always visible. Such icons may present status of an applica‐
       tion and allow user to control the program.

       trayer's code was extracted from fbpanel application, you can find more about it on its homepage: http://fbpanel.sourceforge.net/.

OPTIONS
       This programs follow the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.

       --help

       -h     Show summary of options and exit.

       --version

       -v     Show version of program and exit.

       --edge left|right|top|bottom|none
              Specifies a screen edge to use.

       --align left|center|right
              Specifies an align of the icons.

       --margin <size>
              Specifies length of margin (in pixels)

       --widthtype request|pixel|percent
              Specifies method of calculating trayer's window width:

              request
                     Follow application icons' size, so trayer may shrink or expand dynamically.

              pixel  Set a fixed size, given with --width option in pixels.

              percent
                     Set a fixed size, given with --width option in percentage of a length of screen edge.

       --width <size>
              Width of trayer's window. Ignored when --widthtype is set to request.

       --heighttype request|pixel|percent
              Specifies method of calculating trayer's window height:

              request
                     Follow application icons' size, so trayer may shrink or expand dynamically.

              pixel  Set a fixed size, given with --height option in pixels.

              percent
                     Set a fixed size, given with --height option in percentage of a length of screen edge.

       --height <size>
              Height of trayer's window. Ignored when --heighttype is set to request.

       --SetDockType true|false
              Identify panel window type as dock.

       --SetPartialStrut true|false
              Reserve panel space so that it will not be covered by maximized windows.

       --transparent true|false
              Use transparency.

       --alpha <value>
              Percentage of transparency (0 - nontransparent, 255 - fully transparent)

       --tint <color>
              Color  used to tint transparent background. Color is given as a 24-bit C hexadecimal integer, for example: 0xff0000 is red, 0xff8800
              is orange and 0x00ff00 is green.

       --distance <length>
              Specifies distance between trayer's window and screen edge (in pixels)

       --distancefrom <edge>
              Specifies which edge to calculate distance from, see above.

       --expand true|false
              Specifies whether trayer may accommodate extra space when there is too much icons.

       --padding <size>
              Extra space between icons and trayer window's border.

       --monitor NUM|STRING
              Define the monitor on which you like trayer to appear, number of zero to number of monitors minus one, or the string  "primary"  are
              valid. The default value is 0.

SEE ALSO
       fbpanel(1)

AUTHORS
       Anatoly Asviyan <aanatoly@users.sf.net> - fbpanel
       Rafal Bisingier <ravbc@man.poznan.pl>
       Maciej Delmanowski <harnir@users.berlios.de>
       Grzegorz Nieweglowski <hoppke@dobremiasto.net>
       Thomas Rydzynski

       This manual page was written by Tomasz Melcer <liori@interia.pl>.

FVWM-Crystal                                                       Feb 14, 2005                                                          TRAYER(1)
