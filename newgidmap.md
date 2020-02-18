NEWGIDMAP(1)                  User Commands                 NEWGIDMAP(1)

NAME
       newgidmap - set the gid mapping of a user namespace

SYNOPSIS
       newgidmap pid gid lowergid count [pid gid lowergid count [ ... ]]

DESCRIPTION
       The newgidmap sets /proc/[pid]/gid_map based on it's command line
       arguments and the gids allowed in /etc/subgid.

       After the pid argument, newgidmap expects sets of 3 integers:

       gid
           Begining of the range of GIDs inside the user namespace.

       lowergid
           Begining of the range of GIDs outside the user namespace.

       count
           Length of the ranges (both inside and outside the user
           namespace).

       newgidmap verifies that the caller is the owner of the process
       indicated by pid and that for each of the above sets, each of the
       GIDs in the range [lowergid, lowergid+count] is allowed to the
       caller according to /etc/subgid before setting
       /proc/[pid]/gid_map.

       Note that newgidmap may be used only once for a given process.

OPTIONS
       There currently are no options to the newgidmap command.

FILES
       /etc/subgid
           List of users subordinate group IDs.

       /proc/[pid]/gid_map
           Mapping of gids from one between user namespaces.

SEE ALSO
       login.defs(5), newusers(8), subgid(5), useradd(8), userdel(8),
       usermod(8).

shadow-utils 4.2               03/26/2019                   NEWGIDMAP(1)
