su-to-root(1)                           Debian GNU/Linux manual                          su-to-root(1)

NAME
       su-to-root  - A simple script to give an `interactive' front-end to su.  It can be used in menu
       entry commands to ask for the root password

SYNOPSIS
       su-to-root [-X] [-p <user>] -c <command>

DESCRIPTION
       Most menu entries simply start an editor or a game or whatever. But  some  menu  entries  would
       like to give the user the ability to change important settings in the system, that require root
       privileges.  su-to-root can be used to ask for the root password.

OPTIONS
       -c <command>
              The command to execute as a string. This option is mandatory.

       -p <user>
              The name of the user to change to, instead of root.

       -X     The command is a X11 program that does not require a terminal.  This is to be used  with
              menu entries that declare needs="X11".

ENVIRONMENT
       SU_TO_ROOT_X
              Select  the  su-like program called by su-to-root -X.  Supported values are gksu, kdesu,
              kde4su, ktsuss,
               sux, gksudo and kdesudo.  kde4su denotes the KDE4 version of kdesu.

              When this variable is not set su-to-root will currently try to use gksu, kdesu,  kde4su,
              ktsuss,  sux  and  the  built-in code, in that order with the exception that under a KDE
              session, kdesu and kde4su are prefered over gksu.

              The exact set of programs to try and their order is subject to change without notice.

       SU_TO_ROOT_SU
              Select the su-like program used in text mode.  Supported values are sudo,  sux  and  su,
              the first being the default in Ubuntu (configured in /etc/su-to-rootrc).

FILES
       /etc/su-to-rootrc

       ~/.su-to-rootrc
              su-to-root  will  source  these files at startup in this order. This lets you define and
              modify the environment variables above without restarting your X session.

COPYING
       su-to-root is distributed under the GNU General Public License.  (GPL 2.0 or greater).

AUTHORS
       Joost Witteveen <joostje@debian.org>

       X11 support by Morten Brix Pedersen and Bill Allombert <ballombe@debian.org>

SEE ALSO
       update-menus(1), menufile(5), /usr/share/doc/menu/html

Debian Project                              20 October 1998                              su-to-root(1)
