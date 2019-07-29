dpkg-checkbuilddeps(1)                                              dpkg suite                                              dpkg-checkbuilddeps(1)

NAME
       dpkg-checkbuilddeps - check build dependencies and conflicts

SYNOPSIS
       dpkg-checkbuilddeps [option...]  [control-file]

DESCRIPTION
       This  program checks the installed packages in the system against the build dependencies and build conflicts listed in the control file. If
       any are not met, it displays them and exits with a nonzero return code.

       By default, debian/control is read, but an alternate control filename may be specified on the command line.

OPTIONS
       --admindir=dir
              Change the location of the dpkg database (since dpkg 1.14.0).  The default location is /var/lib/dpkg.

       -A     Ignore Build-Depends-Arch and Build-Conflicts-Arch lines (since dpkg 1.16.4).  Use when only arch-indep packages will be  built,  or
              combine with -B when only a source package is to be built.

       -B     Ignore  Build-Depends-Indep  and Build-Conflicts-Indep lines. Use when only arch-dep packages will be built, or combine with -A when
              only a source package is to be built.

       -I     Ignore built-in build depends and conflicts (since dpkg 1.18.2).  These are implicit dependencies that are  usually  required  on  a
              specific distribution, the so called Build-Essential package set.

       -d build-depends-string

       -c build-conflicts-string
              Use the given build dependencies/conflicts instead of those contained in the debian/control file (since dpkg 1.14.17).

       -a arch
              Check  build  dependencies/conflicts  assuming  that  the  package  described  in the control file is to be built for the given host
              architecture instead of the architecture of the current system (since dpkg 1.16.2).

       -P profile[,...]
              Check build dependencies/conflicts assuming that the package described in the control file is  to  be  built  for  the  given  build
              profile(s) (since dpkg 1.17.2).  The argument is a comma-separated list of profile names.

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

ENVIRONMENT
       DEB_BUILD_PROFILES
              If  set,  it will be used as the active build profile(s) for the package being built. It is a space separated list of profile names.
              Overridden by the -P option.

1.18.24                                                             2017-07-04                                              dpkg-checkbuilddeps(1)
