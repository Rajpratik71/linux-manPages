MAKE_SERVICES(1)                                               GNUstep System Manual                                              MAKE_SERVICES(1)

NAME
       make_services - generate GNUstep services info

SYNOPSIS
       make_services [--test filename ] [--verbose|--quiet]

DESCRIPTION
       make_services builds a validated cache of service information for use by programs that want to access the GNUstep services facility.  Addi‐
       tionally, it builds a list of applications and service bundles found in the standard directories. This cache is usually stored in the  file
       named .GNUstepServices in the user's GNUstep directory.

       Most  commonly,  make_services  is  called from within the GNUstep.sh or GNUstep.csh script to update the service information everytime the
       GNUstep environmet is set up, i.e.  in a login script. But of course it is possible to run make_services from the command line whenever you
       wish, for example after having installed a new application or service.

       The Services menu in an application's mainmenu is usually updated automatically. However, it may be neccessary to close an open or torn off
       menu for the changes to appear.  Also, the workspace manager may have to be closed and restarted  for  file  association  changes  to  take
       effect.

OPTIONS
       --test filename
              check that property list filename contains a valid service information.

       --quiet
              suppress warnings (not recommended but useful in login scripts).

       --verbose
              give verbose output.

       --help show small help screen.

EXAMPLES
       Simply rebuild the cache of service information:

       make_services

       Check whether the file ServiceInfo.plist contains a valid service description:

       make_services --test ServiceInfo.plist

NOTES
       Giving both --quiet and --verbose on the command line will result in verbose output, ignoring the --quiet argument.

SEE ALSO
       GNUstep(7), gopen(1)

HISTORY
       Work on make_services started November 1998.

       This manual page was first written October 2003.

AUTHORS
       make_services was written by Richard Frith-Macdonald <richard@brainstorm.co.uk>.

       This man page was written by Martin Brecher <martin@mb-itconsulting.com>.

GNUstep                                                            October 2003                                                   MAKE_SERVICES(1)
