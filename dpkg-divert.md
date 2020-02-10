dpkg-divert(1)                                                                                dpkg utilities                                                                               dpkg-divert(1)

NAME
       dpkg-divert - override a package's version of a file

SYNOPSIS
       dpkg-divert [option...]  command

DESCRIPTION
       dpkg-divert is the utility used to set up and update the list of diversions.

       File  diversions  are  a way of forcing dpkg(1) not to install a file into its location, but to a diverted location. Diversions can be used through the Debian package scripts to move a file away
       when it causes a conflict. System administrators can also use it to override some package's configuration file, or whenever some files (which aren't marked as “conffiles”) need to  be  preserved
       by dpkg, when installing a newer version of a package which contains those files.

COMMANDS
       [--add] file
              Add a diversion for file.

       --remove file
              Remove a diversion for file.

       --list glob-pattern
              List diversions matching glob-pattern.

       --listpackage file
              Print the name of the package that diverts file (since dpkg 1.15.0).  Prints LOCAL if file is locally diverted and nothing if file is not diverted.

       --truename file
              Print the real name for a diverted file.

OPTIONS
       --admindir directory
              Set the dpkg data directory to directory (default: /var/lib/dpkg).

       --divert divert-to
              divert-to is the location where the versions of file, as provided by other packages, will be diverted.

       --local
              Specifies that all packages' versions of this file are diverted.  This means, that there are no exceptions, and whatever package is installed, the file is diverted. This can be used by an
              admin to install a locally modified version.

       --package package
              package is the name of a package whose copy of file will not be diverted. i.e. file will be diverted for all packages except package.

       --quiet
              Quiet mode, i.e. no verbose output.

       --rename
              Actually move the file aside (or back). dpkg-divert will abort operation in case the destination file already exists.

       --test Test mode, i.e. don't actually perform any changes, just demonstrate.

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

ENVIRONMENT
       DPKG_ADMINDIR
              If set and the --admindir option has not been specified, it will be used as the dpkg data directory.

       DPKG_MAINTSCRIPT_PACKAGE
              If set and the --local and --package options have not been specified, dpkg-divert will use it as the package name.

FILES
       /var/lib/dpkg/diversions
              File which contains the current list of diversions of the system. It is located in the dpkg administration directory, along with other files important to dpkg, such as  status  or  avail‐
              able.
              Note: dpkg-divert preserves the old copy of this file, with extension -old, before replacing it with the new one.

NOTES
       When adding, default is --local and --divert original.distrib. When removing, --package or --local and --divert must match if specified.

       Directories can't be diverted with dpkg-divert.

       Care  should  be  taken  when diverting shared libraries, ldconfig(8) creates a symbolic link based on the DT_SONAME field embedded in the library.  Because ldconfig doesn't honour diverts (only
       dpkg does), the symlink may end up pointing at the diverted library, if a diverted library has the same SONAME as the undiverted one.

EXAMPLES
       To divert all copies of a /usr/bin/example to /usr/bin/example.foo, i.e. directs all packages providing /usr/bin/example to install it as /usr/bin/example.foo, performing the rename if required:

       dpkg-divert --divert /usr/bin/example.foo --rename /usr/bin/example

       To remove that diversion:

       dpkg-divert --rename --remove /usr/bin/example

       To divert any package trying to install /usr/bin/example to /usr/bin/example.foo, except your own wibble package:

       dpkg-divert --package wibble --divert /usr/bin/example.foo --rename /usr/bin/example

       To remove that diversion:

       dpkg-divert --package wibble --rename --remove /usr/bin/example

SEE ALSO
       dpkg(1).

Debian Project                                                                                  2011-08-14                                                                                 dpkg-divert(1)
