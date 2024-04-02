PACO(8)                                                               System                                                               PACO(8)

NAME
       paco - a source code package organizer

SYNOPSIS
       paco [OPTIONS] <packages>
       paco -l [OPTIONS] <package> <command>
       paco -q <files>

DESCRIPTION
       Paco is a program to aid package management when installing packages from source code.

       When  installing  a  package, paco can be used in log mode (with option -l) to wrap the installation command (e.g. "make install"), and log
       the created files. By default the log is stored in directory '/var/log/paco'.

       Once some packages are installed and properly logged, paco can be used in list mode, which is the default, to display package  information.
       Several options are provided to print the information in different formats.

       There are also options to remove packages, query for the owner of files, or maintain the package database.

       Mandatory arguments to long options are mandatory for short options too.

       The special option -- forces and end of option-scanning. This is specially useful when entering the install command in log mode.

GENERAL OPTIONS
       -a, --all
              Apply the specified action to all logged packages. This doesn't work with option -r.

       -h, --help
              Display a help message and exit.

       -L, --logdir=DIR
              Base  log directory. Default is '/var/log/paco', unless variable LOGDIR is set in the configuration file (type 'man pacorc' for more
              information).

       -v, --verbose
              Verbose output. -vv prints also debugging messages (only meaningful with option -l).

       --version
              Display version information and exit.

DATABASE MAINTENANCE OPTIONS
       -u, --update
              Synchronize the log of the package with the current status of the filesystem, calculating the size of the logged files and  checking
              whether they are missing.  If a file becomes compressed or uncompressed (with bzip2 or gzip), it is detected as well. Use along with
              -a to update the whole database.

       -U, --unlog
              Remove the log of the package from the database.

GENERAL LIST OPTIONS
       -b, --block-size=SIZE
              Use blocks of SIZE bytes for the sizes. SIZE may be an integer, optionally followed by one of the following: k, K, m, M.

       -k, --kilobytes
              Like '--block-size=1k', or '--block-size=1024'.

       --sort=WORD
              Sort the list by WORD: When listing files, meaningful values for WORD are: 'name' and 'size'. When listing  packages,  WORD  may  be
              also: 'date' (or 'time'), 'files', 'missing-files' or 'missing-size'.

       -R, --reverse
              Reverse order while sorting.

       -t, --total
              Print totals at the bottom of the list.

PACKAGE LIST OPTIONS
       -1, --one-column
              List one package per line.

       -F     Print the number of installed files.

       -M     Print the number of missing files.

       -C     Print the number of shared files (both installed and missing).

       -d, --date
              Show installation date (-dd shows the hour too).

       -s, --size
              Show the currently installed size of each package; in human readable format by default (e.g. 1.2M, 13k).

       -n, --missing-size
              Print the missing size of each package (= original size - current size).

FILE LIST OPTIONS
       -f, --files
              List currently installed files of the package.

       -m, --missing-files
              List missing files (those files removed after the installation of the package).  -f and -m options can be used together.

       -c, --shared
              With -f and/or -m, list only the shared files (those files also logged by other packages).

       -N, --non-shared
              With -f and/or -m, list only the non shared files (those files not logged by any other package).

       -w, --who-shares
              With -c, print the names of the packages that share each file.

       -y, --symlinks
              Print the contents of symbolic links.

       -s, --size
              Print the size of each file; in human readable format by default (e.g. 1.2M, 13k).

       -z, --no-package-name
              Do not print the name of the package. Useful for scripts.

INFORMATION OPTIONS
       Note: Information may be not available for all packages.

       -i, --info
              Print package information.

       -o, --configure-options
              Print the configure options the package was built with.

       -q, --query, --owner
              Query for the packages that own one or more files.

LOG OPTIONS
       -l, --log
              Enable  log  mode: If a shell command is given as an argument, execute and monitor it, logging the created files, otherwise the list
              of files to log is read from the standard input.
              The list of logged files is printed to the standard output, unless any of -p or -D options is used, in which case is assumed that  a
              package is to be logged in the paco database.
              When a shell comand is monitorized, paco returns the exit code of that command.
              See EXAMPLES below.

       -p, --package=PKG
              Specify  the  name of the package to log, which must begin with an alphanumeric character. With -v, the list of logged files is also
              printed to the standard error stream. With -vv, paco prints detailed information about the install process. This holds for option -D
              too.

       -D, --dirname
              Use the name of the current directory as the name of the package to be logged.

       -E, --exclude=PATH1:PATH2:...
              Colon-separated list of paths to skip when logging. Default is '/dev:/tmp:/usr/src:/media:/sys:/usr/share/info/dir', unless variable
              EXCLUDE is set in the configuration file (type 'man pacorc' for more information).
              Shell wildcards are allowed in the PATHs. See PATH MATCHING below for more details.

       -I, --include=PATH1:PATH2:...
              Colon-separated list of paths to scan when logging. Default is '/', unless variable INCLUDE is set in the configuration  file  (type
              'man pacorc' for more information).
              Shell wildcards are allowed in the PATHs. See PATH MATCHING below for more details.

       --ignore-errors
              Do not exit if the install command fails. This allows for logging uncomplete installations, and cleanup the system upon an installa‐
              tion failure. Errors are not ignored by default, unless variable LOG_IGNORE_ERRORS is set to 1 in the configuration file (type  'man
              pacorc' for more information).

       --log-missing
              Log also the missing files (they are skipped by default). See EXAMPLES below.

       -+, --append
              With -p or -D, if the package is already logged, append the list of files to its log.

REMOVE OPTIONS
       -r, --remove
              Remove  a  package,  keeping the shared files and asking for confirmation by default. Compressed files (with gzip or bzip2) are also
              removed. If the option is doubled (-rr), or all logged files are successfully removed, the package is removed from the database.

       -B, --batch
              Don't prompt for confirmation when removing (and assume yes to all questions).

       -e, --skip=PATH1:PATH2:...
              Don't remove files in these paths.
              Shell wildcards are allowed in the PATHs. See PATH MATCHING below for more details.

       --remove-shared
              Remove also the shared files.

PATH MATCHING
       Options -I, -E and -e accept a colon-separated list of paths, each of which may contain shell-like wildcards (*, ? and  [..]).   Files  are
       matched  against  each of those paths, following the standard shell-like expansion, but with the following exception: If a path in the list
       does not contain any wildcard, and it is a directory, it matches any file within that directory.
       Note that if wildcards are to be used, the whole list of paths must be enclosed in single quotes (') to protect it from being  expanded  by
       the shell.

EXAMPLES
       To log the installation of the package 'foo-1.0', which is installed with the command 'make -C src install':

           paco -lp foo-1.0 "make -C src install"

       Note that in this example the quotes are required to prevent paco to treat '-C' as a command line option.
       Use single quotes if the command already contains double quotes:

            paco -lp foo-1.0 'echo "hello world" > /var/log/foo.log'

       The special end-of-option argument '--' may be used for the same purpose:

           paco -lp foo-1.0 -- make -C src install

       Alternatively, we can use the basename of the current directory as the name of the package to log, using the option -D instead of -p:

           paco -lD "make install && make install.man"

       If we have forgotten to install a file, it can be added to a previously created log with the option -+:

           paco -lp+ foo-1.0 "install foo /bin/foo"

       Note that the option -+ cannot be used to remove a file from the log. For instance, the following command:

           paco -lp+ foo-1.0 "rm /bin/foo"

       would not unlog the file /bin/foo from the log of foo-1.0, but it would mark it as missing instead.

       To  avoid  such  behaviour  it  is  sometimes  useful  to  join up composed install commands into one single command and run paco once. For
       instance, imagine that a package installs the file /bin/foo, but we want it to be installed in /usr/bin/foo. If one runs this:

           paco -lp foo-1.0 make install
           paco -lp+ foo-1.0 "mv /bin/foo /usr/bin/foo"

       Both files, /bin/foo and /usr/bin/foo remain in the log. /usr/bin/foo is marked as installed, and /bin/foo is marked as  missing.  This  is
       usually not the desired behaviour. As a workaround one can join up both commands in one single paco run:

           paco -lp foo-1.0 "make install && mv /bin/foo /usr/bin/foo"

       In this case only /usr/bin/foo is logged.

       The understand the meaning of the option --log-missing, consider the following example, where the file /foo/bar does not exist:

           echo /foo/bar | paco --log-missing -lp foo

       This would log the file /foo/bar, even if it is missing. Without the option --log-missing /foo/bar is skipped.

       To remove all versions of the package foo, keeping the files in /etc and /root, and without asking for confirmation:

           paco -r --batch -e /etc:/root foo

       To remove the package foo-3.3, keeping the files in /var/log and the files ending with ".conf":

           paco -r -e '/var/log:*.conf' foo-3.3

       We  have installed the package 'bubble-1.9' in prefix '/opt/bubble-1.9', but we haven't logged the installation with paco. No problem! Just
       create a log for it thusly:

           find /opt/bubble-1.9 | paco -lp bubble-1.9

BUGS
       Due to LD_PRELOAD limitations, paco can't follow the trace of suid programs.
       For the same reason, paco does not work with programs that statically link libc.

FILES
       /etc/pacorc - configuration file
       /var/log/paco - default log directory

WEB SITE
       The latest version of paco should be always available at:
            http://paco.sourceforge.net

COPYRIGHT
       Copyright (C) 2004-2009 David Rosal <davidrr@sourceforge.net>
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       pacorc(5), pacoball(8), superpaco(8), rpm2paco(8)

paco-2.0.9                                                         28 June 2010                                                            PACO(8)
