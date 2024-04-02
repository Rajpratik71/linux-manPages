GStreamer(1)                                                                            General Commands Manual                                                                           GStreamer(1)

NAME
       gst-inspect-1.0 - print info about a GStreamer plugin or element

SYNOPSIS
       gst-inspect-1.0 [OPTION...] [PLUGIN|ELEMENT]

DESCRIPTION
       gst-inspect-1.0  is a tool that prints out information on available GStreamer plugins, information about a particular plugin, or information about a particular element.  When executed with no
       PLUGIN or ELEMENT argument, gst-inspect-1.0 will print a list of all plugins and elements together with a summary.  When executed with a PLUGIN or ELEMENT argument, gst-inspect-1.0 will print
       information about that plug-in or element.

OPTIONS
       gst-inspect-1.0 accepts the following arguments and options:

       PLUGIN  Name of a plugin

       ELEMENT Name of an element

       --help  Print help synopsis and available FLAGS

       --gst-info-mask=FLAGS
               GStreamer info flags to set (list with --help)

       -a, --print-all
               Print all plugins and elements

       -b, --print-blacklist
               Print list of blacklisted files

       --plugin
               List the plugin contents

       --types=Element/Types
               Allow  inspecting  only  elements  that match all the element types filtered in this slash (´/´) separated list of element types. Those types correspond to what is also called ´klass´
               which is a string describing the type of element, like ´Decoder´, ´Audio´, ´Encoder´ etc... This options implies that only elements will be printed (not typefind  functions  or  trac‐
               ers).

       --exists
               Check if the specified element or plugin exists

       --atleast-version
               When checking if an element or plugin exists, also check that its version is at least the version specified

       -u, --uri-handlers
               Print supported URI schemes, with the elements that implement them

       --print-plugin-auto-install-info
               Print a machine-parsable list of features the specified plugin provides.  Useful in connection with external automatic plugin installation mechanisms.

       --gst-debug-mask=FLAGS
               GStreamer debugging flags to set (list with --help)

       --gst-mask=FLAGS
               GStreamer info and debugging flags to set (list with --help)

       --gst-plugin-spew
               GStreamer info flags to set Enable printout of errors while loading GStreamer plugins

       --gst-plugin-path=PATH
               Add directories separated with ':' to the plugin search path

SEE ALSO
       gst-launch-1.0(1), gst-typefind-1.0(1)

AUTHOR
       The GStreamer team at http://gstreamer.freedesktop.org/

                                                                                             December 2005                                                                                GStreamer(1)
