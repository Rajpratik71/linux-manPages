GStreamer(1)                                                                               General Commands Manual                                                                               GStreamer(1)



NAME
       gst-xmlinspect - print info about a GStreamer plugin or element

SYNOPSIS
       gst-xmlinspect [OPTION...] [PLUGIN|ELEMENT]

DESCRIPTION
       gst-xmlinspect  is  a tool that prints out information on available GStreamer plugins, information about a particular plugin, or information about a particular element.  When executed with no PLUGIN
       or ELEMENT argument, gst-xmlinspect will print a list of all plugins and elements.  When executed with a PLUGIN or ELEMENT argument, gst-xmlinspect will print information about that plug-in or  ele‐
       ment as an XML document.

OPTIONS
       gst-xmlinspect accepts the following arguments and options:

       PLUGIN  Name of a plugin

       ELEMENT Name of an element

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
       gst-feedback(1), gst-inspect(1), gst-launch(1), gst-typefind(1)

AUTHOR
       The GStreamer team at http://gstreamer.freedesktop.org/



                                                                                                  March 2001                                                                                     GStreamer(1)
