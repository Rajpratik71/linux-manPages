LINTIAN-INFO(1)                                                                    User Contributed Perl Documentation                                                                    LINTIAN-INFO(1)

NAME
       lintian-info - give detailed information about Lintian's error tags

SYNOPSIS
       lintian-info [log-file...]

       lintian-info --tags tag ...

DESCRIPTION
       The lintian-info command parses the output of the lintian command and gives verbose information about the listed Lintian error tags, parses a Lintian override file and gives verbose information
       about the tags included, or (if given the -t or --tags option) explains a given tag or tags.

       If no log-file is specified on the command line, this command expects its input on stdin. Thus, the output of lintian can either be piped through lintian-info or a log file produced by lintian
       can be processed with this command.  (Note, though, that the lintian command has a command line option -i to display the same results as lintian-info, so you will not normally need to pipe the
       output of lintian into this command.)

OPTIONS
       -a, --annotate
           Read from standard input or any files specified on the command line and search the input for lines formatted like Lintian override entries.  For each one that was found, display verbose
           information about that tag.

       -h, --help
           Display usage information and exit.

       --include-dir dir
           Use dir as an additional "Lintian root".  The directory is expected have a similar layout to the LINTIAN_ROOT (if it exists), but does not need to be a full self-contained root.

           Unlike lintian, lintian-info will not load any code from these additional directories.

           This option may appear more than once; each time adding an additional directory.

           Note: This option should be the very first if given.

       --profile prof
           Use the severities from the vendor profile prof when displaying tags.  If the profile name does not contain a slash, the default profile for than vendor is chosen.

           If not specified, lintian-info loads the best profile for the current vendor.

           Please Refer to the Lintian User Manual for the full documentation of profiles.

       -t, --tags
           Rather than treating them as log file names, treat any command-line options as tag names and display the descriptions of each tag.

       --user-dirs, --no-user-dirs
           By default, lintian will check $HOME and /etc for files supplied by the user or the local sysadmin (e.g. profiles).  This default can be disabled (and re-enabled) by using --no-user-dirs
           (and --user-dirs, respectively).

           These option can appear multiple times, in which case the of them to appear determines the result.

           Note: This option should be the very first if given.

EXIT STATUS
       If -t or --tags was given and one or more of the tags specified were unknown, this command returns the exit code 1.  Otherwise, it always returns with exit code 0.

SEE ALSO
       lintian(1)

AUTHORS
       Niels Thykier <niels@thykier.net>

       Richard Braakman <dark@xs4all.nl>

       Christian Schwarz <schwarz@monet.m.isar.de>

perl v5.22.1                                                                                    2017-06-05                                                                                LINTIAN-INFO(1)
