UBUNTU-BUILD(1)                                               General Commands Manual                                              UBUNTU-BUILD(1)

NAME
       ubuntu-build - command-line interface to Launchpad build operations

SYNOPSIS
       ubuntu-build <srcpackage> <release> <operation>

DESCRIPTION
       ubuntu-build provides a command line interface to the Launchpad build operations.

OPERATIONS
       Listed below are the available operations for ubuntu-build:

       status Outputs the build status of the package on Launchpad on all architectures.

       retry  Requests  that the package has another attempt at rebuilding from source.  This will only work if the package has Failed to build on
              Launchpad.

       rescore
              Requests that the package's build priority be raised in the build queue.  Only members of the  Launchpad  build  administrators  may
              issue this operation, and it may only be performed on packages which Need building.

OPTIONS
       Listed below are the command line options for ubuntu-build:

       -h or --help
              Display a help message and exit.

       Retry and rescore options:

              These options may only be used with the 'retry' and 'rescore' operations.

              -a ARCHITECTURE, --arch=ARCHITECTURE Rebuild or rescore a specific architecture. Valid architectures include: amd64, sparc, powerpc,
              i386, armel, armhf, arm64, ia64, lpia, hppa.

       Batch processing:

              These options and parameter ordering is only available in --batch mode. Usage: ubuntu-build --batch [options] <package>...

              --batch Enable batch mode

              --series=SERIES Selects the Ubuntu series to operate on (default: current development series)

              --retry Retry builds (give-back).

              --rescore=PRIORITY Rescore builds to <priority>.

              --arch2=ARCHITECTURE Affect only 'architecture' (can be used several times). Valid architectures are: amd64, sparc,  powerpc,  i386,
              armel, armhf, arm64, ia64, lpia, hppa.

AUTHORS
       ubuntu-build  was  written  by  Martin  Pitt  <martin.pitt@canonical.com>,  and  this  manual  page  was written by Jonathan Patrick Davies
       <jpds@ubuntu.com>.

       Both are released under the terms of the GNU General Public License, version 3 or (at your option) any later version.

ubuntu-dev-tools                                                     June 2010                                                     UBUNTU-BUILD(1)
