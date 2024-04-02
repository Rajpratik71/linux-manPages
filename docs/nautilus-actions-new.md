nautilus-actions-new(1)                                       General Commands Manual                                      nautilus-actions-new(1)

NAME
       nautilus-actions-new - create new nautilus actions

SYNOPSIS
       nautilus-actions-new [OPTION]

DESCRIPTION
       nautilus-actions-new  creates new actions for the nautilus file manager non-interactively via the commandline. Action attributes are speci‐
       fied via command-line options.

       By default, actions are written to STDOUT. However, they can also be written to a file suitable for later import via  nautilus-actions-con‐
       fig-tool or you can even write the action directory to your GConf configuration for nautilus-actions

OPTIONS
   Help options
       -?, --help Show help options

       --help-all
              Show all help options

       --help-output
              Choose where the program creates the action

   Action-creation options
       -l, --label=LABEL The label of the menu item (mandatory)

       -t, --tooltip=TOOLTIP
              The tooltip of the menu item

       -i, --icon=ICON
              The icon of the menu item (filename or GTK stock ID)

       -c, --command=PATH
              The path of the command

       -p, --parameters=PARAMS
              The parameters of the command

       -m, --match=EXPR
              A pattern to match selected files against. May include wildcards (* or ?) (you must set one option for each pattern you need)

       -C, --match-case=PATH
              The path of the command

       -T, --mimetypes=EXPR
              A  pattern  to  match selected files' mimetype against. May include wildcards (* or ?) (you must set one option for each pattern you
              need)

       -f, --accept-files
              Set it if the selection must only contain files

       -d, --accept-dirs
              Set it if the selection must only contain folders. Specify both '--isfile' and '--isdir' options is selection can contain both types
              of items

       -M, --accept-multiple-files
              Set it if the selection can have several items

       -s, --scheme=SCHEME
              A valid GVFS scheme where the selected files should be located (you must set one option for each scheme you need)

BUGS
       Please report bugs in nautilus-actions to <submit@bugs.debian.org>. The current bug list may be viewed at <http://bugs.debian.org/nautilus-
       actions>.

AUTHOR
       nautilus-actions was written by Rodrigo Moya  <rodrigo@novell.com>,  Frederic  Ruaudel  <grumz@grumz.net>,  Pierre  Wieser  <pwieser@trych‐
       los.org>, and contributors.

       This manual page was written by Christine Spang <christine@debian.org>, for the Debian project (but may be used by others).

LICENSING
       Both the nautilus-actions source code and this man page are licensed under the GNU General Public License.

SEE ALSO
       nautilus(1),nautilus-actions(1),nautilus-actions-schemas(1),
           nautilus-actions-run(1) nautilus-actions-print(1)

Debian GNU/Linux                                                    2009-08-06                                             nautilus-actions-new(1)
