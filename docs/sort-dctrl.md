SORT-DCTRL(1)                                                  Debian user's manual                                                  SORT-DCTRL(1)

NAME
       sort-dctrl - sort Debian control files

SYNOPSIS
       sort-dctrl [options] [ file ...  ]

       sort-dctrl --copying | --help | --version | -ChV

DESCRIPTION
       The sort-dctrl program sorts Debian control files according to specified criteria.

       A  Debian control (dctrl) file is a semistructured single-table database stored in a machine-parseable text file.  Such a database consists
       of a set of records; each record is a mapping from field names to field content.  Textually, records are separated by  empty  lines,  while
       each  field  is  encoded as one or more nonempty lines inside a record.  A field starts with its name, followed by a colon, followed by the
       field content.  The colon must reside on the first line of the field, and the first line must start with no whitespace.  Subsequent  lines,
       in contrast, always start with linear whitespace (one or more space or tab characters).

       The  sort-dctrl  program  recognizes two field types: string fields and version fields.  Version fields act also as numeric fields.  String
       fields are compared according to strict lexicographical octet-by-octet comparison, after ignoring any initial whitespace after  the  colon.
       Version fields are parsed and compared as Debian version numbers.  When comparing version numbers, if a field content does not in fact con‐
       form to the version number syntax, it compares less than any field content that does conform, and equal to any  other  nonconforming  field
       content.  The sort-dctrl program assumes all fields are string fields unless told otherwise.

       You can specify arbitrary number of keys for sorting, using the -k option.  The keys are interpreted in a descending order of priority: the
       first key specified is primary, the second key specified is secondary, and so on.  If two records compare equal under the primary key, then
       they are compared under the secondary key, and so on.  If no keys are specified, a default key is assumed (the "Package" field with no mod‐
       ifiers).

OPTIONS
       -k keyspec, --key-spec=keyspec
              Specify one or more keys for sorting.  You may specify this option any number of times.  The keyspec argument consists of  a  comma-
              separated  list  of key specifications.  Each key specification consists of the name of the field that serves as the key, optionally
              followed by a colon and key modifiers.  The following key modifiers are supported:

              r      Invert the comparison for this key, reversing the sorting order.

              v      Treat this field as a version number field.

              n      Treat this field as numeric, which currently is synonymous with v.

       -q, --quiet, --silent
              Output nothing to the standard output stream.  Instead, exit immediately after finding the first match.

       -l level, --errorlevel=level
              Set log level to level.  level is one of fatal, important, informational and debug, but the last may not be available, depending  on
              the  compile-time options.  These categories are given here in order; every message that is emitted when fatal is in effect, will be
              emitted in the important error level, and so on. The default is important.

       -V, --version
              Print out version information.

       -C, --copying
              Print out the copyright license.  This produces much output; be sure to redirect or  pipe  it  somewhere  (such  as  your  favourite
              pager).

       -h, --help
              Print out a help summary.

EXAMPLES
       Here are some sample invocations of the program:

       sort-dctrl /var/lib/dpkg/available
              Output the dpkg available file sorted by the package name.

       sort-dctrl -k Version:v /var/lib/dpkg/available
              Output the dpkg available file sorted in ascending order of version numbers.

       sort-dctrl -k Version:vr /var/lib/dpkg/available
              Output the dpkg available file sorted in descending order of version numbers.

       sort-dctrl -k Package,Version:v /var/lib/dpkg/available
              Output  the  dpkg available file sorted primarily in ascending order of package names and secondarily in descending order of version
              numbers.

       sort-dctrl -k Installed-Size:n,Size:nr /var/lib/dpkg/available
              Output the dpkg available file sorted primarily in ascending order of installation sizes and  secondarily  in  descending  order  of
              package sizes.

AUTHOR
       The program and this manual page were written by Antti-Juhani Kaijanaho <ajk@debian.org>.

SEE ALSO
       Debian Policy Manual.  Published as the Debian package debian-policy.  Also available in the Debian website.

       grep-dctrl(1)

Debian Project                                                      2005-06-08                                                       SORT-DCTRL(1)
