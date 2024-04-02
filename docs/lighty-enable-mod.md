LIGHTYENABLEMOD(1)                                            General Commands Manual                                           LIGHTYENABLEMOD(1)

NAME
       lighty-enable-mod, lighty-disable-mod - enable or disable configuration in lighttpd server

SYNOPSIS
       lighty-enable-mod [module]
       lighty-disable-mod [module]

DESCRIPTION
       This manual page documents briefly the lighty-enable-mod and lighty-disable-mod commands.

       lighty-enable-mod  and  lighty-disable-mod  are  programs  that  enable  (and respectively disable) the specified configuration file within
       lighttpd configuration.

       Both programs can be run interactively or from command line. If either program is called without any arguments, an  input  prompt  is  dis‐
       played  to  the  user, where he might choose among available lighttpd modules. Immediate action is taken, if a module name was given on the
       command line.

   EXIT STATUS
       Both programs indicate failure in their exit status. lighty-enable-mod or lighty-disable-mod respectively may leave execution with  one  of
       the following exit codes:

       0    denotes success

       1    denotes a fatal error (e.g., a module could not be enabled, or a dependency was not found)

       2    denotes a minor flaw (e.g., a module was not enabled because it was already loaded before)

       Note
       You  can  (un-)  load several modules at time. The exit status will only reflect the most serious issue (where a minor flaw beats no error,
       but a fatal error beats a minor flaw). This means, if a minor flaw was encountered as well as a fatal error, the program  will  leave  with
       exit status 1 and stop immediately.

DEPENDENCIES
       Debian  allows lighttpd modules to formulate dependencies to other modules they depend on. Configuration files are scanned for dependencies
       upon load or unload of modules, not at runtime of the web server. Such a magic line has the following format:

         # -*- depends: module[, module] -*-

       and may appear anywhere in the file. If such a line is found, the extracted name is interpreted as dependency to another  lighttpd  module.
       lighty-enable-mod  will  seek available configurations to satisfy this dependency and will recursively enable all dependencies found on its
       way.  lighty-disable-mod will disable reverse dependencies recursively.

SEE ALSO
       lighttpd(1)

AUTHOR
       Program and man pages were originally written by Krzysztof Krzyżaniak <eloy@debian.org> and later modified by Arno Töll <debian@toell.net>

                                                                    2006-01-11                                                  LIGHTYENABLEMOD(1)
