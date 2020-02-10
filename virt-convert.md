VIRT-CONVERT(1)                                                                          Virtual Machine Manager                                                                          VIRT-CONVERT(1)

NAME
       virt-convert - convert ovf/vmx to native libvirt guests

SYNOPSIS
       virt-convert INPUT.vmx|INPUT.ovf|INPUT-DIR|INPUT.zip [OPTIONS]

DESCRIPTION
       virt-convert is a command line tool for converting VMX of OVF virtual machines to native libvirt XML. Disk format conversion can also be done at the same time.

       The simplest invocation is simply: virt-convert INPUT. INPUT might be a .vmx or .ovf file, a directory containing a .vmx or .ovf file (and likely 1 or more disk images), or an appliance archive
       like .zip, .tar.gz, or .ova. virt-convert will try to do the right thing in each case.

       By default, the virt-convert will convert all encountered disk images to 'raw' format, sending the output to a new directory location. So the original disk images are _not_ altered in place.

OPTIONS
       --connect URI
           Connect to a non-default hypervisor. See virt-install(1) for details

CONVERSION OPTIONS
       -i INPUT-FORMAT
       --input-format INPUT-FORMAT
           Input format. This should be auto-detected, but can be forced if necessary. Currently "vmx" and "ovf" are supported.

       -D OUTPUT-FORMAT
       --disk-format OUTPUT-FORMAT
           Output disk format. The default is 'raw', so any encountered disk images will be converted to 'raw' format using qemu-img(1). Pass "none" if no conversion should be performed: in this case
           the images will just be copied to the specified --destination.

       --destination DIRECTORY
           The directory to send converted/copied disk images. If not specified, the hypervisor default is used, typically /var/lib/libvirt/images.

MISCELLANEOUS OPTIONS
       --noautoconsole
           Don't automatically try to connect to the guest console. The default behaviour is to launch virt-viewer(1) to display the graphical console, or to run the "virsh" "console" command to
           display the text console. Use of this parameter will disable this behaviour.

       --print-xml
           Print the generated libvirt XML, but do not perform any disk conversions or install/start the guest. This option implies --dry-run.

       --dry-run
           Proceed through the conversion process, but don't convert disks or actually write any converted files.

       -h
       --help
           Show the help message and exit

       --version
           Show program's version number and exit

       -q
       --quiet
           Avoid verbose output.

       -d
       --debug
           Print debugging information

EXAMPLES
       Run a fedora18 OVA archive:

         # virt-convert fedora18.ova

       Run an extracted zip archive containing a centos6 .vmx and .vmdk file, converting the images to qcow2 format

         # virt-convert centos6/ --disk-format qcow2

       Convert the specified .vmx file. Any references disk images must be in the same directory. Don't change the disk format. Move the disk images to /tmp

         # virt-convert foo.vmx --disk-format none --destination /tmp

BUGS
       Please see http://virt-manager.org/page/BugReporting

COPYRIGHT
       Copyright (C) Red Hat, Inc, and various contributors.  This is free software. You may redistribute copies of it under the terms of the GNU General Public License
       "http://www.gnu.org/licenses/gpl.html".  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       virt-install(1), the project website "http://virt-manager.org"

1.3.2                                                                                           2017-08-31                                                                                VIRT-CONVERT(1)
