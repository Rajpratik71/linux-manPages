PRISTINE-BZ2(1)                                                    pristine-bz2                                                    PRISTINE-BZ2(1)

NAME
       pristine-bz2 - regenerate pristine bz2 files

SYNOPSIS
       pristine-bz2 [-vdk] gendelta file.bz2 delta

       pristine-bz2 [-vdk] genbz2 delta file

DESCRIPTION
       This is a complement to the pristine-tar(1) command. Normally you don't need to run it by hand, since pristine-tar calls it as necessary to
       handle .tar.bz2 files.

       pristine-bz2 gendelta takes the specified bz2 file, and generates a small binary delta file that can later be used by pristine-bz2 genbz2
       to recreate the original file.

       pristine-bz2 genbz2 takes the specified delta file, and compresses the specified input file (which must be identical to the contents of the
       original bz2 file). The resulting file will be identical to the original gz file used to create the delta.

       The approach used to regenerate the original bz2 file is to figure out how it was produced -- what compression level was used, whether it
       was built with bzip2(1) or with pbzip2(1).

       Note that other tools exist, like bzip2smp or dbzip2, but they are said to be bit-identical with bzip2. Anyway, bzip2 looks like the most
       widespread implementation, so it's hard to find bzip2 files that make pristine-bz2 fail. Please report!

       The deprecated bzip1 compression method hasn't been implemented.

       If the delta filename is "-", pristine-bz2 reads or writes it to stdio.

OPTIONS
       -v  Verbose mode, show each command that is run.

       -d  Debug mode.

       -k  Don't clean up the temporary directory on exit.

       -t  Try harder to determine how to generate deltas of difficult bz2 files.

ENVIRONMENT
       TMPDIR
           Specifies a location to place temporary files, other than the default.

AUTHOR
       Joey Hess <joeyh@debian.org>, Faidon Liambotis <paravoid@debian.org>, Cyril Brulebois <cyril.brulebois@enst-bretagne.fr>

       Licensed under the GPL, version 2.

perl v5.22.1                                                        2017-09-17                                                     PRISTINE-BZ2(1)
