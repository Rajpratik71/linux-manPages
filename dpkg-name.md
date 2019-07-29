dpkg-name(1)                                                        dpkg suite                                                        dpkg-name(1)

NAME
       dpkg-name - rename Debian packages to full package names

SYNOPSIS
       dpkg-name [option...]  [--] file...

DESCRIPTION
       This manual page documents the dpkg-name program which provides an easy way to rename Debian packages into their full package names. A full
       package name consists of package_version_architecture.package-type as specified in the control file of the package. The version part of the
       filename  consists  of the upstream version information optionally followed by a hyphen and the revision information. The package-type part
       comes from that field if present or fallbacks to deb.

OPTIONS
       -a, --no-architecture
              The destination filename will not have the architecture information.

       -k, --symlink
              Create a symlink, instead of moving.

       -o, --overwrite
              Existing files will be overwritten if they have the same name as the destination filename.

       -s, --subdir [dir]
              Files will be moved into a subdirectory. If the directory given as argument exists the files  will  be  moved  into  that  directory
              otherwise  the  name  of  the  target  directory  is extracted from the section field in the control part of the package. The target
              directory will be «unstable/binary-architecture/section».  If the section is not found in the control, then no-section  is  assumed,
              and  in  this case, as well as for sections non-free and contrib the target directory is «section/binary-architecture».  The section
              field is not required so a lot of packages will find their way to the no-section area.  Use this option with care, it's messy.

       -c, --create-dir
              This option can used together with the -s option. If a target directory isn't found it will  be  created  automatically.   Use  this
              option with care.

       -?, --help
              Show the usage message and exit.

       -v, --version
              Show the version and exit.

BUGS
       Some  packages don't follow the name structure package_version_architecture.deb.  Packages renamed by dpkg-name will follow this structure.
       Generally this will have no impact on how packages are installed by dselect(1)/dpkg(1), but other installation tools might depend  on  this
       naming structure.

EXAMPLES
       dpkg-name bar-foo.deb
              The  file  bar-foo.deb  will  be renamed to bar-foo_1.0-2_i386.deb or something similar (depending on whatever information is in the
              control part of bar-foo.deb).

       find /root/debian/ -name '*.deb' | xargs -n 1 dpkg-name -a
              All files with the extension deb in the directory /root/debian and its subdirectory's will be renamed by dpkg-name if required  into
              names with no architecture information.

       find -name '*.deb' | xargs -n 1 dpkg-name -a -o -s -c
              Don't  do  this.  Your archive will be messed up completely because a lot of packages don't come with section information.  Don't do
              this.

       dpkg-deb --build debian-tmp && dpkg-name -o -s .. debian-tmp.deb
              This can be used when building new packages.

SEE ALSO
       deb(5), deb-control(5), dpkg(1), dpkg-deb(1), find(1), xargs(1).

1.18.24                                                             2017-07-04                                                        dpkg-name(1)
