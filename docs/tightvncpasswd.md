vncpasswd(1)                                                                                     TightVNC                                                                                    vncpasswd(1)

NAME
       vncpasswd - set passwords for VNC server

SYNOPSIS
       vncpasswd [file]
       vncpasswd -t
       vncpasswd -f

DESCRIPTION
       The  vncpasswd  utility should be used to create and change passwords for the TightVNC server authentication. Xvnc uses such passwords when started with the -rfbauth command-line option (or when
       started from the vncserver script).

       vncpasswd allows to enter either one or two passwords. The first password is the primary one, the second password can be used for view-only authentication. Xvnc will restrict mouse and  keyboard
       input from clients who authenticated with the view-only password. The vncpasswd utility asks interactively if it should set the second password.

       The password file name defaults to $HOME/.vnc/passwd unless the -t command-line option was used (see the OPTIONS section below). The $HOME/.vnc/ directory will be created if it does not exist.

       Each  password  has  to  be  longer than five characters (unless the -f command-line option was used, see its description below).  Only the first eight characters are significant. If the primary
       password is too short, the program will abort. If the view-only password is too short, then only the primary password will be saved.

       Unless a file name was provided in the command-line explicitly, this utility may perform certain sanity checks to prevent writing a password file into some hazardous place.

       If at least one password was saved successfully, vncpasswd will exit with status code 0. Otherwise the returned status code will be set to 1.

OPTIONS
       -t     Write passwords into /tmp/$USER-vnc/passwd, creating the /tmp/$USER-vnc/ directory if it does not exist, and checking the permissions on that directory (the mode must be 700). This option
              can help to improve security when your home partition may be shared via network (e.g. when using NFS).

       -f     Filter  mode. Read plain-text passwords from stdin, write encrypted versions to stdout. One or two passwords (full-control and view-only) can be supplied in the input stream, newline ter‐
              minates a password.  Note that in the filter mode, short or even empty passwords will be silently accepted.

SEE ALSO
       vncserver(1), Xvnc(1), vncviewer(1), vncconnect(1)

AUTHORS
       Original VNC was developed in AT&T Laboratories Cambridge. TightVNC additions were implemented by Constantin Kaplinsky. Many other people participated in development, testing and support.

       Man page authors:
       Marcus Brinkmann <Marcus.Brinkmann@ruhr-uni-bochum.de>,
       Tim Waugh <twaugh@redhat.com>,
       Constantin Kaplinsky <const@tightvnc.com>

                                                                                               August 2006                                                                                   vncpasswd(1)
