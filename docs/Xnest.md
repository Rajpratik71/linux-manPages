Xnest(1)                                                                                   General Commands Manual                                                                                   Xnest(1)



NAME
       Xnest - a nested X server

SYNOPSIS
       Xnest [ options ]

DESCRIPTION
       Xnest is both an X client and an X server.  Xnest is a client of the real server which manages windows and graphics requests on its behalf.  Xnest is a server to its own clients.  Xnest manages win-
       dows and graphics requests on their behalf.  To these clients, Xnest appears to be a conventional server.

OPTIONS
       Xnest supports all standard options of the sample server implementation.  For more details, please see Xserver(1).  The following additional arguments are supported as well.

       -display string
              This option specifies the display name of the real server that Xnest should try to connect to.  If it is not provided on the command line, Xnest will read the DISPLAY environment variable  in
              order to find out this information.

       -sync  This option tells Xnest to synchronize its window and graphics operations with the real server.  This is a useful option for debugging, but it will slow down Xnest's performance considerably.
              It should not be used unless absolutely necessary.

       -full  This option tells Xnest to utilize full regeneration of real server objects and reopen a new connection to the real server each time the nested server regenerates.  The sample  server  imple-
              mentation  regenerates  all  objects  in  the server when the last client of this server terminates.  When this happens, Xnest by default maintains the same top-level window and the same real
              server connection in each new generation.  If the user selects full regeneration, even the top-level window and the connection to the real server will be regenerated for each  server  genera-
              tion.

       -class string
              This option specifies the default visual class of the nested server.  It is similar to the -cc option from the set of standard options except that it will accept a string rather than a number
              for the visual class specification.  The string must be one of the following six values: StaticGray, GrayScale, StaticColor, PseudoColor, TrueColor, or DirectColor.  If both  the  -class  and
              -cc  options  are specified, the last instance of either option takes precedence.  The class of the default visual of the nested server need not be the same as the class of the default visual
              of the real server, but it must be supported by the real server.  Use xdpyinfo(1) to obtain a list of supported visual classes on the real server before starting Xnest.  If the user chooses a
              static  class,  all the colors in the default color map will be preallocated.  If the user chooses a dynamic class, colors in the default color map will be available to individual clients for
              allocation.

       -depth int
              This option specifies the default visual depth of the nested server.  The depth of the default visual of the nested server need not be the same as the depth of the default visual of the  real
              server, but it must be supported by the real server.  Use xdpyinfo(1) to obtain a list of supported visual depths on the real server before starting Xnest.

       -sss   This  option tells Xnest to use the software screen saver.  By default, Xnest will use the screen saver that corresponds to the hardware screen saver in the real server.  Of course, even this
              screen saver is software-generated since Xnest does not control any actual hardware.  However, it is treated as a hardware screen saver within the sample server code.

       -geometry WxH+X+Y
              This option specifies the geometry parameters for the top-level Xnest window.  See “GEOMETRY SPECIFICATIONS” in X(7) for a discusson of this option's syntax.  This window corresponds  to  the
              root  window of the nested server.  The width W and height H specified with this option will be the maximum width and height of each top-level Xnest window.  Xnest will allow the user to make
              any top-level window smaller, but it will not actually change the size of the nested server root window.  Xnest does not yet support the RANDR extension for resizing, rotation, and reflection
              of the root window.  If this option is not specified, Xnest will choose W and H to be 3/4ths the dimensions of the root window of the real server.

       -bw int
              This option specifies the border width of the top-level Xnest window.  The integer parameter int must be positive.  The default border width is 1.

       -name string
              This option specifies the name of the top-level Xnest window as string.  The default value is the program name.

       -scrns int
              This option specifies the number of screens to create in the nested server.  For each screen, Xnest will create a separate top-level window.  Each screen is referenced by the number after the
              dot in the client display name specification.  For example, xterm -display :1.1 will open an xterm(1) client in the nested server with the display number :1 on the second screen.  The  number
              of screens is limited by the hard-coded constant in the server sample code, which is usually 3.

       -install
              This  option  tells  Xnest to do its own color map installation by bypassing the real window manager.  For it to work properly, the user will probably have to temporarily quit the real window
              manager.  By default, Xnest will keep the nested client window whose color map should be installed in the real server in the WM_COLORMAP_WINDOWS property of the top-level  Xnest  window.   If
              this color map is of the same visual type as the root window of the nested server, Xnest will associate this color map with the top-level Xnest window as well.  Since this does not have to be
              the case, window managers should look primarily at the WM_COLORMAP_WINDOWS property rather than the color map associated with the top-level Xnest window.  Unfortunately, window  managers  are
              not very good at doing that yet so this option might come in handy.

       -parent window_id
              This option tells Xnest to use window_id as the root window instead of creating a window.

EXTENDED DESCRIPTION
       Starting  up  Xnest  is  just  as simple as starting up xclock(1) from a terminal emulator.  If a user wishes to run Xnest on the same workstation as the real server, it is important that the nested
       server is given its own listening socket address.  Therefore, if there is a server already running on the user's workstation, Xnest will have to be started up with a new display number.  Since there
       is  usually  no  more  than one server running on a workstation, specifying ‘Xnest :1’ on the command line will be sufficient for most users.  For each server running on the workstation, the display
       number needs to be incremented by one.  Thus, if you wish to start another Xnest, you will need to type ‘Xnest :2’ on the command line.

       To run clients in the nested server, each client needs to be given the same display number as the nested server.  For example, ‘xterm -display :1’ will start up an xterm process in the first  nested
       server and ‘xterm -display :2’ will start an xterm in the second nested server from the example above.  Additional clients can be started from these xterms in each nested server.

   Xnest as a client
       Xnest  behaves and looks to the real server and other real clients as another real client.  It is a rather demanding client, however, since almost any window or graphics request from a nested client
       will result in a window or graphics request from Xnest to the real server.  Therefore, it is desirable that Xnest and the real server are on a local network, or even better,  on  the  same  machine.
       Xnest  assumes that the real server supports the SHAPE extension.  There is no way to turn off this assumption dynamically.  Xnest can be compiled without the SHAPE extension built in, in which case
       the real server need not support it.  Dynamic SHAPE extension selection support may be considered in further development of Xnest.

       Since Xnest need not use the same default visual as the the real server, the top-level window of the Xnest client always has its own color map.  This implies that other windows' colors will  not  be
       displayed  properly  while  the keyboard or pointer focus is in the Xnest window, unless the real server has support for more than one installed color map at any time.  The color map associated with
       the top window of the Xnest client need not be the appropriate color map that the nested server wants installed in the real server.  In the case that a nested client attempts to install a color  map
       of  a  different  visual from the default visual of the nested server, Xnest will put the top window of this nested client and all other top windows of the nested clients that use the same color map
       into the WM_COLORMAP_WINDOWS property of the top-level Xnest window on the real server.  Thus, it is important that the real window manager that manages the  Xnest  top-level  window  looks  at  the
       WM_COLORMAP_WINDOWS  property  rather  than  the  color  map associated with the top-level Xnest window.  Since most window managers don't yet appear to implement this convention properly, Xnest can
       optionally do direct installation of color maps into the real server bypassing the real window manager.  If the user chooses this option, it is usually necessary to temporarily disable the real win-
       dow manager since it will interfere with the Xnest scheme of color map installation.

       Keyboard and pointer control procedures of the nested server change the keyboard and pointer control parameters of the real server.  Therefore, after Xnest is started up, it will change the keyboard
       and pointer controls of the real server to its own internal defaults.

   Xnest as a server
       Xnest as a server looks exactly like a real server to its own clients.  For the clients, there is no way of telling if they are running on a real or a nested server.

       As already mentioned, Xnest is a very user-friendly server when it comes to customization.  Xnest will pick up a number of command-line arguments that can configure  its  default  visual  class  and
       depth, number of screens, etc.

       The  only  apparent  intricacy from the users' perspective about using Xnest as a server is the selection of fonts.  Xnest manages fonts by loading them locally and then passing the font name to the
       real server and asking it to load that font remotely.  This approach avoids the overload of sending the glyph bits across the network for every text operation, although it is really a bug.  The con-
       sequence of this approach is that the user will have to worry about two different font paths — a local one for the nested server and a remote one for the real server — since Xnest does not propagate
       its font path to the real server.  The reason for this is because real and nested servers need not run on the same file system which makes the two font paths mutually incompatible.  Thus,  if  there
       is  a  font in the local font path of the nested server, there is no guarantee that this font exists in the remote font path of the real server.  The xlsfonts(1) client, if run on the nested server,
       will list fonts in the local font path and, if run on the real server, will list fonts in the remote font path.  Before a font can be successfully opened by the nested server, it  has  to  exist  in
       local and remote font paths.  It is the users' responsibility to make sure that this is the case.

FUTURE DIRECTIONS
       Make dynamic the requirement for the SHAPE extension in the real server, rather than having to recompile Xnest to turn this requirement on and off.

       Perhaps there should be a command-line option to tell Xnest to inherit the keyboard and pointer control parameters from the real server rather than imposing its own.

       Xnest should read a customization input file to provide even greater freedom and simplicity in selecting the desired layout.

       There is no support for backing store and save unders, but this should also be considered.

       The proper implementation of fonts should be moved into the os layer.

BUGS
       Doesn't run well on servers supporting different visual depths.

       Still crashes randomly.

       Probably has some memory leaks.

AUTHOR
       Davor Matic, MIT X Consortium

SEE ALSO
       Xserver(1), xdpyinfo(1), X(7)



X Version 11                                                                                  xorg-server 1.18.3                                                                                     Xnest(1)
