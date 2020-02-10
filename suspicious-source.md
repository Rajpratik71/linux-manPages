SUSPICIOUS-SOURCE(1)                                                                     General Commands Manual                                                                     SUSPICIOUS-SOURCE(1)

NAME
       suspicious-source - search for files that are not the GPL's "preferred form of modification"

SYNOPSIS
       suspicious-source [options]

DESCRIPTION
       suspicious-source  is  a  script  that outputs a list of files which are not common source files.  This should be run in the root of a source tree to find files which might not be the "preferred
       form of modification" that the GPL and other licenses require.

       The files inside version control system directories (like .bzr/ or CVS/) are not considered.

OPTIONS
       -h, --help
              Show this help message and exit.

       -v, --verbose
              Print more information.

       -d directory, --directory=directory
              Check the files in the specified directory instead of the current directory.

       -m mimetype, --mimetype=mimetype
              Add mimetype to list of white-listed MIME types.

       -e extension, --extension=extension
              Add extension to list of white-listed extensions.

AUTHORS
       suspicious-source and this manpage have been written by Benjamin Drung <bdrung@debian.org>.

       Both are released under the ISC license.

DEBIAN                                                                                       Debian Utilities                                                                        SUSPICIOUS-SOURCE(1)
