ikiwiki-update-wikilist(1)                                    General Commands Manual                                   ikiwiki-update-wikilist(1)

NAME
       ikiwiki-update-wikilist - add or remove user from /etc/ikiwiki/wikilist

SYNOPSIS
       ikiwiki-update-wikilist [-r]

DESCRIPTION
       ikiwiki-update-wikilist  is  designed  to be safely run as root by arbitrary users, either by being made suid and using the (now deprecated
       suidperl), or by being configured in /etc/sudoers to allow arbitrary users to run.

       All it does is allows users to add or remove their names from the /etc/ikiwiki/wikilist file.

       By default, the user's name will be added.  The -r switch causes the user's name to be removed.

       If your name is in /etc/ikiwiki/wikilist, the ikiwiki-mass-rebuild(8) command will look for a ~/.ikiwiki/wikilist  file,  and  rebuild  the
       wikis listed in that file.

OPTIONS
       None.

AUTHOR
       Joey Hess <joey@ikiwiki.info>

                                                                                                                        ikiwiki-update-wikilist(1)
