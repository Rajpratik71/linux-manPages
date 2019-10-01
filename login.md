LOGIN(1)                                                                                        User Commands                                                                                        LOGIN(1)



NAME
       login - begin session on the system

SYNOPSIS
       login [ -p ] [ -h host ] [ -H ] [ -f username | username ]

DESCRIPTION
       login is used when signing onto a system.  If no argument is given, login prompts for the username.

       The user is then prompted for a password, where approprate.  Echoing is disabled to prevent revealing the password.  Only a small number of password failures are permitted before login exits and the
       communications link is severed.

       If password aging has been enabled for the account, the user may be prompted for a new password before proceeding.  He will be forced to provide his old password and the new password before continu‐
       ing.  Please refer to passwd(1) for more information.

       The  user  and  group ID will be set according to their values in the /etc/passwd file.  There is one exception if the user ID is zero: in this case, only the primary group ID of the account is set.
       This should allow the system adminitrator to login even in case of network problems.  The value for $HOME, $USER, $SHELL, $PATH, $LOGNAME, and $MAIL are set according to the  appropriate  fields  in
       the password entry.  $PATH defaults to /usr/local/bin:/bin:/usr/bin for normal users, and to /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin for root if not other configured.

       The environment variable $TERM will be preserved, if it exists (other environment variables are preserved if the -p option is given) or be initialize to the terminal type on your tty.

       Then  the user's shell is started.  If no shell is specified for the user in /etc/passwd, then /bin/sh is used.  If there is no directory specified in /etc/passwd, then / is used (the home directory
       is checked for the .hushlogin file described below).

       If the file .hushlogin exists, then a "quiet" login is performed (this disables the checking of mail and the printing of the last login time and message of the day).  Otherwise, if  /var/log/lastlog
       exists, the last login time is printed (and the current login is recorded).

OPTIONS
       -p     Used by getty(8) to tell login not to destroy the environment.

       -f     Used to skip a second login authentication.  This specifically does not work for root, and does not appear to work well under Linux.

       -h     Used by other servers (i.e., telnetd(8)) to pass the name of the remote host to login so that it may be placed in utmp and wtmp.  Only the superuser may use this option.

              Note  that  the  -h option has impact on the PAM service name.  The standard service name is login, with the -h option the name is remote.  It is necessary to create a proper PAM config files
              (e.g.  /etc/pam.d/login and /etc/pam.d/remote).

       -H     Used by other servers (i.e., telnetd(8)) to tell login that printing the hostname should be suppressed in the login: prompt.  See also LOGIN_PLAIN_PROMPT below if your server does  not  allow
              to configure login command line.

       -V     Print version and exit.

CONFIG FILE ITEMS
       login  reads  the /etc/login.defs(5) configuration file.  Note that the configuration file could be distributed with another package (e.g. shadow-utils).  The following configuration items are rele‐
       vant for login(1):

       MOTD_FILE (string)
           If defined, ":" delimited list of "message of the day" files to be displayed upon login.  The default value is /etc/motd.  If the MOTD_FILE item is empty or quiet login is enabled then the  mes‐
           sage of the day is not displayed.  Note that the same functionality is also provided by pam_motd(8) PAM module.

       LOGIN_PLAIN_PROMPT (boolean)
           Tell login that printing the hostname should be suppressed in the login: prompt.  This is alternative to the -H command line option.  The default value is no.

       LOGIN_TIMEOUT (number)
           Max time in seconds for login.  The default value is 60.

       LOGIN_RETRIES (number)
           Maximum number of login retries in case of bad password.  The default value is 3.

       FAIL_DELAY (number)
           Delay in seconds before being allowed another three tries after a login failure.  The default value is 5.

       TTYPERM (string)
           The terminal permissions.  The default value is 0600 or 0620 if tty group is used.

       TTYGROUP (string)
           The login tty will be owned by the TTYGROUP.  The default value is tty.  If the TTYGROUP does not exist then the ownership of the terminal is set to the user´s primary group.

           The TTYGROUP can be either the name of a group or a numeric group identifier.

       HUSHLOGIN_FILE (string)
           If  defined,  this file can inhibit all the usual chatter during the login sequence.  If a full pathname (e.g.  /etc/hushlogins) is specified, then hushed mode will be enabled if the user´s name
           or shell are found in the file.  If this global hush login file is empty then the hushed mode will be enabled for all users.

           If not a full pathname is specified, then hushed mode will be enabled if the file exists in the user´s home directory.

           The default is to check /etc/hushlogins and if does not exist then ~/.hushlogin

           If the HUSHLOGIN_FILE item is empty then all checks are disabled.

       DEFAULT_HOME (boolean)
           Indicate if login is allowed if we can not change directory to the home directory.  If set to yes, the user will login in the root (/) directory if it is not possible to change directory to  her
           home.  The default value is yes.

       LOG_UNKFAIL_ENAB (boolean)
           Enable display of unknown usernames when login failures are recorded.  The default value is no.

           Note that logging unknown usernames may be a security issue if an user enter her password instead of her login name.

       ENV_PATH (string)
           If set, it will be used to define the PATH environment variable when a regular user login.  The default value is /usr/local/bin:/bin:/usr/bin

       ENV_ROOTPATH (string)
       ENV_SUPATH (string)
           If set, it will be used to define the PATH environment variable when the superuser login.  The default value is /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

FILES
       /var/run/utmp
       /var/log/wtmp
       /var/log/lastlog
       /var/spool/mail/*
       /etc/motd
       /etc/passwd
       /etc/nologin
       /etc/pam.d/login
       /etc/pam.d/remote
       /etc/hushlogins
       .hushlogin

SEE ALSO
       init(8), getty(8), mail(1), passwd(1), passwd(5), environ(7), shutdown(8)

BUGS
       The undocumented BSD -r option is not supported.  This may be required by some rlogind(8) programs.

       A  recursive  login,  as used to be possible in the good old days, no longer works; for most purposes su(1) is a satisfactory substitute.  Indeed, for security reasons, login does a vhangup() system
       call to remove any possible listening processes on the tty.  This is to avoid password sniffing.  If one uses the command login, then the surrounding shell gets killed by vhangup() because  it's  no
       longer the true owner of the tty.  This can be avoided by using exec login in a top-level shell or xterm.

AUTHOR
       Derived from BSD login 5.40 (5/9/89) by Michael Glad ⟨glad@daimi.dk⟩ for HP-UX
       Ported to Linux 0.12: Peter Orbaek ⟨poe@daimi.aau.dk⟩
       Rewritten to PAM-only version by Karel Zak ⟨kzak@redhat.com⟩

AVAILABILITY
       The login command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                        June 2012                                                                                          LOGIN(1)
