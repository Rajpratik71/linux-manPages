checkpassword.login(8)                                        System Manager's Manual                                       checkpassword.login(8)

NAME
       checkpassword - check a password

SYNOPSIS
       checkpassword prog

DESCRIPTION
       checkpassword  reads  descriptor 3 through end of file and then closes descriptor 3.  There must be at most 512 bytes of data before end of
       file.

       The information supplied on descriptor 3 is a login name terminated by \0, a password terminated by \0, a timestamp terminated by  \0,  and
       possibly more data.  There are no other restrictions on the form of the login name, password, and timestamp.

       If the password is unacceptable, checkpassword exits 1.  If checkpassword is misused, it may instead exit 2.  If there is a temporary prob‐
       lem checking the password, checkpassword exits 111.

       If the password is acceptable, checkpassword runs prog.  prog consists of one or more arguments.

COMPATIBLE TOOLS
       There are other tools that offer the same interface as checkpassword.  Applications that use  checkpassword  are  encouraged  to  take  the
       checkpassword name as an argument, so that they can be used with different tools.

       Note  that  these tools do not follow the getopt(3) interface.  Optional features are controlled through (1) the tool name and (2) environ‐
       ment variables.

THE PASSWORD DATABASE
       checkpassword checks the login name and password against /etc/passwd, using the operating system's getpwnam(3) and crypt(3) functions, sup‐
       plemented by getspnam.  It rejects accounts with empty passwords.  It ignores the timestamp.

       Other checkpassword-compatible tools have different interpretations of login names, passwords, and timestamps.  Both the login name and the
       password should be treated as secrets by the application calling checkpassword; the only distinction  is  for  administrative  convenience.
       The timestamp should include any other information that the password is based on; for example, the challenge in a challenge-response system
       such as APOP.

       WARNING: getpwnam is inherently unreliable.  It fails to distinguish between temporary errors and nonexistent users.   Future  versions  of
       getpwnam(3) should return ETXTBSY to indicate temporary errors and ESRCH to indicate nonexistent users.

PROCESS-STATE CHANGES
       Before invoking prog, checkpassword sets up $USER, $HOME, $SHELL, its supplementary groups, its gid, its uid, and its working directory.

       Other  checkpassword-compatible  tools  may make different changes to the process state.  It is crucial for these effects to be documented;
       different applications have different requirements.

SEE ALSO
       getpwnam(3), crypt(3)

                                                                                                                            checkpassword.login(8)
