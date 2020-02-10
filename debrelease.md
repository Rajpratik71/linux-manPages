DEBRELEASE(1)                                                                            General Commands Manual                                                                            DEBRELEASE(1)

NAME
       debrelease - a wrapper around dupload or dput

SYNOPSIS
       debrelease [debrelease options] [dupload/dput options]

DESCRIPTION
       debrelease  is a simple wrapper around dupload or dput.  It is called from within the source code tree of a package, and figures out the current version of a package.  It then looks for the cor‐
       responding .changes file (which lists the files needed to upload in order to release the package) in the parent directory of the source code tree and calls dupload or dput with the .changes file
       as parameter in order to perform the actual uploading.

       Options  may  be  given  to  debrelease;  except  for  the  ones listed below, they are passed on unchanged to dupload or dput.  The devscripts configuration files are also read by debrelease as
       described below.

Directory name checking
       In common with several other scripts in the devscripts package, debrelease will climb the directory tree until it finds a debian/changelog file.  As  a  safeguard  against  stray  files  causing
       potential problems, it will examine the name of the parent directory once it finds the debian/changelog file, and check that the directory name corresponds to the package name.  Precisely how it
       does this is controlled by two configuration file variables DEVSCRIPTS_CHECK_DIRNAME_LEVEL and DEVSCRIPTS_CHECK_DIRNAME_REGEX, and their corresponding command-line options  --check-dirname-level
       and --check-dirname-regex.

       DEVSCRIPTS_CHECK_DIRNAME_LEVEL can take the following values:

       0      Never check the directory name.

       1      Only check the directory name if we have had to change directory in our search for debian/changelog.  This is the default behaviour.

       2      Always check the directory name.

       The  directory  name is checked by testing whether the current directory name (as determined by pwd(1)) matches the regex given by the configuration file option DEVSCRIPTS_CHECK_DIRNAME_REGEX or
       by the command line option --check-dirname-regex regex.  Here regex is a Perl regex (see perlre(3perl)), which will be anchored at the beginning and the end.  If regex contains a  '/',  then  it
       must  match the full directory path.  If not, then it must match the full directory name.  If regex contains the string ´PACKAGE', this will be replaced by the source package name, as determined
       from the changelog.  The default value for the regex is: ´PACKAGE(-.+)?', thus matching directory names such as PACKAGE and PACKAGE-version.

OPTIONS
       --dupload, --dput
              This specifies which uploader program to use; the default is dupload.

       -S     If this option is used, or the default .changes file is not found but a source-only .changes file is present, then this source-only .changes file will be uploaded instead of an  arch-spe‐
              cific one.

       -adebian-architecture, -tGNU-system-type
              See dpkg-architecture(1) for a description of these options.  They affect the search for the .changes file.  They are provided to mimic the behaviour of dpkg-buildpackage when determining
              the name of the .changes file.  If a plain -t is given, it is taken to be the dupload host-specifying option, and therefore signifies the end of the debrelease-specific options.

       --multi
              Multiarch .changes mode: This signifies that debrelease should use the most recent file with the name pattern package_version_*+*.changes as the .changes file, allowing for  the  .changes
              files produced by dpkg-cross.

       --debs-dir directory
              Look for the .changes and .deb files in directory instead of the parent of the source directory.  This should either be an absolute path or relative to the top of the source directory.

       --check-dirname-level N
              See the above section Directory name checking for an explanation of this option.

       --check-dirname-regex regex
              See the above section Directory name checking for an explanation of this option.

       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       --help, -h
              Display a help message and exit successfully.

       --version
              Display version and copyright information and exit successfully.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced in that order to set configuration variables.  Command line options can be used to override configuration file set‐
       tings.  Environment variable settings are ignored for this purpose.  The currently recognised variables are:

       DEBRELEASE_UPLOADER
              The currently recognised values are dupload and dput, and it specifies which uploader program should be used.  It corresponds to the --dupload and --dput command line options.

       DEBRELEASE_DEBS_DIR
              This specifies the directory in which to look for the .changes and .deb files, and is either an absolute path or relative to  the  top  of  the  source  tree.   This  corresponds  to  the
              --debs-dir  command  line option.  This directive could be used, for example, if you always use pbuilder or svn-buildpackage to build your packages.  Note that it also affects debc(1) and
              debi(1).

       DEVSCRIPTS_CHECK_DIRNAME_LEVEL, DEVSCRIPTS_CHECK_DIRNAME_REGEX
              See the above section Directory name checking for an explanation of these variables.  Note that these are package-wide configuration variables, and will therefore  affect  all  devscripts
              scripts which check their value, as described in their respective manpages and in devscripts.conf(5).

SEE ALSO
       dput(1), dupload(1), devscripts.conf(5)

AUTHOR
       Julian Gilbey <jdg@debian.org>, based on the original release script by Christoph Lameter <clameter@debian.org>.

DEBIAN                                                                                       Debian Utilities                                                                               DEBRELEASE(1)
