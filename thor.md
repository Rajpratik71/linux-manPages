thor(1)                                                       General Commands Manual                                                      thor(1)

NAME
       thor - Scripting framework for command line utilities

SYNOPSIS
       thor help [TASK]

       thor install NAME

       thor installed

       thor list [SEARCHTERM]

       thor uninstall NAME

       thor update NAME

       thor version

DESCRIPTION
       Thor is a scripting framework designed for command line utilities.  It is supposed to be a replacement for rake, sake and rubigen.

COMMANDS
       help [TASK]
               Describe available tasks or the specified task

       install NAME
               Install an optionally named Thor file into your system tasks

       installed
               List the installed Thor modules and tasks

       list [SEARCHTERM]
               List the available thor tasks (--substring means .*searchterm)

       uninstall NAME
               Uninstall a named Thor module

       update NAME
               Update a Thor file from its original location

       version Show Thor version

SEE ALSO
       The Thor website: http://whatisthor.com/

       The Thor wiki: https://github.com/wycats/thor/wiki

AUTHORS
       Thor is written by Yehuda Katz, Eric Hodel, et al.

       This  manual  page was written by Christian Hofstaedtler, based on the command-line output of this program, for the Debian GNU/Linux system
       (but may be freely used by others).

                                                                    May 7, 2013                                                            thor(1)
