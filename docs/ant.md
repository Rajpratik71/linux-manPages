ant(1)                                 General Commands Manual                                 ant(1)

NAME
       ant - a Java based make tool.

SYNOPSIS
       ant [OPTIONS] [TARGET [TARGET2 [TARGET3] ...]]

DESCRIPTION
       Like  make  ant  is a tool by which projects can be build. But unlike it, ant is based on Java
       which means it will run on every platform for which a Java Virtual Machine is available.  This
       makes it a great tool for building Java software.

       By default it takes information from build.xml which describes the targets.

       -help, -h
              print help on the command line options

       -projecthelp, -p
              print project help information

       -version
              print the version information

       -diagnostics
              print information that might be helpful to diagnose or report problems

       -quiet, -q
              be extra quiet

       -silent, -S
              print nothing but task outputs and build failures

       -verbose, -v
              be extra verbose

       -debug, -d
              print debugging information

       -emacs, -e
              produce logging information without adornments

       -lib <path>
              specifies a path to search for jars and classes

       -logfile <file>
              use the given file to output log to

       -logger <classname>
              use the given class to perform logging

       -listener <classname>
              add an instance of the given class as a project listener

       -noinput
              do not allow interactive input

       -buildfile, -file, -f <file>
              use  the given buildfile instead of the default build.xml file. This is the ant equiva‐
              lent of Makefile

       -D<property>=<value>
              use value for the given property

       -keep-going, -k
              execute all targets that do not depend on failed target(s)

       -propertyfile <name>
              load all properties from file with -D properties taking precedence

       -inputhandler <class>
              the class which will handle input requests

       -find, -s <file>
              search for buildfile towards the root of the filesystem and use it

       -nice <number>
              A niceness value for the main thread: 1 (lowest) to 10 (highest); 5 is the default

       -nouserlib
              Run ant without using the jar files from ${user.home}/.ant/lib

       -noclasspath
              Run ant without using CLASSPATH

       -autoproxy
              Java 5 or later : use the OS proxy settings

       -main <class>
              Override Ant's normal entry point

SEE ALSO
       make(1) mvn(1)

AUTHOR
       This manpage is written by Egon Willighagen <egonw@sci.kun.nl>

Debian GNU/Linux                               Feb 2010                                        ant(1)
