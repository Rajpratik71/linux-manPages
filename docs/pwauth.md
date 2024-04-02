PWAUTH(8)                                                     System Manager's Manual                                                    PWAUTH(8)

NAME
       pwauth - authenticator for mod_authnz_external and the Apache HTTP Daemon

SYNOPSIS
       pwauth

DESCRIPTION
       Pwauth  is an authenticator designed to be used with mod_auth_external or mod_authnz_external and the Apache HTTP Daemon to support reason‐
       ably secure web authentication out of the system password database on most versions of Unix. Particulary -  secure  authentication  against
       PAM.

       The  simplest test pwauth is to start a root shell and just run pwauth. It will attempt to read the login and password from standard input,
       so type a login name, hit return, then type a password, and hit return (the password will echo on your screen). The check the  status  code
       that was returned (in csh: "echo $status" in sh: "echo $?").

       If  the  login/password were correct you should get a zero status code. If not, you will get some other value. See below the list of status
       codes to find the meaning of the various values returned. Any values 50 or greater indicate a configuration error.

STATUS CODES

       0 STATUS_OK
              Login OK.

       1 STATUS_UNKNOWN
              Nonexistant login or (for some configurations) incorrect password.

       2 STATUS_INVALID
              Incorrect password (for some configurations).

       3 STATUS_BLOCKED
              Uid number is below MIN_UNIX_UID value configured in config.h.

       4 STATUS_EXPIRED
              Login ID has expired.

       5 STATUS_PW_EXPIRED
              Login's password has expired.

       6 SSTATUS_NOLOGIN
              Logins to system have been turned off (usually by /etc/nologin file).

       7 STATUS_MANYFAILES
              Limit on number of bad logins exceeded.

       50 STATUS_INT_USER
              pwauth was invoked by a uid not on the SERVER_UIDS list. If you get this error code, you probably have SERVER_UIDS  set  incorrectly
              in pwauth's config.h file.

       51 STATUS_INT_ARGS
              pwauth  was not given a login & password to check. The means the passing of data from mod_auth_external to pwauth is messed up. Most
              likely one is trying to pass data via environment variables, while the other is trying to pass data via a pipe.

       52 STATUS_INT_ERR
              one of several rare and unlikely internal errors occurred. You'll have to read the source code to figure these out.

       53 STATUS_INT_NOROOT
              pwauth was not able to read the password database. Usually this means it is not running as root. (PAM and login.conf  configurations
              will return 1 in this case.)

AUTHOR
       pwauth was written by Jan Wolter <jan@unixpapa.com>.

       This manual page was written by Hai Zaar <haizaar@haizaar.com>, for the Debian project (but may be used by others).

                                                                    2009-05-02                                                           PWAUTH(8)
