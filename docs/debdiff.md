DEBDIFF(1)                                                    General Commands Manual                                                   DEBDIFF(1)

NAME
       debdiff - compare file lists in two Debian packages

SYNOPSIS
       debdiff [options]
       debdiff [options] ... deb1 deb2
       debdiff [options] ... changes1 changes2
       debdiff [options] ... --from deb1a deb1b ...  --to deb2a deb2b ...
       debdiff [options] ... dsc1 dsc2

DESCRIPTION
       debdiff takes the names of two Debian package files (.debs or .udebs) on the command line and compares their contents (considering only the
       files in the main package, not the maintenance scripts).  It shows which files have been introduced and which removed between the two pack‐
       age  files,  and  is  therefore useful for spotting files which may have been inadvertently lost between revisions of the package.  It also
       checks the file owners and permissions, and compares the control files of the two packages using the wdiff program.  If you want  a  deeper
       comparison of two Debian package files you can use the diffoscope tool.

       If no arguments are given, debdiff tries to compare the content of the current source directory with the last version of the package.

       debdiff  can  also handle changes between groups of .deb files in two ways.  The first is to specify two .changes files.  In this case, the
       .deb files listed in the .changes file will be compared, by taking the contents of all of the listed .deb files together.  (The .deb  files
       listed  are  assumed  to be in the same directory as the .changes file.)  The second way is to list the .deb files of interest specifically
       using the --from ... --to syntax.  These both help if a package is broken up into smaller packages and one wishes to ensure that nothing is
       lost in the interim.

       debdiff  examines  the  devscripts  configuration files as described below.  Command line options override the configuration file settings,
       though.

       If debdiff is passed two source packages (.dsc files) it will compare the contents of the source packages.  If the source  packages  differ
       only in Debian revision number (that is, the .orig.tar.gz files are the same in the two .dsc files), then interdiff(1) will be used to com‐
       pare the two patch files if this program is available on the system, otherwise a diff will be performed between the two source trees.

OPTIONS
       --dirs, -d
              The default mode of operation is to ignore directory names which appear in the file list, but they, too, will be considered if  this
              option is given.

       --nodirs
              Ignore  directory names which appear in the file list.  This is the default and it can be used to override a configuration file set‐
              ting.

       --move FROM TO, -m FROM TO
              It sometimes occurs that various files or directories are moved around between revisions.  This can be handled  using  this  option.
              There  are two arguments, the first giving the location of the directory or file in the first package, and the second in the second.
              Any files in the first listing whose names begin with the first argument are treated as having that substituted for the second argu‐
              ment  when  the file lists are compared.  Any number of --move arguments may be given; they are processed in the order in which they
              appear. This only affects comparing binary packages, not source packages.

       --move-regex FROM TO
              This is the same as --move, except that FROM is treated as a regular expression and the perl  substitution  command  s/^FROM/TO/  is
              applied to the files.  In particular, TO can make use of backreferences such as $1.

       --nocontrol
              debdiff  will  usually compare the respective control files of the packages using wdiff(1).  This option suppresses this part of the
              processing.

       --control
              Compare the respective control files; this is the default, and it can be used to override a configuration file setting.

       --controlfiles FILE[,FILE ...]
              Specify which control files to compare; by default this is just control, but could include postinst, config and so on.   Files  will
              only be compared if they are present in both .debs being compared.  The special value ALL compares all control files present in both
              packages, except for md5sums.  This option can be used to override a configuration file setting.

       --wdiff-source-control
              When processing source packages, compare control files using wdiff.  Equivalent to the --control option for binary packages.

       --no-wdiff-source-control
              Do not compare control files in source packages using wdfiff.  This is the default.

       --wp, --wl, --wt
              Pass a -p, -l or -t option to wdiff respectively.  (This yields the whole wdiff output rather than just the lines with any changes.)

       --show-moved
              If multiple .deb files are specified on the command line, either using .changes files or the --from/--to syntax,  then  this  option
              will  also  show  which  files (if any) have moved between packages.  (The package names are simply determined from the names of the
              .deb files.)

       --noshow-moved
              The default behaviour; can be used to override a configuration file setting.

       --renamed FROM TO
              If --show-moved is being used and a package has been renamed in the process, this command instructs debdiff to treat the package  in
              the first list called FROM as if it were called TO.  Multiple uses of this option are permitted.

       --exclude PATTERN
              Exclude files that match PATTERN.  Multiple uses of this option are permitted.

       --diffstat
              Include the result of diffstat before the generated diff.

       --no-diffstat
              The default behaviour; can be used to override a configuration file setting.

       --auto-ver-sort
              When comparing source packages, do so in version order.

       --no-auto-ver-sort
              Compare source packages in the order they were passed on the command-line, even if that means comparing a package with a higher ver‐
              sion against one with a lower version.  This is the default behaviour.

       --unpack-tarballs
              When comparing source packages, also unpack tarballs found in the top level source directory to compare their  contents  along  with
              the other files.  This is the default behaviour.

       --no-unpack-tarballs
              Do not unpack tarballs inside source packages.

       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       --debs-dir directory
              Look for the .dsc files in directory instead of the parent of the source directory.  This should either be an absolute path or rela‐
              tive to the top of the source directory.

       --help, -h
              Show a summary of options.

       --version, -v
              Show version and copyright information.

       --quiet, -q
              Be quiet if no differences were found.

       --ignore-space, -w
              Ignore whitespace in diffs.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order  to  set  configuration  variables.
       Command line options can be used to override configuration file settings.  Environment variable settings are ignored for this purpose.  The
       currently recognised variables are:

       DEBDIFF_DIRS
              If this is set to yes, then it is the same as the --dirs command line parameter being used.

       DEBDIFF_CONTROL
              If this is set to no, then it is the same as the --nocontrol command line parameter being used.  The default is yes.

       DEBDIFF_CONTROLFILES
              Which control files to compare, corresponding to the --controlfiles command line option.  The default is control.

       DEBDIFF_SHOW_MOVED
              If this is set to yes, then it is the same as the --show-moved command line parameter being used.

       DEBDIFF_WDIFF_OPT
              This option will be passed to wdiff; it should be one of -p, -l or -t.

       DEBDIFF_SHOW_DIFFSTAT
              If this is set to yes, then it is the same as the --diffstat command line parameter being used.

       DEBDIFF_WDIFF_SOURCE_CONTROL
              If this is set to yes, then it is the same as the --wdiff-source-control command line parameter being used.

       DEBDIFF_AUTO_VER_SORT
              If this is set to yes, then it is the same as the --auto-ver-sort command line parameter being used.

       DEBDIFF_UNPACK_TARBALLS
              If this is set to no, then it is the same as the --no-unpack-tarballs command line parameter being used.

       DEBRELEASE_DEBS_DIR
              This specifies the directory in which to look for the .dsc and files, and is either an absolute path or relative to the top  of  the
              source  tree.  This corresponds to the --debs-dir command line option.  This directive could be used, for example, if you always use
              pbuilder or svn-buildpackage to build your packages.  Note that it also affects debrelease(1) in the same  way,  hence  the  strange
              name of the option.

EXIT VALUES
       Normally  the  exit  value will be 0 if no differences are reported and 1 if any are reported.  If there is some fatal error, the exit code
       will be 255.

SEE ALSO
       diffstat(1), dpkg-deb(1), interdiff(1), wdiff(1), devscripts.conf(5), diffoscope(1)

AUTHOR
       debdiff was originally written as a shell script by Yann Dirson <dirson@debian.org> and rewritten in Perl with many more features by Julian
       Gilbey  <jdg@debian.org>.   The software may be freely redistributed under the terms and conditions of the GNU General Public License, ver‐
       sion 2.

DEBIAN                                                           Debian Utilities                                                       DEBDIFF(1)
