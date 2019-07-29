GRPCK(8)                                                    System Management Commands                                                    GRPCK(8)

NAME
       grpck - verify integrity of group files

SYNOPSIS
       grpck [options] [group [ shadow ]]

DESCRIPTION
       The grpck command verifies the integrity of the groups information. It checks that all entries in /etc/group and /etc/gshadow have the
       proper format and contain valid data. The user is prompted to delete entries that are improperly formatted or which have other
       uncorrectable errors.

       Checks are made to verify that each entry has:

       ·   the correct number of fields

       ·   a unique and valid group name

       ·   a valid group identifier (/etc/group only)

       ·   a valid list of members and administrators

       ·   a corresponding entry in the /etc/gshadow file (respectively /etc/group for the gshadow checks)

       The checks for correct number of fields and unique group name are fatal. If an entry has the wrong number of fields, the user will be
       prompted to delete the entire line. If the user does not answer affirmatively, all further checks are bypassed. An entry with a duplicated
       group name is prompted for deletion, but the remaining checks will still be made. All other errors are warnings and the user is encouraged
       to run the groupmod command to correct the error.

       The commands which operate on the /etc/group and /etc/gshadow files are not able to alter corrupted or duplicated entries.  grpck should be
       used in those circumstances to remove the offending entries.

OPTIONS
       The -r and -s options cannot be combined.

       The options which apply to the grpck command are:

       -h, --help
           Display help message and exit.

       -r, --read-only
           Execute the grpck command in read-only mode. This causes all questions regarding changes to be answered no without user intervention.

       -R, --root CHROOT_DIR
           Apply changes in the CHROOT_DIR directory and use the configuration files from the CHROOT_DIR directory.

       -s, --sort
           Sort entries in /etc/group and /etc/gshadow by GID.

       By default, grpck operates on /etc/group and /etc/gshadow. The user may select alternate files with the group and shadow parameters.

CONFIGURATION
       The following configuration variables in /etc/login.defs change the behavior of this tool:

       MAX_MEMBERS_PER_GROUP (number)
           Maximum members per group entry. When the maximum is reached, a new group entry (line) is started in /etc/group (with the same name,
           same password, and same GID).

           The default value is 0, meaning that there are no limits in the number of members in a group.

           This feature (split group) permits to limit the length of lines in the group file. This is useful to make sure that lines for NIS
           groups are not larger than 1024 characters.

           If you need to enforce such limit, you can use 25.

           Note: split groups may not be supported by all tools (even in the Shadow toolsuite). You should not use this variable unless you really
           need it.

FILES
       /etc/group
           Group account information.

       /etc/gshadow
           Secure group account information.

       /etc/passwd
           User account information.

EXIT VALUES
       The grpck command exits with the following values:

       0
           success

       1
           invalid command syntax

       2
           one or more bad group entries

       3
           can't open group files

       4
           can't lock group files

       5
           can't update group files

SEE ALSO
       group(5), groupmod(8), gshadow(5), passwd(5), pwck(8), shadow(5).

shadow-utils 4.2                                                    03/26/2019                                                            GRPCK(8)
