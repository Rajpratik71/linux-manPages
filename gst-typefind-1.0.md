GStreamer(1)                                                  General Commands Manual                                                 GStreamer(1)

NAME
       gst-typefind - print Media type of file

SYNOPSIS
       gst-typefind <file>

DESCRIPTION
       gst-typefind uses the GStreamer type finding system to determine the relevant GStreamer plugin to parse or decode file, and the correspond‐
       ing media type.

OPTIONS
       gst-typefind accepts the following options:

       --help  Print help synopsis and available FLAGS

       --gst-info-mask=FLAGS
               GStreamer info flags to set (list with --help)

       --gst-debug-mask=FLAGS
               GStreamer debugging flags to set (list with --help)

       --gst-mask=FLAGS
               GStreamer info and debugging flags to set (list with --help)

       --gst-plugin-spew
               GStreamer info flags to set Enable printout of errors while loading GStreamer plugins

       --gst-plugin-path=PATH
               Add directories separated with ':' to the plugin search path

SEE ALSO
       gst-feedback(1), gst-inspect(1), gst-launch(1)

AUTHOR
       The GStreamer team at http://gstreamer.freedesktop.org/

                                                                     May 2003                                                         GStreamer(1)
