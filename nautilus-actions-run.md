nautilus-actions-run(1)                                       General Commands Manual                                      nautilus-actions-run(1)

NAME
       nautilus-actions-run - execute an action on the specified target

SYNOPSIS
       nautilus-actions-run [OPTION]

DESCRIPTION
       nautilus-actions-run  runs  specific  nautilus-actions  on  a  given file or folder. More than one target may be specified. This program is
       intended to be used on the command-line for scripting nautilus actions.

OPTIONS
   Help options
       -?, --help Show help options

       --help-all
              Show all help options

       --help-misc
              Show miscellaneous options

   Miscellaneous options
       -v, --version Output the version number

   Application options
       -i, --id=STRING The internal identifier of the action to be launched.

       -t, --target=URI
              A file or folder to run the action on (more than one may be specified).

BUGS
       Please report bugs in nautilus-actions to <submit@bugs.debian.org>. The current bug list may be viewed at <http://bugs.debian.org/nautilus-
       actions>.

AUTHOR
       nautilus-actions  was  written  by  Rodrigo  Moya  <rodrigo@novell.com>,  Frederic Ruaudel <grumz@grumz.net>, Pierre Wieser <pwieser@trych‐
       los.org>, and contributors.

       This manual page was written by Christine Spang <christine@debian.org>, for the Debian project (but may be used by others).

LICENSING
       Both the nautilus-actions source code and this man page are licensed under the GNU General Public License.

SEE ALSO
       nautilus(1),nautilus-actions(1),nautilus-actions-schemas(1),
           nautilus-actions-new(1), nautilus-actions-print(1)

Debian GNU/Linux                                                    2009-12-30                                             nautilus-actions-run(1)
