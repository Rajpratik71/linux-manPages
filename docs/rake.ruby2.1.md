RAKE(1)                                                                                              UNIX                                                                                             RAKE(1)



NAME
       rake - Ruby Make

SYNOPSIS
       rake [--f Rakefile] [--version] [-CGNPgnqstv] [-D [PATTERN]] [-E CODE] [-I LIBDIR] [-R RAKELIBDIR] [-T [PATTERN]] [-e CODE] [-p CODE] [-r MODULE] [--rules] [variable=value] target ...

DESCRIPTION
       Rake is a simple ruby(1) build program with capabilities similar to the regular make(1) command.

       Rake has the following features:

       ·      Rakefiles (Rake's version of Makefiles) are completely defined in standard Ruby syntax.  No XML files to edit. No quirky Makefile syntax to worry about (is that a tab or a space?).

       ·      Users can specify tasks with prerequisites.

       ·      Rake supports rule patterns to synthesize implicit tasks.

       ·      Flexible FileLists that act like arrays but know about manipulating file names and paths.

       ·      A library of prepackaged tasks to make building rakefiles easier.


OPTIONS
       --version
              Display the program version.


       -C

       --classic-namespace
              Put Task and FileTask in the top level namespace


       -D [PATTERN]

       --describe [PATTERN]
              Describe the tasks (matching optional PATTERN ), then exit.


       -E CODE

       --execute-continue CODE
              Execute some Ruby code, then continue with normal task processing.


       -G

       --no-system

       --nosystem
              Use standard project Rakefile search paths, ignore system wide rakefiles.


       -I LIBDIR

       --libdir LIBDIR
              Include LIBDIR in the search path for required modules.


       -N

       --no-search

       --nosearch
              Do not search parent directories for the Rakefile.


       -P

       --prereqs
              Display the tasks and dependencies, then exit.


       -R RAKELIBDIR

       --rakelib RAKELIBDIR

       --rakelibdir RAKELIBDIR
              Auto-import any .rake files in RAKELIBDIR.  (default is rakelib )


       -T [PATTERN]

       --tasks [PATTERN]
              Display the tasks (matching optional PATTERN ) with descriptions, then exit.


       -e CODE

       --execute CODE
              Execute some Ruby code and exit.


       -f FILE

       --rakefile FILE
              Use FILE as the rakefile.


       -h

       --help Prints a summary of options.


       -g

       --system
              Using system wide (global) rakefiles (usually ~/.rake/*.rake ).


       -n

       --dry-run
              Do a dry run without executing actions.


       -p CODE

       --execute-print CODE
              Execute some Ruby code, print the result, then exit.


       -q

       --quiet
              Do not log messages to standard output.


       -r MODULE

       --require MODULE
              Require MODULE before executing rakefile.


       -s

       --silent
              Like --quiet, but also suppresses the 'in directory' announcement.


       -t

       --trace
              Turn on invoke/execute tracing, enable full backtrace.


       -v

       --verbose
              Log message to standard output (default).


       --rules
              Trace the rules resolution.



ENVIRONMENT
       RAKE_SYSTEM
              The directory path containing the system wide rakefiles.


       RAKE_COLUMNS
              Override the number of columns used for output, such as -Fl tasks


       RAKEOPT
              Used to provide default command line arguments to Rake.


       TAGS   Generate an Emacs TAGS file


       TEST   The list of test files will be overridden to include only the filename specified on the command line.

              This provides an easy way to run just one test.


       TESTOPTS

       TESTOPT

       TEST_OPTS

       TEST_OPT
              The given options are passed to the test process after a -Fl

              This allows Test::Unit options to be passed to the test suite.


       USERPROFILE

       HOME

       HOMEDRIVE

       HOMEPATH
              The standard directory containing system wide rake files on Win 32 systems.


SEE ALSO
       ruby(1) make(1)

       http://rake.rubyforge.org/

REPORTING BUGS
       Bugs, features requests and other issues can be logged at <http://onestepback.org/redmine/projects/show/rake.>

       You will need an account to before you can post issues. Register at <http://onestepback.org/redmine/account/register.> Or you can send an email to the author.

AUTHOR
       Rake is written by Jim Weirich <jim@weirichhouse.org>



November 7, 2012                                                                       Ruby Programmers Reference Guide                                                                               RAKE(1)
