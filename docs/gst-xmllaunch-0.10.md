GStreamer(1)                                                                               General Commands Manual                                                                               GStreamer(1)



NAME
       gst-xmllaunch - build and run a GStreamer pipeline from an XML serialization

SYNOPSIS
       gst-xmllaunch [OPTION...] XML-FILE [ ELEMENT.PROPERTY=VALUE ... ]

DESCRIPTION
       gst-xmllaunch  is a tool that is used to build and run a basic GStreamer pipeline, loading it from an XML description. You can produce the XML description using gst-launch-0.10(1) with the -o option
       or by calling gst_xml_write_file() in your own app.

       A simple commandline looks like:

        gst-xmllaunch my-pipeline.xml filesrc0.location=music.mp3

       This sets the location property of the element named filesrc0 to the value "music.mp3". See gst-launch(1) for syntax on setting element names, and gst-inspect to see what properties various elements
       have.

       You can pass "-" as the XML-FILE to read from stdin.

       XML-FILE can be a URI as well, thanks to the wizardry of libxml. I'm not really sure what all is supported, it seems http works just fine though.


WARNING
       gst-xmllaunch is deprecated and broken for all but the most simple pipelines. It will most likely be removed in future. Don't use it.

OPTIONS
       gst-xmllaunch accepts the following options:

       --help  Print help synopsis and available FLAGS

       --silent
               Do not output status information

       --exclude=TYPE, -XTYPE
               Do not output status information of TYPE

       --output=FILE, -oFILE
               Save XML representation of pipeline to FILE and exit

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
