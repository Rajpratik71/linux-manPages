PLDES(1)                                                       GNUstep System Manual                                                      PLDES(1)

NAME
       plio, pldes, plser, plmerge, plparse, pl2link     - property list tools

SYNOPSIS
       pldes filename(s)
       plget key[morekeys]
       plser filename(s)
       plmerge [ destination-file ] [ input-file(s) ]
       plparse filename(s)
       pl2link input-file [ destination-file ]
       plio -input [ input-file ]  -output [ destination-file ]

DESCRIPTION
       Property lists in GNUstep are hierarchical lists of values or attribute-value pairs.  Programmatically they are represented by instances of
       the NSString, NSData, NSArray, or NSDictionary (most common) class (which may contain other instances of such  classes).   These  instances
       can be serialized as binary objects to form a persistent representation.  In addition, there are two alternative human-readable representa‐
       tions.  The first, utilized in NeXTstep and OpenStep, utilizes a text format with equals signs expressing attribute-value bindings and  set
       braces  expressing  hierarchical organization.  The second, often (uninformatively) referred to as "plist" format, is in XML and is used by
       Mac OS X.  The tools described here are utilities for manipulating the various persistent property list representations as files.

       pldes filename(s)
           Converts a binary serialised property list (class instance) to a text representation.

       plget key
           Reads a text representation of a dictionary in property list format as standard input, extracts the string value held in  that  dictio‐
           nary with the specified key, and writes the result to standard output.  Multiple keys may be used to extract values from nested dictio‐
           naries.

       plser filename(s)
           Converts a text representation of a property list to a binary serialized representation.

       plmerge [ destination-file ] [ input-file(s) ]
           Merges text property lists into a single property list

       plparse filename(s)
           Checks that each file contains a valid text representation of a property list.

       pl2link input-file [ destination-file ]
           Produces a desktop link file for KDE and Gnome for the given text representation of a property list.

       plio -input [ input-file ]
           Takes the serialized plist represented by input-file and outputs it to standard output.

       plio -output [ destination-file ]
           Takes a plist from standard input and serializes it into destination-file.

SEE ALSO
       defaults(1)

HISTORY
       Written 1999-2000.

       This manual page first appeared in gnustep-base 1.9.2 (March 2004).

AUTHORS
       pldes, plget, plparse, plser were written by Richard Frith-Macdonald <rfm@gnu.org>.

       plmerge was written by Jonathan Gapen  <jagapen@whitewater.chem.wisc.edu>.

       pl2link was written by Fred Kiefer <FredKiefer@gmx.de>.

       pl (renamed to plio in Debian) was written by Gregory Casamento <greg_casamento@yahoo.com>.

GNUstep                                                             August 2003                                                           PLDES(1)
