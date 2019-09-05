sponsor-patch(1)                                              General Commands Manual                                             sponsor-patch(1)

NAME
       sponsor-patch - Prepare, test-build, and sponsor an upload.

SYNOPSIS
       sponsor-patch [options] bug
       sponsor-patch -h

DESCRIPTION
       sponsor-patch  downloads  the patch or Bazaar branch linked to an Ubuntu bug, applies it, generates a review diff, (optionally) test builds
       it, runs lintian(1) and, after review and confirmation, can upload it.

       sponsor-patch can be used for sponsoring patches, syncs and merges from Debian, SRUs, and creating debdiffs from patches.  If bug has  mul‐
       tiple  patches  or  branches linked, it will prompt the user to select one.  The same applies to bug tasks.  If the attached patch is not a
       debdiff, edit-patch(1) is used to apply it.

       Some obvious checks are performed, in particular:

       1.  update-maintainer(1) is run on the source package to ensure that the Maintainer field meets the Ubuntu policy.

       2.  The version number must be greater than the current version in the archive.  The changes file is also correctly generated to  list  all
           changes since the current version in the archive.

       3.  The changelog must automatically close the sponsorship bug.

       4.  The changelog target must be valid.

       5.  The changelog timestamp is touched.

       Should any checks (or the build) fail, the user has an option to edit the patched source and try building it again.

       Unless  a  working  directory is specified, the sources and patches will be downloaded into a temporary directory in /tmp, which is removed
       once the script finishes running.  The output of the build tool will be placed in workdir/buildresult/.

       One of --upload, --workdir, or --sponsor must be specified.

OPTIONS
       -b, --build
              Build the package with the specified builder. Note for pbuilder(8) and cowbuilder(8) users: This assumes the  common  configuration,
              where the ARCH and DIST environment is read by pbuilderrc(5) to select the correct base image.

       -B BUILDER, --builder=BUILDER
              Use  the  specify builder to build the package.  Supported are cowbuilder(8), cowbuilder-dist(1), pbuilder(8), pbuilder-dist(1), and
              sbuild(1).  The default is pbuilder(8).

       -e, --edit
              Launch a sub-shell to allow editing of the patched source before building.

       -h, --help
              Display a help message and exit.

       -k KEY, --key=KEY
              Specify a key ID for signing the upload.

       -l INSTANCE, --lpinstance=INSTANCE
              Use the specified instance of Launchpad (e.g. "staging"), instead of the default of "production".

       --no-conf
              Do not read any configuration files, or configuration from environment variables.

       -s, --sponsor
              Shortcut for sponsored uploads. Equivalent to -b -u ubuntu.

       -u DEST, --upload=DEST
              Upload to DEST with dput(1) (after confirmation).

       -U, --update
              Update the build environment before attempting to build.

       -v, --verbose
              Print more information.

       -w DIR, --workdir=DIR
              Use the specified working directory, creating it if necessary.  If WORKDIR is not specified, a temporary directory is created, which
              is deleted before sponsor-patch exits.

ENVIRONMENT
       All  of  the  CONFIGURATION  VARIABLES  below are also supported as environment variables.  Variables in the environment take precedence to
       those in configuration files.

CONFIGURATION VARIABLES
       The following variables can be set in the environment or in ubuntu-dev-tools(5) configuration files.  In  each  case,  the  script-specific
       variable takes precedence over the package-wide variable.

       SPONSOR_PATCH_BUILDER, UBUNTUTOOLS_BUILDER
              The default value for --builder.

       SPONSOR_PATCH_LPINSTANCE, UBUNTUTOOLS_LPINSTANCE
              The default value for --lpinstance.

       SPONSOR_PATCH_UPDATE_BUILDER, UBUNTUTOOLS_UPDATE_BUILDER
              The default value for --update.

       SPONSOR_PATCH_WORKDIR, UBUNTUTOOLS_WORKDIR
              The default value for --workdir.

       SPONSOR_PATCH_KEYID, UBUNTUTOOLS_KEYID
              The default value for --key.

EXAMPLES
       Test-building and sponsoring an upload of bug 1234:

              sponsor-patch -s 1234

       Performing a test build of bug 1234 in your PPA:

              sponsor-patch -u ppa:user/ppa 1234

SEE ALSO
       bzr(1),  debchange(1),  debdiff(1),  dput(1),  edit-patch(1), lintian(1), cowbuilder(8), cowbuilder-dist(1), pbuilder(8), pbuilder-dist(1),
       sbuild(1), ubuntu-dev-tools(5), update-maintainer(1)

AUTHORS
       sponsor-patch was written by Benjamin Drung <bdrung@ubuntu.com>, and this manual page was written by Stefano Rivera <stefanor@ubuntu.com>.

       Both are released under the terms of the ISC License.

ubuntu-dev-tools                                                 September 21 2010                                                sponsor-patch(1)
