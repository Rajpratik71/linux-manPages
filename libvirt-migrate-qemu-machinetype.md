LIBVIRT-MIGRATE-QEMU-MACHINETYPE:(1)                                                            June 2012                                                            LIBVIRT-MIGRATE-QEMU-MACHINETYPE:(1)

NAME
       libvirt-migrate-qemu-machinetype - program for migrating machine types in domain definitions

DESCRIPTION
       QEMU  versions  machine  types  by release.  The pc-0.12 machine type is meant to never change.  Newer features should come with the next pc-0.13 version.  However, with 1.0, the pc-0.12 machine
       type appears to have several bugs.

       libvirt-migrate-qemu-machinetype aids in transitioning virtual machine definitions to a new machine type.

USAGE
       libvirt-migrate-qemu-machinetype [-c URI] [-d] -a

       libvirt-migrate-qemu-machinetype [-c URI] [-d] -o TYPE -t TYPE <DOMAIN>

OPTIONS
       -h, --help
              show help message and exit

       -a     probe all domains and migrate if necessary

       -c URI connection URI to use. If one is not specified, will use qemu:///system. Only qemu:///system and qemu:///session is supported.

       -o TYPE
              migrate specified domains from machine type TYPE (default pc-0.12).

       -t TYPE
              migrate specified domains to machine type TYPE (default pc-1.0).

       -d     debug output

EXAMPLES
       To probe and migrate all exisiting domains:

         # libvirt-migrate-qemu-machinetype -a

       To migrate all VMs which are pc-0.13 to pc-0.14:

         # libvirt-migrate-qemu-machinetype -a -o pc-0.13 -t pc-0.14

       To migrate the 'vm1' and 'vm2' domains:

         # libvirt-migrate-qemu-machinetype -t pc-1.0 vm1 vm2

BUGS
       In the event that libvirt-migrate-qemu-machinetype is unable to migrate your VMs, virsh can be used directly. For example:

         $ kvm -M ?
         ... find the newest machine type ...
         $ virsh dumpxml <domain-id> > domain.xml
         ... edit domain.xml to use the newest machine type ...
         $ virsh define domain.xml

SEE ALSO
       virsh(1)

AUTHOR
       libvirt-migrate-qemu-machinetype is Copyright 2012, Canonical Ltd.

       libvirt-migrate-qemu-machinetype by Serge Hallyn <serge.hallyn@canonical.com>.

June 2012                                                                                                                                                            LIBVIRT-MIGRATE-QEMU-MACHINETYPE:(1)
