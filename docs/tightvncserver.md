vncserver(1)                                                                                     TightVNC                                                                                    vncserver(1)

NAME
       vncserver - a wrapper to launch an X server for VNC.

SYNOPSIS
       vncserver  [:display]  [-geometry  widthxheight]  [-depth  depth]  [-pixelformat  rgbNNN|bgrNNN]  [-name  desktop-name] [ -httpport int ] [ -basehttpport int ] [ -alwaysshared ] [ -nevershared ]
       [Xvnc-options...]

       vncserver [ -clean ] -kill :display

       vncserver -help

DESCRIPTION
       vncserver is a wrapper script for Xvnc, the free X server for VNC (Virtual Network Computing). It provides all capabilities of a standard X server, but does not connect to a display for  itself.
       Instead, Xvnc creates a virtual desktop you can view or control remotely using a VNC viewer.

OPTIONS
       You can add Xvnc options at the command line. They will be added to the invocation of Xvnc without changes. The options provided by the vncserver itself are as follows:

       :display
              The display number to use. If omitted, the next free display number is used.

       -geometry widthxheight
              Set desktop width and height.

       -depth depth
              Set the colour depth of the visual to provide, in bits per pixel. Must be a value between 8 and 32.

       -pixelformat rgbNNN|bgrNNN
              Set  colour  format  for pixels representation. The viewer can do the conversion to any other pixel format, but it is faster if the depth and pixel format of the server is the same as the
              equivalent values on the viewer display.

       -name string
              This specifies the name of the desktop.

       -clean This option can be used in conjunction with

       -kill :display
              Stops the session running on the specified display.

       -nevershared
              Never allow shared desktops.

       -alwaysshared
              Always allow shared desktops.

       -basehttpport int
              The base http port to use for the java client applet (you have to install the tightvnc-java package to make this work). The real port number will be port = base + display num.

       -httpport int
              The http port to use for the java client applet (you have to install the tightvnc-java package to make this work).

       -help  Prints a short usage notice to stderr.

EXAMPLES
       vncserver
              Invokes Xvnc on the next available display and with suitable defaults.

       vncserver :1
              Invokes Xvnc on display :1.

       vncserver -geometry 800x600 -depth 16 :1
              Invokes Xvnc on display :1 with desktop size of 800x600 pixels and color depth of 16 bits per pixel.

       vncserver -kill :1
              Shuts down Xvnc server on display :1.

FILES
       /etc/tightvncserver.conf
              System-wide configuration file of TightVNC Server.

       $HOME/.vnc/tightvncserver.conf
              User configuration file of TightVNC Server. Its setting override system-wide configuration.

SEE ALSO
       Xvnc(1), vncviewer(1), vncpasswd(1), vncconnect(1)

AUTHORS
       Original VNC was developed in AT&T Laboratories Cambridge. TightVNC additions were implemented by Constantin Kaplinsky. Many other people participated in development, testing and support.

       Man page authors:
       Marcus Brinkmann <Marcus.Brinkmann@ruhr-uni-bochum.de>,
       Tim Waugh <twaugh@redhat.com>,
       Constantin Kaplinsky <const@tightvnc.com>

                                                                                               August 2006                                                                                   vncserver(1)
