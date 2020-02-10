CONCH(1)                                                                               BSD General Commands Manual                                                                               CONCH(1)

NAME
     conch — Conch SSH client

SYNOPSIS
     conch [-AaCfINnrsTtVvx] [-c cipher_spec] [-e escape_char] [-i identity_file] [-K connection_spec] [-L port:host:hostport] [-l user] [-m mac_spec] [-o openssh_option] [-p port]
           [-R port:host:hostport] [user@] hostname [command]

DESCRIPTION
     conch is a SSHv2 client for logging into a remote machine and executing commands.  It provides encrypted and secure communications across a possibly insecure network.  Arbitrary TCP/IP ports can
     also be forwarded over the secure connection.

     conch connects and logs into hostname (as user or the current username).  The user must prove her/his identity through a public-key or a password.  Alternatively, if a connection is already open
     to a server, a new shell can be opened over the connection without having to reauthenticate.

     If command is specified, command is executed instead of a shell.  If the -s option is given, command is treated as an SSHv2 subsystem name.

   Authentication
     Conch supports the public-key, keyboard-interactive, and password authentications.

     The public-key method allows the RSA or DSA algorithm to be used.  The client uses his/her private key, $HOME/.ssh/id_rsa or $HOME/.ssh/id_dsa to sign the session identifier, known only by the
     client and server.  The server checks that the matching public key is valid for the user, and that the signature is correct.

     If public-key authentication fails, conch can authenticate by sending an encrypted password over the connection.

   Connection sharing
     conch has the ability to multiplex multiple shells, commands and TCP/IP ports over the same secure connection.  To disable multiplexing for a connection, use the -I flag.

     The -K option determines how the client connects to the remote host.  It is a comma-separated list of the methods to use, in order of preference.  The two connection methods are ‘unix’ (for con‐
     necting over a multiplexed connection) and ‘direct’ (to connect directly).  To disable connecting over a multiplexed connection, do not include ‘unix’ in the preference list.

     As an example of how connection sharing works, to speed up CVS over SSH:

     conch --noshell --fork -l cvs_user cvs_host
     set CVS_RSH=conch

     Now, when CVS connects to cvs_host as cvs_user, instead of making a new connection to the server, conch will add a new channel to the existing connection.  This saves the cost of repeatedly nego‐
     tiating the cryptography and authentication.

     The options are as follows:

     -A      Enables authentication agent forwarding.

     -a      Disables authentication agent forwarding (default).

     -C      Enable compression.

     -c cipher_spec
             Selects encryption algorithms to be used for this connection, as a comma-separated list of ciphers in order of preference.  The list that conch supports is (in order of default prefer‐
             ence): aes256-ctr, aes256-cbc, aes192-ctr, aes192-cbc, aes128-ctr, aes128-cbc, cast128-ctr, cast128-cbc, blowfish-ctr, blowfish, idea-ctr, idea-cbc, 3des-ctr, 3des-cbc.

     -e ch | ^ch | none
             Sets the escape character for sessions with a PTY (default: ‘~’).  The escape character is only recognized at the beginning of a line (after a newline).  The escape character followed by a
             dot (‘.’) closes the connection; followed by ^Z suspends the connection; and followed by the escape character sends the escape character once.  Setting the character to “none” disables any
             escapes.

     -f      Fork to background after authentication.

     -I      Do not allow connection sharing over this connection.

     -i identity_spec
             The file from which the identity (private key) for RSA or DSA authentication is read.  The defaults are $HOME/.ssh/id_rsa and $HOME/.ssh/id_dsa.  It is possible to use this option more
             than once to use more than one private key.

     -K connection_spec
             Selects methods for connection to the server, as a comma-separated list of methods in order of preference.  See Connection sharing for more information.

     -L port:host:hostport
             Specifies that the given port on the client host is to be forwarded to the given host and port on the remote side.  This allocates a socket to listen to port on the local side, and when
             connections are made to that socket, they are forwarded over the secure channel and a connection is made to host port hostport from the remote machine.  Only root can forward privieged
             ports.

     -l user
             Log in using this username.

     -m mac_spec
             Selects MAC (message authentication code) algorithms, as a comma-separated list in order of preference.  The list that conch supports is (in order of preference): hmac-sha2-512, hmac-
             sha2-256, hmac-sha1, hmac-md5.

     -N      Do not execute a shell or command.

     -n      Redirect input from /dev/null.

     -o openssh_option
             Ignored OpenSSH options.

     -p port
             The port to connect to on the server.

     -R port:host:hostport
             Specifies that the given port on the remote host is to be forwarded to the given host and port on the local side.  This allocates a socket to listen to port on the remote side, and when
             connections are made to that socket, they are forwarded over the secure channel and a connection is made to host port hostport from the client host.  Only root can forward privieged ports.

     -s      Reconnect to the server if the connection is lost.

     -s      Invoke command (mandatory) as a SSHv2 subsystem.

     -T      Do not allocate a TTY.

     -t      Allocate a TTY even if command is given.

     -V      Display version number only.

     -v      Log to stderr.

     -x      Disable X11 connection forwarding (default).

AUTHOR
     Written by Paul Swartz <z3p@twistedmatrix.com>.

REPORTING BUGS
     To report a bug, visit http://twistedmatrix.com/bugs/

COPYRIGHT
     Copyright © 2002-2008 Twisted Matrix Laboratories.
     This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
     ssh(1)

BSD                                                                                            May 22, 2004                                                                                           BSD
