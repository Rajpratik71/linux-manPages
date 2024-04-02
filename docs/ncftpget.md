ncftpget(1)                            General Commands Manual                            ncftpget(1)

NAME
       ncftpget - Internet file transfer program for scripts

SYNOPSIS
       ncftpget [options] remote-host local-directory remote-files...

       ncftpget [options] bookmark-name local-directory remote-files...

       ncftpget -f login.cfg [options] local-directory remote-files...

       ncftpget [options] ftp://url.style.host/path/name

       ncftpget -c [options] remote-host remote-file > stdout

       ncftpget -C [options] remote-host remote-file local-path-name

       ncftpget -c [options] ftp://url.style.host/path/name > stdout

OPTIONS
   Command line flags:
       -u XX   Use username XX instead of anonymous.

       -p XX   Use password XX with the username.

       -P XX   Use port number XX instead of the default FTP service port (21).

       -j XX   Use account XX in supplement to the username and password (deprecated).

       -d XX   Use the file XX for debug logging.

       -a      Use ASCII transfer type instead of binary.

       -t XX   Timeout after XX seconds.

       -v/-V   Do  (do not) use progress meters.  The default is to use progress meters if the output
               stream is a TTY.

       -f XX   Read the file XX for host, user, and password information.

       -c      Read from remote host and write locally to standard out.

       -C      Read from remote host and write locally to specified pathname.

       -A      Append to local files, instead of overwriting them.

       -z/-Z   Do (do not) try to resume transfers.  The default is to try to resume (-z).

       -E      Use regular (PORT) data connections.

       -F      Use passive (PASV) data connections.  The default is to use passive, but  to  fallback
               to regular if the passive connection fails or times out.

       -DD     Delete remote file after successfully downloading it.

       -R      Recursive mode; copy whole directory trees.

       -T      Do  not  use  automatic  on-the-fly  TAR  mode  for downloading whole directory trees.
               ncftpget uses TAR whenever possible since this usually preserves  symbolic  links  and
               file  permissions.   TAR mode can also result in faster transfers for directories con‐
               taining many small files, since a single data connection can be used  rather  than  an
               FTP  data connection for each small file.  The downside to using TAR is that it forces
               downloading of the whole directory, even if you had previously downloaded a portion of
               it  earlier, so you may want to use this option if you want to resume downloading of a
               directory.

       -r XX   Redial a maximum of XX times until connected to the remote FTP server.

       -b      Run in background (by submitting a batch job and then spawning ncftpbatch).

       -bb     Similar to -b option, but only submits the batch job.  You will need to run ncftpbatch
               for  the  batch  job to be processed.  This is useful if you already have a ncftpbatch
               process running, or wish to have better control of when batch jobs are processed.

               For example, if you wanted to do background processing of three files all on the  same
               remote  server,  it  is  more polite to use just one ncftpbatch process to process the
               three jobs sequentially, rather than having  three  ncftpbatch  processes  open  three
               simultaneous FTP sessions to the same server.

       -B XX   Try setting the TCP/IP socket buffer size to XX bytes.

       -W XX   Send raw FTP command XX after logging in.

       -X XX   Send raw FTP command XX after each file transferred.

       -Y XX   Send raw FTP command XX before logging out.

               The -W, -X, and -Y options are useful for advanced users who need to tweak behavior on
               some servers.  For example, users accessing mainframes might need to send some special
               SITE commands to set blocksize and record format information.

               For  these  options, you can use them multiple times each if you need to send multiple
               commands.  For the -X option, you can use the cookie %s to expand into the name of the
               file that was transferred.

       -o XX   Set advanced option XX.

               This  option  is used primarily for debugging.  It sets the value of an internal vari‐
               able to an integer value.  An example usage would be: -o useFEAT=0,useCLNT=1 which  in
               this  case, disables use of the FEAT command and enables the CLNT command.  The avail‐
               able variables include: usePASV, useSIZE, useMDTM, useREST, useNLST_a, useNLST_d, use‐
               FEAT,  useMLSD,  useMLST,  useCLNT,  useHELP_SITE,  useSITE_UTIME, STATfileParamWorks,
               NLSTfileParamWorks, require20, allowProxyForPORT, doNotGetStartCWD.

DESCRIPTION
       The purpose of ncftpget is to do file transfers from  the  command-line  without  entering  an
       interactive  shell.   This lets you write shell scripts or other unattended processes that can
       do FTP.  It is also useful for advanced users who want to retrieve files from the  shell  com‐
       mand line without entering an interactive FTP program such as ncftp.

       One  particularly  useful  feature  of this program is that you can give it a uniform resource
       locator as the only argument and the program will download that file.  You can then  copy  and
       paste from your web browser or newsreader and use that URL.  Example:

           $ cd /tmp
           $ ncftpget ftp://ftp.ncftp.com/pub/ncftp/ncftp.tar.Z
           $ zcat ncftp.tar.Z | tar xf -

       By  default the program tries to open the remote host and login anonymously, but you can spec‐
       ify a username and password information.  The -u option is used to  specify  the  username  to
       login  as,  and the -p option is used to specify the password.  If you are running the program
       from the shell, you may omit the -p option and the program will prompt you for the password.

       Using the -u and -p options are not recommended, because your account information  is  exposed
       to  anyone  who  can  see your shell script or your process information.  For example, someone
       using the ps program could see your password while the program runs.

       You may use the -f option instead to specify a file with the  account  information.   However,
       this  is  still  not secure because anyone who has read access to the information file can see
       the account information.  Nevertheless, if you choose to use the -f  option  the  file  should
       look something like this:

           host sphygmomanometer.ncftp.com
           user gleason
           pass mypasswd

       Don't forget to change the permissions on this file so no one else can read them.

       The  -d  option is very useful when you are trying to diagnose why a file transfer is failing.
       It prints out the entire FTP conversation to the file you specify, so you can get an  idea  of
       what  went  wrong.  If you specify the special name stdout as the name of the debugging output
       file, the output will instead print to the screen.  Example:

           $ ncftpget -d stdout bowser.nintendo.co.jp . /pub/README
           220: FTP server ready.
           Connected to bowser.nintendo.co.jp.
           Cmd: USER anonymous
           331: Guest login ok, send your complete e-mail address as password.
           Cmd: PASS xxxxxxxx
           230: Welcome!
           Logged in to bowser.nintendo.co.jp as anonymous.
           Cmd: TYPE I
           200: Type set to I.
           Cmd: PORT 192,168,9,37,6,76
           200: PORT command successful.
           Cmd: RETR /pub/README
           550: /pub/README: File in use.
           Cmd: QUIT
           221: Goodbye.

       Using ASCII mode is helpful when the text format of your host differs from that of the  remote
       host.  For example, if you are retrieving a .TXT file from a Windows-based host to a UNIX sys‐
       tem, you could use the -a flag which would use ASCII transfer mode so that the file created on
       the UNIX system would be in the UNIX text format instead of the MS-DOS text format.

       You  can  retrieve an entire directory tree of files by using the -R flag.  However, this will
       work only if the remote FTP server is a UNIX server, or emulates UNIX's list output.  Example:

           $ ncftpget -R ftp.ncftp.com /tmp /pub/ncftp

       This would create a /tmp/ncftp hierarchy.

DIAGNOSTICS
       ncftpget returns the following exit values:

       0       Success.

       1       Could not connect to remote host.

       2       Could not connect to remote host - timed out.

       3       Transfer failed.

       4       Transfer failed - timed out.

       5       Directory change failed.

       6       Directory change failed - timed out.

       7       Malformed URL.

       8       Usage error.

       9       Error in login configuration file.

       10      Library initialization failed.

       11      Session initialization failed.

AUTHOR
       Mike Gleason, NcFTP Software (http://www.ncftp.com).

SEE ALSO
       ncftpput(1), ncftp(1), ftp(1), rcp(1), tftp(1).

       LibNcFTP (http://www.ncftp.com/libncftp/).

ncftpget                                    NcFTP Software                                ncftpget(1)
