man(1)                                                       Code::Blocks IDE man page                                                      man(1)

NAME
       Code::Blocks - The open-source, cross-platform IDE

SYNOPSIS
       codeblocks  [-h]  [-ns] [-d] [--prefix <str>] [-p <str>] [--profile <str>] [--rebuild] [--build] [--target <str>] [--no-batch-window-close]
       [--batch-build-notify] [filename(s)...]

DESCRIPTION
       codeblocks launches the Code::Blocks IDE. Its various command-line arguments are listed below.

OPTIONS
       -h, --help
               Displays the list of accepted command-line arguments.

       -ns     Do not display a splash screen on startup. The splash screen can be completely disabled in the program's environment options.

       -d      Enable the debugging log.

       --prefix
               Specify an alternate path for Code::Blocks to find its shared files.

       -p, --profile
               Set which profile to use. If you set the profile to ask , Code::Blocks will display a list with all the known  profiles  to  choose
               from.

       --rebuild
               Start  a batch rebuild (i.e. "clean" and "build") job on the filenames passed as arguments. The filenames can be either projects or
               workspaces.

       --build Start a batch build (i.e. no "clean") job on the  filenames  passed  as  arguments.   The  filenames  can  be  either  projects  or
               workspaces.

       --target
               Specify a single build target to build in the batch build (or rebuild) job.

       --no-batch-window-close
               When the batch job ends, the log window closes too. This option keeps it open until you manually close it.

       --batch-build-notify
               Display a message when the batch job finishes.

EXAMPLES
       Batch build myproject.cpp, only the "Debug" target and keep the batch job window open when finished:
       codeblocks --build --target="Debug" --no-batch-window-close myproject.cbp

       Batch rebuild everything in myproject.cbp:
       codeblocks --rebuild myproject.cbp

AUTHOR
       Yiannis "mandrav" Mandravellos (mandrav@codeblocks.org)

HISTORY
       2006 - Initial version

1.0                                                                10 July 2006                                                             man(1)
