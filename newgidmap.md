NEWGIDMAP(1)                                                                                    User Commands                                                                                    NEWGIDMAP(1)



NAME
       newgidmap - set the gid mapping of a user namespace

SYNOPSIS
       newgidmap pid gid lowergid count [gid lowergid count [ ... ]]

DESCRIPTION
       The newgidmap sets /proc/[pid]/gid_map based on its command line arguments and the gids allowed in /etc/subgid. Note that the root user is not exempted from the requirement for a valid /etc/subgid
       entry.

       After the pid argument, newgidmap expects sets of 3 integers:

       gid
           Beginning of the range of GIDs inside the user namespace.

       lowergid
           Beginning of the range of GIDs outside the user namespace.

       count
           Length of the ranges (both inside and outside the user namespace).

       newgidmap verifies that the caller is the owner of the process indicated by pid and that for each of the above sets, each of the GIDs in the range [lowergid, lowergid+count] is allowed to the caller
       according to /etc/subgid before setting /proc/[pid]/gid_map.

       Note that newgidmap may be used only once for a given process.

OPTIONS
       There currently are no options to the newgidmap command.

FILES
       /etc/subgid
           List of user's subordinate group IDs.

       /proc/[pid]/gid_map
           Mapping of gids from one between user namespaces.

SEE ALSO
       login.defs(5), newusers(8), subgid(5), useradd(8), userdel(8), usermod(8).



shadow-utils 4.6                                                                                  08/09/2019                                                                                     NEWGIDMAP(1)
