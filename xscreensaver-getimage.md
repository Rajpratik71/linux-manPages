xscreensaver-getimage(1)                                        XScreenSaver manual                                       xscreensaver-getimage(1)

NAME
       xscreensaver-getimage - put some randomly-selected image on the root window

SYNOPSIS
       xscreensaver-getimage [-display host:display.screen] [--verbose] window-id [pixmap-id]

DESCRIPTION
       The xscreensaver-getimage program is a helper program for the xscreensaver hacks that manipulate images.  This is not a user-level command.

       This  program  selects  a random image, and puts it on the specified window or pixmap.  This image might be a snapshot of the desktop; or a
       frame captured from the system's video input; or a randomly-selected image from disk.

       If only a window ID is specified, the image will be painted there.  If both a window ID and a pixmap ID are specified, then the image  will
       be painted on the pixmap; and the window may be modified as a side-effect.

OPTIONS
       xscreensaver-getimage reads the ~/.xscreensaver file for configuration information.  It uses these settings:

       grabDesktopImages
           Whether  it is acceptable to grab snapshots of the desktop.  The security paranoid might want to turn this off, to avoid letting people
           see (but not touch!) your desktop while the screen is locked.

       grabVideoFrames
           Whether it is acceptable to grab frames of video from the system's video input.  Grabbing of video is done  by  invoking  the  xscreen‐
           saver-getimage-video(1) program.

       chooseRandomImages
           Whether it is acceptable to display random images found on disk.  Selection and loading of images is done by invoking the xscreensaver-
           getimage-file(1) program.

       imageDirectory
           When loading images from disk, this is the directory to find them in.  The directory will be searched recursively for images.

           It may also be the URL of an RSS or Atom feed, in which case a random image from that feed will be selected instead.  The  contents  of
           the feed will be cached locally and refreshed periodically as needed.

       If none of the three options are set to True, then video colorbars will be displayed instead.

BUGS
       When  grabbing desktop images, the window argument will be unmapped and have its contents modified, causing flicker.  (This does not happen
       when loading image files or video frames.)

SEE ALSO
       X(1), xscreensaver(1) xscreensaver-demo(1) xscreensaver-getimage-file(1) xscreensaver-getimage-video(1)

COPYRIGHT
       Copyright © 2001-2011 by Jamie Zawinski.  Permission to use, copy, modify, distribute, and sell this software and its documentation for any
       purpose  is  hereby  granted without fee, provided that the above copyright notice appear in all copies and that both that copyright notice
       and this permission notice appear in supporting documentation.  No representations are made about the suitability of this software for  any
       purpose.  It is provided "as is" without express or implied warranty.

AUTHOR
       Jamie Zawinski <jwz@jwz.org>, 14-Apr-01

X Version 11                                                    5.40 (12-Aug-2018)                                        xscreensaver-getimage(1)
