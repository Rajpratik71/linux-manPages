GStreamer(1)                                                                              GStreamer(1)

NAME
       gst-device-monitor-1.0 - Simple command line testing tool for GStreamer device monitors

SYNOPSIS
       gst-device-monitor-1.0 [DEVICE_CLASSES[:FILTER_CAPS]] [DEVICE_CLASSES[:FILTER_CAPS]]

DESCRIPTION
       gst-device-monitor-1.0 is a command line tool that can be used to test GStreamer's device moni‐
       toring functionality. By default it will just print a list of all devices found and  exit,  but
       you  can also make it wait around for more devices by passing the --follow option. You can also
       pass it one or more filter arguments to filter the kind of devices you are interested in.

OPTIONS
       gst-device-monitor-1.0 accepts the following options:

       --help  Print help synopsis and available command line options

       --version
               Print version and exit

       -f, --follow
               Don't exit after showing the initial device list, but wait for devices to be  added  or
               removed

EXAMPLES
       gst-device-monitor-1.0

       gst-device-monitor-1.0 --follow

       gst-device-monitor-1.0 Audio/Source

       gst-device-monitor-1.0 Video/Source:video/x-raw

SEE ALSO
       gst-inspect-1.0(1), gst-launch-1.0(1), gst-discoverer-1.0(1), gst-play-1.0(1),

AUTHOR
       The GStreamer team at http://gstreamer.freedesktop.org/

                                               June 2014                                  GStreamer(1)
