lgroupmod(1)                                                                               General Commands Manual                                                                               lgroupmod(1)



NAME
       lgroupmod - Modify an user group


SYNOPSIS
       lgroupmod [OPTION]... group


DESCRIPTION
       Modifies the user group with name group.


OPTIONS
       -A, --admin-add=list
              Add users in comma-separated list among group's administrators.


       -a, --admin-remove=list
              Remove users in comma-separated list from group's administrators.  Removing users that are not currently among group's administrators silently succeeds.


       -g, --gid=gid
              Change group's group ID to gid.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -L, --lock
              Lock group.  This prevents users from using the group password with newgrp(1) to become a member of group.


       -M, --member-add=list
              Add users in comma-separated list among group's members.


       -m, --member-remove=list
              Remove users in comma-separated list from group's members.  Removing users that are not currently among group's members silently succeeds.


       -n, --name=name
              Rename group to name.


       -P, --plainpassword=password
              Set group's password to password.  Note that the password can be viewed while running lgroupmod using tools such as ps(1).


       -p, --password=encrypted
              Set group's password to the password represented by the hash encrypted.  Note that the hash can be viewed while running lgroupmod using tools such as ps(1).


       -U, --unlock
              Unlock group.


EXIT STATUS
       The exit status is 0 on success, nonzero on error.



libuser                                                                                          Jan 11 2005                                                                                     lgroupmod(1)
