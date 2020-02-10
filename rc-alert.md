RC-ALERT(1)                                                                              General Commands Manual                                                                              RC-ALERT(1)

NAME
       rc-alert - check for installed packages with release-critical bugs

SYNOPSIS
       rc-alert [inclusion options] [--debtags [tag[,tag ...]]] [--popcon] [package ...]
       rc-alert --help|--version

DESCRIPTION
       rc-alert  downloads  the  list of release-critical bugs from the Debian BTS webpages, and then outputs a list of packages installed on the system, or given on the command-line, which are in that
       list.

       If the directory $XDG_CACHE_HOME/devscripts/rc-alert exists or the --cache option is given, then the (sizable) downloaded list will be cached, and will only be downloaded again on a second invo‐
       cation if it has changed.

OPTIONS
       --cache
              Force the creation of the $XDG_CACHE_HOME/devscripts/rc-alert cache directory.

       --help, -h
              Show a summary of options.

       --version, -v
              Show version and copyright information.

       It is also possible to filter the list of bugs reported based on the tags and distributions associated with the package. The filtering options are:

       --include-tags, -f
              A list of tags which the bug must have, in the format used for output.  For example, to include bugs tagged security or help wanted, use "SH".

       --include-tag-op, -t
              If set to and, a bug must have all of the tags specified by --include-tags.

       --exclude-tags
              A list of tags which the bug must not have, in the same format as --include-tags.

       --exclude-tag-op
              If set to and, a bug must have none of the tags specified by --exclude-tags.  By default, the bug will be excluded if any tag matches.

       --include-dists, -d
              A list of distributions which the bug must apply to, in the format used for output.  For example, to include bugs affecting testing or unstable, use "TU".

       --include-dist-op, -o
              If set to and, a bug must apply to all of the specified distributions in order to be included.

       --exclude-dists
              A list of distributions to which the bug must not apply, in the same format as --include-dists.

       --exclude-dist-op
              If set to and, a bug must apply to all of the specified distributions in order to be excluded.  By default the bug will be excluded if it applies to any of the listed distributions.

       It  is  also  possible to only list bugs which have specific debtags set. Note that you need to have debtags installed and also that it's not mandatory for maintainers to set proper debtags. The
       produced list will thus probably be incomplete.

       --debtags
              Match packages based on the listed tags. Each package is matched only if it has all the listed tags; in the case of multiple tags within the same facet, a package is matched if it has any
              of the listed tags within the facet.

       --debtags-database
              Use a non-standard debtags database.  The default is /var/lib/debtags/packages-tags.

       Popularity-contest collects data about installation and usage of Debian packages. You can additionally sort the bugs by the popcon rank of the related packages.

       --popcon
              Sort bugs by the popcon rank of the package the bug belongs to.

       --pc-vote
              By  default, packages are sorted according to the number of people who have the package installed. This option enables sorting by the number of people regularly using the package instead.
              This option has no effect in combination with --pc-local.

       --pc-local
              Instead of requesting remote data the information from the last popcon run is used (/var/log/popularity-contest).

EXAMPLES
       --include-dists OS
              The bug must apply to at least one of oldstable or stable

       --include-dists TU --include-dist-op and
              The bug must apply to both testing and unstable

       --include-dists O --include-tags S --exclude-tags +
              The bug must apply to oldstable and be tagged security but not patch

       --exclude-dists SOT --include-tags R
              The bug must apply to only unstable or experimental (or both) and be tagged unreproducible

       --debtags implemented-in::perl,role::plugin,implemented-in::python
              The bug must apply to packages matching the specified debtags, i.e. the match will only include packages that have the 'role::plugin' tag and that have either of  the  tags  'implemented-
              in::perl' or 'implemented-in::python'.

       --popcon --pc-local
              Read /var/log/popularity-contest and sort bugs by your personal popcon ranking (which is basically the atime of your packages' binaries).

BUGS
       It is not possible to say "does not apply only to unstable"

SEE ALSO
       debtags(1) popbugs(1) popularity-contest(8)

AUTHOR
       rc-alert  was written by Anthony DeRobertis and modified by Julian Gilbey <jdg@debian.org> and Adam D. Barratt <adam@adam-barratt.org.uk> for the devscripts package. Debtags and popcon function‐
       ality was added by Jan Hauke Rahm <info@jhr-online.de>.

DEBIAN                                                                                       Debian Utilities                                                                                 RC-ALERT(1)
