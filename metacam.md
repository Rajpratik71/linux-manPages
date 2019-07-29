metacam(1)                                      extract EXIF information from digital camera files                                      metacam(1)

NAME
       metacam - extract EXIF information from digital camera files

SYNOPSIS
            metacam [-v|-a|-x] [FILE]...

DESCRIPTION
       metacam supports all standard EXIF fields in addition to (known) vendor specific blocks from Nikon, Olympus, Canon and Casio.

OPTIONS
       -h, --help
              Output help information and exit.

       -v, --verbose
              Output unknown tags too.

       -a, --all
              Output ALL tags (implies -v).

       -x, --xml
              Output as XML.

AUTHORS
       metacam was developed by Daniel Stephens <daniel@cheeseplant.org>.

       This manual page was written by Alp Toker <alp@atoker.com>, Jarno Elonen <elonen@debian.org> and Juan Angulo Moreno <juan@apuntale.com> for
       Debian project (but may be used by others).

METACAM 1.2                                                          Sep 2007                                                           metacam(1)
