XVFB(1)                                                       General Commands Manual                                                      XVFB(1)

NAME
       Xvfb - virtual framebuffer X server for X Version 11

SYNOPSIS
       Xvfb [ option ] ...

DESCRIPTION
       Xvfb  is an X server that can run on machines with no display hardware and no physical input devices.  It emulates a dumb framebuffer using
       virtual memory.

       The primary use of this server was intended to be server testing.  The fb code for any depth can be exercised with this server without  the
       need  for  real  hardware  that  supports  the desired depths.  The X community has found many other novel uses for Xvfb, including testing
       clients against unusual depths and screen configurations, doing batch processing with Xvfb as a background rendering engine, load  testing,
       as  an  aid  to  porting  the  X server to a new platform, and providing an unobtrusive way to run applications that don't really need an X
       server but insist on having one anyway.

OPTIONS
       In addition to the normal server options described in the Xserver(1) manual page, Xvfb accepts the following command line switches:

       -screen screennum WxHxD
           This option creates screen screennum and sets its width, height, and depth to W, H, and D respectively.   By  default,  only  screen  0
           exists and has the dimensions 1280x1024x8.

       -pixdepths list-of-depths
           This  option  specifies  a  list  of  pixmap  depths  that the server should support in addition to the depths implied by the supported
           screens.  list-of-depths is a space-separated list of integers that can have values from 1 to 32.

       -fbdir framebuffer-directory
           This option specifies the directory in which the memory mapped files containing the framebuffer memory should be created.   See  FILES.
           This option only exists on machines that have the mmap and msync system calls.

       -shmem
           This option specifies that the framebuffer should be put in shared memory.  The shared memory ID for each screen will be printed by the
           server.  The shared memory is in xwd format.  This option only exists on machines that support the System V shared memory interface.

       If neither -shmem nor -fbdir is specified, the framebuffer memory will be allocated with malloc().

       -linebias n
           This option specifies how to adjust the pixelization of thin lines.  The value n is a bitmask of octants in which to  prefer  an  axial
           step  when  the  Bresenham error term is exactly zero.  See the file Xserver/mi/miline.h for more information.  This option is probably
           only useful to server developers to experiment with the range of line pixelization possible with the fb code.

       -blackpixel pixel-value, -whitepixel pixel-value
           These options specify the black and white pixel values the server should use.

FILES
       The following files are created if the -fbdir option is given.

       framebuffer-directory/Xvfb_screen<n>
           Memory mapped file containing screen n's framebuffer memory, one file per screen.  The file is in xwd format.   Thus,  taking  a  full-
           screen snapshot can be done with a file copy command, and the resulting snapshot will even contain the cursor image.

EXAMPLES
       Xvfb :1 -screen 0 1600x1200x32
               The server will listen for connections as server number 1, and screen 0 will be depth 32 1600x1200.

       Xvfb :1 -screen 1 1600x1200x16
               The  server  will  listen for connections as server number 1, will have the default screen configuration (one screen, 1280x1024x8),
               and screen 1 will be depth 16 1600x1200.

       Xvfb -pixdepths 3 27 -fbdir /var/tmp
               The server will listen for connections as server number 0, will have the default screen configuration  (one  screen,  1280x1024x8),
               will also support pixmap depths of 3 and 27, and will use memory mapped files in /var/tmp for the framebuffer.

       xwud -in /var/tmp/Xvfb_screen0
               Displays screen 0 of the server started by the preceding example.

SEE ALSO
       X(7), Xserver(1), xwd(1), xwud(1), XWDFile.h

AUTHORS
       David P. Wiggins, The Open Group, Inc.

X Version 11                                                    xorg-server 1.18.4                                                         XVFB(1)
