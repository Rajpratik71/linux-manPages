KEDPM(1)                                                      General Commands Manual                                                     KEDPM(1)

NAME
       kedpm — Ked Password Manager

SYNOPSIS
       kedpm [OPTION]

DESCRIPTION
       This manual page documents briefly the kedpm command.

       This manual page was written for the Debian distribution because the original program does not have a manual page.

       kedpm  Ked Password Manager helps to manage large amounts of passwords and related information and simplifies tasks of searching and enter‐
       ing password data.

       KedPM written in python and can be run virtually on any platform python interpreter can run.

       KedPM written as extensible framework, which allows to plug in custom password database back-ends and  custom  user  interface  front-ends.
       Currently only Figaro PM back-end supported. To manage his passwords, user can choose between GUI (GTK2 based graphical user interface) and
       CLI (Command Line Interface).

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with  two  dashes  (`-').   A  summary  of  options  is
       included below.

       -h                    -?           --help
                 Show summary of options.

       -c           --frontend=cli
                 Run command line interface.

       -g           --frontend=gui
                 Run GTK2 graphical interface.

AUTHOR
       This  manual page was written by Matthias Kaehlcke <matze@sindominio.net> for the Debian system (but may be used by others).  Permission is
       granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later version pub‐
       lished by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

                                                                                                                                          KEDPM(1)
