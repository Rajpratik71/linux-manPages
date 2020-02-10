LICENSECHECK(1)                                                                                                                                                                           LICENSECHECK(1)

NAME
       licensecheck - simple license checker for source files

SYNOPSIS
       licensecheck --help|--version

       licensecheck [--no-conf] [--verbose] [--copyright] [-l|--lines=N] [-i|--ignore=regex] [-c|--check=regex] [-m|--machine] [-r|--recursive]  [-e|--encoding=...]  list of files and directories to
       check

DESCRIPTION
       licensecheck attempts to determine the license that applies to each file passed to it, by searching the start of the file for text belonging to various licenses.

       If any of the arguments passed are directories, licensecheck will add the files contained within to the list of files to process.

OPTIONS
       --verbose, --no-verbose
           Specify whether to output the text being processed from each file before the corresponding license information.

           Default is to be quiet.

       -l=N, --lines=N
           Specify the number of lines of each file's header which should be parsed for license information. (Default is 60).

       --tail=N
           By default, the last 5k bytes of each files are parsed to get license information. You may use this option to set the size of this parsed chunk.  You may set this value to 0 to avoid parsing
           the end of the file.

       -i=regex, --ignore=regex
           When processing the list of files and directories, the regular expression specified by this option will be used to indicate those which should not be considered (e.g. backup files, VCS
           metadata).

       -r, --recursive
           Specify that the contents of directories should be added recursively.

       -c=regex, --check=regex
           Specify a pattern against which filenames will be matched in order to decide which files to check the license of.

           The default includes common source files.

       -s, --skipped
           Specify whether to show skipped files, i.e. files found which do not match the check regexp (see "--check" option). Default is to not show skipped files.

           Note that ignored files (like ".git" or ".svn") are not shown even when this option is used.

       --copyright
           Also display copyright text found within the file

       -e --encoding
           Specifies input encoding of source files. By default, input files are not decoded. When encoding is specified, license and copyright information are printed on STDOUT as utf8, or garbage if
           you got the encoding wrong.

       -m, --machine
           Display the information in a machine readable way, i.e. in the form <file><tab><license>[<tab><copyright>] so that it can be easily sorted and/or filtered, e.g. with the awk and sort
           commands.  Note that using the --verbose option will kill the readability.

       --no-conf, --noconf
           Do not read any configuration files. This can only be used as the first option given on the command line.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order to set configuration variables.  Command line options can be used to override
       configuration file settings.  Environment variable settings are ignored for this purpose.  The currently recognised variables are:

       LICENSECHECK_VERBOSE
           If this is set to yes, then it is the same as the --verbose command line parameter being used. The default is no.

       LICENSECHECK_PARSELINES
           If this is set to a positive number then the specified number of lines at the start of each file will be read whilst attempting to determine the license(s) in use.  This is equivalent to the
           --lines command line option.

LICENSE
       This code is copyright by Adam D. Barratt <adam@adam-barratt.org.uk>, all rights reserved; based on a script of the same name from the KDE SDK, which is copyright by <dfaure@kde.org>.  This
       program comes with ABSOLUTELY NO WARRANTY.  You are free to redistribute this code under the terms of the GNU General Public License, version 2 or later.

AUTHOR
       Adam D. Barratt <adam@adam-barratt.org.uk>

Debian Utilities                                                                                2016-03-23                                                                                LICENSECHECK(1)
