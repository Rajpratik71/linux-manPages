DSCEXTRACT(1)                                                 General Commands Manual                                                DSCEXTRACT(1)

NAME
       dscextract - extract a single file from a Debian source package

SYNOPSIS
       dscextract [options] dscfile file

DESCRIPTION
       dscextract  reads  a  single  file  from  a  Debian  source  package.   The idea is to only look into .diff.gz files (source format 1.0) or
       .debian.tar.gz/bz2 files (source format 3.0) where possible, hence avoiding to unpack large tarballs.  It is most useful for files  in  the
       debian/ subdirectory.

       file is relative to the first level directory contained in the package, i.e. with the first component stripped.

OPTIONS
       -f     "Fast"  mode.  For source format 1.0, avoid to fall back scanning the .orig.tar.gz file if file was not found in the .diff.gz.  (For
              3.0 packages, it is assumed that debian/* are exactly the contents of debian.tar.gz/bz2.)

EXIT STATUS
       0      file was extracted.

       1      file was not found in the source package.

       2      An error occurred, like dscfile was not found.

EXAMPLE
       dscextract dds_2.1.1+ddd105-2.dsc debian/watch || test $? = 1

AUTHOR
       dscextract was written by Christoph Berg <myon@debian.org>.

DEBIAN                                                           Debian Utilities                                                    DSCEXTRACT(1)
