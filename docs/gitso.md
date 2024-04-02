GITSO(1)                                                               Gitso                                                              GITSO(1)

NAME
       gitso - Gitso is to support others

SYNOPSIS
       gitso [ --dev | --listen | --connect host | --list list | --low-colors | --version | --help ]

DESCRIPTION
       Gitso is a frontend to reverse VNC connections. It is meant to be a simple two-step process that connects one person to another's screen in
       the context of giving technical support.

OPTIONS
       --dev  Configures paths for running Gitso in the source tree.

       --listen
              Start Gitso and listen for incoming connections

       --connect
              Starts gitso and automatically connects to host which is an IP or domain name (address of support giver).

       --list Alternative support list, where list is either a URL of a remote file or path to local file.

       --low-colors
              Use 8bit colors (for slow connections).

       --version
              The current Gitso version.

       --help Display the help menu.

HOST FILES
       $HOME/.gitso-hosts /etc/gitso-hosts

EXAMPLES
       gitso --list http://support.mydomain.com/techs.txt
              Gets the list of technician IP's or DN's from techs.txt

       gitso --list sanda.mydomain.com,aicha.mydomain.com
              Adds these three entries to the list of support techs.

       gitso --connect hank.mydomain.com
              Automatically connects to hank.mydomain.com

SEE ALSO
       x11vnc vncviewer

AUTHOR
       Aaron Gerber and Derek Buranen

gitso-0.6                                                          October 2008                                                           GITSO(1)
