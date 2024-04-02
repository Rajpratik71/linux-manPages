PBUILDER-DIST-SIMPLE(1)                                       General Commands Manual                                      PBUILDER-DIST-SIMPLE(1)

NAME
       pbuilder-dist-simple - simple multi-release pbuilder wrapper

SYNOPSIS
       pbuilder-<dist> operation [...]

DESCRIPTION
       pbuilder-dist-simple  is  a  wrapper  that makes it easy to use pbuilder with chroots for many different Ubuntu distributions.  If you need
       more features than pbuilder-dist-simple provides, have a look at pbuilder-dist(1).

USAGE
       Create one symlink to pbuilder-dist-simple for each distribution for which you want a build environment, naming them like "pbuilder-lucid",
       "pbuilder-natty", etc.

       Replace operation with the action you want pbuilder-dist-simple to do (create, update, build, clean, login or execute).

EXAMPLES
       pbuilder-natty create
              Creates a pbuilder environment for Ubuntu Natty.

       pbuilder-lucid update
              Updates an existing Ubuntu Lucid environment.

       pbuilder-lucid build ./sample_1.0-0ubuntu1.dsc
              Builds the specified package on an already existing Ubuntu Lucid environment.

FILES
       By default, pbuilder-dist-simple will store all the files it generates in ~/pbuilder/.  This can be changed by modifying the BASE_DIR value
       on the top of the script to any other directory you want.  If the directory doesn't exit, it will be created at runtime.

SEE ALSO
       pbuilder(1), pbuilderrc(5), pbuilder-dist(1)

AUTHORS
       pbuilder-dist was originally written by Jamin W. Collins <jcollins@asgardsrealm.net> and Jordan Mantha <mantha@ubuntu.com>, and  this  man‐
       page by Siegfried-A. Gevatter <rainct@ubuntu.com>.

       Both are released under the GNU General Public License, version 2 or later.

ubuntu-dev-tools                                                 February 25, 2008                                         PBUILDER-DIST-SIMPLE(1)
