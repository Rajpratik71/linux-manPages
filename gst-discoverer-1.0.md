GStreamer(1)                                                                                                                                                                                 GStreamer(1)

NAME
       gst-discoverer-1.0 - Display file metadata and stream information

SYNOPSIS
       gst-discoverer-1.0 FILE|DIRECTORY|URI [FILE2|DIRECTORY2|URI2]

DESCRIPTION
       gst-discoverer-1.0 is a tool that can be used to print basic metadata and stream information about a media file. It can be run on individual files or whole directories. It will recurse into sub-
       directories in that case.

OPTIONS
       gst-discoverer-1.0 accepts the following options:

       --help  Print help synopsis and available FLAGS

       -v, --verbose
               Output all available information

       -a, --async
               Use asynchronous code path

       -t, --timeout=T
               Specify timeout in seconds (default: 10 seconds)

       -c, --toc
               Output TOC (chapters and editions) if available

       SEE ALSO
              gst-inspect-1.0(1), gst-launch-1.0(1),

AUTHOR
       The GStreamer team at http://gstreamer.freedesktop.org/

                                                                                               August 2012                                                                                   GStreamer(1)
