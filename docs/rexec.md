REXEC(1)                                                                                   General Commands Manual                                                                                   REXEC(1)



NAME
       rexec -- remote execution client for an exec server

SYNOPSIS
       rexec [ -abcdhns -l username -p password ] host command

DESCRIPTION
       Rexec calls the rexec(3) routine to act as a client for the remote host's rexecd(8) server.

       It asks that ``command'' be run on the host computer, using username/password authentication. See rexec(3) and rexecd(8) for details of the protocol.

OPTIONS
       Rexec accepts several options, but only three are likely to be very useful:

       -l username

              Set the log-in name on the remote host to username.

       -p password

              Provide  the password for the remote account.  The command line argument will be blanked after being parsed, to prevent it from being seen with ps(1).  However, it is still not very secure to
              type the password on the command line.  In particular, be sure that the shell's history file is protected.

       -n     Explicitly prompt for name and password, even if provided in the environment, in the $HOME/.netrc file, or in the environmental variables REXEC_USER and REXEC_PASS.

       Other options that might be useful with non-standard remote exec daemons, or to debug connections:

       -a     Do not set up an auxiliary channel for standard error from command; the remote standard error and output are then both returned on the local standard output.  By default, rexec  asks  that  a
              separate channel be set up for diagnostic output from the remote command.

       -b     Use  signal  handling as in BSD rsh(1).  Only the signals SIGINT, SIGQUIT, and SIGTERM are echoed to the remote process.  They do not remain raised locally, so rexec waits for the remote com-
              mand to shutdown its side of the socket.  Also, CNTRL-Z will only suspend execution locally--the remote command may continue to run.

       -c     Do not close remote standard input when local standard input closes.  Normally the standard input to the remote command is closed when the local standard input is closed.

       -d     Turn on debugging information. In particular the command sent to the remote host will be echoed.

       -h     Print a usage message.

       -s     Do not echo signals received by the rexec onto the remote process.  Normally, signals which can be trapped are passed on to the remote process; then, when you type CNTRL-C, the remote process
              terminates as well.

USERNAME AND PASSWORD
       Rexec(1) searches for the username and password in the following order:

              1. If -n is given on the command line, the user will always be prompted for both, even if they are also given on the command line.

              2. The command line will be parsed

              3. If the environmental variables REXEC_USER or REXEC_PASS are defined, they will define the username or password.

              4. The $HOME/.netrc file will be searched.  See ftp(1) for a description of this file's format.

              5. Finally, the user will be prompted if either the username or password remains undefined.


SECURITY
       Users  of this command should be aware that rexec(3) transmits their password to the remote host clear text, not encrypted.  If the network is not secure to the remote host, the password can be com-
       primised.


SIGNALS
       Without the -b option, all signals which can be handled are echoed to the remote process.  Afterwards, however, they remain raised in the local process.  Typically, this  means  that  rexec(1)  will
       exit after receiving a fatal signal, even if the remote process has arranged to handle or ignore it.

       Differing  operating  systems  use differing signal numbers; for example AIX and SunOS use 18 for SIGTSTP (^Z), while Linux uses 20.  Therefore, it may have a different effect remotely than locally.
       In particular, typing CNTL-Z may not suspend the execution of the remote process.

EXAMPLE
       rexec othermachine cat ">remote_file; date" <local_file

       will send local_file to the othermachine as remote_file.


BUGS
       Please send bug reports, system incompatibilities, and job offers to the author.

SEE ALSO
       rexec(3), rexecd(8), rsh(1)

AUTHOR
       Michael Sadd
       mas22@cornell.edu
       http://www.tc.cornell.edu/~sadd/

       Thanks to Orange Gopher (2/10/97) and Johannes Plass (plass@dipmza.physik.uni-mainz.de, Oct. 17 1996) for useful suggestions.



                                                                                              February 14, 1997                                                                                      REXEC(1)
