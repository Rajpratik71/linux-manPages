SYNCPACKAGE(1)                                                General Commands Manual                                               SYNCPACKAGE(1)

NAME
       syncpackage - copy source packages from Debian to Ubuntu

SYNOPSIS
       syncpackage [options] <.dsc URL/path or package name>

DESCRIPTION
       syncpackage causes a source package to be copied from Debian to Ubuntu.

       syncpackage  allows you to upload files with the same checksums of the Debian ones, as the common script used by Ubuntu archive administra‐
       tors does, this way you can preserve source files integrity between the two distributions.

       syncpackage will detect source tarballs with mismatching checksums, and can perform fake syncs.

WARNING
       The use of syncpackage --no-lp, which generates a changes file to be directly uploaded to the Ubuntu primary archive or a PPA, is  discour‐
       aged  by the Ubuntu Archive Administrators, as it introduces an unnecessary window for error.  This only exists for backward compatibility,
       for unusual corner cases (such as fakesyncs), and for uploads to archives other than the Ubuntu primary archive.  Omitting this option will
       cause Launchpad to perform the sync request directly, which is the preferred method for uploads to the Ubuntu primary archive.

OPTIONS
       -h, --help
              Show help message and exit

       -d DIST, --distribution=DIST
              Debian distribution to sync from. Default is unstable.

       -r RELEASE, --release=RELEASE
              Specify target Ubuntu release. Default: current development release.

       -V DEBVERSION, --debian-version=DEBVERSION
              Specify the version to sync from.

       -c COMPONENT, --component=COMPONENT
              Specify the component to sync from.

       -b BUG, --bug=BUG
              Mark a Launchpad bug as being fixed by this upload.

       -s USERNAME, --sponsor=USERNAME
              Sponsor the sync for USERNAME (a Launchpad username).

       -v, --verbose
              Display more progress information.

       -F, --fakesync
              Perform  a  fakesync, to work around a tarball mismatch between Debian and Ubuntu.  This option ignores blacklisting, and performs a
              local sync.  It implies --no-lp, and will leave a signed .changes file for you to upload.

       -f, --force
              Force sync over the top of Ubuntu changes.

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

       -l INSTANCE, --lpinstance=INSTANCE
              Launchpad instance to connect to (default: production).

       --simulate
              Show what would be done, but don't actually do it.

LOCAL SYNC PREPARATION OPTIONS
       Options that only apply when using --no-lp:

       --no-lp
              Construct sync locally, rather than letting Launchpad copy the package directly.  It will leave a signed .changes file  for  you  to
              upload.  See the WARNING above.

       -n UPLOADER_NAME, --uploader-name=UPLOADER_NAME
              Use UPLOADER_NAME as the name of the maintainer for this upload instead of evaluating DEBFULLNAME and UBUMAIL.  This option may only
              be used in --no-lp mode.

       -e UPLOADER_EMAIL, --uploader-email=UPLOADER_EMAIL
              Use UPLOADER_EMAIL as the email address of the maintainer for this upload instead of evaluating DEBEMAIL and UBUMAIL.   This  option
              may only be used in --no-lp mode.

       -k KEYID, --key=KEYID
              Specify the key ID to be used for signing.

       --dont-sign
              Do not sign the upload.

       -d DEBIAN_MIRROR, --debian-mirror=DEBIAN_MIRROR
              Use the specified mirror.  Should be in the form http://ftp.debian.org/debian.  If the package isn't found on this mirror, syncpack‐
              age will fall back to the default mirror.

       -s UBUNTU_MIRROR, --debsec-mirror=UBUNTU_MIRROR
              Use the specified Debian security mirror.  Should be in the form http://archive.ubuntu.com/ubuntu.  If the package  isn't  found  on
              this mirror, syncpackage will fall back to the default mirror.

ENVIRONMENT
       DEBFULLNAME, DEBEMAIL, UBUMAIL
              Used to determine the uploader (if not supplied as options).  See ubuntu-dev-tools(5) for details.

       All  of  the  CONFIGURATION  VARIABLES  below are also supported as environment variables.  Variables in the environment take precedence to
       those in configuration files.

CONFIGURATION VARIABLES
       The following variables can be set in the environment or in ubuntu-dev-tools(5) configuration files.  In  each  case,  the  script-specific
       variable takes precedence over the package-wide variable.

       SYNCPACKAGE_DEBIAN_MIRROR, UBUNTUTOOLS_DEBIAN_MIRROR
              The default value for --debian-mirror.

       SYNCPACKAGE_UBUNTU_MIRROR, UBUNTUTOOLS_DEBSEC_MIRROR
              The default value for --ubuntu-mirror.

       SYNCPACKAGE_KEYID, UBUNTUTOOLS_KEYID
              The default value for --key.

SEE ALSO
       requestsync(1), ubuntu-dev-tools(5)

AUTHOR
       syncpackage was written by Martin Pitt <martin.pitt@canonical.com> and Benjamin Drung <bdrung@ubuntu.com>.

       This manual page was written by Luca Falavigna <dktrkranz@ubuntu.com>

       Both are released under GNU General Public License, version 3.

ubuntu-dev-tools                                                     June 2010                                                      SYNCPACKAGE(1)
