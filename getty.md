AGETTY(8)                   System Administration                   AGETTY(8)

NAME
       agetty - alternative Linux getty

SYNOPSIS
       agetty [options] port [baud_rate...] [term]

DESCRIPTION
       agetty  opens  a  tty  port,  prompts for a login name and invokes the
       /bin/login command.  It is normally invoked by init(8).

       agetty has several non-standard features that are useful for hardwired
       and for dial-in lines:

       ·      Adapts the tty settings to parity bits and to erase, kill, end-
              of-line and uppercase characters when it reads  a  login  name.
              The program can handle 7-bit characters with even, odd, none or
              space parity, and 8-bit characters with no parity.  The follow‐
              ing  special  characters  are recognized: Control-U (kill); DEL
              and backspace (erase); carriage return and line  feed  (end  of
              line).  See also the --erase-chars and --kill-chars options.

       ·      Optionally deduces the baud rate from the CONNECT messages pro‐
              duced by Hayes(tm)-compatible modems.

       ·      Optionally does not hang up when it is given an already  opened
              line (useful for call-back applications).

       ·      Optionally  does  not  display  the  contents of the /etc/issue
              file.

       ·      Optionally  displays  an  alternative  issue  file  instead  of
              /etc/issue.

       ·      Optionally does not ask for a login name.

       ·      Optionally  invokes  a  non-standard  login  program instead of
              /bin/login.

       ·      Optionally turns on hardware flow control.

       ·      Optionally forces the line to be local with no need for carrier
              detect.

       This  program  does not use the /etc/gettydefs (System V) or /etc/get‐
       tytab (SunOS 4) files.

ARGUMENTS
       port   A path name relative to the /dev directory.  If a "-" is speci‐
              fied,  agetty  assumes  that its standard input is already con‐
              nected to a tty port and that a connection to a remote user has
              already been established.

              Under  System  V,  a  "-" port argument should be preceded by a
              "--".

       baud_rate,...
              A comma-separated list of one or more baud  rates.   Each  time
              agetty receives a BREAK character it advances through the list,
              which is treated as if it were circular.

              Baud rates should be specified in descending order, so that the
              null  character (Ctrl-@) can also be used for baud-rate switch‐
              ing.

              This argument is optional and unnecessary  for  virtual  termi‐
              nals.

              The  default for serial terminals is keep the current baud rate
              (see --keep-baud) and if unsuccessful then default to '9600'.

       term   The value to be used for the TERM environment  variable.   This
              overrides  whatever  init(8)  may have set, and is inherited by
              login and the shell.

              The default is 'vt100', or 'linux' for Linux on a virtual  ter‐
              minal, or 'hurd' for GNU Hurd on a virtual terminal.

OPTIONS
       -8, --8bits
              Assume that the tty is 8-bit clean, hence disable parity detec‐
              tion.

       -a, --autologin username
              Automatically log in the specified user without  asking  for  a
              username  or password.  Using this option causes an -f username
              option and argument to be added to the /bin/login command line.
              See  --login-options, which can be used to modify this option's
              behavior.

       -c, --noreset
              Do not reset terminal cflags (control modes).   See  termios(3)
              for more details.

       -E, --remote
              Typically  the login(1) command is given a remote hostname when
              called by something such as  telnetd(8).   This  option  allows
              agetty  to pass what it is using for a hostname to login(1) for
              use in utmp(5).  See --host, login(1), and utmp(5).

              If the --host fakehost option is given,  then  an  -h  fakehost
              option and argument are added to the /bin/login command line.

              If the --nohostname option is given, then an -H option is added
              to the /bin/login command line.

              See --login-options.

       -f, --issue-file issue_file
              Display the contents of issue_file instead of /etc/issue.  This
              allows  custom messages to be displayed on different terminals.
              The --noissue option will override this option.

       -h, --flow-control
              Enable hardware (RTS/CTS) flow control.  It is left up  to  the
              application  to disable software (XON/XOFF) flow protocol where
              appropriate.

       -H, --host fakehost
              Write the specified fakehost into the utmp file.  Normally,  no
              login  host  is given, since agetty is used for local hardwired
              connections and consoles.  However, this option can  be  useful
              for identifying terminal concentrators and the like.

       -i, --noissue
              Do  not  display  the  contents of /etc/issue (or other) before
              writing the login prompt.  Terminals or communications hardware
              may  become  confused  when receiving lots of text at the wrong
              baud rate; dial-up scripts may fail if the login prompt is pre‐
              ceded by too much text.

       -I, --init-string initstring
              Set  an  initial  string  to be sent to the tty or modem before
              sending anything else.  This may be used to initialize a modem.
              Non-printable  characters  may  be  sent by writing their octal
              code preceded by a backslash (\).  For example, to send a line‐
              feed character (ASCII 10, octal 012), write \012.

       -J, --noclear
              Do  not  clear  the screen before prompting for the login name.
              By default the screen is cleared.

       -l, --login-program login_program
              Invoke the specified login_program instead of /bin/login.  This
              allows the use of a non-standard login program.  Such a program
              could, for example, ask for a dial-up password or use a differ‐
              ent password file. See --login-options.

       -L, --local-line[=mode]
              Control  the  CLOCAL  line flag.  The optional mode argument is
              'auto', 'always' or 'never'.  If the mode argument is  omitted,
              then  the  default  is 'always'.  If the --local-line option is
              not given at all, then the default is 'auto'.

              always Forces the line to be a local line with no need for car‐
                     rier detect.  This can be useful when you have a locally
                     attached terminal where the serial line does not set the
                     carrier-detect signal.

              never  Explicitly  clears the CLOCAL flag from the line setting
                     and the carrier-detect signal is expected on the line.

              auto   The agetty default.  Does not modify the CLOCAL  setting
                     and follows the setting enabled by the kernel.

       -m, --extract-baud
              Try  to  extract  the baud rate from the CONNECT status message
              produced by Hayes(tm)-compatible modems.  These status messages
              are  of  the  form: "<junk><speed><junk>".  agetty assumes that
              the modem emits its status message at the same speed as  speci‐
              fied with (the first) baud_rate value on the command line.

              Since  the  --extract-baud  feature  may fail on heavily-loaded
              systems, you still should enable BREAK processing by  enumerat‐
              ing all expected baud rates on the command line.

       --list-speeds
              Display supported baud rates.  These are determined at compila‐
              tion time.

       -n, --skip-login
              Do not prompt the user for a login name.  This can be  used  in
              connection  with  the  --login-program  option to invoke a non-
              standard login process such as a BBS system.   Note  that  with
              the --skip-login option, agetty gets no input from the user who
              logs in and therefore will not be able to  figure  out  parity,
              character  size,  and newline processing of the connection.  It
              defaults to space parity, 7 bit characters, and ASCII  CR  (13)
              end-of-line  character.   Beware  that  the program that agetty
              starts (usually /bin/login) is run as root.

       -N, --nonewline
              Do not print a newline before writing out /etc/issue.

       -o, --login-options "login_options"
              Options  and arguments that  are passed to login(1).  Where  \u
              is replaced by the login name. For example:

                  --login-options '-h darkstar -- \u'

              See --autologin, --login-program and --remote.

              Please read the SECURITY NOTICE below before using this option.

       -p, --login-pause
              Wait  for  any key before dropping to the login prompt.  Can be
              combined with --autologin to save  memory  by  lazily  spawning
              shells.

       -r, --chroot directory
              Change root to the specified directory.

       -R, --hangup
              Call  vhangup()  to do a virtual hangup of the specified termi‐
              nal.

       -s, --keep-baud
              Try to keep the existing baud rate.  The baud  rates  from  the
              command line are used when agetty receives a BREAK character.

       -t, --timeout timeout
              Terminate if no user name could be read within timeout seconds.
              Use of this option with hardwired terminal lines is not  recom‐
              mended.

       -U, --detect-case
              Turn on support for detecting an uppercase-only terminal.  This
              setting will detect a login name containing  only  capitals  as
              indicating  an  uppercase-only terminal and turn on some upper-
              to-lower case conversions.  Note that this has no  support  for
              any Unicode characters.

       -w, --wait-cr
              Wait  for  the user or the modem to send a carriage-return or a
              linefeed character before sending the /etc/issue file (or  oth‐
              ers)   and   the   login  prompt.   This  is  useful  with  the
              --init-string option.

       --nohints
              Do not print hints about Num, Caps and Scroll Locks.

       --nohostname
              By default the hostname will  be  printed.   With  this  option
              enabled, no hostname at all will be shown.

       --long-hostname
              By  default  the  hostname is only printed until the first dot.
              With this option enabled, the fully qualified hostname by geth‐
              ostname(3P) or (if not found) by getaddrinfo(3) is shown.

       --erase-chars string
              This  option  specifies  additional  characters  that should be
              interpreted as a backspace ("ignore  the  previous  character")
              when  the  user  types  the login name.  The default additional
              ´erase´ has been ´#´, but since util-linux 2.23  no  additional
              erase characters are enabled by default.

       --kill-chars string
              This  option  specifies  additional  characters  that should be
              interpreted as a kill ("ignore all previous  characters")  when
              the  user  types the login name.  The default additional ´kill´
              has been ´@´, but since  util-linux  2.23  no  additional  kill
              characters are enabled by default.

       --chdir directory
              Change directory before the login.

       --delay number
              Sleep seconds before open tty.

       --nice number
              Run login with this priority.

       --reload
              Ask  all  running  agetty  instances to reload and update their
              displayed prompts, if the user has not  yet  commenced  logging
              in.   After doing so the command will exit.  This feature might
              be unsupported on systems without Linux inotify(7).

       --version
              Display version information and exit.

       --help Display help text and exit.

EXAMPLES
       This section shows examples for the process field of an entry  in  the
       /etc/inittab  file.  You'll have to prepend appropriate values for the
       other fields.  See inittab(5) for more details.

       For a hardwired line or a console tty:

              /sbin/agetty 9600 ttyS1

       For a directly connected terminal without proper carrier-detect wiring
       (try  this  if your terminal just sleeps instead of giving you a pass‐
       word: prompt):

              /sbin/agetty --local-line 9600 ttyS1 vt100

       For an old-style dial-in line with a 9600/2400/1200 baud modem:

              /sbin/agetty --extract-baud --timeout 60 ttyS1 9600,2400,1200

       For a Hayes modem with a fixed 115200 bps  interface  to  the  machine
       (the  example init string turns off modem echo and result codes, makes
       modem/computer DCD track modem/modem DCD, makes a  DTR  drop  cause  a
       disconnection, and turns on auto-answer after 1 ring):

              /sbin/agetty --wait-cr --init-string 'ATE0Q1&D2&C1S0=1 15' 115200 ttyS1

SECURITY NOTICE
       If you use the --login-program and --login-options options,  be  aware
       that a malicious user may try to enter lognames with embedded options,
       which then get passed to the used login program.   Agetty  does  check
       for a leading "-" and makes sure the logname gets passed as one param‐
       eter (so embedded spaces will not create yet another  parameter),  but
       depending  on  how the login binary parses the command line that might
       not be sufficient.  Check that the used login program cannot be abused
       this way.

       Some   programs  use "--" to indicate that the rest of the commandline
       should not be interpreted as options.  Use this feature  if  available
       by passing "--" before the username gets passed by \u.

ISSUE ESCAPES
       The  issue-file  (/etc/issue,  or  the  file set with the --issue-file
       option) may contain certain escape codes to display the  system  name,
       date,  time  etcetera.   All  escape  codes consist of a backslash (\)
       immediately followed by one of the characters listed below.

       4 or 4{interface}
              Insert the IPv4 address of the specified network interface (for
              example:  \4{eth0}).   If  the interface argument is not speci‐
              fied, then select the first fully  configured  (UP,  non-LOCAL‐
              BACK,  RUNNING)  interface.  If not any configured interface is
              found, fall back to the IP address of the machine's hostname.

       6 or 6{interface}
              The same as \4 but for IPv6.

       b      Insert the baudrate of the current line.

       d      Insert the current date.

       e or e{name}
              Translate the human-readable name to  an  escape  sequence  and
              insert  it  (for example: \e{red}Alert text.\e{reset}).  If the
              name argument is not specified, then  insert  \033.   The  cur‐
              rently  supported  names  are: black, blink, blue, bold, brown,
              cyan, darkgray, gray, green, halfbright, lightblue,  lightcyan,
              lightgray,  lightgreen,  lightmagenta,  lightred, magenta, red,
              reset, reverse, and yellow.  All  unknown  names  are  silently
              ignored.

       s      Insert  the  system  name  (the  name of the operating system).
              Same as 'uname -s'.  See also the \S escape code.

       S or S{VARIABLE}
              Insert the VARIABLE data from /etc/os-release.   If  this  file
              does  not  exist then fall back to /usr/lib/os-release.  If the
              VARIABLE argument is not specified, then use  PRETTY_NAME  from
              the  file or the system name (see \s).  This escape code allows
              to keep /etc/issue distribution and release independent.   Note
              that  \S{ANSI_COLOR}  is  converted to the real terminal escape
              sequence.

       l      Insert the name of the current tty line.

       m      Insert the architecture identifier of  the  machine.   Same  as
              'uname -m'.

       n      Insert the nodename of the machine, also known as the hostname.
              Same as 'uname -n'.

       o      Insert the NIS domainname of the machine.   Same  as  'hostname
              -d'.

       O      Insert the DNS domainname of the machine.

       r      Insert the release number of the OS.  Same as 'uname -r'.

       t      Insert the current time.

       u      Insert the number of current users logged in.

       U      Insert the string "1 user" or "<n> users" where <n> is the num‐
              ber of current users logged in.

       v      Insert the version of the OS, that is, the build-date and such.

       An example.  On my system, the following /etc/issue file:

              This is \n.\o (\s \m \r) \t

       displays as:

              This is thingol.orcan.dk (Linux i386 1.1.9) 18:29:30

FILES
       /var/run/utmp
              the system status file.

       /etc/issue
              printed before the login prompt.

       /etc/os-release /usr/lib/os-release
              operating system identification data.

       /dev/console
              problem reports (if syslog(3) is not used).

       /etc/inittab
              init(8) configuration file for SysV-style init daemon.

BUGS
       The baud-rate detection feature (the --extract-baud  option)  requires
       that  agetty  be  scheduled  soon enough after completion of a dial-in
       call (within 30 ms with modems that talk at 2400 baud).   For  robust‐
       ness,  always use the --extract-baud option in combination with a mul‐
       tiple baud rate command-line argument, so  that  BREAK  processing  is
       enabled.

       The  text  in  the /etc/issue file (or other) and the login prompt are
       always output with 7-bit characters and space parity.

       The baud-rate detection feature (the --extract-baud  option)  requires
       that the modem emits its status message after raising the DCD line.

DIAGNOSTICS
       Depending on how the program was configured, all diagnostics are writ‐
       ten to the console device or  reported  via  the  syslog(3)  facility.
       Error  messages  are  produced if the port argument does not specify a
       terminal device; if there is no utmp entry  for  the  current  process
       (System V only); and so on.

AUTHORS
       Werner Fink ⟨werner@suse.de⟩
       Karel Zak ⟨kzak@redhat.com⟩

       The  original  agetty  for serial terminals was written by W.Z. Venema
       <wietse@wzv.win.tue.nl>  and  ported  to   Linux   by   Peter   Orbaek
       <poe@daimi.aau.dk>.

AVAILABILITY
       The  agetty command is part of the util-linux package and is available
       from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                      February 2016                       AGETTY(8)
