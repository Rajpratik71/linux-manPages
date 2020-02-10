TAGPENDING(1)                                                                                                                                                                               TAGPENDING(1)

NAME
       tagpending - tags bugs that are to be closed in the latest changelog as pending

SYNOPSIS
       tagpending [options]

DESCRIPTION
       tagpending parses debian/changelog to determine which bugs would be closed if the package were uploaded. Each bug is then marked as pending, using bts(1) if it is not already so.

OPTIONS
       -n, --noact
           Check whether any bugs require tagging, but do not actually do so.

       -s, --silent
           Do not output any messages.

       -v, --verbose
           List each bug checked and tagged in turn.

       -f, --force
           Do not query the BTS, but (re)tag all bugs closed in the changelog.

       --comments
           Include the changelog header line and the entries relating to the tagged bugs as comments in the generated mail.  This is the default.

           Note that when used in combination with --to, the header line output will always be that of the most recent version.

       --no-comments
           Do not include changelog entries in the generated mail.

       -c, --confirm
           Tag bugs as both confirmed and pending.

       -t, --to version
           Parse changelogs for all versions strictly greater than version.

           Equivalent to dpkg-parsechangelog's -v option.

       -i, --interactive
           Display the message which would be sent to the BTS and, except when --noact was used, prompt for confirmation before sending it.

       -w, --wnpp
           For each bug that does not appear to belong to the current package, check whether it is filed against wnpp. If so, tag it. This allows e.g.  ITAs and ITPs closed in an upload to be tagged.

SEE ALSO
       bts(1) and dpkg-parsechangelog(1)

COPYRIGHT
       This program is Copyright 2008 by Adam D. Barratt <adam@adam-barratt.org.uk>.

       The shell script tagpending, on which this program is based, is Copyright 2004 by Joshua Kwan <joshk@triplehelix.org> with changes copyright 2004-7 by their respective authors.

       This program is licensed under the terms of the GPL, either version 2 of the License, or (at your option) any later version.

Debian Utilities                                                                                2016-03-23                                                                                  TAGPENDING(1)
