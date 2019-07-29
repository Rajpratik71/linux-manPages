UPDATE-TEXMF(8)                                               System Manager's Manual                                              UPDATE-TEXMF(8)

NAME
       update-texmf - shell script to generate /etc/texmf/texmf.cnf

SYNOPSIS
       update-texmf [options]

DESCRIPTION
       This  manual  page  documents briefly the update-texmf command.  This manual page was written for the Debian GNU/Linux distribution because
       the original script was designed for Debian packaging system.

       update-texmf is a shell script to generate /etc/texmf/web2c/texmf.cnf from files in /etc/texmf/texmf.d/*.cnf

       A user who wants to customize /etc/texmf/web2c/texmf.cnf should add, for example, 22mymacro.cnf in  /etc/texmf/texmf.d/  and  run  'update-
       texmf'.

OPTIONS
       -v, --verbose
              Show verbose messages.

       -d, --debug
              Show debugging information, and don't delete temporary files. Implies --verbose.

       -o, --output FILE
              Generate output in FILE instead of /etc/texmf/web2c/texmf.cnf.

SEE ALSO
       Further information can be found in /usr/share/doc/tex-common/README.Debian.{txt,pdf.html}

AUTHOR
       This manual page was written by Atsuhito Kohda <kohda@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                   UPDATE-TEXMF(8)
