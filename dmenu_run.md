DMENU(1)                                                      General Commands Manual                                                     DMENU(1)

NAME
       dmenu - dynamic menu

SYNOPSIS
       dmenu [-b] [-f] [-i] [-l [-m monitor] lines] [-p prompt] [-fn font] [-nb color] [-nf color] [-sb color] [-sf color] [-v]

       dmenu_run ...

DESCRIPTION
       dmenu is a dynamic menu for X, which reads a list of newline-separated items from stdin.  When the user selects an item and presses Return,
       their choice is printed to stdout and dmenu terminates.  Entering text will narrow the items to those matching the tokens in the input.

       dmenu_run is a script used by dwm(1) which lists programs in the user's $PATH and runs the result in their $SHELL.

OPTIONS
       -b     dmenu appears at the bottom of the screen.

       -f     dmenu grabs the keyboard before reading stdin.  This is faster, but will lock up X until stdin reaches end-of-file.

       -i     dmenu matches menu items case insensitively.

       -l lines
              dmenu lists items vertically, with the given number of lines.

       -m monitor
              dmenu is displayed on the monitor number supplied. Monitor numbers are starting from 0.

       -p prompt
              defines the prompt to be displayed to the left of the input field.

       -fn font
              defines the font or font set used.

       -nb color
              defines the normal background color.  #RGB, #RRGGBB, and X color names are supported.

       -nf color
              defines the normal foreground color.

       -sb color
              defines the selected background color.

       -sf color
              defines the selected foreground color.

       -v     prints version information to stdout, then exits.

USAGE
       dmenu is completely controlled by the keyboard.  Items are selected using the arrow keys, page up, page down, home, and end.

       Tab    Copy the selected item to the input field.

       Return Confirm selection.  Prints the selected item to stdout and exits, returning success.

       Ctrl-Return
              Confirm selection.  Prints the selected item to stdout and continues.

       Shift-Return
              Confirm input.  Prints the input text to stdout and exits, returning success.

       Escape Exit without selecting an item, returning failure.

       C-a    Home

       C-b    Left

       C-c    Escape

       C-d    Delete

       C-e    End

       C-f    Right

       C-g    Escape

       C-h    Backspace

       C-i    Tab

       C-j    Return

       C-J    Shift-Return

       C-k    Delete line right

       C-m    Return

       C-M    Shift-Return

       C-n    Down

       C-p    Up

       C-u    Delete line left

       C-w    Delete word left

       C-y    Paste from primary X selection

       C-Y    Paste from X clipboard

       M-g    Home

       M-G    End

       M-h    Up

       M-j    Page down

       M-k    Page up

       M-l    Down

SEE ALSO
       dwm(1), stest(1)

                                                                     dmenu-4.6                                                            DMENU(1)
