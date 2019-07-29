grep-merges(1)                                                General Commands Manual                                               grep-merges(1)

NAME
       grep-merges - search for outstanding merges from Debian

SYNOPSIS
       grep-merges [string]

DESCRIPTION
       grep-merges  searches merges.ubuntu.com for pending merges from Debian.  If a string is given, it will list all merges whose source package
       name, last changelog author, or last uploader contain that string.  Otherwise, it will list all merges.

EXAMPLES
       $ grep-merges cjwatson
       tzsetup Colin Watson <cjwatson@ubuntu.com>
       console-setup   Colin Watson <cjwatson@ubuntu.com>

AUTHOR
       grep-merges and this manual page were written by Colin Watson <cjwatson@ubuntu.com>.

       Both are released under the terms of the GNU General Public License, version 3 or (at your option) any later version.

ubuntu-dev-tools                                                 December 15, 2010                                                  grep-merges(1)
