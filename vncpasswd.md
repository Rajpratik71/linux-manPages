vncpasswd(1)                                                                              Virtual Network Computing                                                                              vncpasswd(1)



NAME
       vncpasswd - change the VNC password

SYNOPSIS
       vncpasswd [passwd-file]
       vncpasswd -f

DESCRIPTION
       vncpasswd  allows  you to set the password used to access VNC desktops.  Its default behavior is to prompt for a VNC password and then store an obfuscated version of this password to passwd-file (or
       to $HOME/.vnc/passwd if no password file is specified.)  The vncserver script runs vncpasswd the first time you start a VNC desktop, and  it  invokes  Xvnc  with  the  appropriate  -rfbauth  option.
       vncviewer can also be given a password file to use via the -passwd option.

       The  password must be at least six characters long (unless the -f command-line option is used-- see below), and only the first eight characters are significant.  Note that the stored password is not
       encrypted securely - anyone who has access to this file can trivially find out the plain-text password, so vncpasswd always sets appropriate permissions (read and write only by the owner.)  However,
       when accessing a VNC desktop, a challenge-response mechanism is used over the wire making it hard for anyone to crack the password simply by snooping on the network.


OPTIONS
       -f     Filter mode.  Read a plain-text password from stdin and write an encrypted version to stdout.  Note that in filter mode, short or even empty passwords will be silently accepted.



FILES
       $HOME/.vnc/passwd
              Default location of the VNC password file.


SEE ALSO
       vncviewer(1), vncserver(1), Xvnc(1) vncconfig(1),
       http://www.tigervnc.org


AUTHORS
       Tristan Richardson, RealVNC Ltd., Antoine Martin, D. R. Commander and others.

       VNC  was  originally  developed by the RealVNC team while at Olivetti Research Ltd / AT&T Laboratories Cambridge.  TightVNC additions were implemented by Constantin Kaplinsky. Many other people have
       since participated in development, testing and support. This manual is part of the TigerVNC software suite.



TigerVNC                                                                                                                                                                                         vncpasswd(1)
