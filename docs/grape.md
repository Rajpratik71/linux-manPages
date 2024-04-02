grape(1)                                                      General Commands Manual                                                     grape(1)

NAME
       grape - inspection and management of the local grape cache used by Groovy

DESCRIPTION
       usage: grape [options] <command> [args] options:

       -D,--define <name=value>
              define a system property

       -d,--debug
              debug log level 4 will print out full stack traces

       -h,--help
              usage information

       -i,--info
              info log level 2 will print out information

       -q,--quiet
              quiet log level 0 will print only errors

       -v,--version
              display the Groovy and JVM versions

       -V,--verbose
              verbose log level 3 will print verbose logs

       -w,--warn
              warn log level 1 will print only errors and warnings

COMMANDS
       install <groupId> <artifactId> [<version>]:
              This  installs  the  specified  groovy module or maven artifact.  If a version is specified that specific version will be installed,
              otherwise the most recent version will be used (as if '*' we passed in).

       list:  Lists locally installed modules (with their full maven name in the case of groovy modules) and versions.

       resolve (<groupId> <artifactId> <version>)+:
              This returns the file locations of the jars representing the artifcats for the specified module(s) and the respective transitive de‐
              pendencies.   You  may  optionally pass in -ant, -dos, or -shell to get the dependencies expressed in a format applicable for an ant
              script, windows batch file, or unix shell script respectively.

SEE ALSO
       groovy(1)

AUTHOR
       This manual page was generated using help2man and edited by Ludovic Claude <ludovic.claude@laposte.net>, for the Debian project (but may be
       used by others).

                                                                     July 2009                                                            grape(1)
