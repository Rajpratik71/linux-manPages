ncftp(1)                               General Commands Manual                               ncftp(1)

NAME
       ncftp - Browser program for the File Transfer Protocol

SYNOPSIS
       ncftp [host]

       ncftp [ftp://host.name/directory/]

DESCRIPTION
       The  purpose of ncftp is to provide a powerful and flexible interface to the Internet standard
       File Transfer Protocol.  It is intended to replace the stock ftp program that comes  with  the
       system.

       Although  the  program  appears  to  be rather spartan, you'll find that ncftp has a wealth of
       valuable performance and usage features.  The program was designed with an emphasis on usabil‐
       ity,  and  it does as much as it can for you automatically so you can do what you expect to do
       with a file transfer program, which is transfer files between two interconnected systems.

       Some of the cooler features include progress meters, filename completion,  command-line  edit‐
       ing,  background  processing,  auto-resume  downloads, bookmarking, cached directory listings,
       host redialing, working with firewalls and proxies, downloading entire directory trees,  etc.,
       etc.

       The  ncftp  distribution  comes  with  the useful utility programs ncftpget(1) and ncftpput(1)
       which were designed to do command-line FTP.  In particular, they  are  very  handy  for  shell
       scripts.   This version of ncftp no longer does command-line FTP, since the main ncftp program
       is more of a browser-type program.

   OPTIONS
       The program allows you to specify a host or directory URL on the command line.  This is a syn‐
       onym  for running ncftp and then using the open command.  A few command-line flags are allowed
       with this mode:

       -u XX   Use username XX instead of anonymous.

       -p XX   Use password XX with the username.

       -j XX   Use account XX in supplement to the username and password (deprecated).

       -P XX   Use port number XX instead of the default FTP service port (21).

   INTRODUCTION TO THE COMMAND SHELL
       Upon running the program you are presented a command prompt where you  type  commands  to  the
       program's  shell.   Usually you will want to open a remote filesystem to transfer files to and
       from your local machine's filesystem.  To do that, you need to know the symbolic name  of  the
       remote  system,  or its Internet Protocol (IP) address.  For example, a symbolic name might be
       ``typhoon.unl.edu,'' and its IP address could be ``129.93.33.24.''  To open  a  connection  to
       that system, you use the program's open command:

            open typhoon.unl.edu
            open 129.93.33.24

       Both of these try to open the machine called typhoon at the University of Nebraska.  Using the
       symbolic name is the preferred way, because IP addresses may change without notice, while  the
       symbolic names usually stay the same.

       When  you open a remote filesystem, you need to have permission.  The FTP Protocol's authenti‐
       cation system is very similar to that of logging in to your account.   You  have  to  give  an
       account  name, and its password for access to that account's files.  However, most remote sys‐
       tems that have anything you might be interested in don't require an account name for use.  You
       can  often  get anonymous access to a remote filesystem and exchange files that have been made
       publicly accessible.  The program attempts to get anonymous permission to a remote  system  by
       default.   What actually happens is that the program tries to use ``anonymous'' as the account
       name, and when prompted for a password, uses your E-mail address as a courtesy to  the  remote
       system's  maintainer.  You can have the program try to use a specific account also.  That will
       be explained later.

       After the open command completes successfully, you are connected  to  the  remote  system  and
       logged  in.   You  should now see the command prompt change to reflect the name of the current
       remote directory.  To see what's in the current remote directory, you can use the program's ls
       and dir commands.  The former is terse, preferring more remote files in less screen space, and
       the latter is more verbose, giving detailed information about each item in the directory.

       You can use the program's cd command to move to other directories on the remote  system.   The
       cd command behaves very much like the command of the same name in the Bourne and Korn shell.

       The  purpose of the program is to exchange data with other systems.  You can use the program's
       get command to copy a file from the remote system to your local system:

            get README.txt

       The program will display the progress of the transfer on the screen, so you can tell how  much
       needs  to  be  done before the transfer finishes.  When the transfer does finish, then you can
       enter more commands to the program's command shell.

       You can use the program's put command to copy a file from your system to the remote system:

            put something.tar

       When you are finished using the remote system, you can open another one or use the quit

       Before quitting, you may want to save the current FTP session's settings for later.   You  can
       use the bookmark command to save an entry into your $HOME/.ncftp/bookmarks file.  When you use
       the bookmark command, you also specify a bookmark name, so the next time  instead  of  opening
       the  full  hostname  you  can use the name of the bookmark.  A bookmark acts just like one for
       your web browser, so it saves the remote directory you were in, the  account  name  you  used,
       etc.,  and  other  information it learned so that the next time you use the bookmark it should
       require as little effort from you as possible.

   COMMAND REFERENCE
       help   The first command to know is help.  If you just type

                   help

              from the command shell, the program prints the names of all of the supported  commands.
              From  there,  you  can get specific help for a command by typing the command after, for
              example:

                   help open

              prints information about the open command.

       ascii  This command sets the transfer type to ASCII text.  This is useful for text-only trans‐
              fers  because the concept of text files differs between operating systems.  For example
              on UNIX, a text file denotes line breaks with the linefeed character, while on MS-DOS a
              line  break  is  denoted by both a carriage return character and a line feed character.
              Therefore, for data transfers that you consider the data as text you can use  ascii  to
              ensure that both the remote system and local system translate accordingly.  The default
              transfer type that ncftp uses is not ASCII, but straight binary.

       bgget and bgput
              These commands correspond to the get and put commands explained below, except that they
              do  the  job  in  the background.  Normally when you do a get then the program does the
              download immediately, and does not return control to you until the download  completes.
              The background transfers are nice because you can continue browsing the remote filesys‐
              tem and even open other systems.  In fact, they are done by a daemon process,  so  even
              if  you  log  off your UNIX host the daemon should still do your transfers.  The daemon
              will also automatically continue to retry the transfers until  they  finish.   To  tell
              when  background  jobs  have  finished,  you have to examine the $HOME/.ncftp/spool/log
              file, or run the jobs command from within NcFTP.

              Both the bgget and bgput commands allow you to schedule when to do the transfers.  They
              take  a  ``-@''  parameter,  whose  argument is a date of the form YYYYMMDDhhmmss (four
              digit year, month, day, hour, minute, second).  For example, to schedule a download  at
              3 AM on November 6, you could try:

                   bgget -@ 19971106030000 /pub/idstuff/quake/q2_100.zip

       bgstart
              This  command  tells  ncftp  to  immediately  start  the  background  transfers  you've
              requested, which simply runs a copy of the ncftpbatch program which is responsible  for
              the background jobs.  Normally the program will start the background job as soon as you
              close the current site, open a new site, or quit the program.  The reason for  this  is
              because  since  so  many  users still use slow dialup links that starting the transfers
              would slow things to a crawl, making it difficult to  browse  the  remote  system.   An
              added  bonus  of  starting the background job when you close the site is that ncftp can
              pass off that open connection to the ncftpbatch program.  That is nice when the site is
              always busy, so that the background job doesn't have to wait and get re-logged on to do
              its job.

       binary Sets the transfer type to raw binary, so that no translation is done on the data trans‐
              ferred.  This is the default anyway, since most files are in binary.

       bookmark
              Saves  the  current  session settings for later use.  This is useful to save the remote
              system and remote working directory so you can quickly resume where you left  off  some
              other time.  The bookmark data is stored in your $HOME/.ncftp/bookmarks file.

       bookmarks
              Lists the contents of your $HOME/.ncftp/bookmarks file in a human-readable format.  You
              can use this command to recall the bookmark name of a  previously  saved  bookmark,  so
              that you can use the open command with it.

       cat    Acts  like  the  ``/bin/cat''  UNIX command, only for remote files.  This downloads the
              file you specify and dumps it directly to the screen.  You will probably find the  page
              command  more useful, since that lets you view the file one screen at a time instead of
              printing the entire file at once.

       cd     Changes the working directory on the remote host.  Use this command to move to  differ‐
              ent  areas  on  the  remote server.  If you just opened a new site, you might be in the
              root directory.  Perhaps there was a directory called ``/pub/news/comp.sources.d'' that
              someone told you about.  From the root directory, you could:

                   cd pub
                   cd news
                   cd comp.sources.d

              or, more concisely,

                   cd /pub/news/comp.sources.d

              Then,  commands such as get, put, and ls could be used to refer to items in that direc‐
              tory.

              Some shells in the UNIX environment have a feature I like, which is  switching  to  the
              previous directory.  Like those shells, you can do:

                   cd -

              to change to the last directory you were in.

       chmod  Acts like the ``/bin/chmod'' UNIX command, only for remote files.  However, this is not
              a standard command, so remote FTP servers may not support it.

       close  Disconnects you from the remote server.  The program does this  for  you  automatically
              when  needed,  so  you can simply open other sites or quit the program without worrying
              about closing the connection by hand.

       debug  This command is mostly for internal testing.  You could type

                   debug 1

              to turn debugging mode on.  Then you could see all messages between the program and the
              remote  server,  and  things  that  are  only printed in debugging mode.  However, this
              information is also available in the $HOME/.ncftp/trace file,  which  is  created  each
              time you run ncftp.  If you need to report a bug, send a trace file if you can.

       dir    Prints  a  detailed  directory  listing.  It tries to behave like UNIX's ``/bin/ls -l''
              command.  If the remote server seems to be a UNIX host, you can also use the same flags
              you would with ls, for instance

                   dir -rt

              would try to act like

                   /bin/ls -lrt

              would on UNIX.

       edit   Downloads into a temporary file for editing on the local host, then uploads the changed
              file back to the remote host.

       get    Copies files from the current working directory on the remote host  to  your  machine's
              current  working  directory.   To place a copy of ``README'' and ``README.too'' in your
              local directory, you could try:

                   get README README.too

              You could also accomplish that by using a wildcard expression, such as:

                   get README*

              This command is similar to the behavior  of  other  FTP  programs'  mget  command.   To
              retrieve  a  remote  file  but  give  it a different name on your host, you can use the
              ``-z'' flag.  This example shows how to download a file called ReadMe.txt but  name  it
              locally as README:

                   get -z ReadMe.txt README

              The  program  tries  to ``resume'' downloads by default.  This means that if the remote
              FTP server lost the connection and was only able to send 490 kilobytes of a  500  kilo‐
              byte  file,  you  could reconnect to the FTP server and do another get on the same file
              name and it would get the last 10 kilobytes, instead  of  retrieving  the  entire  file
              again.   There are some occasions where you may not want that behavior.  To turn it off
              you can use the ``-f'' flag.

              There are also times where you want to append to an existing file.  You can do this  by
              using the ``-A'' flag, for example

                   get -A log.11

              would append to a file named ``log.11'' if it existed locally.

              Another  thing  you  can do is delete a remote file after you download it.  This can be
              useful when a remote host expects a file to be removed when it has been retrieved.  Use
              the double-D flag, such as ``get -DD'' to do this.

              The  get  command  lets  you retrieve entire directory trees, too.  Although it may not
              work with some remote systems, you can try ``get -R'' with a directory to download  the
              directory and its contents.

              When  using  the ``-R'' flag, you can also use the ``-T'' flag to disable automatic on-
              the-fly TAR mode for downloading whole directory trees.  The program uses TAR  whenever
              possible since this usually preserves symbolic links and file permissions. TAR mode can
              also result in faster transfers for directories containing many small  files,  since  a
              single  data  connection  can be used rather than an FTP data connection for each small
              file. The downside to using TAR is that it forces downloading of the  whole  directory,
              even  if  you had previously downloaded a portion of it earlier, so you may want to use
              this option if you want to resume downloading of a directory.

       jobs   Views the list of currently executing NcFTP background tasks.  This actually just  runs
              ncftpbatch -l for you.

       lcd    The  lcd  command  is  the first of a few ``l'' commands that work with the local host.
              This changes the current working directory on the local host.  If you want to  download
              files  into  a different local directory, you could use lcd to change to that directory
              and then do your downloads.

       lchmod Runs ``/bin/chmod'' on the local host.

       lls    Another local command that comes in handy is the lls command, which runs ``/bin/ls'' on
              the  local host and displays the results in the program's window.  You can use the same
              flags with lls as you would in your command shell, so you can do things like:

                   lcd ~/doc
                   lls -lrt p*.txt

       lmkdir Runs ``/bin/mkdir'' on the local host.

       lookup The program also has a built-in interface to the name service via the  lookup  command.
              This means you can lookup entries for remote hosts, like:

                   lookup cse.unl.edu ftp.cs.unl.edu sphygmomanometer.unl.edu

              prints:

                   cse.unl.edu               129.93.33.1
                   typhoon.unl.edu           129.93.33.24
                   sphygmomanometer.unl.edu  129.93.33.126

              There is also a more detailed option, enabled with ``-v,'' i.e.:

                   lookup -v cse.unl.edu ftp.cs.unl.edu

              prints:

                   cse.unl.edu:
                       Name:     cse.unl.edu
                       Address:  129.93.33.1

                   ftp.cs.unl.edu:
                       Name:     typhoon.unl.edu
                       Alias:    ftp.cs.unl.edu
                       Address:  129.93.33.24

              You can also give IP addresses, so this would work too:

                   lookup 129.93.33.24

              prints:

                   typhoon.unl.edu           129.93.33.24

       lpage  Views a local file one page at a time, with your preferred $PAGER program.

       lpwd   Prints  the current local directory.  Use this command when you forget where you are on
              your local machine.

       lrename
              Runs ``/bin/mv'' on the local host.

       lrm    Runs ``/bin/rm'' on the local host.

       lrmdir Runs ``/bin/rmdir'' on the local host.

       ls     Prints a directory listing from the remote system.  It  tries  to  behave  like  UNIX's
              ``/bin/ls -CF''  command.   If  the remote server seems to be a UNIX host, you can also
              use the same flags you would with ls, for instance

                   ls -rt

              would try to act like

                   /bin/ls -CFrt

              would on UNIX.

              ncftp has a powerful built-in system for dealing with directory listings.  It tries  to
              cache  each one, so if you list the same directory, odds are it will display instantly.
              Behind the scenes, ncftp always tries a long listing, and then reformats it as it needs
              to.   So even if your first listing of a directory was a regular ``ls'' which displayed
              the files in columns, your next listing could be ``ls -lrt'' and ncftp would still  use
              the cached directory listing to quickly display the information for you!

       mkdir  Creates  a  new directory on the remote host.  For many public archives, you won't have
              the proper access permissions to do that.

       open   Establishes an FTP control connection to a remote host.   By  default,  ncftp  logs  in
              anonymously  to  the remote host.  You may want to use a specific user account when you
              log in, so you can use the ``-u'' flag to specify which user.  This example  shows  how
              to open the host ``bowser.nintendo.co.jp'' using the username ``mario:''

                   open -u mario bowser.nintendo.co.jp

              Here is a list of options available for use with the open command:

              -u XX Use username XX instead of anonymous.

              -p XX Use password XX with the username.

              -j XX Use account XX in supplement to the username and password (deprecated).

              -P XX Use port number XX instead of the default FTP service port (21).

       page   Browses  a  remote  file one page at a time, using your $PAGER program.  This is useful
              for reading README's on the remote host without downloading them first.

       pdir and pls
              These commands are equivalent to dir and ls respectively, only they feed  their  output
              to  your  pager.   These  commands are useful if the directory listing scrolls off your
              screen.

       put    Copies files from the local host to the remote machine's current working directory.  To
              place a copy of ``xx.zip'' and ``yy.zip'' in the remote directory, you could try:

                   put xx.zip yy.zip

              You could also accomplish that by using a wildcard expression, such as:

                   put *.zip

              This command is similar to the behavior of other FTP programs' mput command.  To send a
              remote file but give it a different name on your host, you can  use  the  ``-z''  flag.
              This  example  shows  how  to  upload a file called ``ncftpd-2.0.6.tar.gz'' but name it
              remotely as ``NFTPD206.TGZ:''

                   put -z ncftpd-2.0.6.tar.gz NFTPD206.TGZ

              The program does not try to ``resume'' uploads by default.  If you do want to resume an
              upload, use the ``-z'' flag.

              There  are  also times where you want to append to an existing remote file.  You can do
              this by using the ``-A'' flag, for example

                   put -A log11.txt

              would append to a file named ``log11.txt'' if it existed on the remote server.

              Another thing you can do is delete a local file after you upload it.  Use the  double-D
              flag, such as ``put -DD'' to do this.

              The  put  command  lets  you  send  entire directory trees, too.  It should work on all
              remote systems, so you can try ``put -R'' with a directory to upload the directory  and
              its contents.

       pwd    Prints  the  current  remote working directory.  A portion of the pathname is also dis‐
              played in the shell's prompt.

       quit   Of course, when you finish using the program, type quit to end the program  (You  could
              also use bye, exit, or ^D).

       quote  This can be used to send a direct FTP Protocol command to the remote server.  Generally
              this isn't too useful to the average user.

       rename If you need to change the name of a remote file, you can use the rename command, like:

                   rename SPHYGMTR.TAR sphygmomanometer-2.3.1.tar

       rhelp  Sends a help request to the remote server.  The list of FTP Protocol commands is  often
              printed,  and  sometimes  some  other  information that is actually useful, like how to
              reach the site administrator.

              Depending on the remote server, you may be able to give a parameter to the server also,
              like:

                   rhelp NLST

              One server responded:

                   Syntax: NLST [ <sp> path-name ]

       rm     If  you need to delete a remote file you can try the rm command.  Much of the time this
              won't work because you won't have the proper access permissions.  This command  doesn't
              accept any flags, so you can't nuke a whole tree by using ``-rf'' flags like you can on
              UNIX.

       rmdir  Similarly, the rmdir command removes a directory.  Depending on the remote server,  you
              may be able to remove a non-empty directory, so be careful.

       set    This  lets  you  configure  some program variables, which are saved between runs in the
              $HOME/.ncftp/prefs file.  The basic syntax is:

                   set <option> <value>

              For example, to change the value you use for the anonymous password, you might do:

                   set anon-password devnull@example.com

              See the next section for a list of things you change.

       show   This lets you display program variables.  You can do ``show all''  to  display  all  of
              them, or give a variable name to just display that one, such as:

                   show anon-password

       site   One  obscure  command you may have to use someday is site.  The FTP Protocol allows for
              ``site specific'' commands.  These ``site'' commands vary of course, such as:

                   site chmod 644 README

              Actually, ncftp's chmod command really does the above.

              Try doing one of these to see what the remote server supports, if any:

                   rhelp SITE
                   site help

       type   You may need to change transfer types during the course of a  session  with  a  server.
              You can use the type command to do this.  Try one of these:

                   type ascii
                   type binary
                   type image

              The  ascii command is equivalent to ``type a'', and the binary command is equivalent to
              ``type i'' and ``type b''.

       umask  Sets the process' umask on the remote server, if it has any concept of a umask, i.e.:

                   umask 077

              However, this is not a standard command, so remote FTP servers may not support it.

       version
              This command dumps some information about the particular edition of the program you are
              using, and how it was installed on your system.

   VARIABLE REFERENCE
       anon-password
              Specifies  what  to use for the password when logging in anonymously.  Internet conven‐
              tion has been to use your E-mail address as a courtesy to the site  administrator.   If
              you  change  this,  be aware that some sites require (i.e. they check for) valid E-mail
              addresses.

       auto-resume
              NcFTP 3 now prompts the user by default when you try to download a  file  that  already
              exists  locally,  or upload a file that already exists remotely.  Older versions of the
              program automatically guessed whether to overwrite the  existing  file  or  attempt  to
              resume  where  it  left off, but sometimes the program would guess wrong.  If you would
              prefer that the program always guess which action to take, set this  variable  to  yes,
              otherwise, leave it set to no and the program will prompt you for which action to take.

       auto-ascii
              If  set  to  a list of pipe-character delimited extensions, files with these extensions
              will be sent in ASCII mode even if binary mode is currently  in  effect.   This  option
              allows  you  to  transfer  most files in binary, with the exception of a few well-known
              file types that should be sent in ASCII.  This option is enabled by default, and set to
              a list of common extensions (e.g., .txt and .html).

       autosave-bookmark-changes
              With  the  advent  of  version  3 of NcFTP, the program treats bookmarks more like they
              would with your web browser, which means that once you bookmark the  site,  the  remote
              directory  is static.  If you set this variable to yes, then the program will automati‐
              cally update the bookmark's starting remote directory with the directory  you  were  in
              when you closed the site.  This behavior would be more like that of NcFTP version 2.

       confirm-close
              By  default  the program will ask you when a site you haven't bookmarked is about to be
              closed.  To turn this prompt off, you can set this variable to no.

       connect-timeout
              Previous versions of the program used a single timeout value for everything.   You  can
              now  have different values for different operations.  However, you probably do not need
              to change these from the defaults unless you have special requirements.

              The connect-timeout variable controls how long to wait, in seconds,  for  a  connection
              establishment  to complete before considering it hopeless.  You can choose to not use a
              timeout at all by setting this to -1.

       control-timeout
              This is the timer used when ncftp sends an FTP command over the control  connection  to
              the remote server.  If the server hasn't replied in that many seconds, it considers the
              session lost.

       logsize
              This is controls how large the transfer log ($HOME/.ncftp/log) can grow  to,  in  kilo‐
              bytes.  The default is 200, for 200kB; if you don't want a log, set this to 0.

       pager  This is the external program to use to view a text file, and is more by default.

       passive
              This  controls ncftp's behavior for data connections, and can be set to one of on, off,
              or the default, optional.  When passive mode is on, ncftp uses the FTP  command  primi‐
              tive PASV to have the client establish data connections to the server.  The default FTP
              protocol behavior is to use the FTP command primitive PORT which has the server  estab‐
              lish  data connections to the client.  The default setting for this variable, optional,
              allows ncftp to choose whichever method it deems necessary.

       progress-meter
              You can change how the program reports file transfer status.  Select from meter  2,  1,
              or 0.

       redial-delay
              When  a  host  is  busy or unavailable, the program waits this number of seconds before
              trying again.  The smallest you can set this is to 10 seconds -- so if you  were  plan‐
              ning on being inconsiderate, think again.

       save-passwords
              If  you  set this variable to yes, the program will save passwords along with the book‐
              marks you save.  While this makes non-anonymous logins more  convenient,  this  can  be
              very  dangerous since your account information is now sitting in the $HOME/.ncftp/book‐
              marks file.  The passwords aren't in clear text, but it is still trivial to decode them
              if someone wants to make a modest effort.

       show-status-in-xterm-titlebar
              If  set  to  yes and operating from within an xterm window, the program will change the
              window's titlebar accordingly.

       so-bufsize
              If your operating system supports TCP Large Windows, you can try setting this  variable
              to  the  number  of  bytes to set the TCP/IP socket buffer to.  This option won't be of
              much use unless the remote server also supports large window sizes and  is  pre-config‐
              ured with them enabled.

       xfer-timeout
              This  timer  controls how long to wait for data blocks to complete.  Don't set this too
              low or else your transfers will timeout without completing.

   FIREWALL AND PROXY CONFIGURATION
       You may find that your network administrator has placed a firewall between  your  machine  and
       the Internet, and that you cannot reach external hosts.

       The answer may be as simple as setting ncftp to use passive mode only, which you can do from a
       ncftp command prompt like this:

            set passive on

       The reason for this is because many firewalls do not allow incoming connections to  the  site,
       but  do  allow  users  to establish outgoing connections.  A passive data connection is estab‐
       lished by the client to the server, whereas the default is for the  server  to  establish  the
       connection to the client, which firewalls may object to.  Of course, you now may have problems
       with sites whose primitive FTP servers do not support passive mode.

       Otherwise, if you know you need to have ncftp communicate directly with a firewall  or  proxy,
       you  can try editing the separate $HOME/.ncftp/firewall configuration file.  This file is cre‐
       ated automatically the first time you run the program, and contains all  the  information  you
       need to get the program to work in this setup.

       The  basics  of  this  process  are  configuring a firewall (proxy) host to go through, a user
       account and password for authentication on the firewall, and which type of firewall method  to
       use.   You can also setup an exclusion list, so that ncftp does not use the firewall for hosts
       on the local network.

FILES
       $HOME/.ncftp/bookmarks
              Saves bookmark and host information.

       $HOME/.ncftp/firewall
              Firewall access configuration file.

       $HOME/.ncftp/prefs
              Program preferences.

       $HOME/.ncftp/trace
              Debugging output for entire program run.

       $HOME/.ncftp/v3init
              Used to tell if this version of the program has run before.

       $HOME/.ncftp/spool/
              Directory where background jobs are stored in the form of spool configuration files.

       $HOME/.ncftp/spool/log
              Information for background data transfer processes.

ENVIRONMENT
       PATH   User's search path, used to find the ncftpbatch program, pager, and some  other  system
              utilities.

       PAGER  Program to use to view text files one page at a time.

       TERM   If  the  program was compiled with support for GNU Readline it will need to know how to
              manipulate the terminal correctly for line-editing, etc.  The pager program  will  also
              take advantage of this setting.

       HOME   By  default,  the program writes its configuration data in a .ncftp subdirectory of the
              HOME directory.

       NCFTPDIR
              If set, the program will use this directory instead of $HOME/.ncftp.  This variable  is
              optional except for those users whose home directory is the root directory.

       COLUMNS
              Both  the  built-in  ls  command and the external ls command need this to determine how
              many screen columns the terminal has.

BUGS
       There are no such sites named bowser.nintendo.co.jp or sphygmomanometer.unl.edu.

       Auto-resume should check the file timestamps instead of relying upon just the file sizes,  but
       it is difficult to do this reliably within FTP.

       Directory caching and recursive downloads depend on UNIX-like behavior of the remote host.

AUTHOR
       Mike Gleason, NcFTP Software (http://www.ncftp.com).

SEE ALSO
       ncftpput(1), ncftpget(1), ncftpbatch(1), ftp(1), rcp(1), tftp(1).

       LibNcFTP (http://www.ncftp.com/libncftp).

       NcFTPd (http://www.ncftp.com/ncftpd).

THANKS
       Thanks  to  everyone who uses the program.  Your support is what drives me to improve the pro‐
       gram!

       I thank Dale Botkin and Tim Russell at my former ISP, Probe Technology.

       Ideas and some code contributed by my partner, Phil Dietz.

       Thanks to Brad Mittelstedt and Chris Tjon, for driving and refining  the  development  of  the
       backbone of this project, LibNcFTP.

       I'd  like  to  thank  my former system administrators, most notably Charles Daniel, for making
       testing on a variety of platforms possible, letting me have some extra  disk  space,  and  for
       maintaining the UNL FTP site.

       For  testing  versions 1 and 2 above and beyond the call of duty, I am especially grateful to:
       Phil Dietz, Kok Hon Yin, and Andrey A. Chernov (ache@astral.msk.su).

       Thanks to Tim MacKenzie (t.mackenzie@trl.oz.au) for the original filename completion code  for
       version 2.3.0 and 2.4.2.

       Thanks to DaviD W. Sanderson (dws@ora.com), for helping me out with the man page.

       Thanks to those of you at UNL who appreciate my work.

       Thanks  to  Red Hat Software for honoring my licensing agreement, but more importantly, thanks
       for providing a solid and affordable development platform.

APOLOGIES
       To the users, for not being able to respond personally to most of your inquiries.

       To Phil, for things not being the way they should be.

ncftp                                       NcFTP Software                                   ncftp(1)
