PDMENU(1)                                                            Commands                                                            PDMENU(1)

NAME
       pdmenu - simple full screen menu program

SYNOPSIS
       pdmenu [options] [menufile ...]

DESCRIPTION
       pdmenu is a simple menu program that displays a menu from which the user can pick programs to run. Submenus are supported.

       When  you run pdmenu , you will be presented with a menu. Simply use the arrow keys to move to the program you want to run, and press Enter
       to run the program. When the program ends, you will be returned to the menu.

       If you are running pdmenu at the linux console, and gpm is running, you can move the mouse and click to navigate through the menus.

       Some menu items are actually submenus, and will take you to another menu.  Others may cause a text edit window to be displayed,  where  you
       can enter parameters for a command before running it. Still others may run a command, and display the output in a window.

KEYS
       Here are all keys you need to get around in pdmenu:

       [up arrow], 8, -
              Move up one line in the menu.

       [down arrow], 2, +
              Move down one line.

       [page up], [ctrl-u]
              Move up an entire screen.

       [page down], [space], [ctrl-v]
              Move down an entire screen.

       [home] Move to the first entry of the menu.

       [end]  Move to the last entry of the menu.

       q      Exit  the  current  menu,  or  exit pdmenu if used on the first menu. Does not work in the text edit windows. (This will not work if
              there is also a hotkey set up for 'q', the hotkey takes precedence.)

       ESC    Close the currently active window, and return to the previous window, or exit pdmenu if used on the first menu.

       [ctrl-c]
              Exit pdmenu immediately.

       [ctrl-r]
              Force a redraw of the screen.

       [enter]
              Launch the selected menu item. In a text edit window, closes the window.

       [backspace]
              Performs a destructive backspace in a text edit window.

       hotkeys
              Some letters of a menu item may be highlighted. These are hotkeys; simply press the highlighted letter to select the next menu  item
              with that hotkey.

OPTIONS
       -h, --help
              Display usage summary and exit.

       -c, --color
              Use color. By default, pdmenu will display in black and white mode. If your terminal supports color, use this switch.

       -u, --unpark
              "Unparks"  the  cursor  from  the bottom of the screen. When this option is selected, the cursor moves to be on the line of the menu
              that is currently selected. This makes pdmenu more useable with speech synthesis systems that need to know what line is the  current
              line on the screen.

       -mmenuid, --menu=menuid
              Instead of displaying the first menu from the menufile, select the menu with the id "menuid" and display it.

       -q, --quit
              By  default, at the opening menu, 'q' will exit pdmenu.  If the -q switch is specified, this will not be the case. This is useful if
              you want to prevent the user from ever exiting pdmenu.  (This also disables control-c  and  the  right  mouse  button  from  exiting
              pdmenu.)

       -r, --retro
              This  makes  pdmenu  use  an old style for displaying menus. Menus in the background don't change color, or lose their hotkeys. Note
              that this will also be a little bit faster than the default on slow terminals and the like.

       -l, --lowbit
              By default, pdmenu will use nice high bit line drawing characters if it thinks your terminal is  capable.  Sometimes  it  gets  this
              wrong  and you get borders that look all messed up. Then you should use this --lowbit switch to force it to use low bit line drawing
              characters.

       -n, --numeric
              Disables the use of the keys 2 and 8 for moving up and down. This is useful if you want to use numbered hotkeys.

       menufile ...
              Specify a menu definition file or files to use. If you specify multiple files, they will all be loaded in together. By default,  the
              first  menu  in the first menufile will be displayed when pdmenu starts, but this can be overridden by the --menu= option.  If menu‐
              file is "-", pdmenu will read standard input as a menu file.

NOTES
       To use the mouse to cut and paste as usual, hold down on the shift key when you use the mouse.

FILES
       /etc/pdmenurc
              Default config file. See pdmenurc(5) for details.
       ~/.pdmenurc
              If this exists, it overrides /etc/pdmenurc. See pdmenurc(5) for details.

ENVIRONMENT
       COLORTERM
              Set this variable to make pdmenu to use color by default.

DISTRIBUTION
       Redistribution is subject to the GNU public license.

BUGS
       See the file BUGS that came with pdmenu for the current buglist.

AUTHOR
       Joey Hess, <joey@kitenet.net>.

SEE ALSO
       pdmenurc(5)

1.3.4                                                            November 08 2014                                                        PDMENU(1)
