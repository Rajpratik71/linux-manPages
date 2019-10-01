COL(1)                                                                                          User Commands                                                                                          COL(1)



NAME
       col - filter reverse line feeds from input

SYNOPSIS
       col [options]

DESCRIPTION
       col  filters out reverse (and half-reverse) line feeds so the output is in the correct order with only forward and half-forward line feeds, and replaces white-space characters with tabs where possi‐
       ble.  This can be useful in processing the output of nroff(1) and tbl(1).

       col reads from standard input and writes to standard output.

OPTIONS
       -b, --no-backspaces
              Do not output any backspaces, printing only the last character written to each column position.

       -f, --fine
              Forward half line feeds are permitted fine mode.  Normally characters printed on a half-line boundary are printed on the following line.

       -p, --pass
              Force unknown control sequences to be passed through unchanged.  Normally, col will filter out any control sequences from the input other than those  recognized  and  interpreted  by  itself,
              which are listed below.

       -h, --tabs
              Output tabs instead of multiple spaces.

       -x, --spaces
              Output multiple spaces instead of tabs.

       -l, --lines number
              Buffer at least number lines in memory.  By default, 128 lines are buffered.

       -V, --version
              Output version information and exit.

       -H, --help
              Output help and exit.

NOTES
       The control sequences for carriage motion that col understands and their decimal values are listed in the following table:

              ESC-7             reverse line feed (escape then 7)
              ESC-8             half reverse line feed (escape then 8)
              ESC-9             half forward line feed (escape then 9)
              backspace         moves back one column (8); ignored in the first column
              newline           forward line feed (10); also does carriage return
              carriage return   (13)
              shift in          shift to normal character set (15)
              shift out         shift to alternate character set (14)
              space             moves forward one column (32)
              tab               moves forward to next tab stop (9)
              vertical tab      reverse line feed (11)

       All unrecognized control characters and escape sequences are discarded.

       col keeps track of the character set as characters are read and makes sure the character set is correct when they are output.

       If the input attempts to back up to the last flushed line, col will display a warning message.

SEE ALSO
       expand(1), nroff(1), tbl(1)

STANDARDS
       The col utility conforms to the Single UNIX Specification, Version 2.  The -l option is an extension to the standard.

HISTORY
       A col command appeared in Version 6 AT&T UNIX.

AVAILABILITY
       The col command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                      September 2011                                                                                         COL(1)
