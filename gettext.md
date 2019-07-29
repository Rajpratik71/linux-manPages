GETTEXT(1)                           GNU                           GETTEXT(1)

NAME
       gettext - translate message

SYNOPSIS
       gettext [OPTION] [[TEXTDOMAIN] MSGID]
       gettext [OPTION] -s [MSGID]...

DESCRIPTION
       The  gettext  program  translates  a natural language message into the
       user's language, by looking up the translation in a message catalog.

       Display native language translation of a textual message.

       -d, --domain=TEXTDOMAIN
              retrieve translated messages from TEXTDOMAIN

       -e     enable expansion of some escape sequences

       -E     (ignored for compatibility)

       -h, --help
              display this help and exit

       -n     suppress trailing newline

       -V, --version
              display version information and exit

       [TEXTDOMAIN] MSGID
              retrieve translated message corresponding to MSGID from TEXTDO‐
              MAIN

       If  the  TEXTDOMAIN  parameter  is not given, the domain is determined
       from the environment variable TEXTDOMAIN.  If the message  catalog  is
       not  found in the regular directory, another location can be specified
       with the environment variable TEXTDOMAINDIR.  When used  with  the  -s
       option  the  program behaves like the 'echo' command.  But it does not
       simply copy its arguments to stdout.  Instead those messages found  in
       the  selected  catalog  are  translated.   Standard  search directory:
       /usr/share/locale

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
       The  full documentation for gettext is maintained as a Texinfo manual.
       If the info and gettext programs are properly installed at your  site,
       the command

              info gettext

       should give you access to the complete manual.

GNU gettext-runtime 0.19.8.1      June 2016                        GETTEXT(1)
