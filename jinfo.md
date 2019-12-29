jinfo(1)                                 Troubleshooting Tools                                jinfo(1)

NAME
       jinfo - Generates configuration information. This command is experimental and unsupported.

SYNOPSIS
       jinfo [ option ] pid

       jinfo [ option ] executable core

       jinfo [ option ] [ servier-id ] remote-hostname-or-IP

       option The command-line options. See Options.

       pid    The process ID for which the configuration information is to be printed. The process
              must be a Java process. To get a list of Java processes running on a machine, use the
              jps(1) command.

       executable
              The Java executable from which the core dump was produced.

       core   The core file for which the configuration information is to be printed.

       remote-hostname-or-IP
              The remote debug server hostname or IP address. See jsadebugd(1).

       server-id
              An optional unique ID to use when multiple debug servers are running on the same remote
              host.

DESCRIPTION
       The jinfo command prints Java configuration information for a specified Java process or core
       file or a remote debug server. The configuration information includes Java system properties
       and Java Virtual Machine (JVM) command-line flags. If the specified process is running on a
       64-bit JVM, then you might need to specify the -J-d64 option, for example: jinfo-J-d64
       -sysprops pid.

       This utility is unsupported and might not be available in future releases of the JDK. In
       Windows Systems where dbgeng.dll is not present, Debugging Tools For Windows must be installed
       to have these tools working. The PATH environment variable should contain the location of the
       jvm.dll that is used by the target process or the location from which the crash dump file was
       produced. For example, set PATH=%JDK_HOME%\jre\bin\client;%PATH% .

OPTIONS
       no-option
              Prints both command-line flags and system property name-value pairs.

       -flag name
              Prints the name and value of the specified command-line flag.

       -flag [+|-]name
              enables or disables the specified Boolean command-line flag.

       -flag name=value
              Sets the specified command-line flag to the specified value.

       -flags
              Prints command-line flags passed to the JVM.

       -sysprops
              Prints Java system properties as name-value pairs.

       -h
              Prints a help message.

       -help
              Prints a help message.

SEE ALSO
       • jps(1)

       • jsadebugd(1)

JDK 8                                      21 November 2013                                   jinfo(1)
