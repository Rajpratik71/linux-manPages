DEFAULTS(1)                                                    GNUstep System Manual                                                   DEFAULTS(1)

NAME
       defaults - read or modify GNUstep user defaults

SYNOPSIS
       defaults [ action ]

DESCRIPTION
       The 'defaults' command lets you to read and modify a user's defaults.

       This program replaces the old NeXTstep style dread, dwrite, and dremove programs.

       If  you have access to another user's defaults database, you may include '-u username' before any other options to use that user's database
       rather than your own.

       defaults read [ domain [ key] ]

              read the named default from the specified domain.  If no 'key' is given - read all defaults from the  domain.   If  no  'domain'  is
              given  - read all defaults from all domains.  A domain is either an application name, or "NSGlobalDomain", for system level defauts.
              (Running programs can access two other domains, "NSArgumentDomain", for command line arguments,  "NSRegistrationDomain",  a  second-
              chance domain in which "defaults for defaults" can be registered, and possibly domains for specific locales.)

       defaults readkey key

              read the named default from all domains.

       defaults write domain key value

              write 'value' as default 'key' in the specified domain.  'value' must be a property list in single quotes.

       defaults write domain dictionary

              write 'dictionary' as a replacement for the specified domain.  'dictionary' must be a property list in single quotes.

       defaults write

              reads standard input for defaults in the format produced by 'defaults read' and writes them to the database.

       defaults delete [ domain [ key] ]

              remove the specified default(s) from the domain.  If no 'key' is given - delete the entire domain.

       defaults delete

              read standard input for a series of lines containing pairs of domains and keys for defaults to be deleted.

       defaults domains

              lists the domains in the database (one per line)

       defaults find word

              searches  domain  names,  default  names, and default value strings for those equal to the specified word and lists them on standard
              output.

       defaults plist

              output some information about property lists

       defaults help

              list options for the defaults command.

FILES
       ~/GNUstep/Defaults/.GNUstepDefaults
              holds defaults for a user

BUGS
       None known.

DIAGNOSTICS
       Hopefully self-explanatory.

HISTORY
       The 'defaults' command appeared in OpenStep and combined  the  capabilities  of  the  earlier  NeXTstep  commands  'dread',  'dwrite',  and
       'dremove'.
       The GNUstep version was written in 1998.

       This manual page first appeared in gnustep-base 1.9.2 (March 2004).

AUTHORS
       defaults was written by Richard Frith-Macdonald <rfm@gnu.org>

GNUstep                                                            February 2004                                                       DEFAULTS(1)
