ncftpput(1)                            General Commands Manual                            ncftpput(1)

NAME
       ncftpput - Internet file transfer program for scripts

SYNOPSIS
       ncftpput [options] remote-host remote-directory local-files...

       ncftpput [options] bookmark-name remote-directory local-files...

       ncftpput -f login.cfg [options] remote-directory local-files...

       ncftpput -c remote-host remote-path-name < stdin

       ncftpput -C remote-host local-path-name remote-path-name

OPTIONS
   Command line flags:
       -u XX   Use username XX instead of anonymous.

       -p XX   Use password XX with the username.

       -P XX   Use port number XX instead of the default FTP service port (21).

       -j XX   Use account XX in supplement to the username and password (deprecated).

       -d XX   Use the file XX for debug logging.

       -a      Use ASCII transfer type instead of binary.

       -m      Attempt to make the remote destination directory before copying.

       -t XX   Timeout after XX seconds.

       -U XX   Use value XX for the umask.

       -v/-V   Do  (do not) use progress meters.  The default is to use progress meters if the output
               stream is a TTY.

       -f XX   Read the file XX for host, user, and password information.

       -c      Read locally from standard input and write remotely to specified pathname.

       -C      Similar to -c, except a local pathname is specified.

       -A      Append to remote files, instead of overwriting them.

       -T XX   Upload into temporary files prefixed by XX.

       -S XX   Upload into temporary files suffixed by XX.

       -R      Recursive mode; copy whole directory trees.

       -r XX   Redial a maximum of XX times until connected to the remote FTP server.

       -z/-Z   Do (do not) try to resume transfers.  The default is to not try to resume (-Z).

       -E      Use regular (PORT) data connections.

       -F      Use passive (PASV) data connections.  The default is to use passive, but  to  fallback
               to regular if the passive connection fails or times out.

       -DD     Delete local file after successfully uploading it.

       -y      Try  using  "SITE  UTIME"  to preserve timestamps on remote host.  Not many remote FTP
               servers support this, so it may not work.

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
       The purpose of ncftpput is to do file transfers from  the  command-line  without  entering  an
       interactive  shell.   This lets you write shell scripts or other unattended processes that can
       do FTP.  It is also useful for advanced users who want to send files from  the  shell  command
       line without entering an interactive FTP program such as ncftp.

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
              pass mypassword

       Don't forget to change the permissions on this file so no one else can read them.

       The  -d  option is very useful when you are trying to diagnose why a file transfer is failing.
       It prints out the entire FTP conversation to the file you specify, so you can get an  idea  of
       what  went  wrong.  If you specify the special name stdout as the name of the debugging output
       file, the output will instead print to the screen.

       Using ASCII mode is helpful when the text format of your host differs from that of the  remote
       host.  For example, if you are sending a text file from a UNIX system to a Windows-based host,
       you could use the -a flag which would use ASCII transfer mode so that the file created on  the
       Windows machine would be in its native text format instead of the UNIX text format.

       You can upload an entire directory tree of files by using the -R flag.  Example:

           $ ncftpput -R pikachu.nintendo.co.jp /incoming /tmp/stuff

       This would create a /incoming/stuff hierarchy on the remote host.

       The  -T  and  -S  options  are useful when you want to upload file to the remote host, but you
       don't want to use the destination pathname until the file is complete.  Using  these  options,
       you  will  not  destroy  a  remote  file  by the same name until your file is finished.  These
       options are also useful when a remote process on the remote host polls  a  specific  filename,
       and  you don't want that process to see that file until you know the file is finished sending.
       Here is an  example  that  uploads  to  the  file  /pub/incoming/README,  using  the  filename
       /pub/incoming/README.tmp as a temporary filename:

           $ ncftpput -S .tmp bowser.nintendo.co.jp /pub/incoming /a/README

       A  neat  way  to  pipe  the  output from any local command into a remote file is to use the -c
       option, which denotes that you're using stdin as input.  The following example  shows  how  to
       make a backup and store it on a remote machine:

           $ tar cf - / | ncftpput -c sonic.sega.co.jp /usr/local/backup.tar

DIAGNOSTICS
       ncftpput returns the following exit values:

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
       ncftpget(1), ncftp(1), ftp(1), rcp(1), tftp(1).

       LibNcFTP (http://www.ncftp.com/libncftp/).

ncftpput                                    NcFTP Software                                ncftpput(1)
