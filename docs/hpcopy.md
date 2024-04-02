hpcopy(1)                                                                                General Commands Manual                                                                                hpcopy(1)

NAME
       hpcopy — copy files from an HFS+ volume

SYNOPSIS
       hpcopy [-m  | -b  | -t  | -r  | -a ] source-path ... target-path

Description
       hpcopy copies files and directories from an HFS+ volume.  If multiple files are to be copied, the target path must be a directory.

       Since Macintosh files contain two forks, which are not representably in Unix file systems, copies use one of several translation modes:

       -m        Mac Binary II is a format for binary file transfer.  Both forks of the Macintosh file are preserved.  This is the recommended mode for transferring arbitrary Macintosh files.

       -b        BinHex also preserves both forks of the Macintosh file.  In addition, the encoded file contains only ASCII characters, making it suitable for electronic mail transmission.

       -t        Text  copies  only  the  data fork of the Macintosh file, while the contents of the resource fork are lost.  In addition, this mode translates end-of-line characters.  This translation
                 should be used for text files.

       -r        Raw Data copies only the data fork of the Macintosh file, while the contents of the resource fork are lost.

       -a        Automatic mode applies a set of predefined heuristics to determine the appropriate translation.  This is the default if no mode is specified.

See also
       hfsplus(7), hpmount(1), hpls(1), hpcd(1), hprm(1), hpmkdir(1), hppwd(1), hpumount(1), hpfsck(1).

Author
       This manual page was written by Jens Schmalzing <jensen@debian.org> for Debian GNU/Linux using the manual page by Klaus Halfmann <halfmann@libra.de> that comes with the source code and  documen‐
       tation from the Tech Info Library.

                                                                                                                                                                                                hpcopy(1)
