putty(1)                                                         PuTTY tool suite                                                         putty(1)

NAME
       putty - GUI SSH, Telnet and Rlogin client for X

SYNOPSIS
       putty [ options ] [ host ]

DESCRIPTION
       putty is a graphical SSH, Telnet and Rlogin client for X. It is a direct port of the Windows SSH client of the same name.

OPTIONS
       The command-line options supported by putty are:

       --display display-name
              Specify  the X display on which to open putty. (Note this option has a double minus sign, even though none of the others do. This is
              because this option is supplied automatically by GTK. Sorry.)

       -fn font-name
              Specify the font to use for normal text displayed in the terminal. For example, -fn fixed, -fn "Monospace 12".

       -fb font-name
              Specify the font to use for bold text displayed in the terminal. If the BoldAsColour resource is set to 1 (the default),  bold  text
              will be displayed in different colours instead of a different font, so this option will be ignored. If BoldAsColour is set to 0 or 2
              and you do not specify a bold font, putty will overprint the normal font to make it look bolder.

       -fw font-name
              Specify the font to use for double-width characters (typically Chinese, Japanese and Korean text) displayed in the terminal.

       -fwb font-name
              Specify the font to use for bold double-width characters (typically Chinese, Japanese and Korean text). Like -fb, this will  be  ig‐
              nored unless the BoldAsColour resource is set to 0 or 2.

       -geometry geometry
              Specify  the  size  of the terminal, in rows and columns of text. See X(7) for more information on the syntax of geometry specifica‐
              tions.

       -sl lines
              Specify the number of lines of scrollback to save off the top of the terminal.

       -fg colour
              Specify the foreground colour to use for normal text.

       -bg colour
              Specify the background colour to use for normal text.

       -bfg colour
              Specify the foreground colour to use for bold text, if the BoldAsColour resource is set to 1 (the default) or 2.

       -bbg colour
              Specify the foreground colour to use for bold reverse-video text, if the BoldAsColour resource is set to 1 (the default) or 2. (This
              colour  is best thought of as the bold version of the background colour; so it only appears when text is displayed in the background
              colour.)

       -cfg colour
              Specify the foreground colour to use for text covered by the cursor.

       -cbg colour
              Specify the background colour to use for text covered by the cursor. In other words, this is the main colour of the cursor.

       -title title
              Specify the initial title of the terminal window. (This can be changed under control of the server.)

       -sb- or +sb
              Tells putty not to display a scroll bar.

       -sb    Tells putty to display a scroll bar: this is the opposite of -sb-. This is the default option: you will probably only need to  spec‐
              ify it explicitly if you have changed the default using the ScrollBar resource.

       -log logfile, -sessionlog logfile
              This option makes putty log all the terminal output to a file as well as displaying it in the terminal.

       -sshlog logfile

       -sshrawlog logfile
              For  SSH  connections, these options make putty log protocol details to a file. (Some of these may be sensitive, although by default
              an effort is made to suppress obvious passwords.)

              -sshlog logs decoded SSH packets and other events (those that -v would print). -sshrawlog additionally logs the raw encrypted packet
              data.

       -cs charset
              This  option  specifies  the character set in which putty should assume the session is operating. This character set will be used to
              interpret all the data received from the session, and all input you type or paste into putty will be converted into  this  character
              set before being sent to the session.

              Any  character  set  name  which is valid in a MIME header (and supported by putty) should be valid here (examples are `ISO-8859-1',
              `windows-1252' or `UTF-8'). Also, any character encoding which is valid in an X logical font  description  should  be  valid  (`ibm-
              cp437', for example).

              putty's  default  behaviour is to use the same character encoding as its primary font. If you supply a Unicode (iso10646-1) font, it
              will default to the UTF-8 character set.

              Character set names are case-insensitive.

       -nethack
              Tells putty to enable NetHack keypad mode, in which the numeric keypad generates the NetHack hjklyubn direction keys.  This  enables
              you to play NetHack with the numeric keypad without having to use the NetHack number_pad option (which requires you to press `n' be‐
              fore any repeat count). So you can move with the numeric keypad, and enter repeat counts with the normal number keys.

       -help, --help
              Display a message summarizing the available options.

       -pgpfp Display the fingerprints of the PuTTY PGP Master Keys, to aid in verifying new files released by the PuTTY team.

       -load session
              Load a saved session by name. This allows you to run a saved session straight from the command line without having to go through the
              configuration box first.

       -ssh, -telnet, -rlogin, -raw, -serial
              Select the protocol putty will use to make the connection.

       -proxycmd command
              Instead  of  making a TCP connection, use command as a proxy; network traffic will be redirected to the standard input and output of
              command. command must be a single word, so is likely to need quoting by the shell.

              The special strings %host and %port in command will be replaced by the hostname and port number you want to connect  to;  to  get  a
              literal % sign, enter %%.

              Backslash escapes are also supported, such as sequences like \n being replaced by a literal newline; to get a literal backslash, en‐
              ter \\. (Further escaping may be required by the shell.)

              (See the main PuTTY manual for full details of the supported %- and backslash-delimited tokens, although most of them  are  probably
              not very useful in this context.)

       -l username
              Specify the username to use when logging in to the server.

       -L [srcaddr:]srcport:desthost:destport
              Set  up  a local port forwarding: listen on srcport (or srcaddr:srcport if specified), and forward any connections over the SSH con‐
              nection to the destination address desthost:destport. Only works in SSH.

       -R [srcaddr:]srcport:desthost:destport
              Set up a remote port forwarding: ask the SSH server to listen on srcport (or srcaddr:srcport if specified), and to forward any  con‐
              nections back over the SSH connection where the client will pass them on to the destination address desthost:destport. Only works in
              SSH.

       -D [srcaddr:]srcport
              Set up dynamic port forwarding. The client listens on srcport (or srcaddr:srcport if specified), and implements a SOCKS  server.  So
              you  can  point SOCKS-aware applications at this port and they will automatically use the SSH connection to tunnel all their connec‐
              tions. Only works in SSH.

       -P port
              Specify the port to connect to the server on.

       -A, -a Enable (-A) or disable (-a) SSH agent forwarding. Currently this only works with OpenSSH and SSH-1.

       -X, -x Enable (-X) or disable (-x) X11 forwarding.

       -T, -t Enable (-t) or disable (-T) the allocation of a pseudo-terminal at the server end.

       -C     Enable zlib-style compression on the connection.

       -1, -2 Select SSH protocol version 1 or 2.

       -4, -6 Force use of IPv4 or IPv6 for network connections.

       -i keyfile
              Private key file for user authentication. For SSH-2 keys, this key file must be in PuTTY's PPK format, not OpenSSH's format or  any‐
              one else's.

              If  you are using an authentication agent, you can also specify a public key here (in RFC 4716 or OpenSSH format), to identify which
              of the agent's keys to use.

       -noagent
              Don't try to use an authentication agent for local authentication. (This doesn't affect agent forwarding.)

       -agent Allow use of an authentication agent. (This option is only necessary to override a setting in a saved session.)

       -hostkey key
              Specify an acceptable host public key. This option  may  be  specified  multiple  times;  each  key  can  be  either  a  fingerprint
              (99:aa:bb:...) or a base64-encoded blob in OpenSSH's one-line format.

              Specifying  this option overrides automated host key management; only the key(s) specified on the command-line will be accepted (un‐
              less a saved session also overrides host keys, in which case those will be added to), and the host key cache will not be written.

       -sercfg configuration-string
              Specify the configuration parameters for the serial port, in -serial mode. configuration-string should be a comma-separated list  of
              configuration parameters as follows:

              •      Any single digit from 5 to 9 sets the number of data bits.

              •      `1', `1.5' or `2' sets the number of stop bits.

              •      Any other numeric string is interpreted as a baud rate.

              •      A single lower-case letter specifies the parity: `n' for none, `o' for odd, `e' for even, `m' for mark and `s' for space.

              •      A single upper-case letter specifies the flow control: `N' for none, `X' for XON/XOFF, `R' for RTS/CTS and `D' for DSR/DTR.

SAVED SESSIONS
       Saved sessions are stored in a .putty/sessions subdirectory in your home directory.

MORE INFORMATION
       For more information on PuTTY, it's probably best to go and look at the manual on the web page:

       https://www.chiark.greenend.org.uk/~sgtatham/putty/

BUGS
       This man page isn't terribly complete.

PuTTY tool suite                                                    2004‐03‐24                                                            putty(1)
