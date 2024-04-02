FIND-JAR(1)                                                                                  Java Packages Tools                                                                                  FIND-JAR(1)



NAME
       find-jar - find extension JAR or directory

SYNOPSIS
       find-jar element

DESCRIPTION
       The find-jar command tests the resolution of a given element. If successful it will return a JAR file or a directory.

       This command is solely intended for testing resolution and should not be used in scripts. Even for single-element classpath building build-classpath is preferred since single-element searches can
       produce multiple file results when resolving into a directory.

EXAMPLES
       find-jar xpp3 will print /usr/share/java/xpp3.jar on standard output.

       find-jar javamail will print /usr/share/java/javamail on standard output.

REPORTING BUGS
       Bugs should be reported through Red Hat Bugzilla at http://bugzilla.redhat.com/.

SEE ALSO
       build-classpath(1), build-jar-repository(1), xmvn-resolve(1).



JAVAPACKAGES                                                                                      11/20/2015                                                                                      FIND-JAR(1)
