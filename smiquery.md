smiquery(1)                                                          SMI Tools                                                         smiquery(1)

NAME
       smiquery - query single information from SMI MIB modules

SYNOPSIS
       smiquery [ -Vh ] [ -p module ] command name

DESCRIPTION
       The  smiquery program is used to query information on a single item from an MIB module, e.g. module meta information or a single type defi‐
       nition.

OPTIONS
       -V, --version
              Show the smiquery version and exit.

       -h, --help
              Show a help text and exit. The help text lists all available commands.

       -p module, --preload module
              Preload the module module before reading the main module. This may be helpful if an incomplete main module  misses  to  import  some
              definitions.

       command name
              This  specifies the kind of information to retrieve (module, imports, revisions, node, parent, compliance, index, members, children,
              type, or macro) and the item to retrieve.

       The module in question is searched along a path, which is initialized by the SMIPATH environment variable or by /usr/share/mibs if  SMIPATH
       is not set. Files with a .sming extension are expected to be (old-style!) SMIng module files. Files with a .my or without any extension are
       expected to be SMIv1/v2 module files.

EXAMPLE
       This example queries for information on the node ifNumber defined in the module IF-MIB.

         $ smiquery node IF-MIB::ifNumber
              MibNode: IF-MIB::ifNumber
               OID: 1.3.6.1.2.1.2.1
              Type: Integer32
          Declaration: OBJECT-TYPE
             NodeKind: scalar
            Access: read-only
            Status: current
          Description: The number of network interfaces (regardless of their
                 current state) present on this system.

SEE ALSO
       The libsmi(3) project is documented at http://www.ibr.cs.tu-bs.de/projects/libsmi/.

AUTHOR
       (C) 1999-2004 F. Strauss, TU Braunschweig, Germany <strauss@ibr.cs.tu-bs.de>

IBR                                                               August 10, 2004                                                      smiquery(1)
