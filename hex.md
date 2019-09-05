tcl::transform::hex(3tcl)                                Reflected/virtual channel support                               tcl::transform::hex(3tcl)

__________________________________________________________________________________________________________________________________________________

NAME
       tcl::transform::hex - Hexadecimal encoding transformation

SYNOPSIS
       package require Tcl  8.6

       package require tcl::transform::core  ?1?

       package require tcl::transform::hex  ?1?

       ::tcl::transform::hex chan

__________________________________________________________________________________________________________________________________________________

DESCRIPTION
       The  tcl::transform::hex package provides a command creating a channel transformation which hex encodes data written to it, and decodes the
       data read from it.

       A related transformations in this module is tcl::transform::base64.

       The internal TclOO class implementing the transform handler is a sub-class of the tcl::transform::core framework.

API
       ::tcl::transform::hex chan
              This command creates a hex transformation on top of the channel chan and returns its handle.

BUGS, IDEAS, FEEDBACK
       This document, and the package it describes, will undoubtedly contain bugs  and  other  problems.   Please  report  such  in  the  category
       virtchannel  of the Tcllib Trackers [http://core.tcl.tk/tcllib/reportlist].  Please also report any ideas for enhancements you may have for
       either package and/or documentation.

KEYWORDS
       channel transformation, hexadecimal, reflected channel, tip 230, transformation, virtual channel

CATEGORY
       Channels

COPYRIGHT
       Copyright (c) 2009 Andreas Kupries <andreas_kupries@users.sourceforge.net>

tcllib                                                                   1                                               tcl::transform::hex(3tcl)
