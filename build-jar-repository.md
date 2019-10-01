BUILD-JAR-REPOSITO(1)                                                                        Java Packages Tools                                                                        BUILD-JAR-REPOSITO(1)



NAME
       build-jar-repository - create a symbolic link to a JAR

SYNOPSIS
       build-jar-repository [OPTION]... DIRECTORY JAR|artifact-coordinates

DESCRIPTION
       Build a JAR repository in the named directory by copying files or creating symbolic links. The JARs can be identified by their names or Maven artifact coordinates. Artifact coordinates specify Maven
       artifact and are in format groupId:artifactId[:extension[:classifier]]:version. If extension is omitted then "jar" is used. If classifier is omitted then empty classifier is used. For more
       information see XMvn Configuration Reference.

OPTIONS
       If no option is specified the default action will be to create symbolic links

       -c, --copy
           Copy files.

       -h, --hard
           Create hard links.

       -p, --preserve-naming Try to preserve the names of the original JAR files (in case of a nested hit the slashes in the path will still be replaced by underscores). Using this option makes any future
       automated repository rebuild impossible, and implies -c unless specified otherwise.

       -s, --soft, --symbolic Create symbolic links (default).

       --help Display help text

EXAMPLES
       build-jar-repository . jndi - This will create a symbolic link to the jndi JAR in the current working directory.

       build-jar-repository -h /tmp log4j - This will create a hard link to the log4j JAR in /tmp directory.

       build-jar-repository -c . org.apache.commons:commons-io - This will copy commons-io JAR to the current working directory.

AUTHOR
       Originally written by Nicholas Mailhot and David Walluck.

REPORTING BUGS
       Bugs should be reported through Red Hat Bugzilla at http://bugzilla.redhat.com/.

SEE ALSO
       build-classpath(1), rebuild-jar-repository(1),



JAVAPACKAGES                                                                                      11/20/2015                                                                            BUILD-JAR-REPOSITO(1)
