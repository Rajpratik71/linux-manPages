ikiwiki-mass-rebuild(8)                                       System Manager's Manual                                      ikiwiki-mass-rebuild(8)

NAME
       ikiwiki-mass-rebuild - rebuild all ikiwiki wikis on a system

SYNOPSIS
       ikiwiki-mass-rebuild

DESCRIPTION
       ikiwiki-mass-rebuild  can be used to force a rebuild of all the wikis on a system (when run as root), or all of a user's wikis (when run as
       non-root).

       You will need to list the setup files for the wikis it should build in the file /etc/ikiwiki/wikilist, which has the format:

       user /path/to/ikiwiki.setup

       It's also possible to let a user list setup files in ~user/.ikiwiki/wikilist in their home directory. To do so, list only the user's  name,
       without a setup file. The format of ~/.ikiwiki/wikilist is the same as /etc/ikiwiki/wikilist.

OPTIONS
       All options are passed on to ikiwiki.

AUTHOR
       Joey Hess <joey@ikiwiki.info>

                                                                                                                           ikiwiki-mass-rebuild(8)
