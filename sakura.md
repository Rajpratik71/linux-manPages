SAKURA(1)                                                                                                                                SAKURA(1)

NAME
       sakura - A simple but powerful libvte-based terminal emulator.

SYNOPSIS
       sakura [options...]

DESCRIPTION
       sakura is a terminal emulator based on GTK+ and VTE. It's a terminal emulator with few dependencies, so you don't need a full GNOME desktop
       installed to have a decent terminal emulator.

HELP OPTIONS
       -?, --help
               Show help options.

       --help-all
               Show all help options

       --help-gtk
               Show GTK+ Options

APPLICATION OPTIONS
       -v, --version
               Print version number

       -f, --font
               Select initial terminal font

       -n, --ntabs
               Select initial number of tabs

       -x, --execute
               Execute command

       -e, --xterm-execute
               Execute command (compatible with xterm's -e option)

       -l, --login
               Login shell

       -t, --title
               Set window title

       -c, --columns
               Set columns number

       -r, --rows
               Set rows number

       -h, --hold
               Hold window after execute command

       -d, --working-directory
               Set working directory

       -m, --maximize
               Maximize window

       -s, --fullscreen
               Fullscreen mode

       --display=DISPLAY
               X display to use

       --config-file=FILENAME
               Use alternate configurtation file. Path is relative to the sakura config dir.  (Example: ~/.config/sakura/FILENAME).

GTK+ OPTIONS
       --class=CLASS
               Program class as used by the window manager

       --name=NAME
               Program name as used by the window manager

       --screen=SCREEN
               X screen to use

       --sync  Make X calls synchronous

       --gtk-module=MODULES
               Load additional GTK+ modules

       --g-fatal-warnings
               Make all warnings fatal

KEYBINDINGS SUPPORT
       sakura supports keyboard bindings. They are configurable by setting the following properties in your sakura config file
       (~/.config/sakura/sakura.conf).

   ACCELERATORS
       Accelerators can be set to any mask value from the GdkModifierType in gdktypes.h; see:

       http://www.krugle.org/examples/p-6R7SuZt1c28ljzpZ/gdktypes.h

       or, on your own system:

       /usr/include/gtk-2.0/gdk/gdkkeysyms.h

       Mask values can be combined by ORing them.

       For example, to set the delete tab accelerator to Ctrl + Shift:

       del_tab_accelerator=5

       because GDK_SHIFT_MASK has a value of 1 (1 << 0), and GDK_CONTROL_MASK has a value of 4 (1 << 2); ORing them together, you get 5.

       I realise that this configuration is not so friendly to non-programmers, but it is a start. :)

   KEYS
       For example, to set the add tab key to 'T':

       add_tab_key=T

       Before sakura used keycodes instead of strings. They're still valid.

   DEFAULTS
           Ctrl + Shift + T                 -> New tab
           Ctrl + Shift + W                 -> Close current tab
           Ctrl + Shift + C                 -> Copy selected text
           Ctrl + Shift + V                 -> Paste selected text
           Alt  + Left cursor               -> Previous tab
           Alt  + Right cursor              -> Next tab
           Alt  + [1-9]                     -> Switch to tab N (1-9)
           Ctrl + Shift + S                 -> Toggle scrollbar
           Ctrl + Shift + Mouse left button -> Open link
           F11                              -> Fullscreen
           Shift + PageUp                   -> Move up through scrollback by page
           Shift + PageDown                 -> Move down through scrollback by page
           Ctrl + Shift + Up                -> Move up through scrollback by line
           Ctrl + Shift + Down              -> Move down through scrollback by line

       You can also increase and decrease the font size in the GTK+ standard way (not configurable):

           Ctrl + '+'                       -> Increase font size
           Ctrl + '-'                       -> Decrease font size

BUGS
       sakura is hosted on Launchpad. Bugs can be filed at:

       https://bugs.launchpad.net/sakura

AUTHORS
       sakura was written by David Gómez <david@pleyades.net>.

       This manual page was written by Andrew Starr-Bochicchio <a.starr.b@gmail.com>.

       Both are released under the GNU General Public License, version 2 or later.

3.3.4                                                               2016-02-14                                                           SAKURA(1)
