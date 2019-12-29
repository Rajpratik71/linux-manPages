Xephyr(1)                               General Commands Manual                              Xephyr(1)

NAME
       Xephyr - X server outputting to a window on a pre-existing X display

SYNOPSIS
       Xephyr [:display] [option ...]

DESCRIPTION
       Xephyr  is  a kdrive server that outputs to a window on a pre-existing "host" X display.  Think
       Xnest but with support for modern extensions like composite, damage and randr.

       Unlike Xnest which is an X proxy, i.e.  limited to the capabilities of the host X  server,  Xe‐
       phyr  is a real X server which uses the host X server window as "framebuffer" via fast SHM XIm‐
       ages.

       It also has support for "visually" debugging what the server is painting.

OPTIONS
       The server accepts all the standard options of Xserver(1) and the following additional options:

       -screen widthxheight
               sets the screen size.

       -parent id
               uses existing window id .  If a -screen  argument  follows  a  -parent  argument,  this
               screen is embedded into the given window.

       -host-cursor
               set  'cursor  acceleration':  The host's cursor is reused. This is only really there to
               aid debugging by avoiding server paints for the cursor. Performance improvement is neg‐
               ligible.

       -resizeable
               Allow  the  Xephyr  window to be resized, even if not embedded into a parent window. By
               default, the Xephyr window has a fixed size.

       -no-host-grab
               Disable grabbing the keyboard and mouse.

SIGNALS
       Send a SIGUSR1 to the server (e.g. pkill -USR1 Xephyr) to toggle the debugging mode.   In  this
       mode red rectangles are painted to screen areas getting painted before painting the actual con‐
       tent.  The delay between this can be altered by setting a XEPHYR_PAUSE env var to  a  value  in
       micro seconds.

CAVEATS
       • Rotated  displays  are  currently updated via full blits. This is slower than a normal orien‐
         tated display. Debug mode will therefore not be of much use rotated.

       • The '-host-cursor' cursor is static in its appearance.

       • The build gets a warning about 'nanosleep'. I think the various '-D' build flags are  causing
         this. I haven't figured as yet how to work round it. It doesn't appear to break anything how‐
         ever.

       • Keyboard handling is basic but works.

       • Mouse button 5 probably won't work.

SEE ALSO
       X(7), Xserver(1)

AUTHOR
       Matthew Allum <mallum@o-hand.com> 2004

X Version 11                              xorg-server 1.20.5                                 Xephyr(1)
