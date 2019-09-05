CHKSTAT(8)                                                                          Tool to check and set file permissions                                                                         CHKSTAT(8)



NAME
       chkstat - Tool to check and set file permissions

SYNOPSIS
       chkstat [OPTIONS] <permission-files...>

       chkstat --system [OPTIONS] <files...>

DESCRIPTION
       The program /usr/bin/chkstat is a tool to check and set file permissions.

       chkstat  can either operate in system mode or on individually specified permission files. In system mode /etc/permissions/security determines which level to use and whether to actually apply permis-
       sion changes.

   OPTIONS
       --system
              Run in system mode. Parses /etc/sysconfig/security to determine which security level to use (PERMISSION_SECURITY) and whether to set or merely warn  about  permission  changes  (CHECK_PERMIS-
              SIONS). In system mode non-option arguments refer to files. Ie just as if the --examine option was specified for them.

       --set  Actually apply the file permissions. The default is to check and warn only unless in system mode where CHECK_PERMISSIONS specifies the default behavior.

       --warn Opposite of --set, ie warn only but don't make actual changes

       --noheader
              Omit printing the output header lines.

       --fscaps, --no-fscaps
              Enable or disable use of fscaps. In system mode the setting of PERMISSIONS_FSCAPS determines whether fscaps are on or off when this option is not set.

       --examine file
              Check permissions for this file instead of all files listed in the permissions files.

       --files filelist
              Check permissions for the files listed in filelist and instead of all files listed in the permissions files.

       --root directory
              Check files relative to the specified directory.

EXAMPLES
       chkstat --set /etc/permissions /etc/permissions.secure

       parses the files /etc/permissions and /etc/permissions and sets the access mode and the user- and group memberships for each file listed.

       chkstat --system /bin/ping

       Run in system mode and only correct permissions of /bin/ping

SEE ALSO
       permissions(5)

COPYRIGHT
       1996-2003 SuSE Linux AG, Nuernberg, Germany.

       2008-2010 SUSE LINUX Products GmbH

AUTHORS
       Reinhold Sojer, Ruediger Oertel, Michael Schroeder, Ludwig Nussel

       Useful changes and additions by Tobias Burnus




3rd Berkeley Distribution                                                                         2010-11-09                                                                                       CHKSTAT(8)
