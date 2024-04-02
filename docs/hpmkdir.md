hpmkdir(1)                                                                               General Commands Manual                                                                               hpmkdir(1)

NAME
       hpmkdir — create a directory on an HFS+ volume

SYNOPSIS
       hpmkdir hfs-path

Description
       hpmkdir creates a new directory under the current working directory on the previously mounted HFS+ volume.  Since write access to HFS+ volumes is still experimental, the program prints a warning
       message and prompts the user before writing anything to the file system.

See also
       hfsplus(7), hpmount(1), hpls(1), hppwd(1), hprm(1), hpcd(1), hpcopy(1), hpumount(1), hpfsck(1).

Author
       This manual page was written by Jens Schmalzing <jensen@debian.org> for Debian GNU/Linux using the manual page by Klaus Halfmann <halfmann@libra.de> that comes with the source code and  documen‐
       tation from the Tech Info Library.

                                                                                                                                                                                               hpmkdir(1)
