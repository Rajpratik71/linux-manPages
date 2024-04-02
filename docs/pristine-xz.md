PRISTINE-XZ(1)                                                      pristine-xz                                                     PRISTINE-XZ(1)

NAME
       pristine-xz - regenerate pristine xz files

SYNOPSIS
       pristine-xz [-vdk] gendelta file.xz delta

       pristine-xz [-vdk] genxz delta file

DESCRIPTION
       This is a complement to the pristine-tar(1) command. Normally you don't need to run it by hand, since pristine-tar calls it as necessary to
       handle .tar.xz files.

       pristine-xz gendelta takes the specified xz file, and generates a small binary delta file that can later be used by pristine-xz genxz to
       recreate the original file.

       pristine-xz genxz takes the specified delta file, and compresses the specified input file (which must be identical to the contents of the
       original xz file). The resulting file will be identical to the original gz file used to create the delta.

       The approach used to regenerate the original xz file is to figure out how it was produced -- what compression level was used, etc.
       Currently support is poor for xz files produced with unusual compression options.

       If the delta filename is "-", pristine-xz reads or writes it to stdio.

OPTIONS
       -v  Verbose mode, show each command that is run.

       -d  Debug mode.

       -k  Don't clean up the temporary directory on exit.

       -t  Try harder to determine how to generate deltas of difficult xz files.

ENVIRONMENT
       TMPDIR
           Specifies a location to place temporary files, other than the default.

AUTHOR
       Joey Hess <joeyh@debian.org>, Faidon Liambotis <paravoid@debian.org>, Cyril Brulebois <cyril.brulebois@enst-bretagne.fr>

       Licensed under the GPL, version 2.

perl v5.22.1                                                        2017-09-17                                                      PRISTINE-XZ(1)
