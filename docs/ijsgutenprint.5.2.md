IJSGUTENPRINT(1)                                                                           Gutenprint Manual Pages                                                                           IJSGUTENPRINT(1)



NAME
       ijsgutenprint - Ghostscript driver for Gutenprint

SYNOPSIS
       gs -sDEVICE=ijs -sIjsServer=/usr/bin/ijsgutenprint -sDeviceManufacturer=vendor -sDeviceModel=name [ -dIjsUseOutputFD ] -sIjsParams=[ key1=value1,keyn=valuen... ] [ options ] [ files ]

DESCRIPTION
       ijsgutenprint provides Ghostscript with a Gutenprint driver, supporting all printers supported by libgutenprint.

       NOTE: ijsgutenprint should never be called directly.  Ghostscript will run it if the IjsServer parameter is set to IjsServer=ijsgutenprint when invoking the IJS driver.

       NOTE: The only supported method of running ijsgutenprint is via Foomatic.  Users running ghostscript directly will not be supported.  The driver name used by Foomatic is gutenprint-ijs.5.2.

OPTIONS
       ijsgutenprint accepts the following Ghostscript IJS options.  The Gutenprint-specific options are not documented here.

       -dIjsUseOutputFD
              This option should be specified whenever output from Ghostscript will go to stdout or into a pipe.  It may be specified in all other cases, with only a slight performance degradation.

       -sIjsParams=Option1=Value1,Option2=Value2
              This parameter contains a single string containing a comma-separated list of sub-options.

       -sDeviceManufacturer=vendor -sDeviceModel=name
              This option must be supplied.  There is no default.  The IJS driver requires the vendor (it's part of the protocol), but the ijsgutenprint driver ignores it.

HISTORY
       The  Ghostscript stp driver was originally written by Henryk Richter (buggs@comlab.uni-rostock.de), and was integrated into Gutenprint during the 3.1 development series.  Gutenprint (which was named
       Gimp-Print prior to release 5.0) itself was originally written by Michael Sweet <mike@easysw.com>, who released up to version 2.0; Robert Krawitz released version 3.0.   The  Gutenprint  development
       team (http://gimp-print.sourceforge.net) now maintains the entire package.

       The IJS driver was originally written by Russell Lang, and incorporated into Gutenprint (known then as Gimp-Print) in early 2002.  This driver corresponds with the IJS protocol 0.32.

       The stp driver is no longer supported as of Gutenprint 5.0.

COPYRIGHT
       Copyright ©  2001-2006 Robert Krawitz (rlk@alum.mit.edu)

       This  program  is  free  software;  you  can  redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the
       License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU  Gen‐
       eral Public License for more details.

       You  should  have  received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
       USA.

AUTHORS
       Robert Krawitz.  Originally written by Russell Lang.

       This manual page was written by Robert Krawitz (rlk@alum.mit.edu) and Roger Leigh (rleigh@debian.org).

SEE ALSO
       gs(1)



Version 5.2.9                                                                                    07 Jul 2012                                                                                 IJSGUTENPRINT(1)
