CFTP(1)                                                                                BSD General Commands Manual                                                                                CFTP(1)

NAME
     conchftp — Conch command-line SFTP client

SYNOPSIS
     conchftp [-B buffer_size] [-b command_file] [-R num_requests] [-s subsystem]

DESCRIPTION
     is a client for logging into a remote machine and executing commands to send and receive file information. It can wrap a number of file transfer subsystems

     The options are as follows:

     -B      Specifies the default size of the buffer to use for sending and receiving. (Default value: 32768 bytes.)

     -b      File to read commands from, '-' for stdin. (Default value: interactive/stdin.)

     -R      Number of requests to make before waiting for a reply.

     -s      Subsystem/server program to connect to.

     The following commands are recognised by :

     cd path
             Change the remote directory to 'path'.

     chgrp gid path
             Change the gid of 'path' to 'gid'.

     chmod mode path
             Change mode of 'path' to 'mode'.

     chown uid path
             Change uid of 'path' to 'uid'.

     exit    Disconnect from the server.

     get remote-path [local-path]
             Get remote file and optionally store it at specified local path.

     help    Get a list of available commands.

     lcd path
             Change local directory to 'path'.

     lls [ls-options [path]]
             Display local directory listing.

     lmkdir path
             Create local directory.

     ln linkpath targetpath
             Symlink remote file.

     lpwd    Print the local working directory.

     ls [-l [path]]
             Display remote directory listing.

     mkdir path
             Create remote directory.

     progress
             Toggle progress bar.

     put local-path [remote-path]
             Transfer local file to remote location

     pwd     Print the remote working directory.

     quit    Disconnect from the server.

     rename oldpath newpath
             Rename remote file.

     rmdir path
             Remove remote directory.

     rm path
             Remove remote file.

     version
             Print the SFTP version.

     ?       Synonym for 'help'.

AUTHOR
     cftp by Paul Swartz <z3p@twistedmatrix.com>. Man page by Mary Gardiner <mary@twistedmatrix.com>.

REPORTING BUGS
     Report bugs to http://twistedmatrix.com/bugs/

COPYRIGHT
     Copyright © 2005-2008 Twisted Matrix Laboratories
     This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

BSD                                                                                          October 8, 2005                                                                                          BSD
