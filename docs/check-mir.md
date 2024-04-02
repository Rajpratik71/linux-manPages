check-mir(1)                                                  General Commands Manual                                                 check-mir(1)

NAME
       check-mir - check support status of dependencies

SYNOPSIS
       check-mir

DESCRIPTION
       This  script  checks  if  any  of a package's build or binary dependencies is in universe/multiverse. If the source package is destined for
       Ubuntu main or restricted, these either need to be eliminated or need to be promoted to main, following  https://wiki.ubuntu.com/MainInclu‐
       sionProcess.

       There are no options, just run it in a source package directory.

AUTHOR
       check-mir was written by Martin Pitt <martin.pitt@ubuntu.com>.

ubuntu-dev-tools                                                  13 January 2011                                                     check-mir(1)
