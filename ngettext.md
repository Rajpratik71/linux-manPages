NGETTEXT(1)                          GNU                          NGETTEXT(1)

NAME
       ngettext - translate message and choose plural form

SYNOPSIS
       ngettext [OPTION] [TEXTDOMAIN] MSGID MSGID-PLURAL COUNT

DESCRIPTION
       The  ngettext  program  translates a natural language message into the
       user's language, by looking up the translation in a  message  catalog,
       and  chooses  the appropriate plural form, which depends on the number
       COUNT and the language of the message catalog  where  the  translation
       was found.

       Display  native  language translation of a textual message whose gram‐
       matical form depends on a number.

       -d, --domain=TEXTDOMAIN
              retrieve translated message from TEXTDOMAIN

       -e     enable expansion of some escape sequences

       -E     (ignored for compatibility)

       -h, --help
              display this help and exit

       -V, --version
              display version information and exit

       [TEXTDOMAIN]
              retrieve translated message from TEXTDOMAIN

       MSGID MSGID-PLURAL
              translate MSGID (singular) / MSGID-PLURAL (plural)

       COUNT  choose singular/plural form based on this value

       If the TEXTDOMAIN parameter is not given,  the  domain  is  determined
       from  the  environment variable TEXTDOMAIN.  If the message catalog is
       not found in the regular directory, another location can be  specified
       with  the  environment variable TEXTDOMAINDIR.  Standard search direc‐
       tory: /usr/share/locale

AUTHOR
       Written by Ulrich Drepper.

REPORTING BUGS
       Report bugs to <bug-gnu-gettext@gnu.org>.

COPYRIGHT
       Copyright  ©  1995-1997,  2000-2007  Free  Software  Foundation,  Inc.
       License     GPLv3+:     GNU     GPL     version     3     or     later
       <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for ngettext is maintained as a Texinfo manual.
       If the info and ngettext programs are properly installed at your site,
       the command

              info ngettext

       should give you access to the complete manual.

GNU gettext-runtime 0.19.8.1      June 2016                       NGETTEXT(1)
