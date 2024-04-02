GFTP(1)                                                       General Commands Manual                                                      GFTP(1)

NAME
       gftp - file transfer client for *NIX based machines.

SYNOPSIS
       gftp [options] [[proto://][ user : [pass] @] server [: port ][/ directory ]]

DESCRIPTION
       gFTP  is  a file transfer client for *NIX based machines. It currently has a text interface and a GTK+ 1.2/2.x graphical interface. It cur‐
       rently supports the FTP, FTPS (control connection only), HTTP, HTTPS, SSH and FSP protocols.

OPTIONS
       You may enter a url on the command line that gFTP will automatically connect to when it starts up.

       --help, -h
              Display program usage.

       --info Display some information about how gFTP was built. Please send the output of this command when submitting a bug report.

       --version, -v
              Display the current version of gFTP.

       proto  This specifies the protocol that should be used. It can currently be one of the following options: ftp, ftps, http, https, ssh, fsp,
              local and bookmark. If omitted, the protocol specified by the default_protocol option will be used.

       user   The username that will be used to log into the remote server. If omitted, your current username will be used for most protocols. For
              the FTP protocol, the anonymous username will be used.

       pass   The password that will be used to log into the remote server. If omitted, you will be prompted for the password. If  you  are  using
              the FTP protocol, and the username is anonymous, then your email address will be used as the password.

       server The remote server to connect to.

       port   The  remote port on the server to connect to. If omitted, the default port for the protocol will be used. The port will be looked up
              in the services(5) file.

       directory
              The directory to change to once you are connected to the remote server.

FILES
       ~/.gftp/gftprc
              Per user configuration file. Most of these options can be edited inside gFTP. This file is also commented very well.   ~/.gftp/book‐
              marks
                     Per user bookmarks file.

BUGS
       If you find any bugs in gFTP, please report them to GNOME's Bugzilla at http://bugzilla.gnome.org/

AUTHOR
       Brian Masney <masneyb@gftp.org> - http://www.gftp.org/

                                                                    MARCH 2007                                                             GFTP(1)
