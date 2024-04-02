REQUESTSYNC(1)                                                General Commands Manual                                               REQUESTSYNC(1)

NAME
       requestsync - helper to file sync requests for Ubuntu

SYNOPSIS
       requestsync [-d distro] [-nse] [-k keyid] <source package> [target release] [base version]
       requestsync --lp [-nse] <source package> <target release> [base version]
       requestsync -h

DESCRIPTION
       requestsync  looks  at  the  versions of <source package> in Debian and Ubuntu and prompts for an explanation of why the Ubuntu changes (if
       there are any) should be dropped.  The changelog entry is then downloaded from packages.debian.org, and the sync request bug  is  filed  in
       launchpad.  Alternatively, the sync request can be filed by GPG-signed email (option --email).

       requestsync  checks if you have the permissions to request the sync from the archive administrators directly by checking if you have upload
       permissions for that package through package set permissions or component permissions. If you don't have  upload  permissions,  the  script
       will subscribe the necessary team with approval rights to the bug report for you.

       This  check  is  only performed if requestsync is allowed to use the LP API (not email submission). In the other case requestsync relies on
       that you answer the question about upload permissions honestly to determine if a team with approval rights is to be subscribed to the bug.

       If you have permission to upload the package directly, then you may prefer to use syncpackage instead to copy the package using the Launch‐
       pad API. At some future point, requestsync will be changed to do this automatically.

       requestsync uses launchpadlib authentication to file its requests.

OPTIONS
       Listed below are the command line options for requestsync:

       -h     Display a help message and exit.

       -d     Specifies which Debian distribution a package should be synced from.  Default is unstable.

       -n     Specifies that the package is a new package, and requestsync should not attempt to look it up in Ubuntu since it will not exist.

       -k <keyid>
              Specifies your GPG key.  This is only used if the sync request is mailed to Launchpad.

       --email
              Use GPG-signed email to file the bug, rather than launchpadlib.

       -s     Specifies  that you require sponsorship.  You need this option if you don't have upload permissions for that package.  This disables
              the upload permissions check described above.

       -C     Allow changelog to be manually filled in when missing.  requestsync gets Debian changelogs from packages.debian.org, which isn't  in
              sync  with  the  Debian  archive.   To request a sync before the changelog is available, pass this option, and provide the changelog
              entries yourself.

       -e     Use this flag after FeatureFreeze for non-bug fix syncs. requestsync will subscribe ubuntu-release team instead of sponsorship team.

       -l INSTANCE, --lpinstance=INSTANCE
              Use the specified instance of Launchpad (e.g. "staging"), instead of the default of "production".

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

       <source package>
              This is the source package that you would like to be synced from Debian.

       <target release>
              This is the release that you would like the source package to be synced into.  This should always be the latest development  release
              of Ubuntu.

       [base version]
              In  some cases, the base version (where the Ubuntu package started differing from the Debian package) cannot be automatically deter‐
              mined.  Specify this option in this case.

ENVIRONMENT
       requestsync uses the following variables which should be set in your shell's configuration by adding export VARIABLE= lines, where VARIABLE
       is one of the following:

       UBUMAIL, DEBEMAIL
              Specifies which email should be used when sending to Launchpad.

       All  of  the  CONFIGURATION  VARIABLES  below are also supported as environment variables.  Variables in the environment take precedence to
       those in configuration files.

CONFIGURATION VARIABLES
       REQUESTSYNC_SMTP_SERVER
              Set which SMTP server to use when sending mail.  If unspecified this defaults to launchpad's SMTP  servers  (the  eventual  destina‐
              tion).

       REQUESTSYNC_SMTP_PORT
              Sets which port of the SMTP server to use. Default is 25.

       REQUESTSYNC_SMTP_USER and REQUESTSYNC_SMTP_PASS
              Sets the username and password to use when authenticating to the SMTP server.

       REQUESTSYNC_USE_LPAPI
              Setting this to no is equivalent to running with --email.

       REQUESTSYNC_LPINSTANCE, UBUNTUTOOLS_LPINSTANCE
              The default value for --lpinstance.

       REQUESTSYNC_KEYID, UBUNTUTOOLS_KEYID
              The default value for -k.

SEE ALSO
       rmadison(1), syncpackage(1), ubuntu-dev-tools(5)

AUTHOR
       requestsync and this manual page were written by the Ubuntu MOTU Team.

       Both are released under the GNU General Public License, version 2.

ubuntu-dev-tools                                                  19 January 2008                                                   REQUESTSYNC(1)
