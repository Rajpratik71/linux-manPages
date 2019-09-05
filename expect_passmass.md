PASSMASS(1)                                                   General Commands Manual                                                  PASSMASS(1)

NAME
       passmass - change password on multiple machines

SYNOPSIS
       passmass [ host1 host2 host3 ...  ]

INTRODUCTION
       Passmass  changes a password on multiple machines.  If you have accounts on several machines that do not share password databases, Passmass
       can help you keep them all in sync.  This, in turn, will make it easier to change them more frequently.

       When Passmass runs, it asks you for the old and new passwords.  (If you are changing root passwords and have equivalencing, the  old  pass‐
       word is not used and may be omitted.)

       Passmass  understands  the  "usual"  conventions.   Additional  arguments may be used for tuning.  They affect all hosts which follow until
       another argument overrides it.  For example, if you are known as "libes" on host1 and host2, but "don" on host3, you would say:

            passmass host1 host2 -user don host3

       Arguments are:

              -user
                  User whose password will be changed.  By default, the current user is used.

              -rlogin
                  Use rlogin to access host.  (default)

              -slogin
                  Use slogin to access host.

              -ssh
                  Use ssh to access host.

              -telnet
                  Use telnet to access host.

              -program

                  Next argument is a program to run to set the password.  Default is "passwd".  Other  common  choices  are  "yppasswd"  and  "set
                  passwd"  (e.g.,  VMS hosts).  A program name such as "password fred" can be used to create entries for new accounts (when run as
                  root).

              -prompt
                  Next argument is a prompt suffix pattern.  This allows the script to know when the shell is prompting.  The default is "# "  for
                  root and "% " for non-root accounts.

              -timeout
                  Next argument is the number of seconds to wait for responses.  Default is 30 but some systems can be much slower logging in.

              -su

                  Next  argument is 1 or 0.  If 1, you are additionally prompted for a root password which is used to su after logging in.  root's
                  password is changed rather than the user's.  This is useful for hosts which do not allow root to log in.

HOW TO USE
       The best way to run Passmass is to put the command in a one-line shell script or alias.  Whenever you get a new account on a  new  machine,
       add the appropriate arguments to the command.  Then run it whenever you want to change your passwords on all the hosts.

CAVEATS
       Using  the  same  password on multiple hosts carries risks.  In particular, if the password can be stolen, then all of your accounts are at
       risk.  Thus, you should not use Passmass in situations where your password is visible, such as across a network which hackers are known  to
       eavesdrop.

       On  the  other  hand,  if you have enough accounts with different passwords, you may end up writing them down somewhere - and that can be a
       security problem.  Funny story: my college roommate had an 11"x13" piece of paper on which he had listed accounts and passwords all  across
       the  Internet.   This  was  several  years worth of careful work and he carried it with him everywhere he went.  Well one day, he forgot to
       remove it from his jeans, and we found a perfectly blank sheet of paper when we took out the wash the following day!

SEE ALSO
       "Exploring Expect: A Tcl-Based Toolkit for Automating Interactive Programs" by Don Libes, O'Reilly and Associates, January 1995.

AUTHOR
       Don Libes, National Institute of Standards and Technology

                                                                  7 October 1993                                                       PASSMASS(1)
