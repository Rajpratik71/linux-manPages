Xvnc(1)                                           VNC                                          Xvnc(1)

NAME
       Xvnc - VNC® Server in Virtual Mode implementation

SYNOPSIS
       Xvnc [OPTION...] [:DISPLAY]

       Xvnc [OPTION...] COMMAND

DESCRIPTION
       Xvnc implements VNC Server in Virtual Mode.

       The  recommended way to start and work with VNC Server in Virtual Mode is to run vncserver-vir‐
       tual. This wrapper passes OPTIONS directly to Xvnc in order to create a virtual desktop, and in
       addition runs a default desktop environment, handles logging, and prompts for a password if the
       VNC password authentication scheme is chosen.

       See vncserver-virtual(1) for further information, and in particular for  details  of  available
       OPTIONS.

COMMANDS
       The  following  commands,  performing  auxiliary operations on an existing virtual desktop, can
       only be applied to Xvnc. The current value of the DISPLAY environment variable is used  to  de‐
       termine which virtual desktop to affect.

       -connect HOST[::PORT]
              Establishes  a reverse connection to a Listening VNC Viewer on HOST at PORT (5500 by de‐
              fault). See vncviewer(1).

       -disconnect
              Disconnects all VNC Viewers.

       -generatekeys [force]
              Generates and stores an RSA private key; force overwrites an existing key. Rsa*  parame‐
              ters may be specified first, in particular RsaModulusBits.

       -reload
              Reloads all license keys and configuration files.

       -stop  Stops VNC Server, disconnecting all VNC Viewers, and destroying the virtual desktop.

       -showexistingstatus
              Causes the VNC Server status dialog to be displayed to connected VNC Viewers.

SEE ALSO
       vncserver-virtual(1), vncviewer(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC  and  VNC  are  trademarks  of RealVNC Ltd and are protected by trademark registrations
       and/or pending trademark applications in the European Union, United States of America and other
       jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                    June 2018                                       Xvnc(1)
