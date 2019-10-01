REBUILD-JAR-REPOSI(1)                                                                        Java Packages Tools                                                                        REBUILD-JAR-REPOSI(1)



NAME
       rebuild-jar-repository - rebuild a JAR repository

SYNOPSIS
       rebuild-jar-repository [OPTION]... DIRECTORY

DESCRIPTION
       Rebuild a jar repository (built by build-jar-repository) based on the current JVM settings

OPTIONS
       If no option is specified the default action will be to rebuild with symbolic links

       -c, --copy
           Copy files.

       -h, --hard
           Create hard links.

       -s, --soft, --symbolic Create symbolic links (default).

EXAMPLES
       rebuild-jar-repository . - This will update all links created by build-jar-repository in the current working directory. Updated links will be symbolic links.

       rebuild-jar-repository -h /tmp - This will update all links created by build-jar-repository in the /tmp directory. Updated links will be hard links.

AUTHOR
       Written by the JPackage Project (http://www.jpackage.org/).

REPORTING BUGS
       Bugs should be reported through Red Hat Bugzilla at http://bugzilla.redhat.com/.

SEE ALSO
       build-jar-repository(1), build-classpath(1),



JAVAPACKAGES                                                                                      11/20/2015                                                                            REBUILD-JAR-REPOSI(1)
