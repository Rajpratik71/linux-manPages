COLCRT(1)                                                                                       User Commands                                                                                       COLCRT(1)



NAME
       colcrt - filter nroff output for CRT previewing

SYNOPSIS
       colcrt [options] [file ...]

DESCRIPTION
       colcrt  provides  virtual half-line and reverse line feed sequences for terminals without such capability, and on which overstriking is destructive.  Half-line characters and underlining (changed to
       dashing `-') are placed on new lines in between the normal output lines.

OPTIONS
       -, --no-underlining
              Suppress all underlining.  This option is especially useful for previewing allboxed tables from tbl(1).

       -2, --half-lines
              Causes all half-lines to be printed, effectively double spacing the output.  Normally, a minimal space output format is used which will suppress empty lines.  The program never suppresses two
              consecutive empty lines, however.  The -2 option is useful for sending output to the line printer when the output contains superscripts and subscripts which would otherwise be invisible.

       -V, --version
              Output version information and exit.

       -h, --help
              Output help and exit.

EXAMPLES
       A typical use of colcrt would be

       tbl exum2.n | nroff -ms | colcrt - | more

SEE ALSO
       nroff(1), troff(1), col(1), more(1), ul(1)

BUGS
       Should fold underlines onto blanks even with the '-' option so that a true underline character would show.

       Can't back up more than 102 lines.

       General overstriking is lost; as a special case '|' overstruck with '-' or underline becomes '+'.

       Lines are trimmed to 132 characters.

       Some provision should be made for processing superscripts and subscripts in documents which are already double-spaced.

HISTORY
       The colcrt command appeared in 3.0BSD.

AVAILABILITY
       The colcrt command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                      September 2011                                                                                      COLCRT(1)
