ZEITGEIST-DAEMON(1)                                                                     General Commands Manual                                                                    ZEITGEIST-DAEMON(1)

NAME
       zeitgeist-daemon - D-Bus interface providing a log of activities

SYNOPSIS
       zeitgeist-daemon [OPTION]

DESCRIPTION
       zeitgeist-daemon is daemon providing an activity log. That is, it consists of a central database for events such as file usage, browser history, calendar entries, etc.

       All  this  information  is  made  available  to external applications which communicate with zeitgeist-daemon over D-Bus. Interested applications can request information, insert new events or
       delete existing events.

       Zeitgeist is also capable of establishing relationships between activities. Its purpose is enabling an activity-aware desktop with adaptive user interfaces.

       By default, zeitgeist-daemon will also start the bundled logging application zeitgeist-datahub.

OPTIONS
       The program follows the usual GNU command line syntax, with options starting with two dashes (`--'). A summary of options is included below.

       --no-datahub
              Do not start zeitgeist-datahub together with this daemon.

       -r, --replace
              Replace any existing Zeitgeist instance if there is one already running. If this option isn't used, zeitgeist-daemon will refuse to start if another running instance is found.

       --log-level=LOG_LEVEL
              Specifies how much information should be printed to the standard output.  Possible values are: DEBUG, INFO, WARNING, ERROR, CRITICAL.

       --log-file=LOG_FILE
              Specifies a file to which log output will be appended.

       -q, --quit
              Stop a currently running Zeitgeist instance and exit. This lets Zeitgeist finish any operation it may currently be doing.

       -v, --version
              Shows which version of Zeitgeist is being executed.

       -h, --help
              Shows a short help message listing all supported options.

ENVIRONMENT VARIABLES
       ZEITGEIST_DATA_PATH
              Overrides the directory where user data files are placed. The default value is that of XDG's data dir (usually ~/.local/share/zeitgeist).

       ZEITGEIST_DATABASE_PATH
              This variable lets you specify an override for the filename of the main database. The default value is $ZEITGEIST_DATA_PATH/activity.sqlite.

       ZEITGEIST_DATABASE_BACKUP_PATH
              This variable lets you specify an override for the filename of a possible database backup. The default value is $ZEITGEIST_DATA_PATH/activity.sqlite.bck.

       ZEITGEIST_DISABLED_EXTENSIONS
              This variable lets you specify comma separated list of extension names which shouldn't be loaded. The names are extracted from type names of the extensions,  so  to  disable  extension
              with type name ZeitgeistDataSourceRegistry, value of the variable should be DataSourceRegistry.

SIGNALS
       SIGHUP: zeitgeist-daemon will shut itself down in a clean way.
              It  is  recommended that system updates of Zeitgeist send this signal to all running instances of zeitgeist-daemon. DBus activation will make sure the updated software is automatically
              restarted when needed.

EXIT CODES
       0      Zeitgeist terminated normally.

       1      An unspecified error occurred.

       10     There is already a running Zeitgeist instance.

       21     Could not access the database file.

       22     The database file is locked.

SEE ALSO
       zeitgeist-datahub, gnome-activity-journal

BUGS
       Please report any bugs on https://bugs.launchpad.net/zeitgeist.

AUTHORS
       Please see the AUTHORS file bundled with this application for a complete list of contributors.

LICENSE
       This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation,  either  version
       2.1 of the License, or (at your option) any later version.

       This  program  is  distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       GNU Lesser General Public License for more details.

       You should have received a copy of the GNU Lesser General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

Zeitgeist                                                                                    June 28, 2012                                                                         ZEITGEIST-DAEMON(1)
