orphaner(8)                                                                                                                                                                                orphaner(8)

NAME
       orphaner - frontend for deborphan

SYNOPSIS
       orphaner [--help|--purge] [deborphan options]

DESCRIPTION
       orphaner  is  a  neat  frontend  for deborphan displaying a list of orphaned packages with dialog or whiptail. Packages may be selected for removal with apt-get which is then called to do the
       work. After removal a new list of orphaned packages is gathered from deborphan. The program ends when either `Cancel' is pressed or no package is marked for removal.

       After you removed a package, all new orphaned packages are shown at the top of the list separated by +++++ from the old list.

       Orphaner also shows two additional buttons: `Simulate' and `Help'.  `Simulate' does like its name suggest only a simulation of removing and shows the  result  that  would  appear  after  real
       removing. So you can see the packages, which will become orphaned and you can select them and remove all packages with one apt-get call.

       `Help' shows you the status of the package given by dpkg -s.  Caution: your selection will be lost.

OPTIONS
       --help Print a short help and exit.

       --skip-apt
              Do not call apt-get, but show apt-get command line instead.

       --purge
              Call apt-get remove with the --purge option.

       orphaner  accepts  most,  but  not all, options that deborphan accepts.  These options are passed to deborphan unchanged, and described in deborphan's manpage.  Options which are not accepted
       include switches to manage the keep file, and switches to change the output format.  Note that switches which take an argument need to passed as one argument to  orphaner.   For  instance  to
       only show packages of priority optional and less important, you need to use --priority=optional (i.e. with the = sign, not with a space).

SEE ALSO
       deborphan(1), orphaner(8), apt-get(8)

April 2004                                                                                                                                                                                 orphaner(8)
