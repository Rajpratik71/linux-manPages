UPDATE-MAINTAINER(1)                                          General Commands Manual                                         UPDATE-MAINTAINER(1)

NAME
       update-maintainer - change the Maintainer field in a Debian source package

SYNOPSIS
       update-maintainer [options]

DESCRIPTION
       update-maintainer updates the Maintainer field in the source of an Ubuntu package to match the DebianMaintainerField specification.

OPTIONS
       -d PATH, --debian-directory=PATH
              location of the debian directory (default: ./debian)

       -h, --help
              show a help message and exit

       -q, --quiet
              print no informational messages

SEE ALSO
       See https://wiki.ubuntu.com/DebianMaintainerField for more information.

AUTHOR
       update-maintainer  has  been  written  by  Benjamin  Drung  <bdrung@ubuntu.com>  and  this  manual  page by Siegfried-Angel Gevatter Pujals
       <rainct@ubuntu.com>.

       Both are released under the ISC license.

ubuntu-dev-tools                                                   December 2010                                              UPDATE-MAINTAINER(1)
