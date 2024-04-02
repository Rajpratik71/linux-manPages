LIBVIRT-MIGRATE-QEMU-DISKS:(1)                                                                 August 2010                                                                 LIBVIRT-MIGRATE-QEMU-DISKS:(1)

NAME
       libvirt-migrate-qemu-disks - program for migrating pre-0.8.3 domain definitions

DESCRIPTION
       Libvirt  versions  earlier  that  0.8.3  would probe a qemu disk to determine its format and did not require that the format be declared in the XML. Newer versions of libvirt will default to the
       'raw' format when the format is not specified in the XML. As a result, non-raw disks without unspecified disk format will no longer be available in virtual machines.

       libvirt-migrate-qemu-disks aids in transitioning virtual machine definitions to the new required format. In essence, it will check all domains for affected virtual machines, probe  the  affected
       disks and update the domain definition accordingly. For example, a domain with:

           <disk type='file' device='disk'>
             <source file='/var/lib/libvirt/images/vm1.qcow2'/>
             <target dev='hda' bus='ide'/>
             <address type='drive' controller='0' bus='0' unit='0'/>
           </disk>

       will be updated to have:

           <disk type='file' device='disk'>
             <driver name='qemu' type='qcow2'/>
             <source file='/var/lib/libvirt/images/vm1.qcow2'/>
             <target dev='hda' bus='ide'/>
             <address type='drive' controller='0' bus='0' unit='0'/>
           </disk>

USAGE
       libvirt-migrate-qemu-disks [-c URI] [-d] -a

       libvirt-migrate-qemu-disks [-c URI] [-d] -t TYPE <DOMAIN>

OPTIONS
       -h, --help
              show help message and exit

       -a     probe all domains and migrate if necessary

       -c URI connection URI to use. If one is not specified, will use qemu:///system. Only qemu:///system and qemu:///session is supported.

       -t TYPE
              migrate specified domains from raw to disk format TYPE

       -d     debug output

EXAMPLES
       To probe and migrate all exisiting domains (root may be needed to probe the disk):

         # libvirt-migrate-qemu-disks -a

       To migrate the 'vm1' and 'vm2' domains:

         # libvirt-migrate-qemu-disks -t qcow2 vm1 vm2

BUGS
       In the event that libvirt-migrate-qemu-disks is unable to migrate your disks, virsh can be used directly. For example:

         $ qemu-img info <path to your disk>
         $ virsh dumpxml <domain-id> > domain.xml
         ... edit domain.xml to use the file format seen with qemu-img ...
         $ virsh define domain.xml

       See http://libvirt.org/formatdomain.html#elementsDisks for more information.

SEE ALSO
       virsh(1)

AUTHOR
       libvirt-migrate-qemu-disks is Copyright 2010, Canonical Ltd.

       libvirt-migrate-qemu-disks and this manual page was originally written by Jamie Strandboge <jamie@canonical.com>

August 2010                                                                                                                                                                LIBVIRT-MIGRATE-QEMU-DISKS:(1)
