ZUM(1)                                                             Debian Manual                                                            ZUM(1)

NAME
       zum - free disk space by making holes in files

SYNOPSIS
       zum [FILE]...

DESCRIPTION
       zum reads a files list on the command line and attempts to perforate these files.  Perforation means, that series of `0' bytes are replaced
       by lseek(2)s, thus giving the file system a chance of not allocating real disk space for those bytes.

EXAMPLE
              find . -type f -print0 | xargs -0 zum

       If you zum under /boot, where your kernel image lives, your system will become unbootable unless you run lilo again.

AUTHOR
       Oleg Kibirev <oleg@gd.cs.CSUFresno.edu>.

       Manual page by Heiko Schlittermann <heiko@lotte.sax.de>.

Debian Project                                                    April 16, 2001                                                            ZUM(1)
