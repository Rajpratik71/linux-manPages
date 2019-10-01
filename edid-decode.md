edid-decode(1)                                                                             General Commands Manual                                                                             edid-decode(1)



NAME
       edid-decode - Decode EDID data in human-readable format

SYNOPSIS
       edid-decode [in] [out]

DESCRIPTION
       edid-decode  decodes  EDID monitor description data in human-readable format.  It takes zero, one, or two arguments.  If invoked with no arguments it reads from standard input and writes to standard
       output.  With one argument, the file named by the argument is read instead.  With two arguments, normal output is suppressed, and the binary EDID blob is written to the  file  named  by  the  second
       argument.

       Input files may be raw binaries or ASCII text.  ASCII input is scanned for hex dumps; heuristics are included to search for hexdumps in xrandr(1) property output and Xorg(1) log file formats, other‐
       wise the data is treated as a raw hexdump.  EDID blocks for connected monitors can be found in /sys/class/drm/*/edid on modern Linux systems with kernel modesetting support.

NOTES
       Not all fields are decoded, or decoded completely.  Some fields' decoding may appear to corrupt the output (for example, detailed string sections have their contents printed literally).  edid-decode
       does  attempt to validate its input against the relevant standards, but its opinions have not been double-checked with the relevant standards bodies, so they may be wrong.  Do not rely on the output
       format, as it will likely change in future versions of the tool as additional fields and extensions are added.

SEE ALSO
       Xorg(1), xrandr(1)

AUTHORS
       edid-decode was written by Adam Jackson, with contributions from Eric Anholt, Damien Lespiau, and others.  For complete history and the latest version, see http://cgit.freedesktop.org/xorg/app/edid-
       decode/



                                                                                                                                                                                               edid-decode(1)
