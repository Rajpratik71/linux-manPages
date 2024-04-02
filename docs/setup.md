setup(1)                                                                                          setuptool                                                                                          setup(1)



NAME
       setup - A text mode system configuration tool

SYNOPSIS
       setup

DESCRIPTION
       The  setuptool  program  (setup)  is a front-end menu program for a group of other tools, mostly system-config-*-tui tools. The list of options which it presents is assembled by scanning /etc/setup‐
       tool.d and /usr/share/setuptool/setuptool.d for files.

       Each file in the directory should contain one or more lines of text.  Each line contains from one to four fields which are separated by "|" characters.  In order, they are:
         - the path to the binary to invoke (mandatory)
         - the untranslated name of the application which should be displayed
           (If unset, defaults to the path of the binary, but don't depend on that.)
         - the gettext textdomain in which a translation of the name of the application can be found
           (If unset, defaults to "setup".)
         - the directory in which translations for the textdomain can be found
           (If unset, defaults to "/usr/share/locale".)

       If multiple entries with the same untranslated name exist, the one which was read FIRST takes precedence. Files are read in name collation order.

EXAMPLE
       A contrived example would create /etc/setuptool.d/00bogus with these contents:

         /bin/ls --color; /bin/sleep 5|Example "ls" invocation.

       or

         /bin/ls --color; /bin/sleep 5|Give this help list|libc

       to use one of libc's (not meaningful here, but) translatable messages.



Linux                                                                                             2009-10-07                                                                                         setup(1)
