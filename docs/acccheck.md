ACCCHECK(1)                                                   General Commands Manual                                                  ACCCHECK(1)

NAME
       acccheck - Password dictionary attack tool that targets windows authentication via the SMB protocol

SYNOPSIS
       acccheck [-t{IP}|-T{FILE}][-p,-P,-u,-U,-v]

DESCRIPTION
       Attempts to connect to the IPC$ and ADMIN$ shares depending on which flags have been chosen, and tries a combination of usernames and pass‐
       words in the hope to identify the password to a given account via a dictionary password guessing attack.

MANDATORY OPTIONS
       User must use one of these options in order to specify the target(s) to probe.

       -t [single host IP address]

       -T [file containing target ip address(es)]

OPTIONS
       Once target(s) is(are) defined, user may use the following ones:

       -p [single password]

       -P [file containing passwords]

       -u [single user]

       -U [file containing usernames]

       -v [verbose mode]

EXAMPLES
       Attempt the 'Administrator' account with a [BLANK] password.
              acccheck -t 10.10.10.1

       Attempt all passwords in 'password.txt' against the 'Administrator' account.
              acccheck -t 10.10.10.1 -P password.txt

       Attempt all password in 'password.txt' against all users in 'users.txt'.
              acccehck -t 10.10.10.1 -U users.txt -P password.txt

       Attempt a single password against a single user.
              acccheck -t 10.10.10.1 -u administrator -p password

                                                                                                                                       ACCCHECK(1)
