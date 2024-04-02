virt-tar(1)                                                                               Virtualization Support                                                                              virt-tar(1)

NAME
       virt-tar - Extract or upload files to a virtual machine

SYNOPSIS
        virt-tar [--options] -x domname directory tarball

        virt-tar [--options] -u domname tarball directory

        virt-tar [--options] disk.img [disk.img ...] -x directory tarball

        virt-tar [--options] disk.img [disk.img ...] -u tarball directory

OBSOLETE
       This tool is obsolete.  Use virt-copy-in(1), virt-copy-out(1), virt-tar-in(1), virt-tar-out(1) as replacements.

EXAMPLES
       Download "/home" from the VM into a local tarball:

        virt-tar -x domname /home home.tar

        virt-tar -zx domname /home home.tar.gz

       Upload a local tarball and unpack it inside "/tmp" in the VM:

        virt-tar -u domname uploadstuff.tar /tmp

        virt-tar -zu domname uploadstuff.tar.gz /tmp

WARNING
       You must not use "virt-tar" with the -u option (upload) on live virtual machines.  If you do this, you risk disk corruption in the VM.  "virt-tar" tries to stop you from doing this, but doesn't
       catch all cases.

       You can use -x (extract) on live virtual machines, but you might get inconsistent results or errors if there is filesystem activity inside the VM.  If the live VM is synched and quiescent, then
       "virt-tar" will usually work, but the only way to guarantee consistent results is if the virtual machine is shut down.

DESCRIPTION
       "virt-tar" is a general purpose archive tool for downloading and uploading parts of a guest filesystem.  There are many possibilities: making backups, uploading data files, snooping on guest
       activity, fixing or customizing guests, etc.

       If you want to just view a single file, use virt-cat(1).  If you just want to edit a single file, use virt-edit(1).  For more complex cases you should look at the guestfish(1) tool.

       There are two modes of operation: -x (eXtract) downloads a directory and its contents (recursively) from the virtual machine into a local tarball.  -u uploads from a local tarball, unpacking it
       into a directory inside the virtual machine.  You cannot use these two options together.

       In addition, you may need to use the -z (gZip) option to enable compression.  When uploading, you have to specify -z if the upload file is compressed because virt-tar won't detect this on its
       own.

       "virt-tar" can only handle tar (optionally gzipped) format tarballs.  For example it cannot do PKZip files or bzip2 compression.  If you want that then you'll have to rebuild the tarballs
       yourself.  (This is a limitation of the libguestfs(3) API).

OPTIONS
       --help
           Display brief help.

       --version
           Display version number and exit.

       -c URI
       --connect URI
           If using libvirt, connect to the given URI.  If omitted, then we connect to the default libvirt hypervisor.

           If you specify guest block devices directly, then libvirt is not used at all.

       --format raw
           Specify the format of disk images given on the command line.  If this is omitted then the format is autodetected from the content of the disk image.

           If disk images are requested from libvirt, then this program asks libvirt for this information.  In this case, the value of the format parameter is ignored.

           If working with untrusted raw-format guest disk images, you should ensure the format is always specified.

       -x
       --extract
       --download
       -u
       --upload
           Use -x to extract (download) a directory from a virtual machine to a local tarball.

           Use -u to upload and unpack from a local tarball into a virtual machine.  Please read the "WARNING" section above before using this option.

           You must specify exactly one of these options.

       -z
       --gzip
           Specify that the input or output tarball is gzip-compressed.

SEE ALSO
       guestfs(3), guestfish(1), virt-cat(1), virt-edit(1), virt-copy-in(1), virt-copy-out(1), virt-tar-in(1), virt-tar-out(1), Sys::Guestfs(3), Sys::Virt(3), http://libguestfs.org/.

AUTHOR
       Richard W.M. Jones http://people.redhat.com/~rjones/

COPYRIGHT
       Copyright (C) 2009 Red Hat Inc.

LICENSE
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the
       License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
       General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
       02110-1301 USA.

BUGS
       To get a list of bugs against libguestfs, use this link: https://bugzilla.redhat.com/buglist.cgi?component=libguestfs&product=Virtualization+Tools

       To report a new bug against libguestfs, use this link: https://bugzilla.redhat.com/enter_bug.cgi?component=libguestfs&product=Virtualization+Tools

       When reporting a bug, please supply:

       ·   The version of libguestfs.

       ·   Where you got libguestfs (eg. which Linux distro, compiled from source, etc)

       ·   Describe the bug accurately and give a way to reproduce it.

       ·   Run libguestfs-test-tool(1) and paste the complete, unedited output into the bug report.

libguestfs-1.32.2                                                                               2016-01-29                                                                                    virt-tar(1)
