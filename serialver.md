serialver(1)                     Remote Method Invocation (RMI) Tools                     serialver(1)

NAME
       serialver - Returns the serial version UID for specified classes.

SYNOPSIS
       serialver [ options ] [ classnames ]

       options
              The command-line options. See Options.

       classnames
              The classes for which the serialVersionUID is to be returned.

DESCRIPTION
       The serialver command returns the serialVersionUID for one or more classes in a form suitable
       for copying into an evolving class. When called with no arguments, the serialver command prints
       a usage line.

OPTIONS
       -classpath path-files
              Sets the search path for application classes and resources. Separate classes and
              resources with a colon (:).

       -show
              Displays a simple user interface. Enter the full class name and press either the Enter
              key or the Show button to display the serialVersionUID.

       -Joption
              Passes option to the Java Virtual Machine, where option is one of the options described
              on the reference page for the Java application launcher. For example, -J-Xms48m sets the
              startup memory to 48 MB. See java(1).

NOTES
       The serialver command loads and initializes the specified classes in its virtual machine, and
       by default, it does not set a security manager. If the serialver command is to be run with
       untrusted classes, then a security manager can be set with the following option:

       -J-Djava.security.manager

       When necessary, a security policy can be specified with the following option:

       -J-Djava.security.policy=<policy file>

SEE ALSO
       • policytool(1)

       • The java.io.ObjectStream class description at
         http://docs.oracle.com/javase/8/docs/api/java/io/ObjectStreamClass.html

JDK 8                                      21 November 2013                               serialver(1)
