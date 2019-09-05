BLAME(1)                                                                                                                                  BLAME(1)

NAME
       blame - annotate RCS files

SYNOPSIS
       blame [options] file ...

DESCRIPTION
       blame outputs an annotated revision from each RCS file.  An annotated RCS file describes the revision and date in which each line was added
       to the file, and the author of each line.

       Pathnames matching an RCS suffix denote RCS files; all others denote working files.  Names are paired as explained in ci(1).

       A revision is selected by options for revision or branch number, checkin date/time, author, or  state.   When  the  selection  options  are
       applied  in  combination,  blame  retrieves the latest revision that satisfies all of them.  If none of the selection options is specified,
       blame retrieves the latest revision on the default branch (normally the trunk, see the -b option of rcs(1)).  The options -d  (--date),  -s
       (--state),  and  -w  (--author)  retrieve  from a single branch, the selected branch, which is specified by -r (--revision), or the default
       branch.

       blame always performs keyword substitution (see KEYWORD SUBSTITUTION in co(1)).

OPTIONS
       -r, --revision[=rev]
              Retrieves the latest revision whose number is less than or equal to rev.  If rev indicates a branch rather than a revision, the lat‐
              est  revision  on  that  branch  is  retrieved.   If rev is omitted, the latest revision on the default branch (see the -b option of
              rcs(1)) is annotated.  If rev is $, blame determines the revision number from keyword values in  the  working  file.   Otherwise,  a
              revision  is composed of one or more numeric or symbolic fields separated by periods.  If rev begins with a period, then the default
              branch (normally the trunk) is prepended to it.  If rev is a branch number followed by a period, then the latest  revision  on  that
              branch is used.  The numeric equivalent of a symbolic field is specified with the -n option of the commands ci(1) and rcs(1).

       -kkv, --expand=kv
              Generate keyword strings using the default form, e.g. $Revision: 1.3 $ for the Revision keyword.  This is the default.

       -kkvl, --expand=kvl
              Like  -kkv,  except that a locker's name is inserted into the value of the Header, Id, and Locker keyword strings if the given revi‐
              sion is currently locked.

       -kk, --expand=k
              Generate only keyword names in keyword strings; omit their values.  See KEYWORD SUBSTITUTION in co(1).  For example, for  the  Revi‐
              sion  keyword,  generate  the string $Revision$ instead of $Revision: 1.3 $.  Log messages are inserted after $Log$ keywords even if
              this option is specified.

       -ko, --expand=o
              Generate the old keyword string, present in the working file just before it was checked in.  For example, for the Revision  keyword,
              generate the string $Revision: 1.1 $ instead of $Revision: 1.3 $ if that is how the string appeared when the file was checked in.

       -kb, --expand=b
              Generate  a  binary  image  of  the old keyword string.  This acts like -ko, except it performs all working file input and output in
              binary mode.  This makes little difference on Posix and Unix hosts.

       -kv, --expand=v
              Generate only keyword values for keyword strings.  For example, for the Revision keyword, generate the string 1.3 instead of  $Revi‐
              sion: 1.3 $.

       -d, --date=date
              Retrieves  the  latest revision on the selected branch whose checkin date/time is less than or equal to date.  The date and time can
              be given in free format.  The time zone LT stands for local time; other common time zone names are  understood.   For  example,  the
              following dates are equivalent if local time is January 11, 1990, 8pm Pacific Standard Time, eight hours west of Coordinated Univer‐
              sal Time (UTC):

                     8:00 pm lt
                     4:00 AM, Jan. 12, 1990           default is UTC
                     1990-01-12 04:00:00+00           ISO 8601 (UTC)
                     1990-01-11 20:00:00-08           ISO 8601 (local time)
                     1990/01/12 04:00:00              traditional RCS format
                     Thu Jan 11 20:00:00 1990 LT      output of ctime(3) + LT
                     Thu Jan 11 20:00:00 PST 1990     output of date(1)
                     Fri Jan 12 04:00:00 GMT 1990
                     Thu, 11 Jan 1990 20:00:00 -0800  Internet RFC 822
                     12-January-1990, 04:00 WET

              Most fields in the date and time can be defaulted.  The default time zone is normally UTC, but this can  be  overridden  by  the  -z
              option.   The other defaults are determined in the order year, month, day, hour, minute, and second (most to least significant).  At
              least one of these fields must be provided.  For omitted fields that are of higher significance than the highest provided field, the
              time zone's current values are assumed.  For all other omitted fields, the lowest possible values are assumed.  For example, without
              -z, the date 20, 10:30 defaults to 10:30:00 UTC of the 20th of the UTC time zone's current month and year.  The  date/time  must  be
              quoted if it contains spaces.

       -s, --state=state
              Retrieves the latest revision on the selected branch whose state is set to state.

       -w, --login[=login]
              Retrieves  the latest revision on the selected branch which was checked in by the user with login name login.  If the argument login
              is omitted, the caller's login is assumed.

       -V, --version[=ver]
              If no argument is supplied, print blame's version number, and the version of RCS it emulates by default. Otherwise emulate the spec‐
              ified version.  See co(1) for details.

       -x, --suffixes=suffixes
              Use suffixes to characterize RCS files.  See ci(1) for details.

       -z, --zone=zone
              Specifies  the  date  output format in keyword substitution, and specifies the default time zone for date in the -ddate option.  The
              zone should be empty, a numeric UTC offset, or the special string LT for local time.  The default is an empty zone, which  uses  the
              traditional  RCS  format of UTC without any time zone indication and with slashes separating the parts of the date; otherwise, times
              are output in ISO 8601 format with time zone indication.  For example, if local time is January 11, 1990, 8pm Pacific Standard Time,
              eight hours west of UTC, then the time is output as follows:

                     option    time output
                     -z        1990/01/12 04:00:00        (default)
                     -zLT      1990-01-11 20:00:00-08
                     -z+05:30  1990-01-12 09:30:00+05:30

KEYWORD SUBSTITUION
       Strings  of the form $keyword$ and $keyword:...$ embedded in the text are replaced with strings of the form $keyword:value$ as described in
       co(1).

FILES
       blame never changes an RCS or working file.  It uses the effective user for all accesses, and it does not even read the working file unless
       a revision number of $ is specified.

ENVIRONMENT
       RCSINIT
              Options prepended to the argument list, separated by spaces.  See ci(1) for details.

DIAGNOSTICS
       The  working pathname and a separator line is written to the diagnostic output.  The exit status is zero if and only if all operations were
       successful.

EXAMPLES
       One day, there will be a whole bunch of useful examples here.

SEE ALSO
       rcsintro(1), ci(1), co(1), ctime(3), date(1), rcs(1), rcsfile(5)

AUTHOR
       Michael Chapman <foonly@users.sourceforge.net>

       Portions of this manual page are from ci(1) and co(1) by Walter F. Tichy and Paul Eggert.

COPYRIGHT AND LICENSE
       blame is copyright © 2004, 2005 Michael Chapman.

       blame is released under the terms and conditions of the GNU General Public License version 2.  Please read the COPYING file carefully.

                                                                    2005/06/30                                                            BLAME(1)
