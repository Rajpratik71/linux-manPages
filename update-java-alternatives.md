UPDATE-JAVA-ALTERNATIVES(8)                                   System Manager's Manual                                  UPDATE-JAVA-ALTERNATIVES(8)

NAME
       update-java-alternatives - update alternatives for jre/sdk installations

SYNOPSIS
       update-java-alternatives [--jre] [--plugin] [-v|--verbose]
             -l|--list [<jname>]
             -s|--set <jname>
             -a|--auto
             -h|-?|--help

DESCRIPTION
       update-java-alternatives  updates  all alternatives belonging to one runtime or development kit for the Java language.  A package does pro‐
       vide these information of it's alternatives in /usr/lib/jvm/.<jname>.jinfo.

OPTIONS
       -l|--list [<jname>]
              List all installed packages (or just <jname>) providing information to set a bunch of java alternatives. Verbose output  shows  each
              alternative provided by the packages.

       -a|--auto
              Switch all alternatives of registered jre/sdk installations to automatic mode.

       -s|--set <jname>
              Set all alternatives of the registered jre/sdk installation to the program path provided by the <jname> installation.

       --jre  Limit the actions to alternatives belong to a runtime environment, not a development kit.

       --jre-headless
              Limit the actions to alternatives belong to the headless part of a runtime environment.

       --plugin
              Limit the actions to alternatives providing browser plugins.

       -h|--help
              Display a help message.

       -v|--verbose
              Verbose output.

FILES
       /usr/lib/jvm/.*.jinfo
              A  text  file  describing a jre/sdk installation. Consists of some variables of the form <var>=<value> and a list of alternatives of
              the form jre|jdk <name> <path>.

AUTHOR
       update-java-alternatives and this manual page was written by Matthias Klose <doko@ubuntu.com>.

                                                                     May 2006                                          UPDATE-JAVA-ALTERNATIVES(8)
