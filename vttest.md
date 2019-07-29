VTTEST(1)                                                                                  General Commands Manual                                                                                  VTTEST(1)



NAME
       vttest - test VT100-type terminal

SYNOPSIS
       vttest [options] [24x80.132]

DESCRIPTION
       Vttest is a program designed to test the functionality of a VT100 terminal (or emulator thereof).  It tests both display (escape sequence handling) and keyboard.

       The program is menu-driven and contains full on-line operating instructions.

       -  To run a given menu-item, you must enter its number.

       -  Menu items start at zero; this is the "Exit" item in almost all cases.

       -  You can run all menu-items (for a given level) by entering an asterisk, i.e, `*'.

       -  You can force a repaint of the menu items by entering "?".

       -  A few menus can be more than one page.  Use "n" and "p" to switch to the next or previous page.

OPTIONS
       You  can  specify  the  screen geometry in the form [24x80.132], i.e., 24 lines, 80 minimum columns, 132 maximum columns.  If your terminal does not switch between 80 and 132 columns you may specify
       24x80.80, for example, to avoid a misleading display.

       Other options are:

       -f file
            specify a file containing a DRCS (soft character definition) string.

       -l   log test results to vttest.log.

       -p   use padding, e.g., for a VT100 connected to a high-speed line.

       -s   add time-delay in selected panning/scrolling options to show details.

       -8   use 8-bit controls (this can be changed with a menu option).

AUTHOR
       Per Lindberg (mcvax,seismo)!enea!suadb!lindberg sometime 1985.

       Modified by Thomas Dickey from June 1996, to support nonstandard screen geometry, VT220-VT520, ISO color and xterm-specific tests.



                                                                                                    LOCAL                                                                                           VTTEST(1)
