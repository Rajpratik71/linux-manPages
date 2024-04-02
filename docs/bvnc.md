bssh/bvnc/bshell(1)      General Commands Manual     bssh/bvnc/bshell(1)

NAME
       bssh/bvnc/bshell  -  Browse for SSH/VNC servers on the local net‐
       work

SYNOPSIS
       bssh

       bvnc

       bshell

DESCRIPTION
       bssh/bvnc/bshell browses for SSH/VNC servers on  the  local  net‐
       work,  shows them in a GUI for the user to select one and finally
       calls ssh/vncviewer after a selection was made.

       If the binary is called as bssh only ssh servers will  be  shown.
       If  the  binary is called as bvnc only VNC servers will be shown.
       If the binary is called as bshell both VNC and  SSH  servers  are
       shown.

OPTIONS
       -s | --ssh
              Browse  for  SSH servers (and only SSH servers) regardless
              under which name the binary is called.

       -v | --vnc
              Browse for VNC servers (and only VNC  servers)  regardless
              under which name the binary is called.

       -S | --shell
              Browse for both VNC and SSH servers regardless under which
              name the binary is called.

       -d | --domain= DOMAIN
              Browse   in   the    specified    domain.    If    omitted
              bssh/bvnc/bshell  will  browse  in  the  default  browsing
              domain (usually .local)

       -h | --help
              Show help.

AUTHORS
       The Avahi Developers <avahi (at) lists  (dot)  freedesktop  (dot)
       org>; Avahi is available from http://avahi.org/

SEE ALSO
       avahi-browse(1), ssh(1), vncviewer(1)

COMMENTS
       This man page was written using xml2man(1) by Oliver Kurth.

Manuals                           User               bssh/bvnc/bshell(1)
