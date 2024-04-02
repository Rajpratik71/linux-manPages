NTFSINFO(8)                                                                             System Manager's Manual                                                                            NTFSINFO(8)

NAME
       ntfsinfo - dump a file's attributes

SYNOPSIS
       ntfsinfo [options] device

DESCRIPTION
       ntfsinfo will dump the attributes of inode inode-number or the file path-filename and/or information about the mft ( -m option).  Run ntfsinfo without arguments for a full list of options.

OPTIONS
       Below  is  a summary of all the options that ntfsinfo accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the long name is preceded by --.  Any single
       letter options, that don't take an argument, can be combined into a single command, e.g.  -fv is equivalent to -f -v.  Long named options can be abbreviated to  any  unique  prefix  of  their
       name.

       -F, --file FILE
              Show information about this file

       -f, --force
              This will override some sensible defaults, such as not overwriting an existing file.  Use this option with caution.

       -h, --help
              Show a list of options with a brief description of each one.

       -i, --inode NUM
              Show information about this inode.

       -m, --mft
              Show information about the volume.

       -q, --quiet
              Produce less output.

       -t, --notime
              Do not display timestamps in the output.

       -v, --verbose
              Increase the amount of output that ntfsinfo prints.

       -V, --version
              Show the version number, copyright and license.

BUGS
       There are no known problems with ntfsinfo.  If you find a bug please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       ntfsinfo  was  written by Matthew J. Fanto, Anton Altaparmakov, Richard Russon, Szabolcs Szakacsits, Yuval Fledel, Yura Pakhuchiy and Cristian Klein.  It was ported to ntfs-3g by Erik Larsson
       and Jean-Pierre Andre.

AVAILABILITY
       ntfsinfo is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       ntfsprogs(8)

ntfs-3g 2017.3.23                                                                             April 2006                                                                                   NTFSINFO(8)
