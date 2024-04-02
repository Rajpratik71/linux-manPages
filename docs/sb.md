SZ(1)                                                         General Commands Manual                                                        SZ(1)

NAME
       sx, sb, sz - XMODEM, YMODEM, ZMODEM file send

SYNOPSIS
       sz [-+8abdefkLlNnopqTtuvyY] file ...
       sb [-adfkqtuv] file ...
       sx [-akqtuv] file
       sz [-oqtv] -c COMMAND
       sz [-oqtv] -i COMMAND
       sz -TT

DESCRIPTION
       Sz  uses  the  ZMODEM, YMODEM or XMODEM error correcting protocol to send one or more files over a dial-in serial port to a variety of pro‐
       grams running under PC-DOS, CP/M, Unix, VMS, and other operating systems.

       While rz is smart enough to be called from cu(1), very few versions of cu(1) are smart enough to allow sz to work properly.   Unix  flavors
       of Professional-YAM are available for such dial-out application.

       Sz sends one or more files with ZMODEM protocol.

       ZMODEM  greatly  simplifies file transfers compared to XMODEM.  In addition to a friendly user interface, ZMODEM provides Personal Computer
       and other users an efficient, accurate, and robust file transfer method.

       ZMODEM provides complete END-TO-END data integrity between application programs.  ZMODEM's 32 bit CRC catches errors that sneak  into  even
       the most advanced networks.

       Advanced file management features include AutoDownload (Automatic file Download initiated without user intervention), Display of individual
       and total file lengths and transmission time estimates, Crash Recovery, selective file transfers, and preservation of exact file  date  and
       length.

       Output from another program may be piped to sz for transmission by denoting standard input with "-":
                                                                      ls -l | sz -
       The  program  output  is  transmitted with the filename sPID.sz where PID is the process ID of the sz program.  If the environment variable
       ONAME is set, that is used instead.  In this case, the Unix command:
                                                               ls -l | ONAME=con sz -ay -
       will send a "file" to the PC-DOS console display.  The -y option instructs the receiver to open the file for writing unconditionally.   The
       -a option causes the receiver to convert Unix newlines to PC-DOS carriage returns and linefeeds.

       Sb  batch  sends  one  or more files with YMODEM or ZMODEM protocol.  The initial ZMODEM initialization is not sent.  When requested by the
       receiver, sb supports YMODEM-g with "cbreak" tty mode, XON/XOFF flow control, and interrupt character set to CAN (^X).   YMODEM-g  (Profes‐
       sional-YAM  g  option) increases throughput over error free channels (direct connection, X.PC, etc.)  by not acknowledging each transmitted
       sector.

       On Unix systems, additional information about the file is transmitted.  If the receiving program uses  this  information,  the  transmitted
       file length controls the exact number of bytes written to the output dataset, and the modify time and file mode are set accordingly.

       Sx  sends  a  single file with XMODEM or XMODEM-1k protocol (sometimes incorrectly called "ymodem").  The user must supply the file name to
       both sending and receiving programs.

       If sz is invoked with $SHELL set and iff that variable contains the string  rsh  ,  rbash  or  rksh  (restricted  shell),  sz  operates  in
       restricted  mode.  Restricted mode restricts pathnames to the current directory and PUBDIR (usually /usr/spool/uucppublic) and/or subdirec‐
       tories thereof.

       The fourth form sends a single COMMAND to a ZMODEM receiver for execution.  Sz exits with the COMMAND return value.   If  COMMAND  includes
       spaces or characters special to the shell, it must be quoted.

       The fifth form sends a single COMMAND to a ZMODEM receiver for execution.  Sz exits as soon as the receiver has correctly received the com‐
       mand, before it is executed.

       The sixth form (sz -TT) attempts to output all 256 code combinations to the terminal.  In you are having  difficulty  sending  files,  this
       command lets you see which character codes are being eaten by the operating system.

       If  sz  is  invoked  with  stdout and stderr to different datasets, Verbose is set to 2, causing frame by frame progress reports to stderr.
       This may be disabled with the q option.

       The meanings of the available options are:

       -+, --append
              Instruct the receiver to append transmitted data to an existing file (ZMODEM only).
       -2, --twostop
              use two stop bits (if possible). Do not use this unless you know what you are doing.
       -8, --try-8k
              Try to go up to 8KB blocksize. This is incompatible with standard zmodem, but a common extension in the bbs world. (ZMODEM only).
       --start-8k
              Start with 8KB blocksize. Like --try-8k.
       -a, --ascii
              Convert NL characters in the transmitted file to CR/LF.  This is done by the sender for XMODEM and YMODEM, by the receiver for  ZMO‐
              DEM.
       -b, --binary
              (ZMODEM) Binary override: transfer file without any translation.
       -B NUMBER, --bufsize NUMBER
              Use a readbuffer of NUMBER bytes. Default ist 16384, which should be enough for most situations. If you have a slow machine or a bad
              disk interface or suffer from other hardware problems you might want to increase the buffersize.  -1 or  auto  use  a  buffer  large
              enough to buffer the whole file. Be careful with this option - things normally get worse, not better, if the machine starts to swap.

              Using this option turns of memory mapping of the input file. This increases memory and cpu usage.
       -c COMMAND, --command COMMAND
              Send COMMAND to the receiver for execution, return with COMMAND´s exit status.
       -C N, --command-tries N
              Retry to send command N times (default: 11).
       -d, --dot-to-slash
              Change  all  instances  of  "."  to  "/" in the transmitted pathname.  Thus, C.omenB0000 (which is unacceptable to MSDOS or CP/M) is
              transmitted as C/omenB0000.  If the resultant filename has more than 8 characters in the stem, a "." is inserted to allow a total of
              eleven.

              This option enables the --full-path option.
       --delay-startup N
              Wait N seconds before doing anything.
       -e, --escape
              Escape all control characters; normally XON, XOFF, DLE, CR-@-CR, and Ctrl-X are escaped.
       -E, --rename
              Force the sender to rename the new file if a file with the same name already exists.
       -f, --full-path
              Send Full pathname.  Normally directory prefixes are stripped from the transmitted filename.

              This is also turned on with to --dot-to-slash option.
       -h, --help
              give help.
       -i COMMAND, --immediate-command COMMAND
              Send COMMAND to the receiver for execution, return immediately upon the receiving program's successful reception of the command.
       -k, --1k
              (XMODEM/YMODEM)  Send  files using 1024 byte blocks rather than the default 128 byte blocks.  1024 byte packets speed file transfers
              at high bit rates.  (ZMODEM streams the data for the best possible throughput.)
       -L N, --packetlen N
              Use ZMODEM sub-packets of length N.  A larger N (32 <= N <= 1024) gives slightly higher throughput, a smaller N speeds error  recov‐
              ery.  The default is 128 below 300 baud, 256 above 300 baud, or 1024 above 2400 baud.
       -m N, --min-bps N
              Stop transmission if BPS-Rate (Bytes Per Second) falls below N for a certain time (see --min-bps-time option).
       -M N, --min-bps-time
              Used together with --min-bps. Default is 120 (seconds).
       -l N, --framelen N
              Wait  for  the receiver to acknowledge correct data every N (32 <= N <= 1024) characters.  This may be used to avoid network overrun
              when XOFF flow control is lacking.
       -n, --newer
              (ZMODEM) Send each file if destination file does not exist.  Overwrite destination file if source file is newer than the destination
              file.
       -N, --newer-or-longer
              (ZMODEM)  Send  each file if destination file does not exist.  Overwrite destination file if source file is newer or longer than the
              destination file.
       -o, --16-bit-crc
              (ZMODEM) Disable automatic selection of 32 bit CRC.
       -O, --disable-timeouts
              Disable read timeout handling. This makes lsz hang if the other side doesn't send anything, but increases performance (not much) and
              decreases system load (reduces number of system calls by about 50 percent).

              Use this option with care.
       -p, --protect
              (ZMODEM) Protect existing destination files by skipping transfer if the destination file exists.
       -q, --quiet
              Quiet suppresses verbosity.
       -R, --restricted
              Restricted  mode:  restricts  pathnames  to  the  current directory and PUBDIR (usually /usr/spool/uucppublic) and/or subdirectories
              thereof.
       -r, --resume
              (ZMODEM) Resume interrupted file transfer.  If the source file is longer than the destination file, the transfer  commences  at  the
              offset in the source file that equals the length of the destination file.
       -s HH:MM, --stop-at HH:MM
              Stop transmission at HH hours, MM minutes. Another variant, using +N instead of HH:MM, stops transmission in N seconds.
       -S, --timesync
              enable timesync protocol support. See timesync.doc for further information.

              This option is incompatible with standard zmodem. Use it with care.
       --syslog[=off]
              turn syslogging on or off. the default is set at configure time.  This option is ignored if no syslog support is compiled in.
       -t TIM, --timeout TIM
              Change timeout to TIM tenths of seconds.
       -T, --turbo
              Do  not  escape certain characters (^P, ^P|0x80, telenet escape sequence [CR + @]). This improves performance by about 1 percent and
              shouldn't hurt in the normal case (but be careful - ^P might be useful if connected through a terminal server).
       --tcp  Try to initiate a TCP/IP connection. lsz will ask the receiving zmodem to open a TCP/IP connection. All handshaking (which address /
              port to use) will be done by the zmodem programs.

              You  will  normally  not  want  to use this option as lrzsz is the only zmodem which understands what to do (private extension). You
              might want to use this option if the two programs are connected (stdin/out) over a slow or bad (not 8bit clean) network connection.

              Use of this option imposes a security risk, somebody else could connect to the port in between. See SECURITY for details.
       --tcp-client ADDRESS:PORT
              Act as a tcp/ip client: Connect to the given port.

              See --tcp-server for more information.

       --tcp-server
              Act as a server: Open a socket, print out what to do, wait for connection.

              You will normally not want to use this option as lrzsz is the only zmodem which understands what  to  do  (private  extension).  You
              might  want  to  use  this  if  you  have to use zmodem (for which reason whatever), and cannot use the --tcp option of lsz (perhaps
              because your telnet doesn't allow to spawn a local program with stdin/stdout connected to the remote side).

              If you use this option you have to start lsz with the --tcp-client ADDRESS:PORT option.  lrz will print  the  address  and  port  on
              startup.

              Use of this option imposes a security risk, somebody else could connect to the port in between. See SECURITY for details.

       -u     Unlink the file after successful transmission.
       -U, --unrestrict
              Turn off restricted mode (this is not possible if running under a restricted shell).
       -w N, --windowsize N
              Limit the transmit window size to N bytes (ZMODEM).
       -v, --verbose
              Verbose output to stderr. More v's generate more output.
       -X, --xmodem
              use XMODEM protocol.
       -y, --overwrite
              Instruct a ZMODEM receiving program to overwrite any existing file with the same name.
       -Y, --overwrite-or-skip
              Instruct  a  ZMODEM receiving program to overwrite any existing file with the same name, and to skip any source files that do have a
              file with the same pathname on the destination system.
       --ymodem
              use ZMODEM protocol.
       -Z, --zmodem
              use ZMODEM protocol.

SECURITY
       Restricted mode restricts pathnames to the current directory and PUBDIR (usually /var/spool/uucppublic) and/or subdirectories thereof,  and
       disables remote command execution.

       Restricted  mode is entered if the R option is given or if lsz detects that it runs under a restricted shell or if the environment variable
       ZMODEM_RESTRICTED is found.

       Restricted mode can be turned of with the U option if not running under a restricted shell.

       Use of the
              --tcp-client or --tcp-server options imposes a security risk, as somebody else could connect to the port before you do it, and  grab
              your data. If there's strong demand for a more secure mode i might introduce some sort of password challenge.

ENVIRONMENT
       ZNULLS may be used to specify the number of nulls to send before a ZDATA frame.

       SHELL  lsz recognizes a restricted shell if this variable includes rsh or rksh

       ZMODEM_RESTRICTED
              lrz enters restricted mode if the variable is set.

       TMPDIR If  this  environment  variable  is set its content is used as the directory to place in the answer file to a timesync request.  TMP
              Used instead of TMPDIR if TMPDIR is not set. If neither TMPDIR nor TMP is set /tmp will be used.

EXAMPLES
       ZMODEM File Transfer (Unix to DSZ/ZCOMM/Professional-YAM)
       % sz -a *.c
       This single command transfers all .c files in the current Unix directory with conversion (-a) to end of line conventions appropriate to the
       receiving environment.  With ZMODEM AutoDownload enabled, Professional-YAM  and ZCOMM will automatically receive the files after performing
       a security check.

       % sz -Yan *.c *.h
       Send only the .c and .h files that exist on both systems, and are newer on the sending system than the corresponding version on the receiv‐
       ing system, converting Unix to DOS text format.
       $ sz -\Yan file1.c file2.c file3.c foo.h baz.h ®(for VMS)

       ZMODEM Command Download (Unix to Professional-YAM)
        cpszall:all
           sz -c "c:;cd /yam/dist"
           sz -ya $(YD)/*.me
           sz -yqb y*.exe
           sz -c "cd /yam"
           sz -i "!insms"
       This  Makefile  fragment  uses  sz  to issue commands to Professional-YAM to change current disk and directory.  Next, sz transfers the .me
       files from the $YD directory, commanding the receiver to overwrite the old files and to convert from Unix end of line conventions to PC-DOS
       conventions.   The  third line transfers some .exe files.  The fourth and fifth lines command Pro-YAM to change directory and execute a PC-
       DOS batch file insms .  Since the batch file takes considerable time, the -i form is used to allow sz to exit immediately.

       XMODEM File Transfer (Unix to Crosstalk)
       % sx -a foo.c
       ESC
       rx foo.c
       The above three commands transfer a single file from Unix to a PC and Crosstalk with sz translating Unix newlines to DOS CR/LF.  This  com‐
       bination is much slower and far less reliable than ZMODEM.

ERROR MESSAGES
       "Caught signal 99" indicates the program was not properly compiled, refer to "bibi(99)" in rbsb.c for details.

SEE ALSO
       rz(omen), ZMODEM.DOC, YMODEM.DOC, Professional-YAM, crc(omen), sq(omen), todos(omen), tocpm(omen), tomac(omen), yam(omen)

       Compile time options required for various operating systems are described in the source file.

VMS VERSION
       The VMS version does not support wild cards.  Because of VMS DCL, upper case option letters must be represented by \ preceding the letter.

       The current VMS version does not support XMODEM, XMODEM-1k, or YMODEM.

       VMS C Standard I/O and RMS may interact to modify the file contents.

FILES
       32 bit CRC code courtesy Gary S. Brown.

       sz.c, crctab.c, rbsb.c, zm.c, zmodem.h Unix source files

       sz.c, crctab.c, vrzsz.c, zm.c, zmodem.h, vmodem.h, vvmodem.c, VMS source files.

       /tmp/szlog stores debugging output (sz -vv) (szlog on VMS).

TESTING FEATURE
       The  command "sz -T file" exercises the Attn sequence error recovery by commanding errors with unterminated packets.  The receiving program
       should complain five times about binary data packets being too long.  Each time sz is interrupted, it should send a ZDATA  header  followed
       by another defective packet.  If the receiver does not detect five long data packets, the Attn sequence is not interrupting the sender, and
       the Myattn string in sz.c must be modified.

       After 5 packets, sz stops the "transfer" and prints the total number of characters "sent" (Tcount).  The difference between Tcount and 5120
       represents the number of characters stored in various buffers when the Attn sequence is generated.

BUGS
       Calling sz from most versions of cu(1) doesn't work because cu's receive process fights sz for characters from the modem.

       On  at  least  one BSD system, sz would hang or exit when it got within a few kilobytes of the end of file.  Using the "-w 8192" flag fixed
       the problem.  The real cause is unknown, perhaps a bug in the kernel TTY output routines.

       Programs that do not properly implement the specified file transfer protocol may cause sz to "hang" the port for a  minute  or  two.   This
       problem is corrected by using ZCOMM, Pro-YAM, or other program with a correct implementation of the specified protocol.

       Many programs claiming to support YMODEM only support XMODEM with 1k blocks, and they often don't get that quite right.

       XMODEM transfers add up to 127 garbage bytes per file.  XMODEM-1k and YMODEM-1k transfers use 128 byte blocks to avoid extra padding.

       YMODEM  programs  use  the file length transmitted at the beginning of the transfer to prune the file to the correct length; this may cause
       problems with source files that grow during the course of the transfer.  This problem does not pertain to ZMODEM transfers, which  preserve
       the exact file length unconditionally.

       Most ZMODEM options are merely passed to the receiving program; some do not implement all these options.

       Circular buffering and a ZMODEM sliding window should be used when input is from pipes instead of acknowledging frames each 1024 bytes.  If
       no files can be opened, sz sends a ZMODEM command to echo a suitable complaint; perhaps it should check for the presence of  at  least  one
       accessible file before getting hot and bothered.  The test mode leaves a zero length file on the receiving system.

       A  few high speed modems have a firmware bug that drops characters when the direction of high speed transmission is reversed.  The environ‐
       ment variable ZNULLS may be used to specify the number of nulls to send before a ZDATA frame.  Values of 101 for a 4.77 mHz PC and 124  for
       an AT are typical.

lrzsz-0.12b                                                          2.6.1996                                                                SZ(1)
