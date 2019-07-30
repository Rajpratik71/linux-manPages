l3build(1)                                                                       General Commands Manual                                                                       l3build(1)

NAME
       l3build - Checking and building packages

SYNOPSIS
       l3build <command> [<options>] [<names>]

DESCRIPTION
       The l3build system is a Lua script for building TeX packages, with particular emphasis on regression testing. It is written in cross-platform Lua code, so can be used by any mod‐
       ern TeX distribution with the texlua interpreter. A package for building with l3build can be written in any TeX dialect; its defaults are set up for LaTeX packages written in the
       DocStrip style.

       The most commonly used l3build commands are:

       check  Run all automated tests

       clean  Clean out directory tree

       doc    Typesets all documentation files

       install
              Installs files into the local texmf tree

       save   Saves test validation log

       tag    Update release tags in files

       uninstall
              Uninstalls files from the local texmf tree

       unpack Unpacks the source files into the build tree

OPTIONS
       Various options apply

       --config|-c
              Sets the config(s) used for running tests

       --date Sets the date to insert into sources

       --dry-run
              Dry run for install

       --engine|-e
              Sets the engine(s) to use for running test

       --epoch
              Sets the epoch for tests and typesetting

       --first
              Name of first test to run

       --force|-f
              Force tests to run if engine is not set up

       --halt-on-error|-H
              Stops running tests after the first failure

       --last Name of last test to run

       --pdf|-p
              Check/save PDF files

       --quiet|-q
              Suppresses TeX output when unpacking

       --rerun
              Skip setup: simply rerun tests

       --shuffle
              Shuffle order of tests

       --texmfhome
              Location of user texmf tree

BUGS
AUTHOR
       The LaTeX3 Project (latex-team@latex-project.org)

       Please log issues on the GitHub homepage: https://github.com/latex3/l3build/issues.

SEE ALSO
       See l3build.pdf for more details.

                                                                                        2018-09-26                                                                             l3build(1)
