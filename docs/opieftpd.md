OPIEFTPD(8)                                                                                System Manager's Manual                                                                                OPIEFTPD(8)



NAME
       opieftpd - File Transfer Protocol server that uses OPIE authentication


SYNOPSIS
       opieftpd [-d] [-l] [-t timeout ] [-T maxtimeout ] [-u umask ]


DESCRIPTION
       opieftpd is the Internet File Transfer Protocol server process. The server uses the TCP protocol and listens at the port specified in the ftp service specification; see services(5).


OPTIONS
       -d     Debugging information is written to the system logs.

       -l     Each ftp(1) session is logged in the system logs.

       -t     The inactivity timeout period is set to timeout seconds (the default is 15 minutes).

       -T     A  client  may also request a different timeout period; the maximum period allowed may be set to maxtimeout seconds with the -T option. The default limit is 2 hours.  -u Set the default umask
              value to umask.

COMMANDS
       The ftp server currently supports the following ftp requests; case is not distinguished:

       Request      Description
       ABOR         abort previous command
       ACCT         specify account (ignored)
       ALLO         allocate storage (vacuously)
       APPE         append to a file
       CDUP         change to parent of current working directory
       CWD          change working directory
       DELE         delete a file
       HELP         give help information
       LIST         give a list of files in a directory
       MKD          make a directory
       MDTM         show last modification time of file
       MODE         specify data transfer mode
       NLST         give name list of files in directory
       NOOP         do nothing
       PASS         specify password
       PASV         prepare for server-to-server transfer
       PORT         specify data connection port
       PWD          print the current working directory
       QUIT         terminate session
       REST         restart incomplete transfer
       RETR         retrieve a file
       RMD          remove a directory
       RNFR         specify rename-from file name
       RNTO         specify rename-to file name
       SITE         non-standard commands (see next section)
       SIZE         return size of file
       STAT         return status of server
       STOR         store a file
       STOU         store a file with a unique name
       STRU         specify data transfer structure
       SYST         show operating system type of server system
       TYPE         specify data transfer type
       USER         specify user name
       XCUP         change to parent of current working directory (deprecated)
       XCWD         change working directory (deprecated)
       XMKD         make a directory (deprecated)
       XPWD         print the current working directory (deprecated)
       XRMD         remove a directory (deprecated)

       The following non-standard or UNIX-specific commands are supported by the SITE request:

       Request      Description
       UMASK        change umask (e.g. SITE UMASK 002)
       IDLE         set idle-timer (e.g. SITE IDLE 60)
       CHMOD        change mode of a file (e.g. SITE CHMOD 755 file)
       HELP         give help information (e.g. SITE HELP)

       The remaining ftp requests specified in Internet RFC-959 are recognized, but not implemented.

       MDTM and SIZE are not specified in RFC-959, but will appear in the next updated FTP RFC.

       The ftp server will abort an active file transfer only when the ABOR command is preceded by a Telnet "Interrupt Process" (IP) signal and a Telnet "Synch" signal in  the  command  Telnet  stream,  as
       described  in  Internet RFC-959.  If a STAT command is received during a data transfer, preceded by a Telnet IP and Synch, transfer status will be returned.  opieftpd interprets file names according
       to the globbing conventions used by csh(1).  This allows users to utilize the metacharacters *?[]{}~.

       opieftpd authenticates users according to three rules:

       The user name must be in the password data base, /etc/passwd, and not have a null password. In this case, a password must be provided by the client before any file operations may be performed.

       The user name must not appear in the file /etc/ftpusers.

       The user must have a standard shell returned by getusershell(3).

       If the user name is anonymous or ftp, an anonymous ftp account must be present in the password file (user ftp ).  In this case, the user is allowed to log in by specifying any password  (by  conven-
       tion, this is given as the client host's name).

       In  the  last  case, opieftpd takes special measures to restrict the client's access privileges.  The server performs a chroot(2) command to the home directory of the ftp user.  In order that system
       security is not breached, it is recommended that the ftp subtree be constructed with care;  the following rules are recommended:


       ~ftp   Make the home directory owned by ftp and unwritable by anyone.

       ~ftp/bin
              Make this directory owned by the super-user and unwritable by anyone. The program ls(1) must be present to support the LIST command.  This program should have mode 111.

       ~ftp/etc
              Make this directory owned by the super-user and unwritable by anyone. The files passwd(5) and group(5) must be present for the ls(1) command to be able to produce owner names rather than num-
              bers.  The password field in passwd is not used, and should not contain real encrypted passwords.  These files should be mode 444.

       ~ftp/pub
              Make this directory mode 777 and owned by ftp.  Users should then place files which are to be accessible via the anonymous account in this directory.

SEE ALSO
       ftpd(8), ftp(1), opie(4), opiekey(1), opiepasswd(1), opieinfo(1), opiesu(1), opieftpd(8), opiekeys(5), opieaccess(5)


BUGS
       The  anonymous account is inherently dangerous and should avoided when possible. In opieftpd, it is a compile-time option that should be disabled if it is not being used.  The server must run as the
       super-user to create sockets with privileged port numbers.  It maintains an effective user id of the logged in user, reverting to the super-user only when binding addresses to sockets.  The possible
       security holes have been scrutinized, but are possibly incomplete.


HISTORY
       The ftpd command appeared in 4.2BSD.


AUTHOR
       Originally written for BSD, ftpd was modified at NRL by Randall Atkinson, Dan McDonald, and Craig Metz to support OTP authentication.


CONTACT
       OPIE is discussed on the Bellcore "S/Key Users" mailing list. To join, send an email request to:

       skey-users-request@thumper.bellcore.com



                                                                                               10 January 1995                                                                                    OPIEFTPD(8)
