extcheck(1)                                   Basic Tools                                  extcheck(1)

NAME
       extcheck - Detects version conflicts between a target Java Archive (JAR) file and currently
       installed extension JAR files.

SYNOPSIS
       extcheck [options] targetfile.jar

       options
              The command-line options. See Options.

       targetfile.jar
              The target JAR file against which the currently installed extension JAR files are
              compared to detect version conflicts.

DESCRIPTION
       The extcheck command checks a specified JAR file for title and version conflicts with any
       extensions installed in the Java SE SDK. Before installing an extension, you can use this
       utility to see whether the same or a more recent version of the extension is already installed.

       The extcheck command compares the Specification-title and Specification-version headers in the
       manifest of the targetfile.jar file against the corresponding headers in all JAR files
       currently installed in the extension directory. By default, the extension directory is
       jre/lib/ext on Oracle Solaris and \jre\lib\ext on Windows. The extcheck command compares
       version numbers in the same way as the java.lang.Package.isCompatibleWith method.

       If no conflict is detected, then the return code is 0.

       If the manifest of any JAR file in the extensions directory has the same Specification-title
       and the same or a newer Specification-version number, then a non-zero error code is returned. A
       non-zero error code is also returned when targetfile.jar does not have the Specification-title
       or Specification-version attributes in its manifest file.

OPTIONS
       -verbose
              Lists JAR files in the extension directory as they are checked. Additionally, manifest
              attributes of the target JAR file and any conflicting JAR files are also reported.

       -Joption
              Passes option to the Java Virtual Machine (JVM), where option is one of the options
              described on the reference page for the Java launcher. For example, -J-Xms48m sets the
              startup memory to 48 MB. See java(1).

SEE ALSO
       • jar(1)

JDK 8                                      21 November 2013                                extcheck(1)
