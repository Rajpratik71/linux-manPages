NEWUIDMAP(1)                  User Commands                 NEWUIDMAP(1)

NAME
       newuidmap - set the uid mapping of a user namespace

SYNOPSIS
       newuidmap pid uid loweruid count [uid loweruid count [ ... ]]

DESCRIPTION
       The newuidmap sets /proc/[pid]/uid_map based on it's command line
       arguments and the uids allowed in /etc/subuid.

       After the pid argument, newuidmap expects sets of 3 integers:

       uid
           Begining of the range of UIDs inside the user namespace.

       loweruid
           Begining of the range of UIDs outside the user namespace.

       count
           Length of the ranges (both inside and outside the user
           namespace).

       newuidmap verifies that the caller is the owner of the process
       indicated by pid and that for each of the above sets, each of the
       UIDs in the range [loweruid, loweruid+count] is allowed to the
       caller according to /etc/subuid before setting
       /proc/[pid]/uid_map.

       Note that newuidmap may be used only once for a given process.

OPTIONS
       There currently are no options to the newuidmap command.

FILES
       /etc/subuid
           List of users subordinate user IDs.

       /proc/[pid]/uid_map
           Mapping of uids from one between user namespaces.

SEE ALSO
       login.defs(5), newusers(8), subuid(5), useradd(8), usermod(8),
       userdel(8).

shadow-utils 4.2               03/26/2019                   NEWUIDMAP(1)
