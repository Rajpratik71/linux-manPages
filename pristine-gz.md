PRISTINE-GZ(1)                                                      pristine-gz                                                     PRISTINE-GZ(1)

NAME
       pristine-gz - regenerate pristine gz files

SYNOPSIS
       pristine-gz [-vdk] gendelta file.gz delta

       pristine-gz [-vdk] gengz delta file

DESCRIPTION
       This is a complement to the pristine-tar(1) command. Normally you don't need to run it by hand, since pristine-tar calls it as necessary to
       handle .tar.gz files.

       pristine-gz gendelta takes the specified gz file, and generates a small binary delta file that can later be used by pristine-gz gengz to
       recreate the original file.

       pristine-gz gengz takes the specified delta file, and compresses the specified input file (which must be identical to the contents of the
       original gz file). The resulting file will be identical to the original gz file used to create the delta.

       The approach used to regenerate the original gz file is to figure out how it was produced -- what compression level was used, whether it
       was built with GNU gzip(1) or with a library or BSD version, whether the --rsyncable option was used, etc, and to reproduce this build
       environment when regenerating the gz.

       This approach will work for about 99.5% of cases. One example of a case it cannot currently support is a gz file that has been produced by
       appending together multiple gz files.

       For the few where it doesn't work, a binary diff will be included in the delta between the closest regneratable gz file and the original.
       In the worst case, the diff will include the entire content of the original gz file, resulting in a larger than usual delta. If the delta
       is much larger than usual, pristine-gz will print a warning.

       If the delta filename is "-", pristine-gz reads or writes it to stdio.

OPTIONS
       -v
       --verbose
           Verbose mode, show each command that is run.

       -d
       --debug
           Debug mode.

       -k
       --keep
           Don't clean up the temporary directory on exit.

ENVIRONMENT
       TMPDIR
           Specifies a location to place temporary files, other than the default.

AUTHOR
       Joey Hess <joeyh@debian.org>, Faidon Liambotis <paravoid@debian.org> Josh Triplett <josh@joshtriplett.org>

       Licensed under the GPL, version 2.

perl v5.22.1                                                        2017-09-17                                                      PRISTINE-GZ(1)
