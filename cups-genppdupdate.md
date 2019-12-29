CUPS-GENPPDUPDATE(8)                    Gutenprint Manual Pages                   CUPS-GENPPDUPDATE(8)

NAME
       cups-genppdupdate - update CUPS+Gutenprint PPD files

SYNOPSIS
       cups-genppdupdate  [-h] [-n] [-N] [-q | -v] [-s ppd-directory] [-s output-directory] [PPD-FILES
       or QUEUES...]

DESCRIPTION
       cups-genppdupdate regenerates the Gutenprint PPD files in use by CUPS, using the PPD files  un‐
       der  /usr/share/cups/model/gutenprint as templates.  The new PPD file replaces the old PPD file
       under /etc/cups/ppd, but all the options set in the old PPD will be merged into  the  new  PPD,
       provided that they are still valid in the new file.

       If no files or queue names are specified, cups-genppdupdate updates all Gutenprint PPD files in
       /etc/cups/ppd.  Otherwise, cups-genppdupdate updates all files or queues listed on the  command
       line.

       cups-genppdupdate does not update PPD files from Gimp-Print 4.2 or earlier.

       cups-genppdupdate  does not restart cupsd.  cupsd will need manually reloading (or send SIGHUP)
       once cups-genppdupdate has completed.

OPTIONS
       -h     Show a help message.

       -n     No action.  The program will run, but the old PPD files will not be replaced.

       -q     Quiet mode.  No messages will be issued, apart from errors.

       -v     Verbose mode.  More informative messages will be issued.  Note  that  extremely  verbose
              output  may  be turned on by setting $debug=1 in the source, but this output will not be
              of use to the average user.

       -s ppd-directory
              Use ppd-directory as the base directory to read PPD files from.  By  default,  the  base
              directory  is /usr/share/cups/model/gutenprint.  Under this directory, the PPD files are
              located in subdirectories according to language code and territory.

       -o output-directory
              Place updated PPD files in output-directory.  By default, this is the same as the  input
              directory.

       -N     Reset all options to their defaults (do not merge options from the current PPD file)

SEE ALSO
       cups-genppd(8),   cups-genppdconfig(8),  CUPS  Software  Administrators  Manual,  http://local‐
       host:631/documentation.html

COPYRIGHT
       Copyright ©  2002-2006 Roger Leigh (rleigh@debian.org) and Robert Krawitz (rlk@alum.mit.edu)

       This program is free software; you can redistribute it and/or modify it under the terms of  the
       GNU General Public License, version 2, as published by the Free Software Foundation.

       This manual page was written by Roger Leigh (rleigh@debian.org).

Version 5.3.1                                 22 Sep 2018                         CUPS-GENPPDUPDATE(8)
