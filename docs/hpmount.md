hpmount(1)                                                                               General Commands Manual                                                                               hpmount(1)

NAME
       hpmount — change directory on an HFS+ volume

SYNOPSIS
       hpmount [-r]  [-pn]  source-path

Description
       hpmount  introduces a new HFS+ volume.  The source path may specify a block device or a regular file containing an HFS+ volume image.  Furthermore, hpmount creates the file .hfsplusvolume in the
       user's home directory, where the source path and the catalogue ID of the current working directory are stored.

       hpmount accepts the following options:

       -r        mount the volume read-only.  The default is to allow write-access.

       -pn       mount partition number n.  The default is to mount the first partition that looks like it contains an HFS+ volume.

See also
       hfsplus(7), hpls(1), hpcd(1), hppwd(1), hpcopy(1), hprm(1), hpmkdir(1), hpumount(1), hpfsck(1).

Author
       This manual page was written by Jens Schmalzing <jensen@debian.org> for Debian GNU/Linux using the manual page by Klaus Halfmann <halfmann@libra.de> that comes with the source code and  documen‐
       tation from the Tech Info Library.

                                                                                                                                                                                               hpmount(1)
