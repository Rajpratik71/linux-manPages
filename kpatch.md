man(1)                                                                                         kpatch man page                                                                                         man(1)



NAME
       kpatch - hot patch module management

SYNOPSIS
       kpatch <command> [<args>]

DESCRIPTION
       kpatch is a user script that manages installing, loading, and displaying information about kernel patch modules installed on the system.

COMMANDS
       install [-k|--kernel-version=<kernel version>] <module>
              install patch module to be loaded at boot

       uninstall [-k|--kernel-version=<kernel version>] <module>
              uninstall patch module

       load --all
              load all installed patch modules into the running kernel

       load <module>
              load patch module into the running kernel

       unload --all
              unload all patch modules from the running kernel

       unload <module>
              unload patch module from the running kernel

       info <module>
              show information about a patch module

       list
              list installed patch modules

       version
              display the kpatch version


SEE ALSO
       kpatch-build(1)

BUGS
       No known bugs.

AUTHOR
       Udo Seidel (udoseidel@gmx.de)

COPYRIGHT
       Copyright (C) 2014: Seth Jennings <sjenning@redhat.com> and Josh Poimboeuf <jpoimboe@redhat.com>




1.0                                                                                              23 Mar 2014                                                                                           man(1)
