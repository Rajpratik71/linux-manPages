ghc-pkg(1)                             General Commands Manual                             ghc-pkg(1)

NAME
       ghc-pkg - GHC Haskell Cabal package manager

SYNOPSIS
       ghc-pkg action [OPTION]...

DESCRIPTION
       A  package  is  a  library  of Haskell modules known to the compiler.  The ghc-pkg tool allows
       adding or removing them from a package database. By default, the system-wide package  database
       is modified, but alternatively the user's local package database or another specified file can
       be used.

       To make a package available for ghc, ghc-pkg can be used to  register  it.   Unregistering  it
       removes it from the database.  Also, packages can be hidden, to make ghc ignore the package by
       default, without uninstalling it.  Exposing a package makes a hidden package available.  Addi‐
       tionally, ghc-pkg has various commands to query the package database.

       Where  a package name is required, the package can be named in full including the version num‐
       ber (e.g.  network-1.0), or without the version number. Naming a package without  the  version
       number  matches  all  versions of the package; the specified action will be applied to all the
       matching packages. A package specifier that matches all version of the  package  can  also  be
       written pkg-*, to make it clearer that multiple packages are being matched.

ACTIONS
       register filename|-
              Register the package using the specified installed package description.

       update filename|-
              Register the package, overwriting any other package with the same name.

       unregister pkg-id
              Unregister the specified package.

       expose pkg-id
              Expose the specified package.

       hide pkg-id
              Hide the specified package

       list [pkg]...
              List  registered  packages in the global database, and also the user database if --user
              is given. If a package name is given all the registered  versions  will  be  listed  in
              ascending order.  Accepts the --simple-output flag.

       dot    Generate  a  graph  of  the  package  dependencies in a form suitable for input for the
              graphviz tools.  For example, to generate a PDF of the dependency graph:
                  dot  tred  dot -Tpdf >pkgs.pdf

       find-module module
              List registered packages exposing module module in the global database,  and  also  the
              user database if --user is given. All the registered versions will be listed in ascend‐
              ing order.  Accepts the --simple-output flag.

       latest pkg-id
              Prints the highest registered version of a package.

       check  Check the consistency of package dependencies and list broken  packages.   Accepts  the
              --simple-output flag.

       describe pkg
              Give  the registered description for the specified package. The description is returned
              in precisely the syntax required by ghc-pkg register.

       field pkg field
              Extract the specified field of the  package  description  for  the  specified  package.
              Accepts comma-separated multiple fields.

       dump   Dump  the  registered description for every package. This is like ghc-pkg describe '*',
              expect that it is intended to be used by tools that  parse  the  results,  rather  than
              humans.

       recache
              Regenerate  the  package  database cache.  This command should only be necessary if you
              added a package to the  database  by  dropping  a  file  into  the  database  directory
              manyally.   By default, the global DB is recached; to recache a different DB use --user
              or --package-conf as appropriate.

OPTIONS
       When asked to modify a database  (register, unregister, update, hide, expose, and also check),
       ghc-pkg  modifies  the  global database by default.  Specifying --user causes it to act on the
       user database, or --package-conf can be used to act on another database entirely. When  multi‐
       ple of these options are given, the rightmost one is used as the database to act upon.

       Commands  that  query the package database (list, latest, describe, field) operate on the list
       of databases specified by the flags --user, --global, and --package-conf.  If  none  of  these
       flags are given, the default is --global --user.

       --user Use the current user's package database.

       --global
              Use the global package database.

       -f FILE, --package-conf=FILE
              Use the specified package config file.

       --global-conf=FILE
              Location of the global package config.

       --force
              Ignore missing dependencies, directories, and libraries.

       --force-files
              Ignore missing directories and libraries only.

       -g, --auto-ghc-libs
              Automatically build libs for GHCi (with register).

       -?, --help
              Display a help message and exit.

       -V, --version
              Output version information and exit.

       --simple-output
              Print output in easy-to-parse format for some commands.

       --names-only
              Only print package names, not versions; can only be used with list --simple-output.

       --ignore-case
              Ignore case for substring matching.

ENVIRONMENT VARIABLES
       GHC_PACKAGE_PATH
              The  GHC_PACKAGE_PATH  environment  variable  may be set to a :-separated list of files
              containing package databases. This list of package databases is used by  ghc  and  ghc-
              pkg, with earlier databases in the list overriding later ones. This order was chosen to
              match the behaviour of the PATH environment variable; think of it as a list of  package
              databases that are searched left-to-right for packages.

              If GHC_PACKAGE_PATH ends in a separator, then the default user and system package data‐
              bases are appended, in that order. e.g. to augment the usual set  of  packages  with  a
              database of your own, you could say:

                   export GHC_PACKAGE_PATH=$HOME/.my-ghc-packages.conf:

              To  check  whether your GHC_PACKAGE_PATH setting is doing the right thing, ghc-pkg list
              will list all the databases in use, in the reverse order they are searched.

FILES
       Both of these locations are changed for Debian.  Upstream still keeps these under /usr.   Some
       programs may refer to that, but look in /var instead.

       /var/lib/ghc/package.conf
              Global package.conf file.

       /var/lib/ghc/package.conf.d/
              Directory  for library specific package.conf files.  These are added to the global reg‐
              istry.

SEE ALSO
       ghc(1), runghc(1), hugs(1).

AUTHOR
       This manual page was written by Kari Pahula <kaol@debian.org>, for the Debian project (and may
       be used by others).

                                              2010-01-27                                   ghc-pkg(1)
