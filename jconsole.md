jconsole(1)                              Java Troubleshooting, Profiling, Monitoring and Management Tools                              jconsole(1)

NAME
       jconsole - Starts a graphical console that lets you monitor and manage Java applications.

SYNOPSIS
       jconsole [ options ] [ connection ... ]

       options
              The command-line options. See Options.

       connection = pid | host:port | jmxURL
              The pid value is the process ID of a local Java Virtual Machine (JVM). The JVM must be running with the same user ID as the user ID
              running the jconsole command.The host:port values are the name of the host system on which the JVM is running, and the port number
              specified by the system property com.sun.management.jmxremote.port when the JVM was started.The jmxUrl value is the address of the
              JMX agent to be connected to as described in JMXServiceURL.

              For more information about the connection parameter, see Monitoring and Management Using JMX Technology at
              http://docs.oracle.com/javase/8/docs/technotes/guides/management/agent.html

              See also the JMXServiceURL class description at http://docs.oracle.com/javase/8/docs/api/javax/management/remote/JMXServiceURL.html

DESCRIPTION
       The jconsole command starts a graphical console tool that lets you monitor and manage Java applications and virtual machines on a local or
       remote machine.

       On Windows, the jconsole command does not associate with a console window. It does, however, display a dialog box with error information
       when the jconsole command fails.

OPTIONS
       -interval=n
              Sets the update interval to n seconds (default is 4 seconds).

       -notile
              Does not tile windows initially (for two or more connections).

       -pluginpath plugins
              Specifies a list of directories or JAR files to be searched for JConsole plug-ins. The plugins path should contain a provider-
              configuration file named META-INF/services/com.sun.tools.jconsole.JConsolePlugin that contains one line for each plug-in. The line
              specifies the fully qualified class name of the class implementing the com.sun.tools.jconsole.JConsolePlugin class.

       -version
              Displays release information and exits.

       -help
              Displays a help message.

       -Jflag
              Passes flag to the JVM on which the jconsole command is run.

SEE ALSO
       · Using JConsole at http://docs.oracle.com/javase/8/docs/technotes/guides/management/jconsole.html

       · Monitoring and Management Using JMX Technology at http://docs.oracle.com/javase/8/docs/technotes/guides/management/agent.html

       · The JMXServiceURL class description at http://docs.oracle.com/javase/8/docs/api/javax/management/remote/JMXServiceURL.html

JDK 8                                                            21 November 2013                                                      jconsole(1)
