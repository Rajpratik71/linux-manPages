BACKPORTPACKAGE(1)                                            General Commands Manual                                           BACKPORTPACKAGE(1)

NAME
       backportpackage - helper to test package backports

SYNOPSIS
       backportpackage [additional options]
              --upload <upload target>
              <source package name or .dsc URL/file>

       backportpackage -h

DESCRIPTION
       backportpackage  fetches  a  package from one distribution release or from a specified .dsc path or URL and creates a no-change backport of
       that package to one or more Ubuntu releases release, optionally doing a test build of the package and/or uploading the  resulting  backport
       for testing.

       Unless  a  working  directory  is specified, the backported package is fetched and built in a temporary directory in /tmp, which is removed
       once the script finishes running.

       backportpackage is only recommended for testing backports in a PPA, not uploading backports to the Ubuntu archive.

OPTIONS
       -d DEST, --destination=DEST
              Backport the package to the specified Ubuntu release. If this option is unspecified, then backportpackage defaults to the release on
              which it is currently running.

       -s SOURCE, --source=SOURCE
              Backport  the package from the specified release, which can be any release of your distribution or any of your distribution's parent
              distributions. If neither this option nor --version are specified, then backportpackage defaults to the current development  release
              for your distribution.

       -S SUFFIX, --suffix=SUFFIX
              Add  the  specified  suffix  to  the version number when backporting. backportpackage will always append ~ubuntuDESTINATION.1 to the
              original version number, and if SUFFIX is specified, it is appended to that, to  get  version  numbers  of  the  form  ORIGINAL_VER‐
              SION~ubuntuDESTINATION.1SUFFIX.  If  the backported package is being uploaded to a PPA, then SUFFIX defaults to ~ppa1, otherwise the
              default is blank.

       -b, --build
              Build the package with the specified builder before uploading. Note for cowbuilder(8) and pbuilder(8) users: This assumes the common
              configuration, where the ARCH and DIST environment is read by pbuilderrc(5) to select the correct base image.

       -B BUILDER, --builder=BUILDER
              Use  the specified builder to build the package. Supported are cowbuilder(8), cowbuilder-dist(1), pbuilder(8), pbuilder-dist(1), and
              sbuild(1).  The default is pbuilder(8).

       -U, --update
              Update the build environment before attempting to build.

       -u UPLOAD, --upload=UPLOAD
              Upload to UPLOAD with dput(1) (after confirmation).

       -k KEYID, --key=KEYID
              Specify the key ID to be used for signing.

       --dont-sign
              Do not sign the upload.

       -y, --yes
              Do not prompt before uploading to a PPA. For everyone's safety, this option is ignored if UPLOAD is ubuntu.

       -v VERSION, --version=VERSION
              If the --source option is specified, then backportpackage verifies that the current version of source package in SOURCE is the  same
              as VERSION. Otherwise, backportpackage finds version VERSION of source package in your distribution's publishing history, regardless
              of the release in which it was published (or if that version is still current). This option is ignored if a  .dsc  URL  or  path  is
              passed in instead of a source package name.

       -w WORKDIR, --workdir=WORKDIR
              If  WORKDIR  is  specified,  then all files are downloaded, unpacked, built into, and otherwise manipulated in WORKDIR. Otherwise, a
              temporary directory is created, which is deleted before backportpackage exits.

       -r, --release-pocket
              Target the upload at the release pocket, rather than the -backports pocket.  This is required for Launchpad PPAs, which are  pocket-
              less (and the default, when the upload target is a PPA).

       -m MIRROR, --mirror=MIRROR
              Use the specified mirror.  Should be in the form http://archive.ubuntu.com/ubuntu.  If the package isn't found on this mirror, back‐
              portpackage will use Launchpad.

       -c BUG, --close=BUG
              Include a Launchpad closer for the specified bug in the auto-generated changelog. In the future, this may actually  close  the  bug,
              but currently does not.

       -l INSTANCE, --lpinstance=INSTANCE
              Use the specified instance of Launchpad (e.g. "staging"), instead of the default of "production".

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

ENVIRONMENT
       DEBFULLNAME, DEBEMAIL, UBUMAIL
              Used to determine the uploader (if not supplied as options).  See ubuntu-dev-tools(5) for details.

       All  of  the  CONFIGURATION  VARIABLES  below are also supported as environment variables.  Variables in the environment take precedence to
       those in configuration files.

CONFIGURATION VARIABLES
       The following variables can be set in the environment or in ubuntu-dev-tools(5) configuration files.  In  each  case,  the  script-specific
       variable takes precedence over the package-wide variable.

       BACKPORTPACKAGE_BUILDER, UBUNTUTOOLS_BUILDER
              The default value for --builder.

       BACKPORTPACKAGE_UPDATE_BUILDER, UBUNTUTOOLS_UPDATE_BUILDER
              The default value for --update.

       BACKPORTPACKAGE_UPLOAD
              The default value for --upload.

       BACKPORTPACKAGE_WORKDIR, UBUNTUTOOLS_WORKDIR
              The default value for --workdir.

       BACKPORTPACKAGE_UBUNTU_MIRROR, UBUNTUTOOLS_UBUNTU_MIRROR
              The default value for --mirror if the specified SOURCE release is an Ubuntu release.

       BACKPORTPACKAGE_DEBIAN_MIRROR, UBUNTUTOOLS_DEBIAN_MIRROR
              The default value for --mirror if the specified SOURCE release is a Debian release.

       BACKPORTPACKAGE_LPINSTANCE, UBUNTUTOOLS_LPINSTANCE
              The default value for --lpinstance.

EXAMPLES
       Test-build  in  your  PPA a backport of znc from the current development release to your workstation's release, deleting the build products
       afterwards:

              backportpackage -u ppa:user/ppa znc

       Backport squashfs-tools from Maverick to both Karmic and Lucid and test-build both locally, leaving all build products in the current work‐
       ing directory:

              backportpackage -b -s maverick -d karmic -d lucid -w . \
                 squashfs-tools

       Fetch a package from a PPA, backport it to Hardy, then upload it back to the same PPA:

              backportpackage -d hardy -u ppa:user/ppa \
                 https://launchpad.net/some/file.dsc

SEE ALSO
       ubuntu-dev-tools(5)

AUTHOR
       backportpackage and this manpage were written by Evan Broder <evan@ebroder.net>

       Both are released under GNU General Public License, version 2.

ubuntu-dev-tools                                                   December 2010                                                BACKPORTPACKAGE(1)
