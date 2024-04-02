hprm(1)                                                                                  General Commands Manual                                                                                  hprm(1)

NAME
       hprm — remove a file or directory on an HFS+ volume

SYNOPSIS
       hprm [-R]  [-f]  hfs-path

Description
       hprm removes the file or directory specified by hfs-path.  Since write access to HFS+ volumes is still experimental, the program prints a warning message and prompts the user before writing any‐
       thing to the file system.

       hprm accepts the following options:

       -R        recursively remove the contents of a directory.

       -f        one day, this option will probably disable prompting.  For the time being, prompting is always enabled.

See also
       hfsplus(7), hpmount(1), hpls(1), hppwd(1), hpmkdir(1), hpcd(1), hpcopy(1), hpumount(1), hpfsck(1).

Author
       This manual page was written by Jens Schmalzing <jensen@debian.org> for Debian GNU/Linux using the manual page by Klaus Halfmann <halfmann@libra.de> that comes with the source code and  documen‐
       tation from the Tech Info Library.

                                                                                                                                                                                                  hprm(1)
