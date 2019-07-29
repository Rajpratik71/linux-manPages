dpkg-parsechangelog(1)                                              dpkg suite                                              dpkg-parsechangelog(1)

NAME
       dpkg-parsechangelog - parse Debian changelog files

SYNOPSIS
       dpkg-parsechangelog [option...]

DESCRIPTION
       dpkg-parsechangelog  reads  and parses the changelog of an unpacked Debian source tree and outputs the information in it to standard output
       in a machine-readable form.

OPTIONS
       -l, --file changelog-file
              Specifies the changelog file to read information from.  A ‘-’ can be used to specify reading from standard input.   The  default  is
              debian/changelog.

       -F changelog-format
              Specifies the format of the changelog. By default the format is read from a special line near the bottom of the changelog or failing
              that defaults to the debian standard format. See also CHANGELOG FORMATS.

       -L libdir
              Obsolete option without effect (since dpkg 1.18.8).  Setting the perl environment variables PERL5LIB or PERLLIB has a similar effect
              when looking for the parser perl modules.

       -S, --show-field field
              Specifies the name of the field to show (since dpkg 1.17.0).  The field name is not printed, only its value.

       -?, --help
              Show the usage message and exit.

       --version
              Show the version and exit.

   Parser Options
       The following options can be used to influence the output of the changelog parser, e.g. the range of entries or the format of the output.

       --format output-format
              Set  the  output format. Currently supported values are dpkg and rfc822.  dpkg is the classic output format (from before this option
              existed) and the default. It consists of one paragraph in Debian control format (see deb-control(5)). If  more  than  one  entry  is
              requested, then most fields are taken from the most recent entry, except otherwise stated:

              Source: pkg-name

              Version: version

              Distribution: target-distribution

              Urgency: urgency
                     The  highest  urgency  of  all included entries is used, followed by the concatenated (space-separated) comments from all the
                     versions requested.

              Maintainer: author

              Date: date
                     The date of the entry as a string, as it appears in the changelog.  With a strptime(3) format "%a, %d %b %Y %T %z", but where
                     the  day  of the week might not actually correspond to the real day obtained from the rest of the date string.  If you need a
                     more accurate representation of the date, use the Timestamp field, but take into account it might not be possible to  map  it
                     back to the exact value in this field.

              Timestamp: timestamp
                     The date of the entry as a timestamp in seconds since the epoch (since dpkg 1.18.8).

              Closes: bug-number
                     The Closes fields of all included entries are merged.

              Changes: changelog-entries
                     The  text  of  all  changelog entries is concatenated. To make this field a valid Debian control format multiline field empty
                     lines are replaced with a single full stop and all lines is intended by one space character. The exact content depends on the
                     changelog format.

              The Version, Distribution, Urgency, Maintainer and Changes fields are mandatory.

              There might be additional user-defined fields present.

              The rfc822 format uses the same fields but outputs a separate paragraph for each changelog entry so that all metadata for each entry
              is preserved.

       --all  Include all changes. Note: other options have no effect when this is in use.

       -s, --since version
       -v version
              Include all changes later than version.

       -u, --until version
              Include all changes earlier than version.

       -f, --from version
              Include all changes equal or later than version.

       -t, --to version
              Include all changes up to or equal than version.

       -c, --count number
       -n number
              Include number entries from the top (or the tail if number is lower than 0).

       -o, --offset number
              Change the starting point for --count, counted from the top (or the tail if number is lower than 0).

CHANGELOG FORMATS
       It is possible to use a different format to the standard one, by providing a parser for that alternative format.

       In order to have dpkg-parsechangelog run the new parser, a line must be included within the last 40 lines of the changelog  file,  matching
       the Perl regular expression: “\schangelog-format:\s+([0-9a-z]+)\W”.  The part in parentheses should be the name of the format. For example:

              @@@ changelog-format: otherformat @@@

       Changelog format names are non-empty strings of alphanumerics.

       If  such  a line exists then dpkg-parsechangelog will look for the parser as a Dpkg::Changelog::Otherformat perl module; it is an error for
       it not being present.  The parser name in the perl module will be automatically capitalized.  The default changelog format is debian, and a
       parser for it is provided by default.

       The parser should be derived from the Dpkg::Changelog class and implement the required documented interface.

       If  the  changelog  format  which  is being parsed always or almost always leaves a blank line between individual change notes, these blank
       lines should be stripped out, so as to make the resulting output compact.

       If the changelog format does not contain date or package name information this information should be omitted from the  output.  The  parser
       should not attempt to synthesize it or find it from other sources.

       If  the  changelog  does  not  have  the  expected  format  the  parser should error out, rather than trying to muddle through and possibly
       generating incorrect output.

       A changelog parser may not interact with the user at all.

NOTES
       All Parser Options except for -v are only supported since dpkg 1.14.16.

       Short option parsing with non-bundled values available only since dpkg 1.18.0.

FILES
       debian/changelog
              The changelog file, used to obtain version-dependent information about the source package, such as the urgency and  distribution  of
              an upload, the changes made since a particular release, and the source version number itself.

SEE ALSO
       deb-changelog(5).

1.18.24                                                             2017-07-04                                              dpkg-parsechangelog(1)
