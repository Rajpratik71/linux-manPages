Xvnc(1)                                                                                          TightVNC                                                                                         Xvnc(1)

NAME
       Xvnc - an X server providing VNC connectivity

SYNOPSIS
       Xvnc   [:display]  [-geometry  widthxheight]  [-depth  depth]  [-pixelformat  rgbNNN|bgrNNN]  [-udpinputport port] [-rfbport port] [-rfbwait time] [-nocursor] [-rfbauth passwd-file] [-httpd dir]
              [-httpport port] [-deferupdate time] [-economictranslate] [-lazytight] [-desktop name]  [-alwaysshared]  [-nevershared]  [-dontdisconnect]  [-viewonly]  [-localhost]  [-interface  ipaddr]
              [-inetd] [-compatiblekbd] [X-options...]

DESCRIPTION
       Xvnc  is  a  VNC  (Virtual  Network  Computing)  server. It acts like an X server with a virtual display. The display can be seen by a VNC viewer application, which may be running on a different
       machine: see vncviewer(1). Xvnc is built inside the source code tree of XFree86, and shares many options with it.

       Normally, you don't need to start Xvnc manually; use the vncserver(1) wrapper script instead. This script sets reasonable defaults for Xvnc session, checks many error conditions etc.

       Please read the BUGS section if you plan to use VNC on an untrusted network.

OPTIONS
       Xvnc supports many standard X server options and a number of VNC-specific options. To see what standard X server options are supported, please  look  at  the  Xvnc  -help  output  and  read  the
       Xserver(1) manual page for details on those options.

       The VNC-specific options are as follows:

       -geometry widthxheight
              Set desktop width and height.

       -depth depth
              Set the colour depth of the visual to provide, in bits per pixel. Must be a value between 8 and 32.

       -pixelformat rgbNNN|bgrNNN
              Set  colour  format  for pixels representation. The viewer can do the conversion to any other pixel format, but it is faster if the depth and pixel format of the server is the same as the
              equivalent values on the viewer display.

       -udpinputport port
              UDP port for keyboard/pointer data.

       -rfbport port
              TCP port for RFB protocol. The RFB protocol is used for commnunication between VNC server and clients.

       -rfbwait time
              Maximum time, in milliseconds, to wait for an RFB client (VNC viewer).

       -nocursor
              Don't put up a pointer cursor on the desktop.

       -rfbauth passwd-file
              Use authentication on RFB protocol from the specified file. The passwd-file can be created using the vncpasswd(1) utility.

       -httpd dir
              Serve files via HTTP protocol from the specified directory. Normally, Java viewer classes are stored in such directory.

       -httpport port
              TCP port on which Xvnc should listen for incoming HTTP connections (to allow access to the desktop from any Java-capable browser).

       -deferupdate time
              Time in milliseconds, to defer screen updates (default 40). Deferring updates helps to coalesce many small desktop changes into a few larger updates thus saving network bandwidth.

       -economictranslate
              Use less memory-hungry pixel format translation.

       -lazytight
              Disable the "gradient" filter in Tight encoding (TightVNC-specific).  The "gradient" filter often helps to improve data compression ratios, but  may  slow  down  the  server  performance.
              Please note that this filter is never used when a client enables JPEG compression in the Tight encoding.

       -desktop name
              Set VNC desktop name ("x11" by default).

       -alwaysshared
              Always treat new clients as shared, never disconnect existing client on a new client connection.

       -nevershared
              Never treat new clients as shared, do not allow several simultaneous client connections.

       -dontdisconnect
              Don't disconnect existing clients when a new non-shared connection comes in, refuse new connection instead.

       -viewonly
              Don't accept keboard and pointer events from clients. All clients will be able to see the desktop but won't be able to control it.

       -localhost
              Only allow loopback connections from localhost. This option is useful in conjunction with SSH tunneling.

       -interface ipaddr
              Listen for client connections only on the network interface with given ipaddr.

       -inetd Xvnc is launched by inetd. This option causes Xvnc to redirect network input/output to stdin/stdout.

       -compatiblekbd
              Set META and ALT keys to the same X modifier flag, as in the original version of Xvnc by AT&T labs (TightVNC-specific).

BUGS
       There  are  many  security problems in current Xvnc implementation. It's recommended to restrict network access to Xvnc servers from untrusted network addresses. Probably, the best way to secure
       Xvnc server is to allow only loopback connections from the server machine (the -localhost option) and to use SSH tunneling for remote access to the Xvnc server. For details on SSH tunneling, see
       <URL:http://www.cl.cam.ac.uk/Research/DTG/attarchive/vnc/sshvnc.html> .

SEE ALSO
       vncserver(1), vncviewer(1), vncpasswd(1), vncconnect(1), sshd(1)

AUTHORS
       Original VNC was developed in AT&T Laboratories Cambridge. TightVNC additions were implemented by Constantin Kaplinsky. Many other people participated in development, testing and support.

       Man page authors:
       Marcus Brinkmann <Marcus.Brinkmann@ruhr-uni-bochum.de>,
       Tim Waugh <twaugh@redhat.com>,
       Constantin Kaplinsky <const@tightvnc.com>

                                                                                               August 2006                                                                                        Xvnc(1)
