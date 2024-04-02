ncftpls(1)                             General Commands Manual                             ncftpls(1)

NAME
       ncftpls - Internet file transfer program for scripts

SYNOPSIS
       ncftpls [options] ftp://url.style/host/path/name/

OPTIONS
   Command line flags:
       -m      Use a machine readable list format, if the server supports it.  This requires that the
               server software support the MLSD extensions, and  many  implementations  do  not  have
               these features.

       -1      Most basic format, one item per line.

       -l      Long list format.

       -C      Columnized list format. This is the default list format.

       -R      Recurse all subdirectories while listing.

       -a      Show all files, if server allows it (as in "/bin/ls -a").

       -i XX   Filter the listing (if server supports it) with the wildcard XX.

       -x -XX  Set the ls flags to use on the server.

       -u XX   Use username XX instead of anonymous.

       -p XX   Use password XX with the username.

       -P XX   Use port number XX instead of the default FTP service port (21).

       -d XX   Use the file XX for debug logging.

       -t XX   Timeout after XX seconds.

       -E      Use regular (PORT) data connections.

       -F      Use  passive  (PASV) data connections.  The default is to use passive, but to fallback
               to regular if the passive connection fails or times out.

       -r XX   Redial a maximum of XX times until connected to the remote FTP server.

       -W XX   Send raw FTP command XX after logging in.

       -X XX   Send raw FTP command XX after each file transferred.

       -Y XX   Send raw FTP command XX before logging out.

               The -W, -X, and -Y options are useful for advanced users who need to tweak behavior on
               some servers.  For example, users accessing mainframes might need to send some special
               SITE commands to set blocksize and record format information.

               For these options, you can use them multiple times each if you need to  send  multiple
               commands.  For the -X option, you can use the cookie %s to expand into the name of the
               file that was transferred.

       -o XX   Set advanced option XX.

               This option is used primarily for debugging.  It sets the value of an  internal  vari‐
               able  to an integer value.  An example usage would be: -o useFEAT=0,useCLNT=1 which in
               this case, disables use of the FEAT command and enables the CLNT command.  The  avail‐
               able variables include: usePASV, useSIZE, useMDTM, useREST, useNLST_a, useNLST_d, use‐
               FEAT, useMLSD,  useMLST,  useCLNT,  useHELP_SITE,  useSITE_UTIME,  STATfileParamWorks,
               NLSTfileParamWorks, require20, allowProxyForPORT, doNotGetStartCWD.

DESCRIPTION
       The  purpose  of  ncftpls  is to do remote directory listings using the File Transfer Protocol
       without entering an interactive shell.  This lets you write shell scripts or other  unattended
       processes that can do FTP.

       The default behavior is to print the directory listing in columnized format (i.e. ls -CF), but
       that is not very useful for scripting.  This example uses the -1 flag, to print one  file  per
       line:

           $ ncftpls -1 ftp://ftp.ncftp.com/pub/ncftp/

       You  can also do a remote "ls -l", by using "ncftpls -l".  If you want to try other flags, you
       have to use them with the -x flag.  For example, if you wanted to do a remote  "ls -lrt",  you
       could do this:

           $ ncftpls -x "-lrt" ftp://ftp.ncftp.com/pub/ncftp/

       By  default the program tries to open the remote host and login anonymously, but you can spec‐
       ify a username and password information like you can with ncftpget or ncftpput.

       Note that the standard specifies that URL pathnames are are relative pathnames.  For FTP, this
       means  that  URLs  specify relative pathnames from the start directory, which for user logins,
       are typically the user's home directory.  If you want to use absolute pathnames, you  need  to
       include a literal slash, using the "%2F" code for a "/" character.  Examples:

           $ ncftpls -u linus ftp://ftp.kernel.org/%2Fusr/src/
           $ ncftpls ftp://steve@ftp.apple.com/%2Fetc/

DIAGNOSTICS
       ncftpls returns the following exit values:

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
       ncftpput(1), ncftpget(1), ncftp(1), ftp(1), rcp(1), tftp(1).

       LibNcFTP (http://www.ncftp.com/libncftp/).

ncftpls                                     NcFTP Software                                 ncftpls(1)
