TABBED(1)                                                     General Commands Manual                                                    TABBED(1)

NAME
       tabbed - generic tabbed interface

SYNOPSIS
       tabbed [-c] [-d] [-h] [-s] [-v] [-g geometry] [-n name] [-p [s+/-]pos] [-r narg] [command...]

DESCRIPTION
       tabbed is a simple tabbed container for applications which support XEmbed. Tabbed will then run the provided command with the xid of tabbed
       as appended argument. (See EXAMPLES.) The automatic spawning of the command can be disabled by providing the -s parameter. If no command is
       provided tabbed will just print its xid and run no command.

OPTIONS
       -c     close tabbed when the last tab is closed. Mutually exclusive with -f.

       -d     detaches tabbed from the terminal and prints its XID to stdout.

       -f     fill up tabbed again by spawning the provided command, when the last tab is closed. Mutually exclusive with -c.

       -h     will print the usage of tabbed.

       -g geometry
              defines the X11 geometry string, which will fixate the height and width of tabbed.  Them form is [=][<width>{xX}<height>][{+-}<xoff‐
              set>{+-}<yoffset>]. See XParseGeometry(3) for further details.

       -n name
              will set the WM_CLASS attribute to name.

       -p [ s +/-] pos
              will set the absolute or relative position of where to start a new tab. When pos is is given without 's' in front it is an  absolute
              position.  Then  negative  numbers will be the position from the last tab, where -1 is the last tab.  If 's' is given, then pos is a
              relative position to the current selected tab. If this reaches the limits of the tabs; those limits then apply.

       -r narg
              will replace the narg th argument in command with the window id, rather than appending it to the end.

       -s     will disable automatic spawning of the command.

       -t color
              defines the selected background color.  #RGB, #RRGGBB, and X color names are supported.

       -T color
              defines the selected foreground color.

       -u color
              defines the normal background color.

       -U color
              defines the normal foreground color.

       -v     prints version information to stderr, then exits.

USAGE
       Mod-Shift-Return
              open new tab

       Mod-Shift-h
              previous tab

       Mod-Shift-l
              next tab

       Mod-Shift-j
              move selected tab one to the left

       Mod-Shift-k
              move selected tab one to the right

       Mod-Tab
              toggle between the selected and last selected tab

       Mod-t  open dmenu to either create a new tab appending the entered string or select an already existing tab.

       Mod-q  close tab

       Mod-[0..9]
              jumps to nth tab

       F11    Toggle fullscreen mode.

EXAMPLES
       $ tabbed surf -e

       $ tabbed urxvt -embed

       $ tabbed xterm -into

       $ xid=$(tabbed -d);urxvt -embed $xid

       $ tabbed -r 2 st -w '' -e tmux

CUSTOMIZATION
       tabbed by default uses Ctrl as Mod key and can be customized by creating a custom config.h and (re)compiling the source code. This keeps it
       fast, secure and simple.

       Debian also provides the tabbed.meta alternative which uses the Windows key as Mod key.

AUTHORS
       See the LICENSE file for the authors.

LICENSE
       See the LICENSE file for the terms of redistribution.

SEE ALSO
       st(1)

BUGS
       Please report them.

                                                                    tabbed-0.6                                                           TABBED(1)
