GStreamer(1)                                                  General Commands Manual                                                 GStreamer(1)

NAME
       gst-inspect - print info about a GStreamer plugin or element

SYNOPSIS
       gst-inspect [OPTION...] [PLUGIN|ELEMENT]

DESCRIPTION
       gst-inspect  is  a  tool  that prints out information on available GStreamer plugins, information about a particular plugin, or information
       about a particular element.  When executed with no PLUGIN or ELEMENT argument, gst-inspect will print a list of all  plugins  and  elements
       together  with  a  summary.  When executed with a PLUGIN or ELEMENT argument, gst-inspect will print information about that plug-in or ele‐
       ment.

OPTIONS
       gst-inspect accepts the following arguments and options:

       PLUGIN  Name of a plugin

       ELEMENT Name of an element

       --help  Print help synopsis and available FLAGS

       --gst-info-mask=FLAGS
               GStreamer info flags to set (list with --help)

       -a, --print-all
               Print all plugins and elements

       --print-plugin-auto-install-info
               Print a machine-parsable list of features the specified plugin provides.  Useful  in  connection  with  external  automatic  plugin
               installation mechanisms.

       --gst-debug-mask=FLAGS
               GStreamer debugging flags to set (list with --help)

       --gst-mask=FLAGS
               GStreamer info and debugging flags to set (list with --help)

       --gst-plugin-spew
               GStreamer info flags to set Enable printout of errors while loading GStreamer plugins

       --gst-plugin-path=PATH
               Add directories separated with ':' to the plugin search path

SEE ALSO
       gst-feedback(1), gst-launch(1), gst-typefind(1)

AUTHOR
       The GStreamer team at http://gstreamer.freedesktop.org/

                                                                   December 2005                                                      GStreamer(1)
