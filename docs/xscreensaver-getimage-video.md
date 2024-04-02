xscreensaver-getimage-video(1)                                  XScreenSaver manual                                 xscreensaver-getimage-video(1)

NAME
       xscreensaver-getimage-video - put a video frame on the root window

SYNOPSIS
       xscreensaver-getimage-video [-display host:display.screen] [--verbose] [--stdout]

DESCRIPTION
       The xscreensaver-getimage-video program is a helper program for the xscreensaver hacks that manipulate images.  Specifically, it is invoked
       by xscreensaver-getimage(1) as needed.  This is not a user-level command.

       This program grabs a random frame of video from the system's video input, and then loads it on the root window.  It does this  by  figuring
       out  which  frame-grabbing  programs  are  installed on the system, and invoking the first one it finds.   Then it runs xscreensaver-getim‐
       age-file(1) to load that image onto the root window.

OPTIONS
       xscreensaver-getimage-video accepts the following options:

       --verbose
           Print diagnostics.

       --stdout
           Instead of loading the image onto the root window, write it to stdout as a PBM file.

SEE ALSO
       X(1), xscreensaver(1), xscreensaver-demo(1), xscreensaver-getimage(1), xscreensaver-getimage-file(1),  bttvgrab(1),  qcam(1),  streamer(1),
       atitv(1), vidtomem(1)

COPYRIGHT
       Copyright © 2001 by Jamie Zawinski.  Permission to use, copy, modify, distribute, and sell this software and its documentation for any pur‐
       pose is hereby granted without fee, provided that the above copyright notice appear in all copies and that both that copyright  notice  and
       this permission notice appear in supporting documentation.  No representations are made about the suitability of this software for any pur‐
       pose.  It is provided "as is" without express or implied warranty.

AUTHOR
       Jamie Zawinski <jwz@jwz.org>, 14-Apr-01

X Version 11                                                    5.40 (12-Aug-2018)                                  xscreensaver-getimage-video(1)
