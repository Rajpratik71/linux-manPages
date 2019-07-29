ROFI-MANPAGE()                                                                                                                      ROFI-MANPAGE()

NAME
       rofi - A window switcher, run launcher, ssh dialog and dmenu replacement

SYNOPSIS
       rofi [ -width pct_scr ] [ -lines lines ] [ -columns columns ] [ -font pangofont ] [ -fg color ] [ -fg-urgent color ] [ -fg-active color ] [
       -bg-urgent color ] [ -bg-active color ] [ -bg color ] [ -bgalt color ] [ -hlfg color ] [ -hlbg color ] [ -key-mode combo ] [ -terminal ter‐
       minal  ]  [  -location  position ] [ -fixed-num-lines ] [ -padding padding ] [ -opacity opacity% ] [ -display display ] [ -bc color ] [ -bw
       width ] [ -dmenu [ -p prompt ] [ -sep separator ] [ -l selected line ] [ -mesg ] [ -select ] ] [ -filter filter ] [ -ssh-client client ]  [
       -ssh-command  command  ]  [ -disable-history ] [ -levenshtein-sort ] [ -case-sensitive ] [ -show mode ] [ -modi mode1,mode2 ] [ -eh element
       height ] [ -lazy-filter-limit limit ] [ -e message] [ -a row ] [ -u row ] [ -pid path ] [ -now ] [ -rnow ] [ -snow ] [ -version ] [  -help]
       [  -dump-xresources  ]  [  -auto-select  ]  [  -parse-hosts  ]  [  -no-parse-known-hosts ] [ -combi-modi mode1,mode2 ] [ -normal-window ] [
       -fake-transparency ] [ -quiet ] [ -glob ] [ -tokenize ]

DESCRIPTION
       rofi is an X11 popup window switcher, run dialog, dmenu replacement and more. It focuses on being fast to use and have minimal distraction.
       It supports keyboard and mouse navigation, type to filter, tokenized search and more.

USAGE
       rofi  can be used in three ways, single-shot; executes once and directly exits when done, as a daemon listening to specific key-combination
       or emulating dmenu.

   Single-shot mode
       To launch rofi directly in a certain mode, specify a mode with rofi -show <mode>. To show the run dialog:

           rofi -show run

   Daemon mode
       To launch rofi in daemon mode don´t specify any mode, instead keys can be bound to launch a certain mode. To show run-mode by  pressing  F2
       start rofi like this:

           rofi -key-run F2

       Keybindings can also be specified in the Xresources file.

   Emulating dmenu
       rofi can emulate dmenu (a dynamic menu for X) when launched with the -dmenu flag.

       The official website for dmenu can be found here http://tools.suckless.org/dmenu/.

OPTIONS
       There are currently three methods of setting configuration options:

       ·   Compile time: edit config.c. This method is strongly discouraged.

       ·   Xresources:  A  method  of  storing key values in the Xserver. See here https://en.wikipedia.org/wiki/X_resources for more information.
           This is the recommended way of configuring rofi.

       ·   Command-line options: Arguments passed to rofi.

       The Xresources file expects options starting with rofi. followed by it´s name. An Example to set the number of lines:

           rofi.lines: 10

       Command line options override settings from Xresources file. The same option set as argument: prefixed with a ´-´:

           rofi -lines 10

       To get a list of available options, formatted as Xresources entries run:

           rofi -dump-xresources

       The configuration system supports the following types:

       ·   String

       ·   Integer (signed and unsigned)

       ·   Char

       ·   Boolean

       Boolean options have a non-default command-line syntax. Example to enable option X:

           -X

       to disable it:

           -no-X

       Below is a list of the most important options:

   General
       -key-{mode} KEY

       Set the key combination to display a {mode} in daemon mode.

           rofi -key-run F12
           rofi -key-ssh control+shift+s
           rofi -key-window mod1+Tab

       -dmenu

       Run rofi in dmenu mode. This allows for interactive scripts. In dmenu mode, rofi reads from STDIN, and output to STDOUT. A simple  example,
       displaying 3 pre-defined options:

           echo -e "Option #1\nOption #2\nOption #3" | rofi -dmenu

       Or get the options from a script:

           ~/my_script.sh | rofi -dmenu

       Pressing shift-enter sends the selected entry to STDOUT and moves to the next entry.

       -show mode

       Open rofi in a certain mode. Available modes are window, run, ssh To show the run-dialog:

           rofi -show run

       -modi mode1,mode1

       Specify  a  ordered, comma separated list of modes to enable. Enabled modes can be changed at runtime. Default key is Ctrl+Tab. If no modes
       are specified all modes will be enabled. To only show the run and ssh launcher:

           rofi -modi "run,ssh" -show run

       Custom modes can be added using the internal ´script´ mode. Each mode has two parameters:

           <name>:<script>

       Example: Have a mode ´Workspaces´ using the i3_switch_workspace.sh script:

           rofi -modi "window,run,ssh,Workspaces:i3_switch_workspaces.sh" -show Workspaces

       -case-sensitive

       Start in case sensitive mode.

       -quiet

       Do not print any message when starting in daemon mode.

       -fuzzy

       Enable experimental fuzzy matching.

       -filter filter

       Filter the list by setting text in input bar to filter

   Theming
       All colors are either hex #rrggbb values or X11 color names. -bg

       -bg-active

       -bg-urgent

       Set background color in menu.

           rofi -bg "#222222"

       Default: #f2f1f0

       -bgalt

       Set background color for alternating rows in menu.

           rofi -bgalt "#222222"

       Default: #f2f1f0

       -bc

       Set border color for menu.

           rofi -bc black

       Default: black

       -bw

       Set border width in pixels.

           rofi -bw 1

       Default: 1

       -fg

       -fg-urgent

       -fg-active

       Set foreground text color for the menu.

           rofi -fg "#cccccc"

       Default: #222222

       -hlbg

       -hlbg-active

       -hlbg-urgent

       Set background color for the highlighted item in the menu.

           rofi -hlbg "#005577"

       Default: #005577

       -hlfg

       -hlfg-active

       -hlfg-urgent

       Set foreground text color for the highlighted item in the menu.

           rofi -hlfg "#ffffff"

       Default: #FFFFFF

       -font

       Specify a font. Pango syntax is used.

           rofi -font "Dejavu Sans Mono 14"

       Default: mono 12

       -opacity

       Set window opacity (0-100).

           rofi -opacity "75"

       Default: 100

       -eh element height

       The height of a field in lines. e.g.

           echo -e "a\n3|b\n4|c\n5" | rofi -sep ´|´ -eh 2 -dmenu

       Default: 1

       The following options are further explained in the theming section:

       -color-enabled

       Enable the exteneded coloring options.

       -color-window background border color separator color/

       Set window background, border and separator color.

       -color-normal background, foreground, background alt, highlight background, highlight foreground

       -color-urgent background, foreground, background alt, highlight background, highlight foreground

       -color-active background, foreground, background alt, highlight background, highlight foreground

       Specify the colors used in a row per state (normal, active, urgent).

       -line-margin

       Set the spacing between the rows.

           Default: *3*
           Min:     *3*
           Max:     *50*

       -separator-style style

       Set separator style. Possible options are "none", "solid" or "dash".

           Default: *dash*

       -hide-scrollbar

       Hide the scrollbar.

       -glob

       Use glob style matching

       -tokenize

       Tokenize the input.

   Layout
       -lines

       Maximum number of lines to show before scrolling.

           rofi -lines 25

       Default: 15

       -columns

       Number of columns to show before scrolling.

           rofi -columns 2

       Default: 1

       -width [value]

       Set width of menu. [value] is specified in percentage.

           rofi -width 60

       If [value] is larger then 100, size is set in pixels. Example to span a full hd monitor:

           rofi -width 1920

       If [value] is negative, it tries to estimates a character width. To show 30 characters on a row:

           rofi -width -30

       Character width is a rough estimation, and might not be correct, but should work for most monospaced fonts.

       Default: 50

       -location

       Specify where the window should be located. The numbers map to the following locations on screen:

             1 2 3
             8 0 4
             7 6 5

       Default: 0

       -fixed-num-lines

       Keep a fixed number of visible lines (See the -lines option.)

       -padding

       Define the inner margin of the window.

       Default: 5

       -fullscreen

       Use the full screen height and width.

       -sidebar-mode

       Open in sidebar-mode. In this mode a list of all enabled modes is shown at the bottom. (See -modi option) To show sidebar use:

           rofi -show run -sidebar-mode -lines 0

       -lazy-filter-limit limit

       The number of entries required for rofi to go into lazy filter mode. In lazy filter mode, it won´t re-filter the list on each keypress, but
       only after rofi been idle for 250ms. Experiments shows that the default (5000 lines) works well, set to 0 to always enable.

       Default: 5000

       -auto-select

       When one entry is left, automatically select it.

       -m num -monitor num

       Select  (Xinerama)  monitor to display rofi on. The special number -1 denotes the currently focused monitor, the number -2 denotes the cur‐
       rently focused window (i.e. rofi will be displayed on top of the focused window).

           Default: *-1*

   PATTERN setting
       -terminal

       Specify what terminal to start.

           rofi -terminal xterm

       Pattern: {terminal} Default: x-terminal-emulator

       -ssh-client client

       Override the used ssh client.

       Pattern: {ssh-client} Default: ssh

   SSH settings
       -ssh-command cmd

       Set the command to execute when starting a ssh session. The pattern {host} is replaced by the selected ssh entry.

       Default: {terminal} -e {ssh-client} {host}

       -parse-hosts

       Parse the /etc/hosts file for entries.

       Default: disabled

       -parse-known-hosts -no-parse-known-hosts

       Parse the ~/.ssh/known_hosts file for entries.

       Default: enabled

   Run settings
       -run-command cmd

       Set command ({cmd}) to execute when running an application. See PATTERN.

       Default: {cmd}

       -run-shell-command cmd

       Set command to execute when running an application in a shell. See PATTERN.

       Default: {terminal} -e {cmd}

       -run-list-command cmd

       If set, use an external tool to generate list of executable commands. Uses ´run-command´

       Default: ""

   Combi settings
       -combi-modi mode1,mode2

       The modi to combine in combi mode. For syntax to see -modi. To get one merge view, of window,run,ssh:

           rofi -show combi -combi-modi "window,run,ssh"

   History and Sorting
       -disable-history -no-disable-history (re-enable history)

       Disable history

       -levenshtein-sort to enable -no-levenshtein-sort to disable

       When searching sort the result based on levenshtein distance.

   Dmenu specific
       -sep separator

       Separator for dmenu. Example: To show list ´a´ to ´e´ with ´|´ as separator:

           echo "a|b|c|d|e" | rofi -sep ´|´ -dmenu

       -p prompt

       Specify the prompt to show in dmenu mode. E.g. select monkey a,b,c,d or e.

           echo "a|b|c|d|e" | rofi -sep ´|´ -dmenu -p "monkey:"

       Default: dmenu

       -selected-row selected row

       Select a certain row.

       Default: 0

       -l number of lines to show

       Maximum number of lines the menu may show before scrolling.

           rofi -lines 25

       Default: 15

       -i

       Makes dmenu searches case-insensitive

       -a X

       Active row, mark row X as active. (starting at 0) You can specify single element: -a 3 A range: -a 3-8 or a set of rows: -a 0,2 or any com‐
       bination: -a 0,2-3,9

       -u X

       Urgent row, mark row X as urgent. (starting at 0) You can specify single element: -u 3 A range: -u 3-8 or a set of rows: -u 0,2 or any com‐
       bination: -u 0,2-3,9

       -only-match

       Only return a selected item, do not allow custom entry. This mode always returns an entry, or returns directly when no entries given.

       -no-custom

       Only return a selected item, do not allow custom entry. This mode returns directly when no entries given.

       -format format

       Allows the output of dmenu to be customized (N is total number of input entries):

       ·   ´s´ selected string.

       ·   ´i´ index (0 - (N-1)).

       ·   ´d´ index (1 - N).

       ·   ´q´ quote string.

       ·   ´f´ filter string (user input).

       ·   ´F´ quoted filter string (user input).

       Default: ´s´

       -select string

       Select first line that matches the given string

       -mesg string

       Add a message line below the filter entry box. Supports pango markup. For more information on  supported  markup  see  here  https://devel‐
       oper.gnome.org/pango/stable/PangoMarkupFormat.html

       -normal-window

       Make rofi reacts like a normal application window. Useful for scripts like Clerk that are basically an application.

       -fake-transparency

       Enable fake transparency. This only works with transparent background color in the theme, not the opacity setting.

   Message dialog
       -e message

       Popup a message dialog (used internally for showing errors) with message. Message can be multi-line.

   Other
       ´-pid´ path

       Make  rofi  create  a pid file and check this on startup. Avoiding multiple copies running simultaneously. This is useful when running rofi
       from a keybinding daemon.

   Debug
       -dump-xresources

       Dump the current active configuration in Xresources format to the command-line. This does not validate all passed values (e.g. colors).

       -no-config

       Disable parsing of configuration. This runs rofi in stock mode.

PATTERN
       To launch commands (e.g. when using the ssh launcher) the user can enter the used command-line, the following keys can be used that will be
       replaced at runtime:

       ·   {host}: The host to connect to.

       ·   {terminal}: The configured terminal (See -terminal-emulator)

       ·   {ssh-client}: The configured ssh client (See -ssh-client)

       ·   {cmd}: The command to execute.

DMENU REPLACEMENT
       If argv[0] (calling command) is dmenu, rofi will start in dmenu mode. This way it can be used as a drop-in replacement for dmenu. just copy
       or symlink rofi to dmenu in $PATH.

           ln -s /usr/bin/dmenu /usr/bin/rofi

SIGNALS
       HUP

       If in daemon mode, reload the configuration from Xresources. (commandline arguments still -override Xresources). This will also reload con‐
       figured key-bindings.

       INT

       If in daemon mode, quits rofi.

       USR1

       If in daemon mode, dumps the current configuration to stdout. Similar to -xresources-dump

THEMING
       With  rofi  0.15.4  we  have  a  new  way  of  specifying  colors,  the  old  settings  still apply (for now). To enable the new setup, set
       rofi.color-enabled to true. The new setup allows you to specify colors per state, similar to i3 Currently 3 states exists:

       ·   normal Normal row.

       ·   urgent Highlighted row (urgent)

       ·   active Highlighted row (active)

       For each state the following 5 colors must be set:

       ·   bg Background color row

       ·   fg Text color

       ·   bgalt Background color alternating row

       ·   hlfg Foreground color selected row

       ·   hlbg Background color selected row

       The window background and border color should be specified separate. The key color-window contains a pair background,border. An example for
       Xresources file:

           ! State:           ´bg´,     ´fg´,     ´bgalt´,  ´hlbg´,   ´hlfg´
           rofi.color-normal: #fdf6e3,  #002b36,  #eee8d5,  #586e75,  #eee8d5
           rofi.color-urgent: #fdf6e3,  #dc322f,  #eee8d5,  #dc322f,  #fdf6e3
           rofi.color-active: #fdf6e3,  #268bd2,  #eee8d5,  #268bd2,  #fdf6e3

           !                  ´background´, ´border´
           rofi.color-window: #fdf6e3,      #002b36

       Same settings can also be specified on command-line:

           rofi -color-normal "#fdf6e3,#002b36,#eee8d5,#586e75,#eee8d5"

COLORS
       Rofi  has  an  experimental mode for a ´nicer´ transparency. The idea is to make the background of the window transparent, leaving the text
       opaque. There are 2 requirements for this feature: 1. Your Xserver supports TrueColor, 2. You are running a composite manager. If  this  is
       satisfied you can use the following format for colors:

           argb:FF444444

       The  first  two  fields  specify the alpha level. This determines the amount of transparency. (00 everything, FF nothing). The other fields
       represent the actual color, in hex.

KEYBINDINGS
       rofi has the following key-bindings:

       ·   Ctrl-v, Insert: Paste clipboard

       ·   Ctrl-Shift-v, Shift-Insert: Paste primary selection

       ·   Ctrl-u: Clear the line

       ·   Ctrl-a: Beginning of line

       ·   Ctrl-e: End of line

       ·   Ctrl-f, Right: Forward one character

       ·   Alt-f: Forward one word

       ·   Ctrl-b, Left: Back one character

       ·   Alt-b: Back one word

       ·   Ctrl-d, Delete: Delete character

       ·   `Ctrl-Alt-d´: Delete word

       ·   Ctrl-h, Backspace: Backspace (delete previous character)

       ·   Ctrl-Alt-h: Delete previous word

       ·   Ctrl-j,Ctrl-m,Enter: Accept entry

       ·   Ctrl-n,Down: Select next entry

       ·   Ctrl-p,Up: Select previous entry

       ·   Page Up: Go to the previous page

       ·   Page Down: Go to the next page

       ·   Ctrl-Page Up: Go to the previous column

       ·   Ctrl-Page Down: Go to the next column

       ·   Ctrl-Enter: Use entered text as command (in ssh/run modi)

       ·   Shift-Enter: Launch the application in a terminal (in run mode)

       ·   Shift-Enter: Return the selected entry and move to the next item while keeping Rofi open. (in dmenu)

       ·   Shift-Right: Switch to the next modi. The list can be customized with the -switchers argument.

       ·   Shift-Left: Switch to the previous modi. The list can be customized with the -switchers argument.

       ·   Ctrl-Tab: Switch to the next modi. The list can be customized with the -switchers argument.

       ·   Ctrl-Shift-Tab: Switch to the previous modi. The list can be customized with the -switchers argument.

       ·   Ctrl-space: Set selected item as input text.

       ·   Shift-Del: Delete entry from history.

       ·   Ctrl-grave: Toggle case sensitivity.

       To get a full list of keybindings, see rofi -dump-xresources | grep kb-. Keybindings can be modified using the configuration systems.

FAQ
       Text in window switcher is not nicely lined out

           Try using a mono-space font.

       **rofi** is completely black.

           Check quotes used on the commandline: e.g. used “ instead of ".

LICENSE
       MIT/X11

       Permission is hereby granted, free of charge, to any person obtaining
       a copy of this software and associated documentation files (the
       "Software"), to deal in the Software without restriction, including
       without limitation the rights to use, copy, modify, merge, publish,
       distribute, sublicense, and/or sell copies of the Software, and to
       permit persons to whom the Software is furnished to do so, subject to
       the following conditions:

       The above copyright notice and this permission notice shall be
       included in all copies or substantial portions of the Software.

       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
       OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
       MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
       IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
       CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
       TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
       SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

WEBSITE
       rofi website can be found at here https://davedavenport.github.io/rofi/

       rofi bugtracker can be found here https://github.com/DaveDavenport/rofi/issues

AUTHOR
       Qball Cow qball@gmpclient.org

       Rasmus Steinke rasi@xssn.at

       Original code based on work by: Sean Pringle sean.pringle@gmail.com

       For a full list of authors, check the AUTHORS file.

                                                                   November 2015                                                    ROFI-MANPAGE()
