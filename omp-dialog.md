omp-dialog(8)                                                 System Manager's Manual                                                omp-dialog(8)

NAME
       omp-dialog - Dialog-based OMP tool for OpenVAS

SYNOPSIS
       omp-dialog OPTIONS

DESCRIPTION
       omp-dialog  is  a  menu-driven client interface for OMP (OpenVAS Management Protocol). It is using the "dialog" tool to build the graphical
       interface in your terminal.

OPTIONS
       -h, --host=HOST
              Connect to OpenVAS Manager on host HOST.

       -p, --port=PORT
              Connect to OpenVAS Manager on port PORT.

       -u, --username=USER
              Use the username USER to access the OpenVAS Manager.

       -w, --password=PASSWORD
              Use the password PASSWORD to access the OpenVAS Manager. If the password is not set as parameter,  it  will  be  requested  interac‐
              tively.

       -c, --configfile=FILE
              oad connection configuration from file FILE. The default file is ~/omp.config.

       -d, --debug
              Write Debug output to ./omp-dialog.log.

       -?, --help
              Show help.

EXAMPLES
       omp-dialog

       Start the dialog interface with a login dialog, because no connection information were prodived and in case the default config file does no
       offer adequate information.

SEE ALSO
       openvasmd(8) omp(8)

MORE INFORMATION ABOUT THE OPENVAS PROJECT
       The canonical places where you will  find  more  information  about  the  OpenVAS  project  are:  http://www.openvas.org/  (Official  site)
       http://wald.intevation.org/projects/openvas/ (Development Platform)

COPYRIGHT
       The omp-dialog command line client is released under the GNU GPL, version 2, or, at your option, any later version.

Manuals                                                                User                                                          omp-dialog(8)
