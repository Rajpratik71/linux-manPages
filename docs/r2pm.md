R2PM(1)                                                     BSD General Commands Manual                                                    R2PM(1)

NAME
     R2PM — radare2 package manager

SYNOPSIS
     r2pm [init|update|cmd] [...]

DESCRIPTION
     Allows to install, update, uninstall and discover plugins and tools that can be used with radare2.

     -a, repo    Adds an external r2pm repository, no arguments to -a will list all the registered repos, use '-a - repo' to unregister/remove
                 those repos.

     -i, info    Show information about repository and installed packages

     -i, install pkgname
                 Install a package

     -gi, global-install pkgname
                 Install a package in the system directory

     -t, test [OK|FX|BR|XX] [build-id]
                 Show last build + testsuite run from travis, greps for errors

     -u, uninstall pkgname
                 Uninstall a package

     -gu, global-install pkgname
                 Uninstall a package from the system directory

     -l, list    List installed packages

     -s, search keyword
                 Search in database for packages matching keyword

     -r, run command ...args
                 Run command with R2PM_BINDIR in PATH

     -v, version
                 Show version information

     -h, help    Show usage help message

     -c, clean   Clean the source cache

     -w, when    Show when a package was installed or exit 1 if pkg does not exist

EXAMPLES
     Initialize and update the package database

       $ r2pm init
       $ r2pm update

     Install a package

       $ r2pm install yara3

     Uninstall a package

       $ r2pm uninstall yara3

     Search a package

       $ r2pm search yara

     List available packages

       $ r2pm -s

SEE ALSO
     radare2(1)

                                                                    Jun 7, 2016
