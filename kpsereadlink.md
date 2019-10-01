KPSEREADLINK(1)                                                                            General Commands Manual                                                                            KPSEREADLINK(1)



NAME
       kpsereadlink - print contents of symbolic link

SYNOPSIS
       kpsereadlink file

DESCRIPTION
       If file is a symbolic link, print its contents (what it links to), and exit successfully.  Exit with a failure otherwise.

       On systems that do not support symbolic links, kpsereadlink will always fail.

OPTIONS
       kpsereadlink accepts the following options:

       --help Print help message and exit.

       --version
              Print version information and exit.

SEE ALSO
       readlink(2)



Kpathsea 6.1.0                                                                                   1 March 2011                                                                                 KPSEREADLINK(1)
