GIT-PBUILDER(1)                                         User Contributed Perl Documentation                                        GIT-PBUILDER(1)

NAME
       git-pbuilder - Wrapper around cowbuilder/qemubuilder for gbp buildpackage

SYNOPSIS
       DIST=distribution ARCH=architecture [BUILDER=(pbuilder|qemubuilder)] \
           git-pbuilder debbuild-options

       DIST=distribution ARCH=architecture [BUILDER=(pbuilder|qemubuilder)] \
           git-pbuilder (update | create | login) cowbuilder-options

DESCRIPTION
       git-pbuilder is a wrapper around pdebuild intended for use by gbp buildpackage.  It configures pdebuild to use cowbuilder by default,
       passes appropriate options to debbuild, and sets the base path for cowbuilder based on the environment variable DIST and, if set, the
       environment variable ARCH.  qemubuilder can be selected instead by setting the environment variable BUILDER to "qemubuilder", and pbuilder
       can be selected by setting BUILDER to "pbuilder".

       By default, git-pbuilder assumes the target distribution is "sid", the same architecture as the cowbuilder default, and uses
       /var/cache/pbuilder/base-sid.cow if it exists.  If it doesn't, /var/cache/pbuilder/base.cow is tried.  If DIST is set, its value is the
       target distribution and /var/cache/pbuilder/base-dist.cow is used instead.  If DIST is "etch" or "ebo", --debian-etch-workaround is also
       passed to cowbuilder.  If ARCH is set, its value is the target architecture and /var/cache/pbuilder/base-dist-arch.cow is used, with dist
       being set to "sid" if DIST was not set.

       If qemubuilder is used as the builder, no base directory is used.  Instead, qemubuilder is invoked with the --config option pointing to the
       file /var/cache/pbuilder/qemubuilder-arch-dist.conf

       If pbuilder is used as the builder, git-pbuilder instead looks for /var/cache/pbuilder/base-sid.tgz by default and
       /var/cache/pbuilder/base.tgz if it doesn't exist.  If DIST or ARCH are set, they are used to form the expected name of the tgz file in the
       same way as they're used to form the expected base directory for cowbuilder.  Similar to cowbuilder, --debian-etch-workaround is passed to
       pbuilder if from the DIST setting it looks like the target distribution is etch.

       If git-pbuilder is invoked via a name that starts with "git-*-", the part between the hyphens is taken to be the default name of the
       builder to use.  However, "pbuilder" is mapped to cowbuilder for backward compatibility; if you want to use pbuilder, you have to
       explicitly set BUILDER.  The part after the last hyphen is taken to be the default distribution (if it contains no additional hyphen) or
       the default distribution followed by the default architecture (if it contains a hyphen).  One can therefore create symlinks like
       "git-pbuilder-squeeze" pointing to git-pbuilder and use that name when wanting to use a distribution of "squeeze", or
       "git-qemubuilder-sid-armel" to use qemubuilder to build for the "armel" architecture and the "sid" distribution.  Explicit settings of
       BUILDER, DIST, or ARCH always override any guesses from the command name.  (But note that gbp buildpackage does not pass on environment
       variables when run with --git-pbuilder; see below.)

       Any arguments are passed as-is to dpkg-buildpackage via the --debbuildopts option to pdebuild.  To pass arguments to the builder instead,
       put them in the environment variable GIT_PBUILDER_OPTIONS.

       To disable all attempts to discover the base path, tarball, or configuration file and set up the pbuilder options and instead rely on the
       settings in .pbuilderrc, set GIT_PBUILDER_AUTOCONF to "no".

       Normally, one does not run this script directly.  Instead, it's used as the builder script for gbp buildpackage via the --git-pbuilder
       command-line option.  When run this way, you should use the --git-dist, --git-arch, --git-qemubuilder, --git-pbuilder-autoconf, and
       --git-pbuilder-options flags instead of setting the DIST, ARCH, BUILDER, GIT_PBUILDER_AUTOCONF, and GIT_PBUILDER_OPTIONS environment
       variables.  See gbp-buildpackage(1) for more information.

       Alternately, git-pbuilder may be called with an argument of "update", "create", or "login".  In this case, it calls cowbuilder (or the
       configured builder as described above) using sudo and passes the corresponding command to the builder, using the same logic as above to
       determine the base directory and distribution.  If the distribution (set in DIST) ends in "-backports", one of the following will be added
       as an --othermirror parameter to the builder:

           deb http://ftp.debian.org/debian $DIST main
           deb http://backports.debian.org/debian-backports $DIST main

       The first will be used for most distributions, and the second for "squeeze-backports" or "oldstable-backports". If the distribution ends in
       "-lts", the following will be added as an --othermirror parameter to the builder:

           deb http://ftp.debian.org/debian $DIST main

       to support building for Long Term Support releases.

       Any additional arguments to git-pbuilder are passed along to the builder.  Due to how sudo works, invoking the builder with an action will
       not read the user's .pbuilderrc by default, so in this case git-pbuilder will add an explicit --configfile option pointing to the user's
       .pbuilderrc if it exists.

       If you use git-pbuilder with one of these arguments, you must have the "sudo" package installed, and you must configure sudo to let the
       current user run the appropriate builder command.

ENVIRONMENT
       ARCH
           Sets the target architecture.  For a cowbuilder builder, this sets both the base path and is passed as the --architecture option.  With
           qemubuilder, this controls the path to the configuration file.  With pbuilder, this sets the tgz path and is passed as --architecture.

       BUILDER
           Sets the builder to use.  The only supported settings are "cowbuilder" (the default), "qemubuilder", and "pbuilder".

       COWBUILDER_BASE
           Set this environment variable to change the default location for the cowbuilder base directories (/var/cache/pbuilder).

       DIST
           Sets the target distribution.  This is used primarily to determine the base path for cowbuilder or pbuilder or the configuration file
           path for qemubuilder, but it's also used to determine whether to pass --debian-etch-workaround to cowbuilder or pbuilder.

       GIT_PBUILDER_AUTOCONF
           If set to "no", disable the logic that constructs the base path, tarball, or configuration file and all other logic to determine the
           options to pass to the builder.  Instead, just run the configured builder and assume its configuration is handled elsewhere (such as in
           .pbuilderrc).  This also suppresses setting --buildresult, so the user will need to ensure that the configuration still puts packages
           where gbp buildpackage expects them.

       GIT_PBUILDER_OPTIONS
           Add additional options for the builder.  These options are passed as-is to cowbuilder, qemubuilder, or pbuilder via pdebuild.  The
           contents of this variable will undergo shell expansion, so any arguments containing shell metacharacters or whitespace need to be
           quoted in the value of the environment variable.

       GIT_PBUILDER_OUTPUT_DIR
           Where to put the result of the build.  The default is ".." (the parent directory).  This setting is ignored if GIT_PBUILDER_AUTOCONF is
           set to "no".

       PBUILDER_BASE
           Set this environment variable to change the default location for the pbuilder tgz files (/var/cache/pbuilder) when BUILDER is set to
           "pbuilder".

FILES
       /var/cache/pbuilder/base-sid.cow
       /var/cache/pbuilder/base.cow
           The default "cowbuilder --basepath" directories, searched for in that order, if neither DIST nor ARCH is set.

       /var/cache/pbuilder/base-sid-$ARCH.cow
           The "cowbuilder --basepath" directory used if ARCH is set and DIST is not set.

       /var/cache/pbuilder/base-$DIST.cow
           The "cowbuilder --basepath" directory used if DIST is set and ARCH is not.

       /var/cache/pbuilder/base-$DIST-$ARCH.cow
           The "cowbuilder --basepath" directory used if DIST and ARCH are both set.

       /var/cache/pbuilder/base-sid.tgz
       /var/cache/pbuilder/base.tgz
       /var/cache/pbuilder/base-sid-$ARCH.tgz
       /var/cache/pbuilder/base-$DIST.tgz
       /var/cache/pbuilder/base-$DIST-$ARCH.tgz
           Similar to the above, the "pbuilder --basetgz" path used for various settings of DIST and ARCH if BUILDER is set to "pbuilder".

       /var/cache/pbuilder/qemubuilder-$ARCH-$DIST.conf
           The "qemubuilder --config" file used.  $ARCH defaults to "armel" and $DIST defaults to "sid" if not set.

SEE ALSO
       cowbuilder(8), dpkg-buildpackage(1), gbp-buildpackage(1), pbuilder(8), pdebuild(1), qemubuilder(8), sudo(8)

       The latest version of this script is available from <http://www.eyrie.org/~eagle/software/scripts/>.

AUTHOR
       Russ Allbery <eagle@eyrie.org>

perl v5.22.1                                                        2016-01-29                                                     GIT-PBUILDER(1)
