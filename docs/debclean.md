DEBCLEAN(1)                                                   General Commands Manual                                                  DEBCLEAN(1)

NAME
       debclean - clean up a sourcecode tree

SYNOPSIS
       debclean [options]

DESCRIPTION
       debclean  walks through the directory tree starting at the directory tree in which it was invoked, and executes debian/rules clean for each
       Debian source directory encountered.  These directories are recognised by containing a debian/changelog  file  for  a  package  whose  name
       matches that of the directory.  Name matching is described below.

       Also,  if  the  --cleandebs  option is given, then in every directory containing a Debian source tree, all files named *.deb, *.changes and
       *.build are removed.  The .dsc, .diff.gz and the (.orig).tar.gz files are not touched so that the release can be  reconstructed  if  neces‐
       sary,  and  the .upload files are left so that debchange functions correctly.  The --nocleandebs option prevents this extra cleaning behav‐
       iour and the --cleandebs option forces it.  The default is not to clean these files.

       debclean uses debuild(1) to clean the source tree.

Directory name checking
       In common with  several  other  scripts  in  the  devscripts  package,  debclean  will  walk  through  the  directory  tree  searching  for
       debian/changelog  files.   As  a safeguard against stray files causing potential problems, it will examine the name of the parent directory
       once it finds a debian/changelog file, and check that the directory name corresponds to the package name.  Precisely how it  does  this  is
       controlled  by  two configuration file variables DEVSCRIPTS_CHECK_DIRNAME_LEVEL and DEVSCRIPTS_CHECK_DIRNAME_REGEX, and their corresponding
       command-line options --check-dirname-level and --check-dirname-regex.

       DEVSCRIPTS_CHECK_DIRNAME_LEVEL can take the following values:

       0      Never check the directory name.

       1      Only check the directory name if we have had to change directory in our search for debian/changelog.  This is the default behaviour.

       2      Always check the directory name.

       The directory name is checked by testing whether the current directory name (as determined by pwd(1)) matches the regex given by  the  con‐
       figuration  file  option  DEVSCRIPTS_CHECK_DIRNAME_REGEX  or  by the command line option --check-dirname-regex regex.  Here regex is a Perl
       regex (see perlre(3perl)), which will be anchored at the beginning and the end.  If regex contains a '/',  then  it  must  match  the  full
       directory  path.  If not, then it must match the full directory name.  If regex contains the string ´PACKAGE', this will be replaced by the
       source package name, as determined from the changelog.  The default value for the regex is: ´PACKAGE(-.+)?', thus matching directory  names
       such as PACKAGE and PACKAGE-version.

OPTIONS
       --cleandebs
              Also remove all .deb, .changes and .build files from the parent directory.

       --nocleandebs
              Do not remove the .deb, .changes and .build files from the parent directory; this is the default behaviour.

       --check-dirname-level N
              See the above section Directory name checking for an explanation of this option.

       --check-dirname-regex regex
              See the above section Directory name checking for an explanation of this option.

       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       -d     Do not run dpkg-checkbuilddeps to check build dependencies.

       --help Display a help message and exit successfully.

       --version
              Display version and copyright information and exit successfully.

CONFIGURATION VARIABLES
       The  two configuration files /etc/devscripts.conf and ~/.devscripts are sourced in that order to set configuration variables.  Command line
       options can be used to override configuration file settings.  Environment variable settings are ignored for this  purpose.   The  currently
       recognised variables are:

       DEBCLEAN_CLEANDEBS
              If this is set to yes, then it is the same as the --cleandebs command line parameter being used.

       DEVSCRIPTS_CHECK_DIRNAME_LEVEL, DEVSCRIPTS_CHECK_DIRNAME_REGEX
              See the above section Directory name checking for an explanation of these variables.  Note that these are package-wide configuration
              variables, and will therefore affect all devscripts scripts which check their value, as described in their respective  manpages  and
              in devscripts.conf(5).

SEE ALSO
       debuild(1), devscripts.conf(5)

AUTHOR
       Christoph Lameter <clameter@debian.org>; modifications by Julian Gilbey <jdg@debian.org>.

DEBIAN                                                           Debian Utilities                                                      DEBCLEAN(1)
