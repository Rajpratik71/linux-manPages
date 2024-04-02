aeskeyfind(1)                                                      User Commands                                                     aeskeyfind(1)

NAME
       aeskeyfind - Locates 128-bit and 256-bit AES keys in a captured memory image.

SYNOPSIS
       aeskeyfind [OPTION] MEMORY-IMAGE

DESCRIPTION
       aeskeyfind is a tool that illustrates automatic techniques for locating 128-bit and 256-bit AES keys in a captured memory image.

OPTIONS
       -v     verbose output -- prints the extended keys and the constraints on the rows of the key schedule

       -q     don't display a progress bar

       -t THRESHOLD
              sets the maximum number of bit errors allowed in a candidate key schedule

       -h     displays usage help

BUGS
       Likely.

SEE ALSO
       biosmemimage(1), rsakeyfind(1)

AUTHOR
       aeskeyfind was written by Nadia Heninger and Ariel Feldman.

       This  manual  page was adapted by Julien Valroff <julien@debian.org> from rsakeyfind.1, originally written by Jacob Appelbaum <jacob@appel‐
       baum.net> for the Debian system (but may be used by others).  Permission is granted to copy, distribute and/or modify this  document  under
       the terms of the GNU General Public License, Version 2 or any later version published by the Free Software Foundation.

User Commands                                                       07-23-2011                                                       aeskeyfind(1)
