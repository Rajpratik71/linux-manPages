hpumount(1)                                                                              General Commands Manual                                                                              hpumount(1)

NAME
       hpumount — unmount an HFS+ volume

SYNOPSIS
       hpumount

Description
       hpumount  is  used  to forget about a previously mounted HFS+ volume.  However, the command does not change the volume itself, it simply removes the .hfsplusvolume file in the user's home direc‐
       tory.

See also
       hfsplus(7), hpmount(1), hpls(1), hpcd(1), hppwd(1), hpcopy(1), hprm(1), hpmkdir(1), hpfsck(1).

Author
       This manual page was written by Jens Schmalzing <jensen@debian.org> for Debian GNU/Linux using the manual page by Klaus Halfmann <halfmann@libra.de> that comes with the source code and  documen‐
       tation from the Tech Info Library.

                                                                                                                                                                                              hpumount(1)
