ALIEN(1p)                         User Contributed Perl Documentation                        ALIEN(1p)

NAME
       alien - Convert or install an alien binary package

SYNOPSIS
        alien [--to-deb] [--to-rpm] [--to-tgz] [--to-slp] [options] file [...]

DESCRIPTION
       alien is a program that converts between Red Hat rpm, Debian deb, Stampede slp, Slackware tgz,
       and Solaris pkg file formats. If you want to use a package from another linux distribution than
       the one you have installed on your system, you can use alien to convert it to your preferred
       package format and install it. It also supports LSB packages.

WARNING
       alien should not be used to replace important system packages, like init, libc, or other things
       that are essential for the functioning of your system. Many of these packages are set up
       differently by the different distributions, and packages from the different distributions
       cannot be used interchangeably. In general, if you can't remove a package without breaking your
       system, don't try to replace it with an alien version.

PACKAGE FORMAT NOTES
       rpm For converting to and from rpm format the Red Hat Package Manager must be installed.

       lsb Unlike the other package formats, alien can handle the depenendencies of lsb packages if
           the destination package format supports dependencies. Note that this means that the package
           generated from a lsb package will depend on a package named "lsb" -- your distribution
           should provide a package by that name, if it is lsb compliant. The scripts in the lsb
           package will be converted by default as well.

           To generate lsb packages, the Red Hat Package Manager must be installed, and alien will use
           by preference a program named lsb-rpm, if it exists.  No guarantees are made that the
           generated lsb packages will be fully LSB compliant, and it's rather unlikely they will
           unless you build them in the lsbdev environment.

           Note that unlike other package formats, converting an LSB package to another format will
           not cause its minor version number to be changed.

       deb For converting to (but not from) deb format, the gcc, make, debhelper, dpkg-dev, and dpkg
           packages must be installed.

       tgz Note that when converting from the tgz format, alien will simply generate an output package
           that has the same files in it as are in the tgz file. This only works well if the tgz file
           has precompiled binaries in it in a standard linux directory tree. Do NOT run alien on tar
           files with source code in them, unless you want this source code to be installed in your
           root directory when you install the package!

           When using alien to convert a tgz package, all files in /etc in are assumed to be
           configuration files.

       pkg To manipulate packages in the Solaris pkg format (which is really the SV datastream package
           format), you will need the Solaris pkginfo and pkgtrans tools.

OPTIONS
       alien will convert all the files you pass into it into all the output types you specify. If no
       output type is specified, it defaults to converting to deb format.

       file [...]
           The list of package files to convert.

       -d, --to-deb
           Make debian packages. This is the default.

       -r, --to-rpm
           Make rpm packages.

       -t, --to-tgz
           Make tgz packages.

       --to-slp
           Make slp packages.

       -p, --to-pkg
           Make Solaris pkg packages.

       -i, --install
           Automatically install each generated package, and remove the package file after it has been
           installed.

       -g, --generate
           Generate a temporary directory suitable for building a package from, but do not actually
           create the package. This is useful if you want to move files around in the package before
           building it. The package can be built from this temporary directory by running
           "debian/rules binary", if you were creating a Debian package, or by running "rpmbuild -bb
           <packagename>.spec" if you were creating a Red Hat package.

       -s, --single
           Like -g, but do not generate the packagename.orig directory. This is only useful when you
           are very low on disk space and are generating a debian package.

       -c, --scripts
           Try to convert the scripts that are meant to be run when the package is installed and
           removed. Use this with caution, because these scripts might be designed to work on a system
           unlike your own, and could cause problems. It is recommended that you examine the scripts
           by hand and check to see what they do before using this option.

           This is enabled by default when converting from lsb packages.

       --patch=patch
           Specify the patch to be used instead of automatically looking the patch up in
           /var/lib/alien. This has no effect unless a debian package is being built.

       --anypatch
           Be less strict about which patch file is used, perhaps attempting to use a patch file for
           an older version of the package. This is not guaranteed to always work; older patches may
           not necessarily work with newer packages.

       --nopatch
           Do not use any patch files.

       --description=desc
           Specifiy a description for the package. This only has an effect when converting from the
           tgz package format, which lacks descriptions.

       --version=version
           Specifiy a version for the package. This only has an effect when converting from the tgz
           package format, which may lack version information.

           Note that without an argument, this displays the version of alien instead.

       -T, --test
           Test the generated packages. Currently this is only supported for debian packages, which,
           if lintian is installed, will be tested with lintian and lintian's output displayed.

       -k, --keep-version
           By default, alien adds one to the minor version number of each package it converts. If this
           option is given, alien will not do this.

       --bump=number
           Instead of incrementing the version number of the converted package by 1, increment it by
           the given number.

       --fixperms
           Sanitize all file owners and permissions when building a deb. This may be useful if the
           original package is a mess. On the other hand, it may break some things to mess with their
           permissions and owners to the degree this does, so it defaults to off. This can only be
           used when converting to debian packages.

       --target=architecture
           Force the architecture of the generated package to the given string.

       -v, --verbose
           Be verbose: Display each command alien runs in the process of converting a package.

       --veryverbose
           Be verbose as with --verbose, but also display the output of each command run. Some
           commands may generate a lot of output.

       -h, --help
           Display a short usage summary.

       -V, --version
           Display the version of alien.

EXAMPLES
       Here are some examples of the use of alien:

       alien --to-deb package.rpm
           Convert the package.rpm into a package.deb

       alien --to-rpm package.deb
           Convert the package.deb into a package.rpm

       alien -i package.rpm
           Convert the package.rpm into a package.deb (converting to a .deb package is default, so you
           need not specify --to-deb), and install the generated package.

       alien --to-deb --to-rpm --to-tgz --to-slp foo.deb bar.rpm baz.tgz
           Creates 9 new packages. When it is done, foo bar and baz are available in all 4 package
           formats.

ENVIRONMENT
       alien recognizes the following environment variables:

       RPMBUILDOPT
           Options to pass to rpm when it is building a package.

       RPMINSTALLOPT
           Options to pass to rpm when it is installing a package.

       EMAIL
           If set, alien assumes this is your email address. Email addresses are included in generated
           debian packages.

AUTHOR
       alien was written by Christoph Lameter, <clameter@debian.org>.

       deb to rpm conversion code was taken from the martian program by Randolph Chung,
       <tausq@debian.org>.

       The Solaris pkg code was written by Mark A. Hershberger <mah@everybody.org>.

       alien has been extensively rewritten (3 times) and is now maintained by Joey Hess,
       <joeyh@debian.org>.

COPYRIGHT
       alien may be copied and modified under the terms of the GNU General Public License.

perl v5.20.2                                  2015-10-23                                     ALIEN(1p)
