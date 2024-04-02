APT-LISTCHANGES(1)                                                                        Debian                                                                       APT-LISTCHANGES(1)

NAME
       apt-listchanges - Show new changelog entries from Debian package archives

SYNOPSIS
       apt-listchanges [[options...]] {[--apt] | [package.deb...]}

DESCRIPTION
       apt-listchanges is a tool to show what has been changed in a new version of a Debian package, as compared to the version currently installed on the system.

       It does this by extracting the relevant entries from both the NEWS.Debian and changelog[.Debian] files, usually found in /usr/share/doc/package, from Debian package archives.

       Please note that in the default installation if apt-listchanges is run during upgrades as an APT plugin, it displays NEWS.Debian entries only. This can be changed with the
       --which option.

       If changelog entries are displayed and the package does not contain changelog[.Debian] file, apt-listchanges calls apt-get changelog command to download the changelog from
       network. This behavior can be disabled with the --no-network option.

       Given a set of filenames as arguments (or read from apt when using --apt), apt-listchanges will scan the files (assumed to be Debian package archives) for the relevant changelog
       entries, and display them all in a summary grouped by source package. The groups are sorted by the urgency of the most urgent change, and than by the package name. Changes within
       each package group are displayed in the order of their appearance in the changelog files, i.e. starting from the latest to the oldest; the --reverse option can be used to alter
       this order.

OPTIONS
       apt-listchanges provides the following options to control its behavior. Most of them have their equivalent entries in the configuration file, see the "CONFIGURATION FILE" below
       for details.

       --apt
           Read filenames from a specially-formatted pipeline (as provided by apt), rather than from command line arguments, and honor certain apt-specific options in the config file.
           This pipeline must be in "version 2" format, specified in the apt configuration.

       -v, --verbose
           Display additional (usually unwanted) information. For instance, print a message when a package of the same or older version is to be installed, or when a package is to be
           newly installed.

       -f, --frontend
           Select which frontend to use to display information to the user. Current frontends include:

           pager
               Uses sensible-pager(1) command to display output. The command uses PAGER environment variable to choose your favourite pager. The "pager" option may be specified in the
               configuration file to select a specific pager for use with apt-listchanges.

           browser
               Displays an HTML-formatted changelog with hyperlinks for bugs and email addresses using the sensible-browser(1) command that examines BROWSER environment variable to
               choose your favourite browser. The "browser" option may be specified in the configuration file to select a specific browser for use with apt-listchanges.

           xterm-pager
               Uses your favorite pager to display output, but does so in an xterm (using the x-terminal-emulator alternative) in the background. This allows you to go on with the
               upgrade if you like, and continue to browse the changelogs. You can override the terminal emulator to be used with the "xterm" configuration option.

           xterm-browser
               The logical combination of xterm-pager and browser. Only appropriate for text-mode browsers.

           text
               Dumps output to stdout, with no pauses.

           mail
               Sends mail to the address specified with --email-address, and does not display changelogs.

           gtk
               Spawns a gtk window to display the changelogs. Needs python3-gi to be installed.

           none
               Does nothing. Can be used to prevent apt-listchanges from running when configured to run automatically from apt.

           Please note that apt-listchanges will try to switch to an unprivileged user before spawning commands in "browser", "xterm-browser", and "xterm-pager" frontends. However this
           currently does not apply to the "pager" frontend. See also "ENVIRONMENT VARIABLES" below.

       --email-address=address
           In addition to displaying it, mail a copy of the changelog data to the specified address. To only mail changelog entries, use this option with the special frontend 'mail'.

       --email-format={text|html}
           If sending mail copies is enabled (see --email-address above), this option selects whether the mail should be sent as an old good plain text data (which is the default
           behavior), or as html data with clickable links, which might be more convenient for people using graphical mail clients.

       -c, --confirm
           Once changelogs have been displayed, ask the user whether or not to proceed. If the user chooses not to proceed, a nonzero exit status will be returned, and apt will abort.

       -a, --show-all
           Rather than trying to display changelog entries that are newer than the currently installed version of the package, simply display all changelog entries for all packages.
           This is useful for viewing the entire changelog of a .deb before extracting it.

       -n, --no-network
           In rare cases when a binary package (or to be more precise: none of the binary packages built from the same source package that are processed together as a group) does not
           contain a changelog file, apt-listchanges by default executes apt-get changelog to downolad changelogs from the network servers usually provided by your operating system
           distribution. This option will disable this behavior, what might be useful for example for systems behind a firewall.

       --save-seen=file
           This option will cause apt-listchanges to keep track of the last version of a package for which changelogs have been displayed, to avoid redisplaying the same changelogs in a
           future invocation. The database is stored in the named file. Specify 'none' to disable this feature.

       --dump-seen
           Display the contents of the seen database to standard output as a list of lines consisting of source package name and its latest seen version, separated by space. This option
           requires the path to the seen database to be known: please either specify it using --save-seen option or pass --profile=apt option to have it read from the configuration
           file.

       --since=version
           This option will cause apt-listchanges to show the entries later than the specified version. With this option, the only other argument you can pass is the path to a .deb
           file.

       --which={news|changelogs|both}
           This option selects whether news (from NEWS.Debian et al.), changelogs (from changelog.Debian et al.) or both should be displayed. The default is to display only news.

       --help
           Displays syntax information.

       -h, --headers
           These options will cause apt-listchanges to insert a header before each package's changelog showing the name of the package, and the names of the binary packages which are
           being upgraded (if there is more than one, or it differs from the source package name).

       --debug
           Display some debugging information.

       --profile=name
           Select an option profile.  name corresponds to a section in /etc/apt/listchanges.conf. The default when invoked from apt is "apt", and "cmdline" otherwise.

       --reverse
           Show the changelog entries in reverse order.

       --ignore-apt-assume, --ignore-debian-frontend
           Disable forcing non-interactive frontend in some of the cases described in the "AUTOMATIC FRONTEND OVERRIDE" section below.

       --select-frontend
           Choose frontend interactively. This option is mainly for testing purposes, please do not use it.

AUTOMATIC FRONTEND OVERRIDE
       For a better integration with existing package management tools, apt-listchanges tries to detect if package upgrades are done in a non-interactive way, and automatically switches
       its frontend to 'text' when any of the following conditions is satisfied:

       ·   the standard output is not connected to terminal;

       ·   the --quiet (-q) option is given to apt-get(8) (or aptitude(8)); note however that when the option is used more than once, apt-listchanges switches the frontend to 'mail';

       ·   the --assume-yes (-y) option is given to apt-get(8);

       ·   the DEBIAN_FRONTEND environment variable is set to "noninteractive", and APT_LISTCHANGES_FRONTED is not set.

       For backward compatibility purposes the last two of the above checks can be disabled either with "ignore_apt_assume=true" or "ignore_debian_frontend=true" configuration file
       entries (see "CONFIGURATION FILE" below) or by using the command line options: --ignore-apt-assume or --ignore-debian-frontend.

       Please also note that the "mail" frontend is already non-interactive one, so it is never switched to the "text" frontend.

       Additionally apt-listchanges overrides X11-based frontends ("gtk", "xterm-pager", "xterm-browser") with "pager" (or "browser" in case of "xterm-browser") when the environment
       variable DISPLAY is not set.

CONFIGURATION FILE
       apt-listchanges reads its configuration from the /etc/apt/listchanges.conf. The file consists of sections with names enclosed in the square brackets. Each section should contain
       lines in the key=value format. Lines starting with the "#" sign are treated as comments and ignored.

       Section is a name of profile that can be used as parameter of the --profile option.

       The configuration of the "apt" section can be managed by debconf(7), and the most of the settings there can be changed with the help of the dpkg-reconfigure apt-listchanges
       command.

       Key is a name of some command-line option (except for --apt, --profile, --help) with the initial hyphens removed, and the remaining hyphens translated to underscores, for
       example: "email_format" or "save_seen".

       Value represents the value of the corresponding option. For command-line options that do not take argument, like "confirm" or "headers", the value should be set either to "1",
       "yes", "true", and "on" in order to enable the option, or to "0", "no", "false", and "off" to disable it.

       Additionally key can be one of the following keywords: "browser", "pager" or "xterm". The value of such configuration entry should be the name of an appropriate command,
       eventually followed by its arguments, for example: "pager=less -R".

       Example 1. Example configuration file

           [cmdline]
           frontend=pager

           [apt]
           frontend=xterm-pager
           email_address=root
           confirm=1

           [custom]
           frontend=browser
           browser=mozilla

       The above configuration file specifies that in command-line mode, the default frontend should be "pager". In apt mode, the xterm-pager frontend is default, a copy of the
       changelogs (if any) should be emailed to root, and apt-listchanges should ask for confirmation. If apt-listchanges is invoked with --profile=custom, the browser frontend will be
       used, and invoke mozilla.

ENVIRONMENT
       APT_LISTCHANGES_FRONTEND
           Frontend to use.

       APT_LISTCHANGES_USER, SUDO_USER, USERNAME
           The value of the first existing of the above variables will be used as the name of user to switch to when running commands spawned by the "browser", "xterm-browser", and
           "xterm-pager" frontends if apt-listchanges is started by a privileged user.

       DEBIAN_FRONTEND
           If set to "noninteractive", then it can force apt-listchanges to use non-interactive frontend, see the "AUTOMATIC FRONTEND OVERRIDE" section for details.

       BROWSER
           Used by the browser frontend, should be set to a command expecting a file: URL for an HTML file to display.

       PAGER
           Used by the pager frontend.

       APT_HOOK_INFO_FD
           File descriptor to read package names from in the --apt mode. (Apt is expected to set this variable to a proper file descriptor number).

FILES
       /etc/apt/listchanges.conf
           Configuration file.

       /etc/apt/apt.conf.d/20listchanges
           File used for registering apt-listchanges into apt system.

       /var/lib/apt/listchanges.db
           Database used for save-seen.

AUTHOR
       apt-listchanges was written by Matt Zimmerman <mdz@debian.org>

       The current maintainer is Robert Luberda <robert@debian.org>

SEE ALSO
       sensible-pager(1), sensible-browser(1), apt-get(8), aptitude(8)

apt-listchanges                                                                         2017-07-08                                                                     APT-LISTCHANGES(1)
