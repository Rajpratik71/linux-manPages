VIRT-XML-VALIDATE(1)                                          Virtualization Support                                          VIRT-XML-VALIDATE(1)

NAME
       virt-xml-validate - validate libvirt XML files against a schema

SYNOPSIS
       virt-xml-validate XML-FILE [SCHEMA-NAME]

       virt-xml-validate OPTION

DESCRIPTION
       Validates a libvirt XML for compliance with the published schema.  The first compulsory argument is the path to the XML file to be
       validated. The optional second argument is the name of the schema to validate against. If omitted, the schema name will be inferred from
       the name of the root element in the XML document.

       Valid schema names currently include

       "domainsnapshot"
           The schema for the XML format used by domain snapshot configuration

       "domain"
           The schema for the XML format used by guest domains configuration

       "network"
           The schema for the XML format used by virtual network configuration

       "storagepool"
           The schema for the XML format used by storage pool configuration

       "storagevol"
           The schema for the XML format used by storage volume descriptions

       "nodedev"
           The schema for the XML format used by node device descriptions

       "capability"
           The schema for the XML format used to declare driver capabilities

       "nwfilter"
           The schema for the XML format used by network traffic filters

       "secret"
           The schema for the XML format used by secrets descriptions

       "interface"
           The schema for the XML format used by physical host interfaces

OPTIONS
       -h, --help
           Display command line help usage then exit.

       -V, --version
           Display version information then exit.

EXIT STATUS
       Upon successful validation, an exit status of 0 will be set. Upon failure a non-zero status will be set.

AUTHOR
       Daniel P.Berrange

BUGS
       Report any bugs discovered to the libvirt community via the mailing list <https://libvirt.org/contact.html> or bug tracker
       <https://libvirt.org/bugs.html>.  Alternatively report bugs to your software distributor / vendor.

COPYRIGHT
       Copyright (C) 2009-2013 by Red Hat, Inc.  Copyright (C) 2009 by Daniel P. Berrange

LICENSE
       virt-xml-validate is distributed under the terms of the GNU GPL v2+.  This is free software; see the source for copying conditions. There
       is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

SEE ALSO
       virsh(1), online XML format descriptions <https://libvirt.org/format.html>

libvirt-3.9.0                                                       2017-10-30                                                VIRT-XML-VALIDATE(1)
