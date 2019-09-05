Xdmx(1)                                                                                    General Commands Manual                                                                                    Xdmx(1)



NAME
       Xdmx - Distributed Multi-head X server

SYNOPSIS
       Xdmx [:display] [option ...]

DESCRIPTION
       Xdmx  is  a proxy X server that uses one or more other X servers as its display devices.  It provides multi-head X functionality for displays that might be located on different machines.  Xdmx func-
       tions as a front-end X server that acts as a proxy to a set of back-end X servers.  All of the visible rendering is passed to the back-end X servers.  Clients connect  to  the  Xdmx  front-end,  and
       everything appears as it would in a regular multi-head configuration.  If Xinerama is enabled (e.g., with +xinerama on the command line), the clients see a single large screen.

       Xdmx communicates to the back-end X servers using the standard X11 protocol, and standard and/or commonly available X server extensions.

OPTIONS
       In addition to the normal X server options described in the Xserver(1) manual page, Xdmx accepts the following command line switches:

       -display display-name
               This specifies the name(s) of the back-end X server display(s) to connect to.  This option may be specified multiple times to connect to more than one back-end display.  The first is used as
               screen 0, the second as screen 1, etc.  If this option is omitted, the $DISPLAY environment variable is used as the single back-end X server display.


       -xinput input-source
               This specifies the source to use for XInput extension devices.  The choices are the same as for -input , described below, except that core devices on backend servers  cannot  be  treated  as
               XInput extension devices.  (Although extension devices on backend and console servers are supported as extension devices under Xdmx).


       -input input-source
               This specifies the source to use for the core input devices.  The choices are:

               dummy
                   A set of dummy core input drivers are used.  These never generate any input events.


               local
                   The  raw keyboard and pointer from the local computer are used.  A comma-separated list of driver names can be appended.  For example, to select the example Linux keyboard and PS/2 mouse
                   driver use: -input local,kbd,ps2.  The following drivers have been implemented for Linux: kbd, ms (a two-button Microsoft mouse driver), ps2 (a PS/2 mouse driver), usb-mou (a  USB  mouse
                   driver),  usb-kbd (a USB keyboard driver), and usb-oth (a USB non-keyboard, non-mouse driver).  Additional drivers may be implemented in the future.  Appropriate defaults will be used if
                   no comma-separated list is provided.


               display-name
                   If the display-name is a back-end server, then core input events are taken from the server specified.  Otherwise, a console window will be opened on the specified display.

                   If the display-name is followed by ",xi" then XInput extension devices on the display will be used as Xdmx XInput extension devices.  If the display-name is followed by ",noxi" then XIn-
                   put extension devices on the display will not be used as Xdmx XInput extension devices.  Currently, the default is ",xi".

                   If  the  display-name  is followed by ",console" and the display-name refers to a display that is used as a backend display, then a console window will be opened on that display and that
                   display will be treated as a backend display.  Otherwise (or if ",noconsole" is used), the display will be treated purely as a backend or a console display, as described above.

                   If the display-name is followed by ",windows", then outlines of the windows on the backend will be displayed inside the console window.  Otherwise (or if ",nowindows" is used), the  con-
                   sole window will not display the outlines of backend windows.  (This option only applies to console input.)

                   If  the  display-name  is followed by ",xkb", then the next 1 to 3 comma-separated parameters will specify the keycodes, symbols, and geometry of the keyboard for this input device.  For
                   example, ",xkb,xfree86,pc104" will specify that the "xfree86" keycodes and the "pc104" symbols should be used to initialize the keyboard.  For  an  SGI  keyboard,  ",xkb,sgi/indy(pc102)"
                   might be useful.  A list of keycodes, symbols, and geometries can be found in /usr/share/X11/xkb.  Use of keycodes, symbols and geometries for XKB configuration is deprecated in favor of
                   the rules, layout, model, variant and options settings available via the -param command line switch.  If this option is not specified, the input device will be queried, perhaps using the
                   XKEYBOARD extension.

               If this option isn't specified, the default input source is the first back-end server (the one used for screen 0).  The console window shows the layout of the back-end display(s) and pointer
               movements and key presses within the console window will be used as core input devices.

               Several special function keys are active, depending on the input source:

                      Ctrl-Alt-q will terminate the Xdmx server in all modes.

                      Ctrl-Alt-g will toggle a server grab in console mode (a special cursor, currently a spider, is used to indicate an active server grab).

                      Ctrl-Alt-f will toggle fine-grain motion in console mode (a special cursor, currently a cross hair, is used to indicate this mode).  If this mode is combined with a server grab,  then
                      the cursor will have 4 lines instead of only 2.

                      Ctrl-Alt-F1 through Ctrl-Alt-F12 will switch to another VC in local (raw) mode.


       -nomulticursor
               This option turns off support for displaying multiple cursors on overlapped back-end displays.  This option is available for testing and benchmarking purposes.


       -fontpath
               This  option  sets  the Xdmx server's default font path.  This option can be specified multiple times to accommodate multiple font paths.  See the FONT PATHS section below for very important
               information regarding setting the default font path.


       -configfile filename
               Specify the configuration file that should be read.  Note that if the -display command-line option is used, then the configuration file will be ignored.


       -config name
               Specify a configuration to use.  The name will be the name following the virtual keyword in the configuration file.


       -stat interval screens
               This option enables the display of performance statistics.  The interval is in seconds.  The screens is a count of the number of back-end screens for which data  is  printed  each  interval.
               Specifying 0 for screens will display data for all screens.

               For  each  screen,  the  following  information  is printed: the screen number, an absolute count of the number of XSync() calls made (SyncCount), the rate of these calls during the previous
               interval (Sync/s), the average round-trip time (in microseconds) of the last 10 XSync() calls (avSync), the maximum round-trip time (in microseconds) of the last 10 XSync calls (mxSync), the
               average  number  of XSync() requests that were pending but not yet processed for each of the last 10 processed XSync() calls, the maximum number of XSync() requests that were pending but not
               yet processed for each of the last 10 processed XSync() calls, and a histogram showing the distribution of the times of all of the XSync() calls that were made during the previous interval.

               (The length of the moving average and the number and value of histogram bins are configurable at compile time in the dmxstat.h header file.)


       -syncbatch interval
               This option sets the interval in milliseconds for XSync() batching.  An interval less than or equal to 0 will disable XSync() batching.  The default interval is 100 ms.


       -nooffscreenopt
               This option disables the offscreen optimization.  Since the lazy window creation optimization requires the offscreen optimization to be enabled, this option will also disable the lazy window
               creation optimization.


       -nowindowopt
               This option disables the lazy window creation optimization.


       -nosubdivprims
               This option disables the primitive subdivision optimization.


       -noxkb  Disable use of the XKB extension for communication with the back end displays.  (Combine with -kb to disable all use of XKB.)


       -depth int
               This  option  sets  the  root window's default depth.  When choosing a default visual from those available on the back-end X server, the first visual with that matches the depth specified is
               used.

               This option can be combined with the -cc option, which specifies the default color visual class, to force the use of a specific depth and color class for the root window.


       -norender
               This option disables the RENDER extension.


       -noglxproxy
               This option disables GLX proxy -- the build-in GLX extension implementation that is DMX aware.


       -noglxswapgroup
               This option disables the swap group and swap barrier extensions in GLX proxy.


       -glxsyncswap
               This option enables synchronization after a swap buffers call by waiting until all X protocol has been processed.  When a client issues a glXSwapBuffers request, Xdmx relays that request  to
               each  back-end  X  server, and those requests are buffered along with all other protocol requests.  However, in systems that have large network buffers, this buffering can lead to the set of
               back-end X servers handling the swap buffers request asynchronously.  With this option, an XSync() request is issued to each back-end X server after sending the swap  buffers  request.   The
               XSync()  requests  will  flush all buffered protocol (including the swap buffers requests) and wait until the back-end X servers have processed those requests before continuing.  This option
               does not wait until all GL commands have been processed so there might be previously issued commands that are still being processed in the GL pipe when the XSync() request returns.  See  the
               -glxfinishswap option below if Xdmx should wait until the GL commands have been processed.


       -glxfinishswap
               This option enables synchronization after a swap buffers call by waiting until all GL commands have been completed.  It is similar to the -glxsyncswap option above; however, instead of issu-
               ing an XSync(), it issues a glFinish() request to each back-end X server after sending the swap buffers requests.  The glFinish() request will flush all buffered protocol  requests,  process
               both X and GL requests, and wait until all previously called GL commands are complete before returning.


       -ignorebadfontpaths
               This  option ignores font paths that are not available on all back-end servers by removing the bad font path(s) from the default font path list.  If no valid font paths are left after remov-
               ing the bad paths, an error to that effect is printed in the log.


       -addremovescreens
               This option enables the dynamic addition and removal of screens, which is disabled by default.  Note that GLXProxy and Render do not yet support dynamic addition and removal of screens,  and
               must be disabled via the -noglxproxy and -norender command line options described above.


       -param  This  option  specifies  parameters  on  the  command line.  Currently, only parameters dealing with XKEYBOARD configuration are supported.  These parameters apply only to the core keyboard.
               Parameter values are installation-dependent.  Please see /usr/share/X11/xkb or a similar directory for complete information.

               XkbRules
                       Defaults to "evdev".  Other values may include "sgi" and "sun".


               XkbModel
                       Defaults to "pc105".  When used with "base" rules, other values may include "pc102", "pc104", "microsoft", and many others.  When used with "sun"  rules,  other  values  may  include
                       "type4" and "type5".


               XkbLayout
                       Defaults to "us".  Other country codes and "dvorak" are usually available.


               XkbVariant
                       Defaults to "".


               XkbOptions
                       Defaults to "".

CONFIGURATION FILE GRAMMAR
       The following words and tokens are reserved:
              virtual display wall option param { } ; #

       Comments start with a # mark and extend to the end of the line.  They may appear anywhere.  If a configuration file is read into xdmxconfig, the comments in that file will be preserved, but will not
       be editable.

       The grammar is as follows:
              virtual-list ::= [ virtual-list ] | virtual

              virtual ::= virtual [ name ] [ dim ] { dw-list }

              dw-list ::= [ dw-list ] | dw

              dw ::= display | wall | option

              display ::= display name [ geometry ] [ / geometry ] [ origin ] ;

              wall ::= wall [ dim ] [ dim ] name-list ;

              option ::= option name-list ;

              param ::= param name-list ;

              param ::= param { param-list }

              param-list ::= [ param-list ] | name-list ;

              name-list ::= [ name-list ] | name

              name ::= string | double-quoted-string

              dim ::= integer x integer

              geometry ::= [ integer x integer ] [ signed-integer signed-integer ]

              origin ::= @ integer x integer

       The name following virtual is used as an identifier for the configuration, and may be passed to Xdmx using the -config command line option.  The name of a display should be standard X display  name,
       although no checking is performed (e.g., "machine:0").

       For names, double quotes are optional unless the name is reserved or contains spaces.

       The first dimension following wall is the dimension for tiling (e.g., 2x4 or 4x4).  The second dimension following wall is the dimension of each display in the wall (e.g., 1280x1024).

       The  first  geometry following display is the geometry of the screen window on the backend server.  The second geometry, which is always preceeded by a slash, is the geometry of the root window.  By
       default, the root window has the same geometry as the screen window.

       The option line can be used to specify any command-line options (e.g., -input).  (It cannot be used to specify the name of the front-end display.)  The  option  line  is  processed  once  at  server
       startup, just line command line options.  This behavior may be unexpected.

CONFIGURATION FILE EXAMPLES
       Two displays being used for a desktop may be specified in any of the following formats:
              virtual example0 {
                  display d0:0 1280x1024 @0x0;
                  display d1:0 1280x1024 @1280x0;
              }

              virtual example1 {
                  display d0:0 1280x1024;
                  display d1:0 @1280x0;
              }

              virtual example2 {
                  display "d0:0";
                  display "d1:0" @1280x0;
              }

              virtual example3 { wall 2x1 d0:0 d1:0; }
       A 4x4 wall of 16 total displays could be specified as follows (if no tiling dimension is specified, an approximate square is used):
              virtual example4 {
                  wall d0:0 d1:0 d2:0 d3:0
                       d4:0 d5:0 d6:0 d7:0
                       d8:0 d9:0 da:0 db:0
                       dc:0 dd:0 de:0 df:0;
              }

FONT PATHS
       The  font path used by the Xdmx front-end server will be propagated to each back-end server,which requires that each back-end server have access to the exact same font paths as the front-end server.
       This can be most easily handled by either using a font server (e.g., xfs) or by remotely mounting the font paths on each back-end server, and then setting the Xdmx server's default  font  path  with
       the -I "-fontpath" command line option described above.

       For example, if you specify a font path with the following command line:
              Xdmx :1 -display d0:0 -fontpath /usr/fonts/75dpi/ -fontpath /usr/fonts/Type1/ +xinerama
       Then, /usr/fonts/75dpi/ and /usr/fonts/Type1/ must be valid font paths on the Xdmx server and all back-end server, which is d0 in this example.

       Font servers can also be specified with the -fontpath option.  For example, let's assume that a properly configured font server is running on host d0.  Then, the following command line
              Xdmx :1 -display d0:0 -display d1:0 -fontpath tcp/d0:7100 +xinerama
       will initialize the front-end Xdmx server and each of the back-end servers to use the font server on d0.

       Some  fonts might not be supported by either the front-end or the back-end servers.  For example, let's assume the front-end Xdmx server includes support Type1 fonts, but one of the back-end servers
       does not.  Let's also assume that the default font path for Xdmx includes Type1 fonts in its font path.  Then, when Xdmx initializes the default font path to load the default  font,  the  font  path
       that includes Type1 fonts (along with the other default font paths that are used by the Xdmx server) is sent to the back-end server that cannot handle Type1 fonts.  That back-end server then rejects
       the font path and sends an error back to the Xdmx server.  Xdmx then prints an error message and exits because it failed to set the default font path and was unable load the default font.

       To fix this error, the offending font path must be removed from the default font path by using a different -fontpath command line option.

       The -fontpath option can also be added to the configuration file as described above.

COMMAND-LINE EXAMPLES
       The back-end machines are d0 and d1, core input is from the pointer and keyboard attached to d0, clients will refer to :1 when opening windows:
              Xdmx :1 -display d0:0 -display d1:0 +xinerama

       As above, except with core input from d1:
              Xdmx :1 -display d0:0 -display d1:0 -input d1:0 +xinerama

       As above, except with core input from a console window on the local display:
              Xdmx :1 -display d0:0 -display d1:0 -input :0 +xinerama

       As above, except with core input from the local keyboard and mouse:
              Xdmx :1 -display d0:0 -display d1:0 -input local,kbd,ps2 +xinerama
       Note that local input can be used under Linux while another X session is running on :0 (assuming the user can access the Linux console tty and mouse devices): a new (blank) VC will be used for  key-
       board  input  on the local machine and the Ctrl-Alt-F* sequence will be available to change to another VC (possibly back to another X session running on the local machine).  Using Ctrl-Alt-Backspace
       on the blank VC will terminate the Xdmx session and return to the original VC.

       This example uses the configuration file shown in the previous section:
              Xdmx :1 -input :0 +xinerama -configfile filename -config example2
       With this configuration file line:
              option -input :0 +xinerama;
       the command line can be shortened to:
              Xdmx :1 -configfile filename -config example2

USING THE USB DEVICE DRIVERS
       The USB device drivers use the devices called /dev/input/event0, /dev/input/event1, etc.  under Linux.  These devices are driven using the evdev Linux kernel module, which is part of the hid  suite.
       Please note that if you load the mousedev or kbddev Linux kernel modules, then USB devices will appear as core Linux input devices and you will not be able to select between using the device only as
       an Xdmx core device or an Xdmx XInput extension device.  Further, you may be unable to unload the mousedev Linux kernel module if XFree86 is configured to use  /dev/input/mice  as  an  input  device
       (this is quite helpful for laptop users and is set up by default under some Linux distributions, but should be changed if USB devices are to be used with Xdmx).

       The USB device drivers search through the Linux devices for the first mouse, keyboard, or non-mouse-non-keyboard Linux device and use that device.

KEYBOARD INITIALIZATION
       If Xdmx was invoked with -xkb or was not compiled to use the XKEYBOARD extension, then a keyboard on a backend or console will be initialized using the map that the host X server provides.

       If the XKEYBOARD extension is used for both Xdmx and the host X server for the keyboard (i.e., the backend or console X server), then the type of the keyboard will be obtained from the host X server
       and the keyboard under Xdmx will be initialized with that information.  Otherwise, the default type of keyboard will be initialized.  In both cases, the map from the host X server will not be  used.
       This  means  that different initial behavior may be noted with and without XKEYBOARD.  Consistent and expected results will be obtained by running XKEYBOARD on all servers and by avoiding the use of
       xmodmap on the backend or console X servers prior to starting Xdmx.

       If -xkbmap is specified on the Xdmx command line, then that map will currently be used for all keyboards.

MULTIPLE CORE KEYBOARDS
       X was not designed to support multiple core keyboards.  However, Xdmx provides some support for multiple core keyboards.  Best results will be obtained if all of the keyboards are of the  same  type
       and  are  using the same keyboard map.  Because the X server passes raw key code information to the X client, key symbols for keyboards with different key maps would be different if the key code for
       each keyboard was sent without translation to the client.  Therefore, Xdmx will attempt to translate the key code from a core keyboard to the key code for the key with the same  key  symbol  of  the
       first  core keyboard that was loaded.  If the key symbol appears in both maps, the results will be expected.  Otherwise, the second core keyboard will return a NoSymbol key symbol for some keys that
       would have been translated if it was the first core keyboard.

SEE ALSO
       DMX(3), X(7), Xserver(1), xdmxconfig(1), vdltodmx(1), xfs(1), xkbcomp(1), xkeyboard-config(7)

AUTHORS
       Kevin E. Martin <kem@redhat.com>, David H. Dawes <dawes@xfree86.org>, and Rickard E. (Rik) Faith <faith@redhat.com>.

       Portions of Xdmx are based on code from The XFree86 Project (http://www.xfree86.org) and X.Org (http://www.x.org).



X Version 11                                                                                  xorg-server 1.18.3                                                                                      Xdmx(1)
