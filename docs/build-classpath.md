BUILD-CLASSPATH(1)                                                                           Java Packages Tools                                                                           BUILD-CLASSPATH(1)



NAME
       build-classpath - build a Java CLASSPATH

SYNOPSIS
       build-classpath JAR|artifact-coordinates [JAR|artifact-coordinates ...]

DESCRIPTION
       Small utility to build a Java CLASSPATH with the named JARs or Maven artifact coordinates. Artifact coordinates specify Maven artifact and are in format
       groupId:artifactId[:extension[:classifier]]:version. If extension is omitted then "jar" is used. If classifier is omitted then empty classifier is used. For more information see XMvn Configuration
       Reference. The CLASSPATH is returned to standard output.

EXAMPLES
       build-classpath junit xerces-j2 wsdl4j - this will return a string to standard out that is a valid CLASSPATH containing junit, xerces-j2, and wsdl4j JARs.

       build-classpath log4j:log4j org.apache.commons:commons-io - this will return a string to standard out that is a valid CLASSPATH containing log4j and commons-io JARs.

       build-classpath com.google.inject:guice::no_aop: - this will return a string to standard out that is a valid CLASSPATH containing google-guice JAR with classifier no_aop.

AUTHOR
       Originally written by David Walluck.

REPORTING BUGS
       Bugs should be reported through Red Hat Bugzilla at http://bugzilla.redhat.com/.

SEE ALSO
       build-jar-repository(1), rebuild-jar-repository(1),



JAVAPACKAGES                                                                                      11/20/2015                                                                               BUILD-CLASSPATH(1)
