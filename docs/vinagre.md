VINAGRE(1)                                                    General Commands Manual                                                   VINAGRE(1)

NAME
       vinagre - a remote desktop viewer for the GNOME Desktop

SYNOPSYS
       vinagre [OPTIONS] [server][::port|:display]

DESCRIPTION
       vinagre  is  a  remote desktop viewer for the GNOME desktop. It can support many protocols using a plugin system. Current plugins exist for
       VNC and SSH.  Vinagre has many features, among others:.

       - Support for multiple connections simultaneously

       - Bookmarks and history support

       - Avahi integration

       - GNOME keyring integration

       - You can connect to a VNC server by double clicking on a .vnc file when using nautilus.

OPTIONS
   Help Options:
       -?, --help
              Show help options

   Application Options:
       -F, --file=filename
              Opens a .vnc file

       -f, --fullscreen
              Open Vinagre in fullscreen mode

       --geometry=GEOMETRY
              Specify geometry of the Vinagre window in X11 format

       -n, --new-window
              Create a new toplevel window in an existing instance of Vinagre

       --display=DISPLAY
              X display to use

       Run 'vinagre --help' to see a full list of available command line options

OPERANDS
       The following operands are supported:

       [server][::port|:display]
              Specifies the VNC server to connect to. The VNC server can be either a hostname, or an IP address. If the server is an IPv6 address,
              it must be enclosed by square brackets. The address can optionally be followed by two colons (::) and the VNC port number, or alter‐
              natively by one colon (:) and the display where Vinagre should run. If a port is not specified, default value of 5900 will be  used.
              If  the value is lower than 1024, 5900 will be added to it. For example, ":0" means "5900" and ":1" means ":5901". If only a port is
              specified, but not the hostname, localhost will be assumed.  Possible values for the display are between 0 and 1024.  If  a  display
              number greater than 1024 is specified, it will be assumed to be a port.  Note that you can't specify the port and the display at the
              same time.

EXAMPLES
       Example 1: Start vinagre from the command line

       example% vinagre

       Example 2: Create a new top-level window

       example% vinagre --new-window

       Example 3: Connect to a specified VNC server and port

       example% vinagre snoopy::5900

       Example 4: Connect to a specified IPv4 address and port

       example% vinagre 192.168.1.35::2700

       Example 5: Connect to a specified IPv6 address and port

       example% vinagre [2001:0db8:0:0:0:0:1428:57ab]::2700

       Example 6: Connect to a VNC server specified by a .vnc file

       example% vinagre -F snoopy.vnc

       Example 7: Connect to localhost on a specified port in fullscreen mode

       example% vinagre -f ::5900

SEE ALSO
       Vinagre help manual

AUTHOR
       Vinagre was written by Jonh Wendell <wendell@bani.com.br> and David King <amigadave@amigadave.com>

       This manual page was written by Emilio Pozuelo Monfort <pochu@ubuntu.com> and Halton Huo <halton.huo@sun.com>.

User Commands                                                     April 18, 2011                                                        VINAGRE(1)
