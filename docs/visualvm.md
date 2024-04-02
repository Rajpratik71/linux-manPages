VISUALVM(1)                                                        User Commands                                                       VISUALVM(1)

NAME
       VisualVM - All-in-One Java Troubleshooting Tool

SYNOPSIS
       jvisualvm [OPTIONS]

DESCRIPTION
       VisualVM  is  a tool to monitor and troubleshoot Java applications. It runs on Java 7 or higher but is able to monitor applications running
       on JDK 1.4 and higher. It utilizes various available technologies like jvmstat, JMX, the Serviceability Agent (SA), and the Attach  API  to
       get the data and automatically uses the fastest and most lightweight technology to impose minimal overhead on monitored applications.

OPTIONS
       --openjmx <arg>
              open application specified by JMX connection (host:port)

       --openfile <arg>
              open file specified by <arg>, file can be Application snapshot, NetBeans Profiler snapshot or HPROF heap dump.

       --openid <arg>
              open application with id <arg>

       --openpid <arg>
              open application with process id <arg>

       --laf <LaF classname>
              use given LookAndFeel class instead of the default

       --fontsize <size>
              set the base font size of the user interface, in points

       --locale <language[:country[:variant]]>
              use specified locale

       --userdir <path>
              use specified directory to store user settings

       --cachedir <path>
              use specified directory to store user cache, must be different from userdir

       --nosplash
              do not show the splash screen

       --help show this help

       --jdkhome <path>
              path to JDK

       -J<jvm_option>
              pass <jvm_option> to JVM

SEE ALSO
       More information and tutorial videos are available on the VisualVM site at:

              https://visualvm.github.io

VisualVM 1.3.7                                                       May 2014                                                          VISUALVM(1)
