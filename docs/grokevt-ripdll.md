grokevt-ripdll(1)                                                                                                                grokevt-ripdll(1)

NAME
       grokevt-ripdll - A tool for extracting message resources from a PE-formatted file.

SYNOPSIS
       grokevt-ripdll  input-dll  output-db .SH DESCRIPTION grokevt-ripdll parses a PE-formatted file (modern .exe and .dll files are examples PE-
       formatted files) and extracts all message resources. These resources are then stored in a Berkeley-style database file, which maps relative
       virtual addresses (RVAs) to the message resources themselves. These RVAs are what can be found in a windows event log file (.evt extension)
       to reference the proper message resource.  This utility is not intended to be used directly by end-users.  It is used by grokevt-builddb(1)
       to extract resources from all DLL/EXEs referenced in the registry.

ARGUMENTS
       input-dll
              This  is the PE formatted file to extract resources from. (It doesn't need to have a .dll extension, but it is most commonly used on
              DLLs.)

       output-db
              The database file to store the RVA->message mapping in. If this file already exists, it will be overwritten.  To extract the entries
              stored in this database, see grokevt-dumpmsgs(1).

BUGS
       Probably a few. This script has not been extensively tested with some guest platforms or with non-english systems.

       The  documentation  used  as a reference for PE formatted files was not complete or not completely accurate in places. Much guess-and-check
       took place.

CREDITS
       Original PE header code borrowed from the pymavis project.  For more information, see:

                 http://www.mplayerhq.hu/~arpi/pymavis/

       Message resource parsing added by Timothy D. Morgan.

       Copyright (C) 2005-2007 Timothy D. Morgan

       Copyright (C) 2004 A'rpi

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 3 for more details.

SEE ALSO
       grokevt(7) grokevt-addlog(1) grokevt-builddb(1) grokevt-dumpmsgs(1) grokevt-findlogs(1) grokevt-parselog(1)

File Conversion Utilities                                          20 March 2008                                                 grokevt-ripdll(1)
