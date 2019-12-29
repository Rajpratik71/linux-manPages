STARTX(1)                               General Commands Manual                              STARTX(1)

NAME
       startx - initialize an X session

SYNOPSIS
       startx [ [ client ] options ... ] [ -- [ server ] [ display ] options ... ]

DESCRIPTION
       The  startx script is a front end to xinit(1) that provides a somewhat nicer user interface for
       running a single session of the X Window System.  It is often run with no arguments.

       Arguments immediately following the startx command are used to start a client in the same  man‐
       ner as xinit(1).  The special argument '--' marks the end of client arguments and the beginning
       of server options.  It may be convenient to specify server options with startx to  change  them
       on  a per-session basis.  Some examples of specifying server arguments follow; consult the man‐
       ual page for your X server to determine which arguments are legal.

              startx -- -depth 16

              startx -- -dpi 100

              startx -- -layout Multihead

       Note that in the Debian system, what many people traditionally put in the .xinitrc file  should
       go  in  .xsession  instead; this permits the same X environment to be presented whether startx,
       xdm, or xinit is used to start the X session. All  discussion  of  the  .xinitrc  file  in  the
       xinit(1)  manual  page  applies  equally well to .xsession.  Keep in mind that .xinitrc is used
       only by xinit(1) and completely ignored by xdm(1).

       To determine the client to run, startx looks for the following files, in order:

              $(HOME)/.startxrc

              /usr/lib/x86_64-linux-gnu/sys.startxrc

              $(HOME)/.xinitrc

              /etc/X11/xinit/xinitrc

       If command line client options are given,  they  override  this  behavior  and  revert  to  the
       xinit(1)  behavior.   To  determine  the  server  to  run, startx first looks for a file called
       .xserverrc in the user's home directory.  If that is not found, it uses the file  xserverrc  in
       the  xinit library directory.  If command line server options are given, they override this be‐
       havior and revert to the xinit(1) behavior.  Users rarely need to provide  a  .xserverrc  file.
       See the xinit(1) manual page for more details on the arguments.

       The system-wide xinitrc and xserverrc files are found in the /etc/X11/xinit directory.

ENVIRONMENT VARIABLES
       DISPLAY                  This  variable  gets  set  to the name of the display to which clients
                                should connect.  Note that this gets set, not read.

       XAUTHORITY               This variable, if not already defined, gets set  to  $(HOME)/.Xauthor‐
                                ity.   This  is  to prevent the X server, if not given the -auth argu‐
                                ment, from automatically setting up insecure host-based authentication
                                for  the local host.  See the Xserver(1) and Xsecurity(7) manual pages
                                for more information on X client/server authentication.

FILES
       $(HOME)/.xinitrc         Client to run.  Typically a shell script which runs many  programs  in
                                the background.

       $(HOME)/.xserverrc       Server to run.  The default is X.

       /etc/X11/xinit/xinitrc   Client to run if the user has no .xinitrc file.

       /etc/X11/xinit/xserverrc Server to run if the user has no .xserverrc file.

SEE ALSO
       xinit(1), X(7), Xserver(1), Xorg(1), xorg.conf(5)

X Version 11                                  xinit 1.4.1                                    STARTX(1)
