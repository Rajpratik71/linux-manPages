UPDATE-PASSWD(8)                                                                        System Manager's Manual                                                                       UPDATE-PASSWD(8)

NAME
       update-passwd - safely update /etc/passwd, /etc/shadow and /etc/group

SYNOPSIS
       update-passwd [options]

DESCRIPTION
       update-passwd  handles  updates  of /etc/passwd, /etc/shadow and /etc/group on running Debian systems.  It compares the current files to master copies, distributed in the base-passwd package,
       and updates all entries in the global system range (that is, 0–99).

OPTIONS
       update-passwd follows the usual GNU command line syntax, with long options starting with two dashes (‘-’).

       -p, --passwd-master=FILE
              Use FILE as the master copy of the passwd database.  The default value is /usr/share/base-passwd/passwd.master.

       -g, --group-master=FILE
              Use FILE as the master copy of the group database.  The default value is /usr/share/base-passwd/group.master.

       -P, --passwd=FILE
              Use FILE as the system passwd database.  The default value is /etc/passwd.

       -S, --shadow=FILE
              Use FILE as the system shadow database.  The default value is /etc/shadow.

       -G, --group=FILE
              Use FILE as the system group database.  The default value is /etc/group.

       -s, --sanity-check
              Only perform sanity-checks but don't do anything.

       -v, --verbose
              Give detailed information about what we are doing.  A second -v gives additional detail.

       -n, --dry-run
              Don't do anything but only show what we would do.

       -L, --no-locking
              Don't attempt to lock the account database.  This should only be used for debugging purposes.  I repeat: do not do this unless you are really sure you need this!

       -h, --help
              Show a summary of how to use update-passwd.

       -V, --version
              Show the version number

ENVIRONMENT
       DEBIAN_HAS_FRONTEND
              If this environment variable is sent and the --dry-run flag was not given, update-passwd uses debconf to prompt for whether to make changes.  Each proposed change will produce a  sepa‐
              rate  prompt.   User  or  group removals, UID or GID changes, and home directory changes will be asked with high priority.  User or group additions and shell changes will be asked with
              medium priority.  Questions about whether to move entries above the NIS compat inclusion entry or whether to change the GECOS of a user are asked at low priority.

BUGS
       At this moment update-passwd does not verify the shadow-file.  It should check if the entries in the passwd are also in shadow and vice versa, and that  passwords  are  not  present  in  both
       files.

AUTHOR
       Wichert Akkerman <wakkerma@debian.org>

       This  program was written for the Debian project, and is copyright 1999–2002 Wichert Akkerman and copyright 2002, 2003 Colin Watson.  It is distributed under version 2 of the GNU General Pub‐
       lic License.

DEBIAN                                                                                       Debian tools                                                                             UPDATE-PASSWD(8)
