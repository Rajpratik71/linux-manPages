lgroupadd(1)                                                                               General Commands Manual                                                                               lgroupadd(1)



NAME
       lgroupadd - Add an user group


SYNOPSIS
       lgroupadd [OPTION]... group


DESCRIPTION
       Adds a new user group with name group.


OPTIONS
       -g, --gid=gid
              Use group ID gid for the newly created group.  A group ID is selected automatically if this option is not present.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -r, --reserved
              The  group is a system group.  Groups that are not marked as system groups usually have automatically selected group IDs above a certain value (configured as LU_GIDNUMBER in libuser.conf(5)).
              This information is also passed to the libuser backends.


EXIT STATUS
       The exit status is 0 on success, nonzero on error.



libuser                                                                                          Jan 11 2005                                                                                     lgroupadd(1)
