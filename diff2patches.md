diff2patches(1)                                                                                                                    diff2patches(1)

NAME
       diff2patches - Extract non-debian/ patches from .diff.gz files

SYNTAX
       diff2patches filename
       diff2patches --help|--version

DESCRIPTION
       Extracts  patches  from  .diff.gz  which  apply to files outside the “debian/” directory scope.  A patch is created for each modified file.
       Each patch is named according to the path of the modified file, with “/” replaced by “___”, and an extension of “.patch”.

OPTIONS
       filename
           Extract patches from filename which apply outside the “debian/” directory.

       --help
           Output help information and exit.

       --version
           Output version information and exit.

FILES
       debian/control
              Existence of this file is tested before any patch is extracted.

       debian/
       debian/patches/
              Patches are extracted to one of these directories.  “debian/patches/” is preferred, if it exists.  If DEB_PATCHES is present in  the
              environment, it will override this behavior (see “ENVIRONMENT VARIABLES” section below).

ENVIRONMENT VARIABLES
       DEB_PATCHES
              When  defined  and  points  to  an  existing  directory,  patches  are  extracted  in  that  directory  and  not under “debian/” nor
              “debian/patches/”.

SEE ALSO
       combinediff(1)

AUTHOR
       Raphael Geissert <atomo64@gmail.com>

Raphael Geissert <atomo64@gmail.com>                                                                                               diff2patches(1)
