dpkg-repack(1)                                                      dpkg suite                                                      dpkg-repack(1)

NAME
       dpkg-repack - put an unpacked .deb file back together

SYNOPSIS
       dpkg-repack [option...] package-name...

DESCRIPTION
       dpkg-repack creates a .deb file out of a Debian package that has already been installed on your system.

       If any changes have been made to the package while it was unpacked (ie, conffiles files in /etc modified), the new package will inherit the
       changes. (There are exceptions to this, including changes to configuration files that are not conffiles, including those managed by ucf.)

       This utility can make it easy to copy packages from one computer to another, or to recreate packages that are installed on your system, but
       no longer available elsewhere.

       Note: dpkg-repack will place the created package in the current directory.

OPTIONS
       --root=dir
              Take  package from filesystem rooted on dir. This is useful if, for example, you have another computer nfs mounted on /mnt, then you
              can use --root=/mnt to reassemble packages from that computer.

       --arch=architecture
              Make the package be for a specific architecture.  dpkg-repack might not be able to tell if an installed package is architecture  all
              or  is specific to the system's architecture, in case it lacks the Architecture field. If you know the package architecture, you can
              use this option to force dpkg-repack to use the right architecture.

       -d, --deb-option=option
              Pass option as build argument to dpkg-deb.  This option can be specified multiple times.

       --generate
              Generate a temporary directory suitable for building a package from, but do not actually create the package. This is useful  if  you
              want  to  move  files  around  in  the package before building it. The package can be built from this temporary directory by running
              "dpkg-deb --build dir ." as root (or by using fakroot -u), where dir is the generated directory.

       package-name
              The name of the package to attempt to repack. Multiple packages can be listed.

BUGS
       There is a tricky situation that can occur if you dpkg-repack a package that has modified conffiles. The modified conffiles are packed  up.
       Now if you install the package, dpkg(1) does not realize that the conffiles in it are modified. So if you later upgrade to a new version of
       the package, dpkg(1) will believe that the old (repacked) package has older conffiles than the new version, and will silently  replace  the
       conffiles with those in the package you are upgrading to.

       While  dpkg-repack can be run under fakeroot(1) and will work most of the time, fakeroot -u must be used if any of the files to be repacked
       are owned by non-root users. Otherwise the package will have them owned by root.  dpkg-repack will warn if you  run  it  under  fakeroot(1)
       without the -u flag.

SEE ALSO
       dpkg(1), dpkg-deb(1), fakeroot(1).

AUTHOR
       Joey Hess <joeyh@debian.org>

1.41                                                                2015-04-11                                                      dpkg-repack(1)
