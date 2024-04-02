PLAINBOX-QML-SHELL(1)                                                                            Plainbox                                                                           PLAINBOX-QML-SHELL(1)

NAME
       plainbox-qml-shell - standalone qml-native shell

SYNOPSIS
          plainbox-qml-shell [-h] [--version] [-v] [-D] [-C] [-T LOGGER] [-P] [-I]
                             QML-FILE

DESCRIPTION
       Runs specified file as it would be a plainbox' qml job.  Returns 0 if job returned 'pass', 1 if job returned 'fail', or other value in case of an error.

       This command runs qml job provided by specified file.

       General purpose of this command is to make development of qml-native jobs faster, by making it easier to test qml file(s) that constitute to job without resorting to installation of provider and
       running plainbox run.  Typical approach to the development of new qml job would be as follows:

       - have an idea for a job

       - create a qml file in Ubuntu-SDK or Your Favourite Editor

       - hack on the file and iterate using qmlscene (or use plainbox-qml-shell
         immediately if you start with next point)

       - make it conformant to plainbox qml-native API described in CEP-5
         (calling test-done at the end)

       - copy qml file over to data dir of a provider and add a job unit to it

OPTIONS
       Positional arguments:

       qml file with job to be run

       Optional arguments:

       --version
              show program's version number and exit

       -v, --verbose
              be more verbose (same as --log-level=INFO)

       -D, --debug
              enable DEBUG messages on the root logger

       -C, --debug-console
              display DEBUG messages in the console

       -T, --trace
              enable DEBUG messages on the specified logger (can be used multiple times)

       -P, --pdb
              jump into pdb (python debugger) when a command crashes

       -I, --debug-interrupt
              crash on SIGINT/KeyboardInterrupt, useful with --pdb

SEE ALSO
       plainbox-run

AUTHOR
       Zygmunt Krynicki & Checkbox Contributors

COPYRIGHT
       2012-2014 Canonical Ltd

0.25                                                                                         January 05, 2016                                                                       PLAINBOX-QML-SHELL(1)
