dpkg-trigger(1)                               dpkg suite                               dpkg-trigger(1)

NAME
       dpkg-trigger - a package trigger utility

SYNOPSIS
       dpkg-trigger [option...] trigger-name
       dpkg-trigger [option...] command

DESCRIPTION
       dpkg-trigger is a tool to explicitly activate triggers and check for its support on the running
       dpkg.

       This can be used by maintainer scripts in complex and conditional  situations  where  the  file
       triggers, or the declarative activate triggers control file directive, are insufficiently rich.
       It can also be used for testing and by system administrators (but note that the triggers  won't
       actually be run by dpkg-trigger).

       Unrecognized trigger name syntaxes are an error for dpkg-trigger.

COMMANDS
       --check-supported
              Check  if the running dpkg supports triggers (usually called from a postinst). Will exit
              0 if a triggers-capable dpkg has run, or 1 with an  error  message  to  stderr  if  not.
              Normally, however, it is better just to activate the desired trigger with dpkg-trigger.

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

OPTIONS
       --admindir=dir
              Change the location of the dpkg database. The default location is /var/lib/dpkg.

       --by-package=package
              Override  trigger  awaiter  (normally  set  by dpkg through the DPKG_MAINTSCRIPT_PACKAGE
              environment variable of the maintainer scripts, naming the package to which  the  script
              belongs, and this will be used by default).

       --no-await
              This  option  arranges that the calling package T (if any) need not await the processing
              of this trigger; the  interested  package(s)  I,  will  not  be  added  to  T's  trigger
              processing awaited list and T's status is unchanged.  T may be considered installed even
              though I may not yet have processed the trigger.

       --await
              This option does the inverse of --no-await (since dpkg 1.17.21).  It  is  currently  the
              default behavior.

       --no-act
              Just test, do not actually change anything.

EXIT STATUS
       0      The  requested  action  was  successfully  performed.   Or  a check or assertion command
              returned true.

       1      A check or assertion command returned false.

       2      Fatal or unrecoverable error due to invalid command-line usage, or interactions with the
              system, such as accesses to the database, memory allocations, etc.

ENVIRONMENT
       DPKG_ADMINDIR
              If  set  and  the  --admindir option has not been specified, it will be used as the dpkg
              data directory.

SEE ALSO
       dpkg(1), deb-triggers(5), /usr/share/doc/dpkg-dev/triggers.txt.gz.

1.19.0.5                                      2019-09-05                               dpkg-trigger(1)
