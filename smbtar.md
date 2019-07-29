SMBTAR(1)                                                          User Commands                                                         SMBTAR(1)

NAME
       smbtar - shell script for backing up SMB/CIFS shares directly to UNIX tape drives

SYNOPSIS
       smbtar [-r] [-i] [-a] [-v] {-s server} [-p password] [-x services] [-X] [-N filename] [-b blocksize] [-d directory] [-l loglevel] [-u user]
        [-t tape] {filenames}

DESCRIPTION
       This tool is part of the samba(7) suite.

       smbtar is a very small shell script on top of smbclient(1) which dumps SMB shares directly to tape.

OPTIONS
       -s server
           The SMB/CIFS server that the share resides upon.

       -x service
           The share name on the server to connect to. The default is "backup".

       -X
           Exclude mode. Exclude filenames... from tar create or restore.

       -d directory
           Change to initial directory before restoring / backing up files.

       -v
           Verbose mode.

       -p password
           The password to use to access a share. Default: none

       -u user
           The user id to connect as. Default: UNIX login name.

       -a
           Reset DOS archive bit mode to indicate file has been archived.

       -t tape
           Tape device. May be regular file or tape device. Default: $TAPE environmental variable; if not set, a file called tar.out.

       -b blocksize
           Blocking factor. Defaults to 20. See tar(1) for a fuller explanation.

       -N filename
           Backup only files newer than filename. Could be used (for example) on a log file to implement incremental backups.

       -i
           Incremental mode; tar files are only backed up if they have the archive bit set. The archive bit is reset after each file is read.

       -r
           Restore. Files are restored to the share from the tar file.

       -l log level
           Log (debug) level. Corresponds to the -d flag of smbclient(1).

ENVIRONMENT VARIABLES
       The $TAPE variable specifies the default tape device to write to. May be overridden with the -t option.

BUGS
       The smbtar script has different options from ordinary tar and from smbclient's tar command.

CAVEATS
       Sites that are more careful about security may not like the way the script handles PC passwords. Backup and restore work on entire shares;
       should work on file lists. smbtar works best with GNU tar and may not work well with other versions.

DIAGNOSTICS
       See the DIAGNOSTICS section for the smbclient(1) command.

VERSION
       This man page is correct for version 3 of the Samba suite.

SEE ALSO
       smbd(8), smbclient(1), smb.conf(5).

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open
       Source project similar to the way the Linux kernel is developed.

       Ricky Poulten wrote the tar extension and this man page. The smbtar script was heavily rewritten and improved by Martin Kraemer. Many
       thanks to everyone who suggested extensions, improvements, bug fixes, etc. The man page sources were converted to YODL format (another
       excellent piece of Open Source software, available at ftp://ftp.icce.rug.nl/pub/unix/) and updated for the Samba 2.0 release by Jeremy
       Allison. The conversion to DocBook for Samba 2.2 was done by Gerald Carter. The conversion to DocBook XML 4.2 for Samba 3.0 was done by
       Alexander Bokovoy.

Samba 4.3                                                           05/23/2019                                                           SMBTAR(1)
