404main(1)                                                    General Commands Manual                                                   404main(1)

NAME
       404main - check if all build dependencies of a package are in main

SYNOPSIS
       404main <package name> [<distribution>]

DESCRIPTION
       404main is a script that can be used to check if a package and all its build dependencies are in Ubuntu's main component or not.

CAVEATS
       404main   will   take   the  dependencies  and  build  dependencies  of  the  packages  from  the  distribution  you  have  first  in  your
       /etc/apt/sources.list file.

       Also, because of this the <distribution> option is NOT trustworthy; if the dependencies changed YOU WILL GET INCORRECT RESULTS.

SEE ALSO
       apt-cache(8)

AUTHORS
       404main was written by Pete Savage <petesavage@ubuntu.com> and this manpage by Siegfried-Angel Gevatter Pujals <rainct@ubuntu.com>.

       Both are released under the GNU General Public License, version 2 or later.

ubuntu-dev-tools                                                 February 17, 2008                                                      404main(1)
