
SETTERM(1)                                                                                      User Commands                                                                                      SETTERM(1)



NAME
       setterm - set terminal attributes

SYNOPSIS
       setterm [options]

DESCRIPTION
       setterm  writes  to  standard  output  a character string that will invoke the specified terminal capabilities.  Where possible terminfo is consulted to find the string to use.  Some options however
       (marked "virtual consoles only" below) do not correspond to a terminfo(5) capability.  In this case, if the terminal type is "con" or "linux" the string that invokes the  specified  capabilities  on
       the PC Minix virtual console driver is output.  Options that are not implemented by the terminal are ignored.

OPTIONS
       For boolean options (on or off), the default is on.

       For conciseness, an 8-color below is black, red, green, yellow, blue, magenta, cyan, or white.

       A 16-color is an 8-color, grey, or bright followed by red, green, yellow, blue, magenta, cyan, or white.

       The various color options may be set independently, at least at virtual consoles, though the results of setting multiple modes (for example, -underline and -half-bright) are hardware-dependent.

       -appcursorkeys [on|off] (virtual consoles only)
              Sets  Cursor  Key  Application Mode on or off. When on, ESC O A, ESC O B, etc.  will be sent for the cursor keys instead of ESC [ A, ESC [ B, etc.  See the "vi and Cursor-Keys" section of the
              Text-Terminal-HOWTO for how this can cause problems for vi users.

       -append [1-NR_CONS]
              Like -dump, but appends to the snapshot file instead of overwriting it.  Only works if no -dump options are given.

       -background 8-color|default (virtual consoles only)
              Sets the background text color.

       -blank [0-60|force|poke] (virtual consoles only)
              Sets the interval of inactivity, in minutes, after which the screen will be automatically blanked (using APM if available).  Without an argument, gets the blank status (returns which  vt  was
              blanked or zero for unblanked vt).

              The force option keeps screen blank even if a key is pressed.

              The poke option unblank the screen.

       -bfreq [freqnumber]
              Sets the bell frequency in Hz.  Without an argument, defaults to 0.

       -blength [0-2000]
              Sets the bell duration in milliseconds.  Without an argument, defaults to 0.

       -blink [on|off]
              Turns blink mode on or off.  Except at a virtual console, -blink off turns off all attributes (bold, half-brightness, blink, reverse).

       -bold [on|off]
              Turns bold (extra bright) mode on or off.  Except at a virtual console, -bold off turns off all attributes (bold, half-brightness, blink, reverse).

       -clear [all]
              Clears the screen and "homes" the cursor, as clear(1).

       -clear rest
              Clears from the current cursor position to the end of the screen.

       -clrtabs [tab1 tab2 tab3 ...] (virtual consoles only)
              Clears tab stops from the given horizontal cursor positions, in the range 1-160.  Without arguments, clears all tab stops.

       -cursor [on|off]
              Turns the terminal's cursor on or off.

       -default
              Sets the terminal's rendering options to the default values.

       -dump [1-NR_CONS]
              Writes  a  snapshot of the given virtual console (with attributes) to the file specified in the -file option, overwriting its contents; the default is screen.dump.  Without an argument, dumps
              the current virtual console.  Overrides -append.

       -append [1-NR_CONS]
              Like -dump, but appends to the snapshot file instead of overwriting it.  Only works if no -dump options are given.

       -file dumpfilename
              Sets the snapshot file name for any -dump or -append options on the same command line.  If this option is not present, the default is screen.dump in the current directory.  A path  name  that
              exceeds system maximum will be truncated, see PATH_MAX from linux/limits.h for the value.

       -msg [on|off] (virtual consoles only)
              Enables or disables the sending of kernel printk() messages to the console.

       -msglevel 1-8 (virtual consoles only)
              Sets the console logging level for kernel printk() messages.  All messages strictly more important than this will be printed, so a logging level of 0 has the same effect as -msg on and a log‐
              ging level of 8 will print all kernel messages.  klogd(8) may be a more convenient interface to the logging of kernel messages.

       -powerdown [0-60]
              Sets the VESA powerdown interval in minutes.  Without an argument, defaults to 0 (disable powerdown).  If the console is blanked or the monitor is in suspend mode, then the  monitor  will  go
              into vsync suspend mode or powerdown mode respectively after this period of time has elapsed.

       -underline [on|off]
              Turns underline mode on or off (see -ulcolor).

       -powersave [off]
              Turns off monitor VESA powersaving features.

       -powersave on|vsync
              Puts the monitor into VESA vsync suspend mode.

       -powersave powerdown
              Puts the monitor into VESA powerdown mode.

       -powersave hsync
              Puts the monitor into VESA hsync suspend mode.

       -regtabs [1-160] (virtual consoles only)
              Clears all tab stops, then sets a regular tab stop pattern, with one tab every specified number of positions.  Without an argument, defaults to 8.

       -repeat [on|off] (virtual consoles only)
              Turns keyboard repeat on or off.

       -reset Displays the terminal reset string, which typically resets the terminal to its power on state.

       -reverse [on|off]
              Turns reverse video mode on or off.  Except at a virtual console, -reverse off turns off all attributes (bold, half-brightness, blink, reverse).

       -store (virtual consoles only)
              Stores the terminal's current rendering options (foreground and background colors) as the values to be used at reset-to-default.

       -tabs [tab1 tab2 tab3 ...] (virtual consoles only)
              Sets tab stops at the given horizontal cursor positions, in the range 1-160.  Without arguments, shows the current tab stop settings.

       -term terminal_name
              Overrides the TERM environment variable.

       -ulcolor 16-color (virtual consoles only)
              Sets the color for underlined characters.

       -version
              Output version information and exit.

       -help  Output help screen and exit.

SEE ALSO
       tput(1), stty(1), terminfo(5), tty(4)

BUGS
       Differences between the Minix and Linux versions are not documented.

AVAILABILITY
       The setterm command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                       January 2000                                                                                      SETTERM(1)
