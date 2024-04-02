SCS2ASCII(1)                                                                               General Commands Manual                                                                               SCS2ASCII(1)



NAME
       scs2ascii - convert IBM SCS printer data into ASCII

SYNOPSIS
       scs2ascii

DESCRIPTION
       This program handles the conversion from an SCS print stream from an AS/400 printer emulation to something suitable for sending to lpr.  It is only intended for use with lp5250d.

       When using host print transform with lp5250d, scs2ascii will remove the remaining characters from the SCS print stream to leave only the data intended for the printer.

SEE ALSO
       lp5250d(1), http://tn5250.sourceforge.net/

COPYRIGHT
       scs2ascii is copyright 1997 - 1999 Michael Madore.  This manpage is copyright 1999 - 2008 Carey Evans.

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of
       the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR  A  PARTICULAR  PURPOSE.   See  the  GNU
       Lesser General Public License for more details.

       You  should  have  received  a  copy  of  the  GNU  Lesser General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
       02111-1307  USA

AUTHORS
       scs2ascii was written by Michael Madore.  This manual page was written by Carey Evans.



                                                                                                 17 Jun 2001                                                                                     SCS2ASCII(1)
