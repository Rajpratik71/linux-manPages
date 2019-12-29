RAKE(1)                               BSD General Commands Manual                              RAKE(1)

NAME
     rake — make-like build utility for Ruby

SYNOPSIS
     rake [-f rakefile] [options] targets ...

DESCRIPTION
     rake is a make(1)-like build utility for Ruby.  Tasks and dependencies are specified in standard
     Ruby syntax.

OPTIONS
     -m, --multitask
             Treat all tasks as multitasks.

     -B, --build-all
             Build all prerequisites, including those which are up-to-date.

     -j, --jobs num_jobs
             Specifies the maximum number of tasks to execute in parallel (default is number of CPU
             cores + 4).

   Modules
     -I, --libdir libdir
             Include libdir in the search path for required modules.

     -r, --require module
             Require module before executing rakefile.

   Rakefile location
     -f, --rakefile filename
             Use filename as the rakefile to search for.

     -N, --no-search, --nosearch
             Do not search parent directories for the Rakefile.

     -G, --no-system, --nosystem
             Use standard project Rakefile search paths, ignore system wide rakefiles.

     -R, --rakelib rakelibdir, --rakelibdir rakelibdir
             Auto-import any .rake files in rakelibdir (default is ‘rakelib’)

     -g, --system
             Use system-wide (global) rakefiles (usually ~/.rake/*.rake).

   Debugging
     --backtrace=out
             Enable full backtrace.  out can be stderr (default) or stdout.

     -t, --trace=out
             Turn on invoke/execute tracing, enable full backtrace.  out can be stderr (default) or
             stdout.

     --suppress-backtrace pattern
             Suppress backtrace lines matching regexp pattern.  Ignored if --trace is on.

     --rules
             Trace the rules resolution.

     -n, --dry-run
             Do a dry run without executing actions.

     -T, --tasks [pattern]
             Display the tasks (matching optional pattern) with descriptions, then exit.

     -D, --describe [pattern]
             Describe the tasks (matching optional pattern), then exit.

     -W, --where [pattern]
             Describe the tasks (matching optional pattern), then exit.

     -P, --prereqs
             Display the tasks and dependencies, then exit.

     -e, --execute code
             Execute some Ruby code and exit.

     -p, --execute-print code
             Execute some Ruby code, print the result, then exit.

     -E, --execute-continue code
             Execute some Ruby code, then continue with normal task processing.

   Information
     -v, --verbose
             Log message to standard output.

     -q, --quiet
             Do not log messages to standard output.

     -s, --silent
             Like --quiet, but also suppresses the ‘in directory’ announcement.

     -X, --no-deprecation-warnings
             Disable the deprecation warnings.

     --comments
             Show commented tasks only

     -A, --all
             Show all tasks, even uncommented ones (in combination with -T or -D)

     --job-stats [level]
             Display job statistics.  If level is ‘history’, displays a complete job list.

     -V, --version
             Display the program version.

     -h, -H, --help
             Display a help message.

SEE ALSO
     The complete documentation for rake has been installed at
     /usr/share/doc/rake-doc/html/index.html.  It is also available online at
     https://ruby.github.io/rake

AUTHORS
     rake was written by Jim Weirich <jim@weirichhouse.org>.

     This manual was created by Caitlin Matos <caitlin.matos@zoho.com> for the Debian project (but may
     be used by others).  It was inspired by the manual by Jani Monoses <jani@iv.ro> for the Ubuntu
     project.

rake 11.2.2                                  June 12, 2016                                 rake 11.2.2
