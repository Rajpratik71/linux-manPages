FINDDUP(1)                                                             Perl                                                             FINDDUP(1)

NAME
       finddup - Find identical files and do something with them

SYNOPSIS
   Usage:
              finddup [options...]

       --man  the manpage

       -h, --help
              a short help

       --version
              the version (CVS) of the program

       -n, --noaction
              do just nothing, just print out (implies -v)

       -v, --verbose
              just what the name says

       -q, --quiet
              be quiet

       -l, --link
              link the identical files together

       -o, --oldresult
              Use the old output of this script

       -i, --ignore-perms
              Don't check that file owner and permissions match

       -d, --dir
              Define the dir to check (you may specify more than one)

DESCRIPTION
       finddup search the working directory and all files below on the same partition for duplicate files.

       finddup can optional hardlink such files to save space.

       Files size 0 will not be reported or hardlinked as this might give problemes later.

       This is a complete rewrite of the finddup in perl to handle several issues:

         - Allow spaces and other characters in filenames

         - be faster

         - include nodup in same script

         - Handle files that already have other hardlinks in the same tree

         - Several improvements

       If started as nodup or nodup.pl the script will act like started with options --link and --oldresult

COPYRIGHT
       Copyright (c) 2005 by Klaus Ethgen. All rights reserved.

LICENSE
       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You  should  have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation,
       Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

AUTHOR
       Klaus Ethgen <Klaus@Ethgen.de<gt>

HISTORY
       $Log: finddup,v $ Revision 2.3  2005/02/06 18:57:42  klaus * Make --oldresult faster by not calculating the md5sum again * Fix a  but  that
       with --oldresult no links will be done cause the internal
         datastructure * Do handle errors in open for md5sum calculation

       Revision 2.2  2005/02/06 12:21:02  klaus Little but important bug in link routine.

       Revision 2.1  2005/02/05 18:43:11  klaus Just cosmetic

       Revision 2.0  2005/02/05 18:41:20  klaus Completely new version

Contributed                                                            User                                                             FINDDUP(1)
