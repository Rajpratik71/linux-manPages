VMBUILDER(1)                                                                             General Commands Manual                                                                             VMBUILDER(1)

NAME
       vmbuilder - builds virtual machines from the command line

SYNOPSIS
       vmbuilder <hypervisor> <distro> [OPTIONS]...

       <hypervisor>  Hypervisor image format. Valid options: xen kvm vmw6 vmserver

       <distro>      Distribution. Valid options: ubuntu

DESCRIPTION
       This  manual page documents the vmbuilder command.  vmbuilder is a program that builds virtual machines from the command line, but can have other interfaces implemented through its plugin mecha‐
       nism. You can pass command line options to add extra packages, remove packages, choose which version of Ubuntu, which mirror etc. On recent hardware with plenty of RAM,  tmpdir  in  /dev/shm  or
       using a tmpfs, and a local mirror (see apt-proxy or apt-mirror), you can bootstrap a vm in less than a minute.

OPTIONS
       NOTE:  Only common basic options are described here.  Many options can be added through plugins and others, they depends on the hypervisor and distro you specify.  Please use vmbuilder <hypervi‐
              sor> <distro> --help for a full options list.

       -h, --help
              Show this help message and exit.

       -c ALTCONFIG --config
              Specify the path to an optional configuration file. [default:None]. /etc/vmbuilder.cfg and ~/.vmbuilder.cfg are always read if present. The content of the configuration file is  explained
              at https://help.ubuntu.com/community/JeOSVMBuilder#Using%20configuration%20files.

       -d DEST, --dest DEST
              Specify the destination directory. [default:<hypervisor>-<distro>]. Config option: destdir.

       --debug
              Show (a lot of) debug information

       -v, --verbose
              Show progress information

       -q, --quiet
              Silent operation

       -t TMP, --tmp TMP
              Use TMP as temporary working space for image generation. Defaults to $TMPDIR if it is defined or /tmp otherwise. [default: /tmp]

       --templates DIR
              Prepends dir to template search path. See https://help.ubuntu.com/community/JeOSVMBuilder#Modifying%20the%20libvirt%20template%20to%20use%20bridging for an example.

       -o, --overwrite
              Force overwrite of destination directory if it already exist. [default: False]

       --in-place
              Install directly into the filesystem images. This is needed if your $TMPDIR is nodev and/or nosuid, but will result in slightly larger file system images.

       --tmpfs OPTS
              Use a tmpfs as the working directory, specifying its size or "-" to use tmpfs default (suid,dev,size=1G).

       -m MEM, --mem MEM
              Assign MEM megabytes of memory to the guest vm. [default: 128]

       --cpus NUM
              Assign NUM cpus to the guest vm. [default: 1]

   Guest partitioning options
       --part PATH
              Allows to specify a partition table in PATH each line of partfile should specify (root first):
                      mountpoint size (device) (filename)
              one  per  line, separated by space, where size is in megabytes. The third and fourth options allow you to specify a device for the filesystem, and a name for the filesystem image, both of
              which are optional. You can have up to 4 virtual disks, a new disk starts on a line containing only '---'. ie:
                      root 2000 a1 rootfs
                      /boot 512 a2 boot
                      swap 1000 a3 swapfs
                      ---
                      /var 8000 b1 var
                      /var/log 2000 b2 varlog

       The following three options are not used if --part is specified:

              --rootsize SIZE
                     Size (in MB) of the root filesystem [default: 4096].  Discarded when --part is used.

              --optsize SIZE
                     Size (in MB) of the /opt filesystem. If not set, no /opt filesystem will be added. Discarded when --part is used.

              --swapsize SIZE
                     Size (in MB) of the swap partition [default: 1024]. Discarded when --part is used.

   Network related options:
       --domain DOMAIN
              Set DOMAIN as the domain name of the guest. Default: The domain of the machine running this script.

       --ip ADDRESS
              IP address in dotted form [default: dhcp]

       Options below are discarded if --ip is not specified
              --mask VALUE IP mask in dotted form [default: based on ip setting].

              --net ADDRESS
                     IP net address in dotted form [default: based on ip setting].

              --bcast VALUE
                     IP broadcast in dotted form [default: based on ip setting].

              --gw ADDRESS
                     Gateway (router) address in dotted form [default: based on ip setting (first valid address in the network)].

              --dns ADDRESS
                     DNS address in dotted form [default: based on ip setting (first valid address in the network)]

   Post install actions:
       --copy FILE
              Read 'source dest' lines from FILE, copying source files from host to dest in the guest's file system.

       --execscript SCRIPT, --exec SCRIPT
              Run SCRIPT after distro installation finishes. Script will be called with the guest's chroot as first argument, so you can use chroot $1 <cmd> to run code in the virtual machine.

   libvirt integration:
       --libvirt=URI
              Add VM to given URI

   Scripts:
       --firstboot PATH
              Specify a script that will be copied into the guest and executed the first time the machine boots.  This script must not be interactive.

       --firstlogin PATH
              Specify a script that will be copied into the guest and will be executed the first time the user logs in.  This script can be interactive.

DEVELOPMENT
       vmbuilder is a python program that offers a very simple mechanism to increase functionalities, interfaces, support  other  distribution  and  hypervisors.  Feel  free  to  join  the  project  at
       https://launchpad.net/vmbuilder

COMPATIBILTY
       vmbuilder  includes  a command line interface compatibility with its ancestor ubuntu-vm-builder.  This compatibility does not include template or configration files which now use a newer format.
       Programs or script that were relying on ubuntu-vm-builder should continue working without any issues if the do not use templates or configuration files.

SUPPORT
       Feel free to join #ubuntu-virt on freenode to get some help or just say hello.

SEE ALSO
       apt-proxy(8), apt-mirror(8)

       The vmbuilder tutorial available at https://help.ubuntu.com/community/JeOSVMBuilder

       The CheetahTemplate documentation for syntax of the template files at http://www.cheetahtemplate.org/docs/users_guide_html/

AUTHOR
       vmbuilder is Copyright (C) 2007-2008 Canonical Ltd. and written by Soren Hansen <soren@canonical.com> with the help of others, see /usr/share/doc/python-vm-builder/AUTHORS for more details.

                                                                                                 Oct 2008                                                                                    VMBUILDER(1)
