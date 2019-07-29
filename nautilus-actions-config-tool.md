nautilus-actions-config-tool(1)                               General Commands Manual                              nautilus-actions-config-tool(1)

NAME
       nautilus-actions-config-tool - configure programs to launch from the nautilus file manager

SYNOPSIS
       nautilus-actions-config-tool

OPTIONS
   Help Options
       -?, --help
              Show help options

       -?, --help-all
              Show all help options

       -?, --help-misc

   Application Options
       -?, --non-unique
              Set it to run multiple instances of the program [unique]

       -?, --version
              Output the version number, and exit gracefully [no]

       -?, --display=DISPLAY
              X display to use

DESCRIPTION
       nautilus-actions  is an extension for the nautilus file manager which allows arbitrary programs to be launched through the nautilus context
       menu.

       Each time you right-click on one or more files in nautilus, or any part of the background of the currently opened folder,  nautilus-actions
       will  look  at  its  configured  actions to see if a program has been setup for this selection. If so, it will add an item to the menu that
       allows you to execute the program on the selected files.

       Configurations are stored in GConf for speed  and  integration  with  other  GNOME  programs.  Configs  can  be  easily  shared  using  the
       "Import/Export assistant" menu items in the Tools menu of nautilus-actions-config-tool /.

BUGS
       Please report bugs in nautilus-actions to <submit@bugs.debian.org>. The current bug list may be viewed at <http://bugs.debian.org/nautilus-
       actions>.

AUTHOR
       nautilus-actions was written by Rodrigo Moya  <rodrigo@novell.com>,  Frederic  Ruaudel  <grumz@grumz.net>,  Pierre  Wieser  <pwieser@trych‐
       los.org>, and contributors.

       This  manual  page  was  written  by  Christine Spang <christine@debian.org> and Alice Ferrazzi <aliceinwire@gnumerica.org>, for the Debian
       project (but may be used by others).

LICENSING
       Both the nautilus-actions source code and this man page are licensed under the GNU General Public License.

SEE ALSO
       nautilus(1),nautilus-actions-new(1),nautilus-actions-print(1)

Debian GNU/Linux                                                    2011-11-05                                     nautilus-actions-config-tool(1)
