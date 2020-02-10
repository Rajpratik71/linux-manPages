DEBCHANGE(1)                                                                             General Commands Manual                                                                             DEBCHANGE(1)

NAME
       debchange - Tool for maintenance of the debian/changelog file in a source package

SYNOPSIS
       debchange [options] [text ...]
       dch [options] [text ...]

DESCRIPTION
       debchange or its alias dch will add a new comment line to the Debian changelog in the current source tree.  This command must be run from within that tree.  If the text of the change is given on
       the command line, debchange will run in batch mode and simply add the text, with line breaks as necessary, at the appropriate place in debian/changelog (or the changelog specified by options, as
       described below).  If no text is specified then debchange will run the editor as determined by sensible-editor for you to edit the file.  (The environment variables VISUAL and EDITOR are used in
       this order to determine which editor to use.)  Editors which understand the +n option for starting the editing on a specified line will use this to move to the correct line of the file for edit‐
       ing.   If  the  editor is quit without modifying the temporary file, debchange will exit without touching the existing changelog.  Note that the changelog is assumed to be encoded with the UTF-8
       encoding.  If it is not, problems may occur.  Please see the iconv(1) manpage to find out how to convert changelogs from legacy encodings.  Finally, a changelog or NEWS file can be created  from
       scratch using the --create option described below.

       debchange  also  supports  automatically  producing  bug-closing  changelog  entries,  using  the  --closes  option.   This  will  usually  query  the  BTS,  the  Debian Bug Tracking System (see
       https://bugs.debian.org/) to determine the title of the bug and the package in which it occurs.  This behaviour can be stopped by giving a --noquery option or by setting the configuration  vari‐
       able  DEBCHANGE_QUERY_BTS  to no, as described below.  In either case, the editor (as described above) will always be invoked to give an opportunity to modify the entries, and the changelog will
       be accepted whether or not modifications are made.  An extra changelog entry can be given on the command line in addition to the closes entries.

       At most one of --append, --increment, --edit, --release, and --newversion may be specified as listed below. If no options are specified, debchange will use heuristics to guess whether or not the
       package has been successfully released, and behave as if --increment had been specified if the package has been released, or otherwise as if --append has been specified.

       Two  different  sets of heuristics can be used, as controlled by the --release-heuristic option or the DEBCHANGE_RELEASE_HEURISTIC configuration variable. The default changelog heuristic assumes
       the package has been released unless its changelog contains UNRELEASED in the distribution field. If this heuristic is enabled then the distribution will default to UNRELEASED in  new  changelog
       entries,  and  the --mainttrailer option described below will be automatically enabled. This can be useful if a package can be released by different maintainers, or if you do not keep the upload
       logs. The alternate log heuristic determines if a package has been released by looking for an appropriate dupload(1) or dput(1) log file in the parent directory.  A warning will be issued if the
       log file is found but a successful upload is not recorded. This may be because the previous upload was performed with a version of dupload prior to 2.1 or because the upload failed.

       If  either  --increment  or --newversion is used, the name and email for the new version will be determined as follows.  If the environment variable DEBFULLNAME is set, this will be used for the
       maintainer full name; if not, then NAME will be checked.  If the environment variable DEBEMAIL is set, this will be used for the email address.  If this variable has  the  form  "name  <email>",
       then  the  maintainer name will also be taken from here if neither DEBFULLNAME nor NAME is set.  If this variable is not set, the same test is performed on the environment variable EMAIL.  Next,
       if the full name has still not been determined, then use getpwuid(3) to determine the name from the password file.  If this fails, use the previous changelog entry.  For the email address, if it
       has  not  been  set  from DEBEMAIL or EMAIL, then look in /etc/mailname, then attempt to build it from the username and FQDN, otherwise use the email address in the previous changelog entry.  In
       other words, it's a good idea to set DEBEMAIL and DEBFULLNAME when using this script.

       Support is included for changelogs that record changes by multiple co-maintainers of a package. If an entry is appended to the current version's entries, and the maintainer is different from the
       maintainer  who  is  listed  as  having  done the previous entries, then lines will be added to the changelog to tell which maintainers made which changes. Currently only one of the several such
       styles of recording this information is supported, in which the name of the maintainer who made a set of changes appears on a line before  the  changes,  inside  square  brackets.  This  can  be
       switched  on  and off using the --[no]multimaint option or the DEBCHANGE_MULTIMAINT configuration file option; the default is to enable it.  Note that if an entry has already been marked in this
       way, then this option will be silently ignored.

       If the directory name of the source tree has the form package-version, then debchange will also attempt to rename it if the (upstream) version number changes.  This can be prevented by using the
       --preserve command line or configuration file option as described below.

       If --force-bad-version or --allow-lower-version is used, debchange will not stop if the new version is less than the current one.  This is especially useful while doing backports.

Directory name checking
       In common with several other scripts in the devscripts package, debchange will climb the directory tree until it finds a debian/changelog file.  As a safeguard against stray files causing poten‐
       tial problems, it will examine the name of the parent directory once it finds the debian/changelog file, and check that the directory name corresponds to the package name.  Precisely how it does
       this  is  controlled by two configuration file variables DEVSCRIPTS_CHECK_DIRNAME_LEVEL and DEVSCRIPTS_CHECK_DIRNAME_REGEX, and their corresponding command-line options --check-dirname-level and
       --check-dirname-regex.

       DEVSCRIPTS_CHECK_DIRNAME_LEVEL can take the following values:

       0      Never check the directory name.

       1      Only check the directory name if we have had to change directory in our search for debian/changelog.  This is the default behaviour.

       2      Always check the directory name.

       The directory name is checked by testing whether the current directory name (as determined by pwd(1)) matches the regex given by the configuration file option  DEVSCRIPTS_CHECK_DIRNAME_REGEX  or
       by  the  command  line option --check-dirname-regex regex.  Here regex is a Perl regex (see perlre(3perl)), which will be anchored at the beginning and the end.  If regex contains a '/', then it
       must match the full directory path.  If not, then it must match the full directory name.  If regex contains the string ´PACKAGE', this will be replaced by the source package name, as  determined
       from the changelog.  The default value for the regex is: ´PACKAGE(-.+)?', thus matching directory names such as PACKAGE and PACKAGE-version.

       The default changelog to be edited is debian/changelog; however, this can be changed using the --changelog or --news options or the CHANGELOG environment variable, as described below.

OPTIONS
       --append, -a
              Add a new changelog entry at the end of the current version's entries.

       --increment, -i
              Increment  either  the final component of the Debian release number or, if this is a native Debian package, the version number.  On Ubuntu or Tanglu, this will also change the suffix from
              buildX to ubuntu1/tanglu1.  Use -R, --rebuild for a no change rebuild increment.  This creates a new section at the beginning of the changelog with appropriate headers and footers.  Also,
              if this is a new version of a native Debian package, the directory name is changed to reflect this.  If DEBCHANGE_RELEASE_HEURISTIC is changelog (default) and the current release is UNRE‐
              LEASED, this will only change the version of the current changelog stanza.  Otherwise, this will create a new changelog stanza with the new version.

       --newversion version, -v version
              This specifies the version number (including the Debian release part) explicitly and behaves as the --increment option in other respects.  It will also change the directory  name  if  the
              upstream  version  number  has  changed.   If  DEBCHANGE_RELEASE_HEURISTIC  is  changelog (default) and the current release is UNRELEASED, this will only change the version of the current
              changelog stanza.  Otherwise, this will create a new changelog stanza with the new version.

       --edit, -e
              Edit the changelog in an editor.

       --release, -r
              Finalize the changelog for a release.  Update the changelog timestamp. If the distribution is set to UNRELEASED, change it to the  distribution  from  the  previous  changelog  entry  (or
              another distribution as specified by --distribution).  If there are no previous changelog entries and an explicit distribution has not been specified, unstable will be used.

       --force-save-on-release
              When  --release  is used, an editor is opened to allow inspection of the changelog.  The user is required to save the file to accept the modified changelog, otherwise the original will be
              kept (default).

       --no-force-save-on-release
              Do not do so. Note that a dummy changelog entry may be supplied in order to achieve the same effect - e.g. debchange --release "".  The entry will not be added to the  changelog  but  its
              presence will suppress the editor.

       --create
              This  will  create  a  new debian/changelog file (or NEWS if the --news option is used).  You must be in the top-level directory to use this; no directory name checking will be performed.
              The package name and version can either be specified using the --package and --newversion options, determined from the directory name using the --fromdirname option  or  entered  manually
              into the generated changelog file.  The maintainer name is determined from the environment if this is possible, and the distribution is specified either using the --distribution option or
              in the generated changelog file.

       --empty
              When used in combination with --create, suppress the automatic addition of an "initial release" changelog entry (so that the next invocation of debchange adds the first entry).  Note that
              this will cause a dpkg-parsechangelog warning on the next invocation due to the lack of changes.

       --package package
              This specifies the package name to be used in the new changelog; this may only be used in conjunction with the --create, --increment and --newversion options.

       --nmu, -n
              Increment  the  Debian  release  number  for  a non-maintainer upload by either appending a ".1" to a non-NMU version number (unless the package is Debian native, in which case "+nmu1" is
              appended) or by incrementing an NMU version number, and add an NMU changelog comment.  This happens automatically if the packager is neither in the Maintainer nor the Uploaders  field  in
              debian/control, unless DEBCHANGE_AUTO_NMU is set to no or the --no-auto-nmu option is used.

       --bin-nmu
              Increment  the  Debian  release  number for a binary non-maintainer upload by either appending a "+b1" to a non-binNMU version number or by incrementing a binNMU version number, and add a
              binNMU changelog comment.

       --qa, -q
              Increment the Debian release number for a Debian QA Team upload, and add a QA upload changelog comment.

       --rebuild, -R
              Increment the Debian release number for a no-change rebuild by appending a "build1" or by incrementing a rebuild version number.

       --security, -s
              Increment the Debian release number for a Debian Security Team non-maintainer upload, and add a Security Team upload changelog comment.

       --team Increment the Debian release number for a team upload, and add a Team upload changelog comment.

       --upstream, -U
              Don't append distro-name1 to the version on a derived distribution. Increment the Debian version.

       --bpo  Increment the Debian release number for an upload to jessie-backports, and add a backport upload changelog comment.

       --local, -lsuffix
               Add a suffix to the Debian version number for a local build.

       --force-bad-version, -b
              Force a version number to be less than the current one (e.g., when backporting).

       --allow-lower-version pattern
              Allow a version number to be less than the current one if the new version matches the specified pattern.

       --force-distribution
              Force the provided distribution to be used, even if it doesn't match the list of known distributions (e.g. for unofficial distributions).

       --auto-nmu
              Attempt to automatically determine whether a change to the changelog represents a Non Maintainer Upload.  This is the default.

       --no-auto-nmu
              Disable automatic NMU detection.  Equivalent to setting DEBCHANGE_AUTO_NMU to no.

       --fromdirname, -d
              This will take the upstream version number from the directory name, which should be of the form package-version.  If the upstream  version  number  has  increased  from  the  most  recent
              changelog  entry,  then  a  new entry will be made with version number version-1 (or version if the package is Debian native), with the same epoch as the previous package version.  If the
              upstream version number is the same, this option will behave in the same way as -i.

       --closes nnnnn[,nnnnn ...]
              Add changelog entries to close the specified bug numbers.  Also invoke the editor after adding these entries.  Will generate warnings if the BTS cannot be contacted (and --noquery has not
              been specified), or if there are problems with the bug report located.

       --[no]query
              Should we attempt to query the BTS when generating closes entries?

       --preserve, -p
              Preserve the source tree directory name if the upstream version number (or the version number of a Debian native package) changes.  See also the configuration variables section below.

        --no-preserve, --nopreserve
              Do not preserve the source tree directory name (default).

       --vendor vendor
              Override the distributor ID over the default returned by dpkg-vendor.  This name is used for heuristics applied to new package versions and for sanity checking of the target distribution.

       --distribution dist, -D dist
              Use  the  specified  distribution  in  the  changelog  entry  being edited, instead of using the previous changelog entry's distribution for new entries or the existing value for existing
              entries.

       --urgency urgency, -u urgency
              Use the specified urgency in the changelog entry being edited, instead of using the default "medium" for new entries or the existing value for existing entries.

       --changelog file, -c file
              This will edit the changelog file instead of the standard debian/changelog.  This option overrides any CHANGELOG environment variable setting.  Also, no directory traversing  or  checking
              will be performed when this option is used.

       --news [newsfile]
              This  will edit newsfile (by default, debian/NEWS) instead of the regular changelog.  Directory searching will be performed.  The changelog will be examined in order to determine the cur‐
              rent package version.

       --[no]multimaint
              Should we indicate that parts of a changelog entry have been made by different maintainers?  Default is yes; see the discussion above and also the DEBCHANGE_MULTIMAINT configuration  file
              option below.

       --[no]multimaint-merge
              Should  all  changes made by the same author be merged into the same changelog section?  Default is no; see the discussion above and also the DEBCHANGE_MULTIMAINT_MERGE configuration file
              option below.

       --maintmaint, -m
              Do not modify the maintainer details previously listed in the changelog.  This is useful particularly for sponsors wanting to automatically add a sponsorship  message  without  disrupting
              the  other  changelog  details.   Note  that  there  may be some interesting interactions if multi-maintainer mode is in use; you will probably wish to check the changelog manually before
              uploading it in such cases.

       --controlmaint, -M
              Use maintainer details from the debian/control Maintainer field rather than relevant environment variables (DEBFULLNAME, DEBEMAIL, etc.).  This option might be useful to  restore  details
              of the main maintainer in the changelog trailer after a bogus edit (e.g. when -m was intended but forgot) or when releasing a package in the name of the main maintainer (e.g. the team).

       --[no]mainttrailer, -t
              If  mainttrailer  is set, it will avoid modifying the existing changelog trailer line (i.e. the maintainer and date-stamp details), unless used with options that require the trailer to be
              modified (e.g. --create, --release, -i, --qa, etc.)  This option differs from --maintmaint in that it will use multi-maintainer mode if appropriate, with  the  exception  of  editing  the
              trailer. See also the DEBCHANGE_MAINTTRAILER configuration file option below.

       --check-dirname-level N
              See the above section "Directory name checking" for an explanation of this option.

       --check-dirname-regex regex
              See the above section "Directory name checking" for an explanation of this option.

       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       --release-heuristic log|changelog
              Controls how debchange determines if a package has been released, when deciding whether to create a new changelog entry or append to an existing changelog entry.

       --help, -h
              Display a help message and exit successfully.

       --version
              Display version and copyright information and exit successfully.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced in that order to set configuration variables.  Command line options can be used to override configuration file set‐
       tings.  Environment variable settings are ignored for this purpose.  The currently recognised variables are:

       DEBCHANGE_PRESERVE
              If this is set to yes, then it is the same as the --preserve command line parameter being used.

       DEBCHANGE_QUERY_BTS
              If this is set to no, then it is the same as the --noquery command line parameter being used.

       DEVSCRIPTS_CHECK_DIRNAME_LEVEL, DEVSCRIPTS_CHECK_DIRNAME_REGEX
              See the above section "Directory name checking" for an explanation of these variables.  Note that these are package-wide configuration variables, and will therefore affect all  devscripts
              scripts which check their value, as described in their respective manpages and in devscripts.conf(5).

       DEBCHANGE_RELEASE_HEURISTIC
              Controls  how  debchange  determines  if  a package has been released, when deciding whether to create a new changelog entry or append to an existing changelog entry. Can be either log or
              changelog.

       DEBCHANGE_MULTIMAINT
              If set to no, debchange will not introduce multiple-maintainer distinctions when a different maintainer appends an entry to an existing changelog.  See the discussion above.   Default  is
              yes.

       DEBCHANGE_MULTIMAINT_MERGE
              If  set to yes, when adding changes in multiple-maintainer mode debchange will check whether previous changes by the current maintainer exist and add the new changes to the existing block
              rather than creating a new block.  Default is no.

       DEBCHANGE_MAINTTRAILER
              If this is set to no, then it is the same as the --nomainttrailer command line parameter being used.

       DEBCHANGE_TZ
              Use this timezone for changelog entries.  Default is the user/system timezone as shown by `date -R` and affected by the environment variable TZ.

       DEBCHANGE_LOWER_VERSION_PATTERN
              If this is set, then it is the same as the --allow-lower-version command line parameter being used.

       DEBCHANGE_AUTO_NMU
              If this is set to no then debchange will not attempt to automatically determine whether the current changelog stanza represents an NMU.  The default is yes.  See  the  discussion  of  the
              --nmu option above.

       DEBCHANGE_FORCE_SAVE_ON_RELEASE
              If this is set to no, then it is the same as the --no-force-save-on-release command line parameter being used.

       DEBCHANGE_VENDOR
              Use this vendor instead of the default (dpkg-vendor output).  See --vendor for details.

ENVIRONMENT
       DEBEMAIL, EMAIL, DEBFULLNAME, NAME
              See the above description of the use of these environment variables.

       CHANGELOG
              This variable specifies the changelog to edit in place of debian/changelog.  No directory traversal or checking is performed when this variable is set.  This variable is overridden by the
              --changelog command-line setting.

       VISUAL, EDITOR
              These environment variables (in this order) determine the editor used by sensible-editor.

SEE ALSO
       debc(1), debclean(1), dput(1), dupload(1), devscripts.conf(5)

AUTHOR
       The original author was Christoph Lameter <clameter@debian.org>.  Many substantial changes and improvements were made by Julian Gilbey <jdg@debian.org>.

DEBIAN                                                                                       Debian Utilities                                                                                DEBCHANGE(1)
