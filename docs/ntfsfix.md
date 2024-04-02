NTFSFIX(8)                                                                              System Manager's Manual                                                                             NTFSFIX(8)

NAME
       ntfsfix - fix common errors and force Windows to check NTFS

SYNOPSIS
       ntfsfix [options] device

DESCRIPTION
       ntfsfix  is a utility that fixes some common NTFS problems.  ntfsfix is NOT a Linux version of chkdsk.  It only repairs some fundamental NTFS inconsistencies, resets the NTFS journal file and
       schedules an NTFS consistency check for the first boot into Windows.

       You may run ntfsfix on an NTFS volume if you think it was damaged by Windows or some other way and it cannot be mounted.

OPTIONS
       Below is a summary of all the options that ntfsfix accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the long name is preceded by  --.   Any  single
       letter  options,  that  don't  take  an argument, can be combined into a single command, e.g.  -fv is equivalent to -f -v.  Long named options can be abbreviated to any unique prefix of their
       name.

       -b, --clear-bad-sectors
              Clear the list of bad sectors. This is useful after cloning an old disk with bad sectors to a new disk.

       -d, --clear-dirty
              Clear the volume dirty flag if the volume can be fixed and mounted.  If the option is not present or the volume cannot be fixed, the dirty volume flag is set to request a volume check‐
              ing at next mount.

       -h, --help
              Show a list of options with a brief description of each one.

       -n, --no-action
              Do not write anything, just show what would have been done.

       -V, --version
              Show the version number, copyright and license

BUGS
       There are no known problems with ntfsfix.  If you find a bug please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       ntfsfix was written by Anton Altaparmakov, with contributions from Szabolcs Szakacsits.  It was ported to ntfs-3g by Erik Larsson and Jean-Pierre Andre.

AVAILABILITY
       ntfsfix is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       mkntfs(8), ntfsprogs(8)

ntfs-3g 2017.3.23                                                                            January 2013                                                                                   NTFSFIX(8)
