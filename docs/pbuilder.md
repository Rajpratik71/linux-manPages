pbuilder(8)                                                          pbuilder                                                          pbuilder(8)

NAME
       pbuilder - personal package builder

SYNOPSIS
       pbuilder --create [options]

       pbuilder --update [options]

       pbuilder --build [options] .dsc-file

       pbuilder --execute [options] -- script [script options]

       pbuilder --clean

       pbuilder --login [options]

DESCRIPTION
       Front  end  program  to the pbuilder suite of programs, used for creating and maintaining chroot environment and building Debian package in
       the chroot environment.

COMMANDS
       --create
              Creates a base.tgz for the specified distribution.

       --update
              Updates the base.tgz for the specified distribution.  Also, by specifying the --override-config option, it is possible to install  a
              new apt-line using the given options and settings in the configuration file for the base.tgz.

              For  example, to switch the distribution of an existing base.tgz to sid, specify the --distribution sid --override-config options to
              update.

       --build
              Builds the package specified by .dsc-file in the chroot environment created using the base.tgz

       --clean
              Cleans up the directory specified by the configuration BUILDPLACE and APTCACHE specified in /etc/pbuilderrc

       --login
              Logs into the chroot, and cleaned up afterwards.  Any changes you make will not be kept.  Only use this for temporary and  debugging
              purposes.  Do not bind-mount filesystems directly inside the chroot.  Use --bindmounts option to mount.

       --execute
              Execute a script or command inside the chroot, in a similar manner to --login

              The file specified in the command-line argument will be copied into the chroot, and invoked.

              The remaining arguments are passed on to the script.

       --dumpconfig
              Dumps configuration information, used for debugging.

       --debuild
              Builds a Debian package from the Debian source directory.  The current directory should have the usual debian/ directory.

              Same as pdebuild --use-pdebuild-internal

OPTIONS
       The  command  is  followed  by options of the form --option name which will modify the semantics as explained below.  They are applied from
       left-to-right, and when there are conflicting options, the rightmost options will have effect.

       --basetgz [basetgz-location]
              Specifies the location of base.tgz

              This option will define the default distribution and apt-lines when used in pbuilder --update and pbuilder --create

       --buildplace [location of build]
              Specifies the location where building and base.tgz updating and creation takes place. This is a temporary work directory.

              A subdirectory of that directory using the current PID of the process is used.

       --buildresult [location to put build result]
              Specifies the location the build result gets into after building.  The deb files and other files that have resulted  from  build  is
              copied  there.   Note that the default value is not the current directory, or ..  but another place, /var/cache/pbuilder/result This
              is to avoid overwriting already existing deb files with the newly generated ones.

       --mirror [mirror location]
              Specifies the URL of Debian mirror to be specified in sources.list inside the chroot.  This option is only valid  when  distribution
              is  being  specified, for --update and --build targets.  The format is something like: http://http.us.debian.org/debian which should
              point to your favourite mirror.

              This option can optionally be omitted, and left blank, in which case, this part is skipped.

              Note that these URLs specified to pbuilder will be used from within the chroot, and specifying file:/somewhere/ will  most  probably
              fail.

       --othermirror [deb http://xxx/xxx/ ./ | other deb lines... ]
              The  lines  which is added to the sources.list, delimited with | Like deb http://local/mirror stable main|deb file:/usr/local/mirror
              ./

              The deb lines here are the ones that will appear at the top of the sources.list inside the chroot.  Be sure  to  follow  the  syntax
              rules  of  sources.list(5).   These lines appear at the beginning of the constructed sources file, so this is the place to list your
              local mirror sites; apt will then use them in preference to the ones listed in --mirror .

       --distribution [distribution]
              Specifies the distribution used.  The supported values are the ones debootstrap supports, plus experimental which is  special  cased
              in pbuilder.  For instance you may use: sid or experimental .

       --architecture [architecture]
              Specifies  the  architecture to use when creating the chroot, defaults to the system one.  The supported values are the ones deboot‐
              strap supports.

       --components [components]
              Specifies the default distribution components to use. eg. "main contrib non-free".  Default is "main".

       --override-config
              Specify to use different apt set up inside the chroot than it was used for creating the base.tgz.  Specify this when you want to  do
              pbuilder --update with a different distribution target set up.

              --distribution  ,  --components  ,  --mirror  ,  --othermirror  options are only valid when --override-config option is specified in
              --update target, or when pbuilder --create is being called.

       --http-proxy [proxy]
              Specifies the http proxy URL. Something like http://xxx.xxx.xxx.xxx:8080/ should do.

       --aptcache [location of retrieved package files]
              Specifies the location where the packages downloaded by apt should be cached. Use --aptcache "" if you want  caching  to  be  turned
              off.

       --debdelta
              This  option is used in the --update target, and enable the use of debdelta (if it is already installed, otherwise will be installed
              the first time this option is used).

       --configfile [configuration file to load]
              Additional configuration file to read after all other configuration files have been read.

       --hookdir [location of user scripts]
              Specifies the location where scripts for user intervention during the --create and --update process are  stored.  Currently  scripts
              are  executed  at  only  one  point,  on  exit from the chrooted environment, just before either a create or a build regenerated the
              base.tgz file. The script names must be in the form X<digit><digit><whatever-else-you-want> much like boot scripts. The scripts must
              be  executable  and may be either binaries or interpreted scripts. If it is a script in other than Bourne Shell or Perl, it is up to
              the user to ensure the interpreter was previously installed in the chrooted environment. Files ending in ~ or .bak are ignored.

              Although it may not seem necessary, pbuilder --update does not invoke the hooks if --hookdir is empty, so if you want to avoid  run‐
              ning hooks, run pbuilder with --hookdir ""

              If  there  is  a  distribution hook, for example, if there was a file sid inside the hook directory, and the script was creating the
              chroot for sid distribution, pbuilder will call debootstrap with that as the 4th parameter in the  chroot  creation  process.   This
              allows for use of custom debootstrap hook script.

              A<digit><digit><whatever-else-you-want>  is  for --build target.  It is executed before build starts; after unpacking the build sys‐
              tem, and unpacking the source, and satisfying the build-dependency.

              B<digit><digit><whatever-else-you-want> is executed after build system finishes building,  successfully,  before  copying  back  the
              build result.

              C<digit><digit><whatever-else-you-want> is executed after build failure, before cleanup.

              D<digit><digit><whatever-else-you-want> is executed before unpacking the source inside the chroot, after setting up the chroot envi‐
              ronment.  Create $TMP, and $TMPDIR if necessary.

              This is called before build-dependency is satisfied.  Also useful for calling apt-get update

              E<digit><digit><whatever-else-you-want> is executed after pbuilder --update
               and pbuilder --create finishes apt-get work with the chroot, before umounting kernel file systems (/proc) and creating the  tarball
              from the chroot.

              F<digit><digit><whatever-else-you-want>  is  executed just before user logs in, or program starts executing, after chroot is created
              in --login or --execute target.

              G<digit><digit><whatever-else-you-want> is executed just after debootstrap finishes,  and  configuration  is  loaded,  and  pbuilder
              starts mounting /proc and invoking apt-get install in --create target.

              H<digit><digit><whatever-else-you-want>  is  executed just after unpacking the chroot, mounting proc and any bind mount specified in
              BINDMOUNTS.  It's executed for every target that requires the unpacked chroot.  It's useful if you want to  dynamically  change  the
              chroot guts before anything starts using it.

              I<digit><digit><whatever-else-you-want> is executed after build system finishes building, successfully, after copying back the build
              results.

       --debbuildopts [options]

              List of options that are passed on to dpkg-buildpackage.  Multiple flags are additive and appended ot the any value  given  in  DEB‐
              BUILDOPTS as specified in pbuilderrc.  To clear the list of options, pass the empty string, e.g.  --debbuildopts "".

              Multiple options are delimited with spaces, like --debbuildopts "-j100 -E"

       --logfile [file to log]
              Specifies  the  logfile  to create.  The messages generated during execution will be written to the specified file, and the standard
              output.

       --loglevel I
              Specify how much output you want from pbuilder, valid values are E (errors only), W (errors and warnings), I (errors,  warnings  and
              informational) and D (everything including some debug messages).

       --binary-arch

              Specify  to  build  architecture specific targets instead of all targets.  Setting --debbuildopts after this option will re-set some
              parts of the effect.

              Use this option rather than using --debbuildopts -B

       --bin-nmu [changelog message]
              Specify to build a binary-NMU instead of a standard package.  This option takes the changelog message  to  pass  to  the  binary-NMU
              package as parameter.

       --bin-nmu-maintainer [maintainer]
              Specify the maintainer name and email address to be displayed in the changes file.  If no maintainer is provided, it defaults to the
              last uploader.

       --bin-nmu-version [version number]
              Specify the number to append to the version in the binary-NMU package.  If no number is provided, it defaults to 1.

       --bindmounts bind-mount-points
              Bind-mount the specified directories to inside the chroot.  bind-mount-points is a space-delimited list of directories to bind-mount
              which should be specified in a space-delimited manner, surrounded in double quotations, like: "/srv /somedir /someotherdir"

       --debootstrapopts --variant=buildd --keyring /usr/share/keyrings/debian-archive-keyring.gpg
              Add extra command-line options to debootstrap.

              Specify multiple options through multiple instance of this option, for example:

              --debootstrapopts --arch=arm --debootstrapopts --variant=buildd

       --debootstrap debootstrap
              Use  specified  debootstrap implementation as debootstrap.  Known implementations are cdebootstrap and debootstrap and default is to
              use debootstrap.

       --allow-untrusted
              Allow untrusted (no key installed) and unsigned repositories.  Warning: Enabling this option may allow remote attackers  to  compro‐
              mise the system.  Better use signed repositories and --keyring to add the key(s).

       --keyring path/to/keyring
              Additional  keyrings  to  use  for package verification with apt, not used for debootstrap (use --debootstrapopts ). Use this to add
              (local) signed repositories. By default the debian-archive-keyring package inside the chroot is  used.  Can  be  specified  multiple
              times.

       --save-after-login

       --save-after-exec
              Save the chroot image after exiting from the chroot instead of deleting changes.  Effective for login and execute session.

       --autocleanaptcache
              Clean  apt  cache  automatically,  to  run apt-get autoclean to only keep the packages which are required for the version of Debian.
              This is useful when you keep a aptcache directory for each distribution and want to keep the size of the aptcache down.

       --help

              Show a brief help message.

MORE SPECIFIC OPTIONS
       Some options are more involved to pbuilder internal than others. The following options are available.

       --removepackages [packages to remove]
              Removes the packages on creating the base.tgz.  Use this option to remove potentially dangerous or undesirable packages,  like  lilo
              which nobody will need to have inside a chroot.

              Packages should be specified in a space-delimited manner, surrounded in double quotations, like "lilo gcc mawk"

       --extrapackages [packages to add]
              Adds  packages  specified  as an addition to the default, which is build-essential by default.  This is used in --build and --create
              (after successfully creating the initial chroot) and --update.

              The packages should be specified as a space-delimited list.

       --debemail [maintainer-name <email-address>]

              Specifies that dpkg-buildpackage be called with -mmaintainer-name <email-address> instead of default value specified in the environ‐
              ment variable, or pbuilderrc

              This option is almost obsolete, use --debbuildopts instead

       --pkgname-logfile
              Alternative option to --logfile option.  Automatically creates a logfile that is named by the .dsc file name, only really applicable
              for --build target.

              The file extension is specified by PKGNAME_LOGFILE_EXTENSION in pbuilderrc

       --aptconfdir [APT configuration directory to use]
              Uses the apt configuration file found in the specified directory as the chroot configuration.  /etc/apt is one example, so that  the
              same configuration can be used inside the chroot.

              This option overrides other options, and may cause some inconsistency problems.

       --timeout [timeout in sleep time]
              Time out building after sleeping set time.  Specify something like --timeout 10h in the command line.  Default is no timeout.

       --no-targz
              Not  using base.tgz for operation.  The --buildplace will not be deleted and reconstructed from a .tar.gz file.  Also, pbuilder will
              not add its process ID to the --buildplace as it usually would.

              Useful when experimenting with chroots, or trying to create chroots outside control of pbuilder.

       --compressprog
              Program to use for compression and decompression of the base.tgz.  The default is to use gzip, and any program that can be used  for
              the --use-compress-program option of tar can be given.

              If set to "pigz", compression and decompression is gzip compatible but will use all available CPUs.

       --twice
              Build  the  package  twice in a row.  Useful to ensure the package cleans up properly.  The resulting packages are the ones from the
              second build.

       --preserve-buildplace
              Do not clean the --buildplace if it has the same contents as the .tar.gz file, and no modifications are done.

              For preserving the build place for --create and --update targets, see --debug option.

              As with --no-targz, suppresses appending pbuilder's process ID to the --buildplace.

              This is useful if you want to attempt to build a large number of packages successively, but you expect that many of them cannot have
              their build dependencies satisfied.

              It will clean up the build place on failure, or after a successful build.

       --debug

              Turn  on  Debug mode of pbuilder, to be verbose about errors, and try to avoid cleanup processing when error happens in --update and
              --create targets.

       --inputfile filename

              Add extra file to be copied to /tmp/buildd inside the build environment.

              available in --build and --login and --execute targets.

FILES
       /etc/pbuilderrc
              The system-wide configuration file for pbuilder.

       /usr/share/pbuilder/pbuilderrc
              The default settings for pbuilder, used as fallback for all values that is not specified in /etc/pbuilderrc.

       ${HOME}/.pbuilderrc
              The personal configuration file for pbuilder, which overrides settings set in other configuration files.

              Note that ${HOME} is usually /root (if you are running pbuilder through sudo).

EXAMPLES
       pbuilder --create

              # pbuilder --create
              Distribution is sid.
              Building the build environment
               -> running debootstrap
              /usr/sbin/debootstrap
              I: Retrieving Release
              I: Retrieving Packages
              I: Validating Packages
                   .
                   .

       pbuilder --update

              # pbuilder --update
              W: /home/dancer/.pbuilderrc does not exist
              Building the build Environment
               -> extracting base tarball [/var/cache/pbuilder/base.tgz]
                   .
                   .

       pbuilder --build

              # pbuilder --build dsh_*.dsc
              I: using fakeroot in build.
              Current time: Sat Jan 20 12:03:34 JST 2007
              pbuilder-time-stamp: 1169262214
              Building the build Environment
               -> extracting base tarball [/home/dancer/DEBIAN/pbuilder/pbuilder/testsuite/tmp.FeeAX18779/testimage]
               -> creating local configuration
                   .
                   .

BUGS
       This program is starting to have too many options already.

AUTHOR
       Initial coding, and main maintenance is done by Junichi Uekawa <dancer@debian.org>.  User hooks code added by Dale Amon <amon@vnl.com>

       The homepage is available at http://pbuilder.alioth.debian.org

SEE ALSO
       /usr/share/doc/pbuilder/pbuilder-doc.html, pdebuild(1), pbuilderrc(5)

Debian                                                              2007 Apr 10                                                        pbuilder(8)
