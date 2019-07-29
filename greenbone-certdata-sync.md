greenbone-certdata-sync(8)                                    System Manager's Manual                                   greenbone-certdata-sync(8)

NAME
       greenbone-certdata-sync - OpenVAS Manager SCAP sync script

SYNOPSIS
       greenbone-certdata-sync OPTIONS

DESCRIPTION
       Update the CERT data from the feed server.

OPTIONS
       --version
              Print version and exit.

       --identify
              Print machine readable identity information and exit.

       --describe
              Print human readable description.

       --feedversion
              Print feed version and exit.

       --help Print help message and exit.

       --refresh
              Only refresh the database. Do not fetch any files.

       --migrate
              Only migrate the database. Do not fetch any files.

       --selftest
              Perform self-test and exit.

       --feedcurrent
              Check whether feed is current.

       --database=DATABASE
              The name of the database. For Posgres backend only. Default is tasks.

SEE ALSO
       openvasmd(8), greenbone-scapdata-sync(8)

MORE INFORMATION ABOUT THE OPENVAS PROJECT
       The  canonical  places  where  you  will  find  more  information  about  the  OpenVAS project are: http://www.openvas.org/ (Official site)
       http://wald.intevation.org/projects/openvas/ (Development Platform)

COPYRIGHT
       The OpenVAS Manager is released under the GNU GPL, version 2, or, at your option, any later version.

Manuals                                                                User                                             greenbone-certdata-sync(8)
