xscreensaver-getimage-file(1)                                   XScreenSaver manual                                  xscreensaver-getimage-file(1)

NAME
       xscreensaver-getimage-file - put a randomly-selected image on the root window

SYNOPSIS
       xscreensaver-getimage-file [-display host:display.screen] [--verbose] [--name] [--no-cache] directory-or-URL

DESCRIPTION
       The  xscreensaver-getimage-file program is a helper program for the xscreensaver hacks that manipulate images.  Specifically, it is invoked
       by xscreensaver-getimage(1) as needed.  This is not a user-level command.

       This program selects a random image from disk, and loads it on the root window.  It does this by figuring out which image-loading  programs
       are installed on the system, and invoking the first one it finds.

OPTIONS
       xscreensaver-getimage-file accepts the following options:

       --verbose
           Print diagnostics.

       --name
           Don't load an image: instead just print the file name to stdout.

       directory-or-URL
           If  a directory is specified, it will be searched recursively for images.  Any images found will eligible for display.  For efficiency,
           the contents of the directory are cached for a few hours before it is re-scanned.

           If a URL is specified, it should be the URL of an RSS or Atom feed containing images.  The first time it is accessed, all of the images
           in  the feed will be downloaded to a local cache directory.  If a few hours have elapsed since last time, the URL will be polled again,
           and any new images will be cached, any images no longer in the feed will be expired.

       --no-cache
           Update the cache immediately, even if it is not time yet.  This will re-scan the directory, or re-poll the RSS feed.

SEE ALSO
       X(1), xscreensaver(1), xscreensaver-demo(1), xscreensaver-getimage(1), xv(1), xli(1), xloadimage(1), chbg(1)

COPYRIGHT
       Copyright © 2001-2012 by Jamie Zawinski.  Permission to use, copy, modify, distribute, and sell this software and its documentation for any
       purpose  is  hereby  granted without fee, provided that the above copyright notice appear in all copies and that both that copyright notice
       and this permission notice appear in supporting documentation.  No representations are made about the suitability of this software for  any
       purpose.  It is provided "as is" without express or implied warranty.

AUTHOR
       Jamie Zawinski <jwz@jwz.org>, 14-Apr-01

X Version 11                                                    5.40 (12-Aug-2018)                                   xscreensaver-getimage-file(1)
