unpack200(1)                             Java Deployment Tools                            unpack200(1)

NAME
       unpack200 - Transforms a packed file produced by pack200(1) into a JAR file for web deployment.

SYNOPSIS
       unpack200 [ options ] input-file JAR-file

       options
              The command-line options. See Options.

       input-file
              Name of the input file, which can be a pack200 gzip file or a pack200 file. The input
              can also be JAR file produced by pack200(1) with an effort of 0, in which case the
              contents of the input file are copied to the output JAR file with the Pack200 marker.

       JAR-file
              Name of the output JAR file.

DESCRIPTION
       The unpack200 command is a native implementation that transforms a packed file produced by
       pack200(1) into a JAR file. A typical usage follows. In the following example, the
       myarchive.jar file is produced from myarchive.pack.gz with the default unpack200 command
       settings.

       unpack200 myarchive.pack.gz myarchive.jar

OPTIONS
       -Hvalue --deflate-hint=value
              Sets the deflation to be true, false, or keep on all entries within a JAR file. The
              default mode is keep. If the value is true or false, then the --deflate=hint option
              overrides the default behavior and sets the deflation mode on all entries within the
              output JAR file.

       -r --remove-pack-file
              Removes the input pack file.

       -v --verbose
              Displays minimal messages. Multiple specifications of this option displays more verbose
              messages.

       -q --quiet
              Specifies quiet operation with no messages.

       -lfilename --log-file=filename
              Specifies a log file where output messages are logged.

       -? -h --help
              Prints help information about the unpack200 command.

       -V --version
              Prints version information about the unpack200 command.

       -Joption
              Passes option to the Java Virtual Machine, where option is one of the options described
              on the reference page for the Java application launcher. For example, -J-Xms48m sets the
              startup memory to 48 MB. See java(1).

NOTES
       This command should not be confused with the unpack command. They are distinctly separate
       products.

       The Java SE API Specification provided with the JDK is the superseding authority in case of
       discrepancies.

EXIT STATUS
       The following exit values are returned: 0 for successful completion, and a value that is
       greater than 0 when an error occurred.

SEE ALSO
       • pack200(1)

       • jar(1)

       • jarsigner(1)

       • Pack200 and Compression at
         http://docs.oracle.com/javase/8/docs/technotes/guides/deployment/deployment-
         guide/pack200.html

       • The Java SE Technical Documentation page at http://docs.oracle.com/javase/

JDK 8                                      21 November 2013                               unpack200(1)
