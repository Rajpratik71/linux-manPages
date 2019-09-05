USERHELPER(8)                                                 System Manager's Manual                                                USERHELPER(8)

NAME
       userhelper - A helper interface to PAM.

SYNOPSIS
       userhelper [ -t ] [ -w prog args ] [ -c ] [ -f full-name ] [ -o office ] [ -p office-phone ] [ -h home-phone ] [ -s shell ] [ username ]

DESCRIPTION
       NOTE  this  program  is  NOT  intended  to be run interactively.  If you want to change this information on the command line use passwd(1),
       chfn(1), or chsh(1).

       This program provides a basic interface to change a user's password, gecos information, and shell.  The main difference between  this  pro‐
       gram  and its traditional equivalents is that prompts are written to standard out to make it easy for a GUI wrapper to interface to it as a
       child process.

       The output is in the form of:

       <number> <string>

       Where the number is the type of prompt returned from libpam, and the string is the prompt to give the user.

       The prompt numbers are as follows:

       1      Prompt with visible input.

       2      Prompt with invisible input.

       3      Suggested answer for the current prompt.

       4      Informational message.

       5      Error message.

       6      Count of messages sent in this block so far.

       7      The name of the service being used.

       8      Whether or not the command will be executed as the user if authentication fails.

       9      The name of the user being authenticated.

OPTIONS
       -t     Use text mode authentication instead of the numbered message types just described; only used with -w.

       -w     Specify a program name to be run and arguments to be passed to it.  userhelper will look in the file /etc/security/console.apps/pro‐
              gramname  for  the name of a user to authenticate, the path of the binary to be run, and other settings described below.  userhelper
              will then attempt to authenticate the user using PAM, specifying programname as the PAM service name.  If  authentication  succeeds,
              the  binary  will  be run with superuser privileges.  If the configuration file specifies that PAM session management should be per‐
              formed, userhelper will also open a PAM session before starting the program, and close the session when the program terminates.   If
              authentication fails, userhelper can be configured run the program with the user's privileges instead.

       -c     Change the current user's password.  Note that this option cannot be used with any of the other options.  This is due to the limita‐
              tion in the interface to libpam.

       -f     Specify a new Full Name.

       -o     Specify a new Office.

       -p     Specify a new Office Phone.

       -h     Specify a new Home Phone.

       -s     Specify a new shell.

WRAPPER CONFIGURATION
       The wrapper configuration file used with -w contains variable assignments and file inclusions.

       A file inclusion line has the following form:
              . path
       (that is a dot and a space, followed by path).  If path is relative, it is interpreted relative to the  directory  containing  the  current
       file.   The  file  inclusion  line  is interpreted by inserting contents of path to the current file.  Nested file inclusions are possible,
       recursive file inclusion results in undefined behavior.

       A variable assignment line has the following form:
              name=value
       No additional white space is allowed.  If value is surrounded by a matching pair of " or ' quotes, the quotes are removed; otherwise, the \
       characters are removed, except that \\ is replaced by a single \.

       The following variables are recognized:

       USER   The  name  of  the  user userhelper should attempt to authenticate the invoking user as.  Typically this is root.  The special value
              <user> (which is also the default) indicates that userhelper should authenticate the invoking user.

              The special value <none> indicates that access should be denied; when used in conjunction with UGROUPS, members of the given  groups
              can authenticate but all others are given an Insufficient Rights message.

       UGROUPS
              A  comma-separated list of groups whose members will be authenticated as if USER were set to the special value <user>. If the invok‐
              ing user is not a member of one of these groups, the name defined in USER will be used as normal. For example,  setting  UGROUPS  to
              wheel  and  USER  to  root allows members of wheel (traditionally used for administrative privileges) to authenticate with their own
              credentials and requires other users to provide the root password.

       PROGRAM
              The name of the binary to execute if authentication succeeds.  This should always be specified as an absolute path.  If  not  speci‐
              fied, userhelper will attempt to run /sbin/programname first, and failing that, it will attempt to run /usr/sbin/programname.

       SESSION
              Specifies whether or not userhelper should perform PAM session management when running the program.  Typically this is needed if the
              PAM configuration uses a module such as pam_xauth.so to forward X11 authentication tokens for use by the program.  Valid values  are
              yes and no, with the default being no.

       KEEP_ENV_VARS
              A  comma-separated  list of names of environment variables that should be kept in the environment of the wrapped program.  The envi‐
              ronment is cleared by default and only a few selected variables are kept in the environment if they do not contain  any  potentially
              dangerous substrings.

       RETRY  Specifies the number of times userhelper should attempt to authenticate the user if the initial attempt fails.  The default value is
              2, which causes userhelper to attempt to authenticate the user a total of 3 times.

       FALLBACK
              Specifies whether or not the specified binary should be run with the invoking  user's  privileges  if  authentication  fails.   This
              option  is  useful  for running applications which gain additional abilities when run with superuser privileges, but which are still
              useful when run without them.

       NOXOPTION
              The name of an option which, if passed to userhelper as an argument for the program it will run, will cause userhelper to behave  as
              if the -t flag had been passed to it.

       GUI    Specifies  whether or not userhelper should use consolehelper to present graphical dialog boxes when prompting the user for informa‐
              tion.  This is the inverse of the -t option.  Valid values are yes and no, with the default being yes.

       BANNER Specifies specific text which userhelper should present to the user when userhelper prompts  for  information.   The  default  is  a
              generic message based on the PAM service name.

       BANNER_DOMAIN
              Specifies  the  text  domain in which translations of the banner are stored.  This setting is deprecated in favor of the DOMAIN set‐
              ting.

       DOMAIN Specifies the text domain in which translations of strings are stored.  If this setting is specified, it overrides any  setting  for
              BANNER_DOMAIN which may also be set.

       STARTUP_NOTIFICATION_NAME
              Specifies the startup notification name used for startup notification.

       STARTUP_NOTIFICATION_DESCRIPTION
              Specifies the startup notification name used for startup notification.

       STARTUP_NOTIFICATION_WORKSPACE
              Specifies the startup notification workspace used for startup notification.

       STARTUP_NOTIFICATION_WMCLASS
              Specifies the startup notification binary wmclass used for startup notification.

       STARTUP_NOTIFICATION_BINARY_NAME
              Specifies the startup notification binary name used for startup notification.

       STARTUP_NOTIFICATION_ICON_NAME
              Specifies the startup notification icon name used for startup notification.

EXIT STATUS
       A non-zero exit status indicates an error occurred.  Those errors are:

       1      The authentication passwords was incorrect.

       2      One or more of the GECOS fields is invalid.  This occurs when there is a colon supplied in one of the fields.

       3      Password resetting error.

       4      Some system files are locked.

       5      User unknown.

       6      Insufficient rights.

       7      Invalid call to this program.

       8      The shell provided is not valid (i.e., does not exist in /etc/shells).

       9      Ran out of memory.

       10     Could not find the program.

       11     exec failed even though program exists.

       12     the user canceled the operation.

       255    Unknown error.

FILES
       /etc/passwd              The gecos and shell information is stored in this file.

       /etc/shells              This file is checked to see if the new shell supplied is valid.

       /etc/security/console.apps/prog
                                This file contains the values which will be used for the variables when userhelper is used with the -w flag.

       /etc/pam.d/prog          This file contains the PAM configuration used when userhelper is used with the -w flag.

SEE ALSO
       userpasswd(1), userinfo(1), consolehelper(8), chfn(1), chsh(1), passwd(5)

AUTHOR
       Otto Hammersmith <otto@redhat.com>
       Michael K. Johnson <johnsonm@redhat.com>

Red Hat, Inc.                                                     January 8 2008                                                     USERHELPER(8)
