GROUPMEMS(8)                                                                              System Management Commands                                                                             GROUPMEMS(8)



NAME
       groupmems - administer members of a user's primary group

SYNOPSIS
       groupmems -a user_name | -d user_name | [-g group_name] | -l | -p

DESCRIPTION
       The groupmems command allows a user to administer their own group membership list without the requirement of superuser privileges. The groupmems utility is for systems that configure its users to be
       in their own name sake primary group (i.e., guest / guest).

       Only the superuser, as administrator, can use groupmems to alter the memberships of other groups.

OPTIONS
       The options which apply to the groupmems command are:

       -a, --add user_name
           Add a user to the group membership list.

           If the /etc/gshadow file exist, and the group has no entry in the /etc/gshadow file, a new entry will be created.

       -d, --delete user_name
           Delete a user from the group membership list.

           If the /etc/gshadow file exist, the user will be removed from the list of members and administrators of the group.

           If the /etc/gshadow file exist, and the group has no entry in the /etc/gshadow file, a new entry will be created.

       -g, --group group_name
           The superuser can specify which group membership list to modify.

       -h, --help
           Display help message and exit.

       -l, --list
           List the group membership list.

       -p, --purge
           Purge all users from the group membership list.

           If the /etc/gshadow file exist, and the group has no entry in the /etc/gshadow file, a new entry will be created.

       -R, --root CHROOT_DIR
           Apply changes in the CHROOT_DIR directory and use the configuration files from the CHROOT_DIR directory.

SETUP
       In this operating system the groupmems executable is not setuid and regular users cannot use it to manipulate the membership of their own group.

CONFIGURATION
       The following configuration variables in /etc/login.defs change the behavior of this tool:

       MAX_MEMBERS_PER_GROUP (number)
           Maximum members per group entry. When the maximum is reached, a new group entry (line) is started in /etc/group (with the same name, same password, and same GID).

           The default value is 0, meaning that there are no limits in the number of members in a group.

           This feature (split group) permits to limit the length of lines in the group file. This is useful to make sure that lines for NIS groups are not larger than 1024 characters.

           If you need to enforce such limit, you can use 25.

           Note: split groups may not be supported by all tools (even in the Shadow toolsuite). You should not use this variable unless you really need it.

FILES
       /etc/group
           Group account information.

       /etc/gshadow
           secure group account information

SEE ALSO
       chfn(1), chsh(1), passwd(1), groupadd(8), groupdel(8), useradd(8), userdel(8), usermod(8).



shadow-utils 4.6                                                                                  08/09/2019                                                                                     GROUPMEMS(8)
