SETTERM(1)                      User Commands                      SETTERM(1)

NAME
       setterm - set terminal attributes

SYNOPSIS
       setterm [options]

DESCRIPTION
       setterm  writes to standard output a character string that will invoke
       the specified terminal capabilities.  Where possible terminfo is  con‐
       sulted  to find the string to use.  Some options however (marked "vir‐
       tual consoles only" below) do not correspond to a terminfo(5) capabil‐
       ity.   In  this  case,  if  the  terminal type is "con" or "linux" the
       string that invokes the specified capabilities on the PC Minix virtual
       console  driver  is  output.   Options that are not implemented by the
       terminal are ignored.

OPTIONS
       For boolean options (on or off), the default is on.

       Below, an 8-color can be black, red,  green,  yellow,  blue,  magenta,
       cyan, or white.

       A  16-color  can  be  an  8-color, or grey, or bright followed by red,
       green, yellow, blue, magenta, cyan, or white.

       The various color options may be set independently, at least  on  vir‐
       tual consoles, though the results of setting multiple modes (for exam‐
       ple, --underline and --half-bright) are hardware-dependent.

       --appcursorkeys [on|off]  (virtual consoles only)
              Sets Cursor Key Application Mode on or off.  When on, ESC O  A,
              ESC  O B, etc.  will be sent for the cursor keys instead of ESC
              [ A, ESC [ B, etc.  See the vi and Cursor-Keys section  of  the
              Text-Terminal-HOWTO  for  how  this  can  cause problems for vi
              users.

       --append [console_number]
              Like --dump, but appends to the snapshot file instead of  over‐
              writing it.  Only works if no --dump options are given.

       --background 8-color|default
              Sets the background text color.

       --blank [0-60|force|poke]  (virtual consoles only)
              Sets  the  interval  of inactivity, in minutes, after which the
              screen will be automatically blanked (using APM if  available).
              Without an argument, it gets the blank status (returns which vt
              was blanked, or zero for an unblanked vt).

              The force option keeps the  screen  blank  even  if  a  key  is
              pressed.

              The poke option unblanks the screen.

       --bfreq [number]  (virtual consoles only)
              Sets  the  bell  frequency  in  Hertz.  Without an argument, it
              defaults to 0.

       --blength [0-2000]  (virtual consoles only)
              Sets the bell duration in milliseconds.  Without  an  argument,
              it defaults to 0.

       --blink [on|off]
              Turns  blink  mode  on  or  off.   Except on a virtual console,
              --blink off turns off all  attributes  (bold,  half-brightness,
              blink, reverse).

       --bold [on|off]
              Turns  bold (extra bright) mode on or off.  Except on a virtual
              console, --bold off  turns  off  all  attributes  (bold,  half-
              brightness, blink, reverse).

       --clear [all|rest]
              Without an argument or with the argument all, the entire screen
              is cleared and the cursor is set to  the  home  position,  just
              like  clear(1)  does.   With  the  argument rest, the screen is
              cleared from the current cursor position to the end.

       --clrtabs [tab1 tab2 tab3 ...]  (virtual consoles only)
              Clears tab stops from the given horizontal cursor positions, in
              the range 1-160.  Without arguments, it clears all tab stops.

       --cursor [on|off]
              Turns the terminal's cursor on or off.

       --default
              Sets the terminal's rendering options to the default values.

       --dump [console_number]
              Writes  a snapshot of the virtual console with the given number
              to the file specified with the --file option,  overwriting  its
              contents;  the default is screen.dump.  Without an argument, it
              dumps the current virtual console.  This overrides --append.

       --file filename
              Sets the snapshot file name for any --dump or --append  options
              on  the  same command line.  If this option is not present, the
              default is screen.dump in the current directory.  A  path  name
              that exceeds the system maximum will be truncated, see PATH_MAX
              from linux/limits.h for the value.

       --foreground 8-color|default
              Sets the foreground text color.

       --half-bright [on|off]
              Turns dim (half-brightness) mode on or off.  Except on  a  vir‐
              tual console, --half-bright off turns off all attributes (bold,
              half-brightness, blink, reverse).

       --hbcolor 16-color
              Sets the color for bold characters.

       --initialize
              Displays the terminal initialization  string,  which  typically
              sets  the terminal's rendering options, and other attributes to
              the default values.

       --inversescreen [on|off]
              Swaps foreground and background colors for the whole screen.

       --linewrap [on|off]
              Makes the terminal continue on a new line when a line is full.

       --msg [on|off]  (virtual consoles only)
              Enables or disables the sending of kernel printk() messages  to
              the console.

       --msglevel 0-8  (virtual consoles only)
              Sets  the  console  logging level for kernel printk() messages.
              All messages strictly more important than this will be printed,
              so  a  logging level of 0 has the same effect as --msg on and a
              logging level of 8 will print all  kernel  messages.   klogd(8)
              may  be  a  more  convenient interface to the logging of kernel
              messages.

       --powerdown [0-60]
              Sets the VESA powerdown interval in minutes.  Without an  argu‐
              ment,  it defaults to 0 (disable powerdown).  If the console is
              blanked or the monitor is in suspend  mode,  then  the  monitor
              will  go into vsync suspend mode or powerdown mode respectively
              after this period of time has elapsed.

       --powersave off
              Turns off monitor VESA powersaving features.

       --powersave on|vsync
              Puts the monitor into VESA vsync suspend mode.

       --powersave powerdown
              Puts the monitor into VESA powerdown mode.

       --powersave hsync
              Puts the monitor into VESA hsync suspend mode.

       --regtabs [1-160]  (virtual consoles only)
              Clears all tab stops, then sets a  regular  tab  stop  pattern,
              with  one  tab every specified number of positions.  Without an
              argument, it defaults to 8.

       --repeat [on|off]  (virtual consoles only)
              Turns keyboard repeat on or off.

       --reset
              Displays the terminal reset string, which typically resets  the
              terminal to its power-on state.

       --resize
              Reset  terminal size by assessing maximum row and column.  This
              is useful when actual geometry and kernel terminal  driver  are
              not  in  sync.   Most notable use case is with serial consoles,
              that do not use ioctl(3) but just byte streams and breaks.

       --reverse [on|off]
              Turns reverse video mode on or off.  Except on a  virtual  con‐
              sole,  --reverse  off  turns  off  all  attributes (bold, half-
              brightness, blink, reverse).

       --store  (virtual consoles only)
              Stores the terminal's current rendering options (foreground and
              background  colors)  as  the  values  to  be  used at reset-to-
              default.

       --tabs [tab1 tab2 tab3 ...]
              Sets tab stops at the given horizontal cursor positions, in the
              range  1-160.  Without arguments, it shows the current tab stop
              settings.

       --term terminal_name
              Overrides the TERM environment variable.

       --ulcolor 16-color  (virtual consoles only)
              Sets the color for underlined characters.

       --underline [on|off]
              Turns underline mode on or off.

       --version
              Displays version information and exits.

       --help Displays a help text and exits.

COMPATIBILITY
       Since version 2.25 setterm has  support  for  long  options  with  two
       hyphens, for example --help, beside the historical long options with a
       single hyphen, for example -help.  In scripts it is better to use  the
       backward-compatible single hyphen rather than the double hyphen.  Cur‐
       rently there are no plans nor  good  reasons  to  discontinue  single-
       hyphen compatibility.

SEE ALSO
       stty(1), tput(1), tty(4), terminfo(5)

BUGS
       Differences between the Minix and Linux versions are not documented.

AVAILABILITY
       The setterm command is part of the util-linux package and is available
       from  Linux  Kernel  Archive   ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                         May 2014                        SETTERM(1)
