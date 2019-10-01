lnewusers(1)                                                                               General Commands Manual                                                                               lnewusers(1)



NAME
       lnewusers - Create new user accounts


SYNOPSIS
       lnewusers [OPTION]...


DESCRIPTION
       Creates new user accounts using data read from standard input.

       The input data consists of lines, each line has 7 colon-separated fields:


       User name


       Plaintext password


       User ID
              lnewusers refuses to create users with user ID 0 (the root user ID).


       Group  If this field is a valid group ID, it is interpreted as a group ID, otherwise as a group name.  If the field is empty, a group name equal to user name is used.

              If the specified group does not exist, it is automatically created.  If the group is specified with a group ID, the created group has group name equal to the user name.


       GECOS  The GECOS field is traditionally used to store user's real name and other information.


       Home directory
              If this field is empty, a default specified by libuser configuration, or /home/username if libuser configuration does not specify a default, is used.


       Login shell
              If this field is empty, a default specified by libuser configuration is used.


       Errors in user specifications are reported and processing continues on the next line.


OPTIONS
       -f, --file=file
              Read account data from file instead of standard input.


       -i, --interactive
              Ask all questions when connecting to the user database, even if default answers are set up in libuser configuration.


       -M, --nocreatehome
              Don't create home directories.


       -n, --nocreatemail
              Don't create mail spool files.


EXIT STATUS
       The exit status is 0 on success, nonzero on fatal error.  Errors in user specifications are not reflected in the exit status.



libuser                                                                                          Jul 13 2008                                                                                     lnewusers(1)
