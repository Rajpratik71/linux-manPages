PYVERSIONS()                                                                                                                                                                                 PYVERSIONS()

NAME
       pyversions - print python version information

SYNOPSIS
       pyversions [-h] [-v] [<options>]

DESCRIPTION
       pyversions prints information about installed, supported python runtimes, the default runtime, and parses the information of the PythonVersion fields in the package control file.

OPTIONS
       -d, --default
              Show the default python version.

       -s, --supported
              Show the supported python versions.

       -r, --requested [<version string>|<control file>]
              Reads  the  value of the XS-Python-Version field in the source section of a control file and shows all matching python versions. The parameter is interpreted as a version string, if it is
              not the name of a file. If the XS-Python-Version field is missing, get the version information from debian/pyversions.  Without any parameter, it will fall  back  to  list  the  supported
              Python versions after checking debian/control and debian/pyversions.

       -i, --installed
              Show the installed supported python versions.

       -v, --version
              Limit the output to the version numbers of the python versions.

       -h, --help
              Print a help text.

SEE ALSO
       Python policy.

AUTHOR
       Matthias Klose

                                                                                                                                                                                             PYVERSIONS()
