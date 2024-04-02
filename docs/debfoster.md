DEBFOSTER(8)                                                BSD System Manager's Manual                                               DEBFOSTER(8)

NAME
     debfoster — weed unnecessary Debian packages

SYNOPSIS
     debfoster [-acdefhiknopqrstvV] [--verbose] [--version] [--help] [--quiet] [--force] [--mark-only] [--upgrade] [--config file]
               [--keeperfile file] [--no-keeperfile] [--ignore-default-rules] [--show-keepers] [--show-orphans] [--show-depends package]
               [--show-dependents package] [--show-providers package] [--show-related package] [--use-tasks] [--option opt=val] [package1 ...]
               [package2- ...]

DESCRIPTION
     debfoster maintains a list of installed packages that were explicitly requested rather than installed as a dependency.  Arguments are
     entirely optional, debfoster can be invoked per se after each run of dpkg and/or apt-get.

     Alternatively you can use debfoster to install and remove packages by specifying the packages on the command line.  Packages suffixed with a
     - are removed while packages without a suffix are installed.

     If a new package is encountered or if debfoster notices that a package that used to be a dependency is now an orphan, it will ask you what to
     do with it.  If you decide to keep it, debfoster will just take note and continue.  If you decide that this package is not interesting enough
     it will be removed as soon as debfoster is done asking questions.  If your choices cause other packages to become orphaned more questions
     will ensue.

     Whenever debfoster asks you about a package, any of the following responses can be given:

       ‘y’         Yes, keep the package. This is the default response.
       ‘n’         No, delete the package.
       ‘p’         Prune the package. This tells debfoster to also delete all packages that are only installed because this package depends on
                   them.  A list of such packages, if any, is shown above the prompt.
       ‘s’         Skip this question. The next time you run debfoster it will ask you again about this package.
       ‘h’         Print a help message.
       ‘i’ or ‘?’  Show information about the package.
       ‘u’         Undo last response.
       ‘q’         Exit without removing packages.  All changes will be lost.
       ‘x’         Save changes to debfoster database, remove unwanted packages, and exit without asking further questions.

   Command line options
     -v, --verbose
             debfoster will show which packages have disappeared, have become dependencies or (if Quiet is enabled) have become orphans.

     -V, --version
             Display version and copyright information.

     -h, --help
             Display a concise summary of the available options and argument syntax.

     -f, --force
             Don't ask anything and assume ‘no’ as the answer to all questions.  It also installs any packages that seem to be missing, thus forc‐
             ing your system to comply with the debfoster database.  Can have ‘interesting’ results if you're not careful.

     -q, --quiet
             Don't ask anything and assume ‘yes’ as the answer to all questions.  Useful to create an initial /var/lib/debfoster/keepers file or
             to recreate it after changing the configuration file.

     -m, --mark-only
             Instructs debfoster to make changes to the keeper file but not to actually install or delete any packages.  This can be used to
             ‘edit’ a keeper file by invoking debfoster one or more times in a row.  The changes can then be committed by invoking debfoster with
             the --force option, which will delete/install any necessary packages.  This is mainly useful for scripts and frontends, but may be
             useful from the command line as well.

     -u, --upgrade
             If used as ‘debfoster -u package’ it will install or upgrade the packages specified on the command line and try to upgrade all pack‐
             ages that it relies on.

     -c, --config file
             Specify a different configuration file to use.

     -k, --keeperfile file
             Specify a different debfoster database to use.

     -n, --no-keeperfile
             Don't read the debfoster database and start with an empty list.

     -i, --ignore-default-rules
             This will instruct debfoster to ignore the UseHold, UseEssential, MaxPriority, KeepSections, and NokeepSections settings in the con‐
             fig file (i.e., assume that any package can be an orphan). This is a good option for those who really want to make sure their system
             is squeaky clean. It's also useful when sharing or transferring a keeper file between multiple machines where different config files
             can cause some confusion. Properly used, -i eliminates that uncertainty.

     -a, --show-keepers
             Lists the contents of the debfoster database.

     -s, --show-orphans
             List all orphaned packages that are not mentioned in the debfoster database.

     -d, --show-depends package
             List all packages that this package depends on.

     -e, --show-dependents package
             List all packages in the debfoster database that depend on this package.

     -p, --show-providers package
             List all packages that provide the dependency target specified by package (e.g.  "debfoster -p x-terminal-emulator" ).

     -r, --show-related package
             List all packages that are only installed because this package depends on them.

     -t, --use-tasks
             Make tasks visible as packages. This will make tasks that are selectable using tasksel(1) appear as packages named task-<label>.

     -o, --option opt=val
             Override any configuration option specified in the configuration file.

CONFIGURATION
     Some aspects of the behaviour of debfoster can be configured in the configuration file, /etc/debfoster.conf.  Options are specified as
           Option = Value
     Option names are case insensitive.

     InstallCmd
             Default: apt-get install
             Command invoked with a number of packages on the command line.  The command is not passed to /bin/sh but invoked like xargs(1) with a
             number of packages as extra options.

     RemoveCmd
             Default: apt-get --purge remove
             Like InstallCmd but for removing packages.

     InfoCmd
             Default: dpkg -s
             Like InstallCmd but called with a single package as an argument to display information on.

     KeeperFile
             Default: /var/lib/debfoster/keepers
             The file where the list of orphans is stored.  You can use this file for reference when installing a machine or even to make identi‐
             cal Debian installs.

     DpkgStatus
             Default: /var/lib/dpkg/status
             The file where dpkg(8) stores its information about which packages are more or less installed.  This value can usually be left
             untouched.

     DpkgAvailable
             Default: /var/lib/dpkg/available
             The file where dpkg(8) stores its information about which packages are available.  This value can usually be left untouched.

     MaxPriority
             Default: standard
             Any packages with a priority greater than this value will be considered too basic to ask questions about.  The default value means
             that questions will be asked about packages with priority "standard", "optional" and "extra".  With the special value ‘ANY’ you can
             indicate that all known priorities should be considered too important to ask questions about.  These priority values are known to
             debfoster (taken from the debian-policy package):
                   required
                   important
                   standard
                   optional
                   extra

     UseHold
             Default: yes
             Use the hold attribute from the Status: line.  Packages with this attribute won't ever be upgraded by apt, so it's safe to assume
             that you want to keep it.

     UseEssential
             Default: yes
             Use the Essential: line from dpkg(8) 's status file.  Most packages which are marked essential shouldn't be removed anyway, so if you
             don't want to be bothered with it, enable this option.

     UsePreDepends
             Default: yes
             A package that pre-depends on another package requires the latter during installation.  This option will make debfoster count these
             pre-dependencies as ordinary dependencies.  If you frequently update your packages you may want to keep an eye out for pre-depended
             packages that have become obsolete.

     UseRecommends
             Default: yes
             Recommended packages would be installed together with the package that recommends them in all usual setups.  This option will make
             debfoster count these recommendations as real dependencies.  Enabling this option will enable you to better manage packages which
             were installed because another package recommended them.

     UseSuggests
             Default: no
             Packages suggested by another package usually enhance the function of the latter or have a related function which may be useful in
             combination with the package that suggested them.  This option will make debfoster count these suggestions as real dependencies.
             Using this option will result in even fewer questions being asked.

     UseTasks
             Default: no
             Make tasks visible as packages. This will make tasks that are selectable using tasksel(1) appear as packages named task-<label>.
             debfoster will treat them as if they were normal packages. Tasks cannot be removed but marking a task for removal will stop debfoster
             asking questions about it.

     KeepSections
             Default:
             You may find that you are always interested in keeping (for example) documentation.  With this option you can indicate that packages
             from a certain section should always be kept.  You can specify a comma separated lists of ‘precious’ sections.

     NokeepSections
             Default:
             List the sections you are never interested in.  For example, ‘libs’ is a good candidate, as most libraries debfoster asks about are
             leftovers from old packages.

     GuessDepends
             Default:
             List name extensions for packages that you want to group with their base packages. Applications are often separated into multiple
             packages with names like "app", "app-doc", "app-dev". If you don't want to answer questions about "app-doc", you can add the "doc"
             extension to the GuessDepends list.

     NegativeKeepers
             Default: yes
             Remember explicit removals of packages.  If a package is installed that has been explicitly removed before, remove it again without
             asking.  Set this to no if you want to be asked anyway.

     Verbose
             Default: no
             Using this option has the same result as having -v on the command line.  It will make debfoster show which packages have disappeared
             or have become a dependency.

     Force   Default: no
             This option has the same meaning as the -f command line option.  All orphaned packages are scheduled for removal without asking any
             question.

     Quiet   Default: no
             Having this option (which has the same meaning as the -q command line argument) in your configuration file more or less defeats the
             purpose of debfoster although the KeeperFile is still kept up-to-date.

BUGS
     Send reports to the Debian bug tracking system:
     http://bugs.debian.org/debfoster
     with as much information as you can gather (error messages, configuration files, versions of dpkg/apt, whatever might be relevant).  A tool
     such as reportbug might come in handy.

SEE ALSO
     apt-get(8), apt-cache(8), dpkg(8), deborphan(1) tasksel(1)

Debian GNU/Linux                                                   July 29, 2019                                                  Debian GNU/Linux
