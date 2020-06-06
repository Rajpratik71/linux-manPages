GStreamer(1)                                                                               General Commands Manual                                                                               GStreamer(1)



NAME
       gst-feedback - generate debug info for GStreamer bug reports

SYNOPSIS
       gst-feedback-0.10

DESCRIPTION
       gst-feedback is a utility that scans the system for various information that is useful to GStreamer developers to help diagnose user problem.

       Depending on the type of bug report, it may be useful to attach the output of gst-feedback when you contact the developers.

       NOTE:  The  current version of this script scans many dirs: /usr/lib /usr/local/lib /home /usr/include /usr/local/include /home (again) for various GStreamer installations.  Depending on your system
       you may not want to do this.  Improvements to the script are welcome.

USAGE
       Generate the feedback information by running gst-feedback:

       gst-feedback

       Possibly redirect output and errors to a file:

       gst-feedback &> myfeedback

WARNING
       The gst-feedback dumps a lot of information about a system, some of which may be considered sensitive.  If this is a concern, review the information before posting to a public  forum,  such  as  the
       GStreamer bug tracking system.

SEE ALSO
       gst-inspect(1), gst-launch(1), gst-typefind(1)

AUTHOR
       The GStreamer team at http://gstreamer.freedesktop.org/



                                                                                                  June 2002                                                                                      GStreamer(1)
