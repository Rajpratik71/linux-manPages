dunst(1)                                                          Dunst Reference                                                         dunst(1)

NAME
       dunst - A customizable and lightweight notification-daemon

SYNOPSIS
       dunst [-geometry geom] [-shrink shrink] [-fn font] [-nf/nb/lf/lb/cf/cb color] [-to/nto/lto/cto secs] [-format fmt] [-key key] [-mod mod]
       [-mon n] [-t/title title] [-c/class class] [-v]

DESCRIPTION
       Dunst is a highly configurable and lightweight notification daemon.

OPTIONS
       -h/--help
           display help message.

       -fn font
           defines the font or font set used.

       -lb/nb/cb color
           defines the background color of low/normal/critical messages.

       -lf/nf/cf color
           defines the foreground color of low/normal/critical messages.

       -to secs
           defines the default timeout. Can be (partially) overridden by the following options.

       -lto/nto/cto secs
           timeouts for low/normal/critical messages.

       -key key
           remove notification by pressing key.

       -all_key key
           remove all notifications by pressing key.

       -history_key key
           redisplay last notification by pressing key.

       -format fmt
           defines the format of the message. See FORMAT.

       -mon n
           show the notification on monitor n.

       -follow mode
           display notifications on focused monitor. Possible options are "mouse" to follow the mouse cursor, "keyboard" to follow the window with
           the keyboard focus and "none" to disable focus following. "mouse" and "keyboard" overwrite the -mon option.

       -s  sort messages by urgency.

       -ns don't sort messages by urgency.

       -geometry [{width}]x{height}][+/-{x}+/-{y}]
           The geometry of the message window. The height is measured in lines everything else in pixels. If the width is omitted but the height
           is given ("-geometry x2"), the message window expands over  the  whole  screen (dmenu-like).  If  width  is  0,  the  window  expands
           to  the longest message displayed. A positive x is measured from the left, a negative from the right side of the screen.  Y is measured
           from the top and down respectevly.  see also EXAMPLES show the notification on monitor n.

       -t/-title title
           Define the title of notification windows spawned by dunst.

       -t/-class class
           Define the class of notification windows spawned by dunst.

       -shrink
           Shrink window if it's smaller than the width. Will be ignored if width is 0.

       -lh/-line_height height
           The height of a single line in pixel. If the height is smaller than the font height, it will get raised to the font height.

       -print
           Print notifications to stdout. This might be useful for logging, setting up rules or using the output in other scripts.

       -v/--version
           print version information.

       -config file
           use alternative config file.

FORMAT
       fmt is a string containing placeholders. The placeholders will be replaced with the corresponding text, or if the text is not present,
       nothing. Possible placeholders are:

       %a  appname
       %s  summary
       %b  body
       %i  iconname (including its path)
       %I  iconname (without its path)
       %p  progress value ([  0%] to [100%])

COLORS
       Every option that needs a color as argument accepts #RGB, #RRGGBB and X color names.

NOTIFY-SEND
       dunst is able to get different colors for a message via notify-send.  In order to do that you have to add a hint via the -h option.  The
       progress value can be set with a hint, too.

       notify-send -h string:fgcolor:#ff4444
       notify-send -h string:bgcolor:#4444ff -h string:fgcolor:#ff4444
       notify-send -h int:value:42 "Working ..."

MISCELLANEOUS
       Dunst can be paused by sending a notification with a summary of "DUNST_COMMAND_PAUSE" and resumed with a summary of "DUNST_COMMAND_RESUME".
       Alternatively you can send SIGUSR1 and SIGUSR2 to pause and unpause respectivly. For Example:

       killall -SIGUSR1 dunst # pause
       killall -SIGUSR2 dunst # resume

       When paused dunst will not display any notifications but keep all notifications in a queue.  This can for example be wrapped around a
       screen locker (i3lock, slock) to prevent flickering of notifications through the lock and to read all missed notifications after returning
       to the computer.

CONFIGURATION
       An example configuration file is included (usually /usr/share/dunst/dunstrc).  To change the configuration, copy this file to
       ~/.config/dunst/dunstrc and edit it accordingly.

AUTHOR
       written by Sascha Kruse <knopwob@googlemail.com>

COPYRIGHT
       copyright 2013 Sascha Kruse and contributors (see LICENSE for licensing information)

       If you feel that copyrights are violated, please send me an email.

SEE ALSO
       dwm(1), dmenu(1), twmn(1), notify-send(1)

                                                                    2015-11-17                                                            dunst(1)
