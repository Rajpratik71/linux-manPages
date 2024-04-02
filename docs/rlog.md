RLOG(1)                                                                                    General Commands Manual                                                                                    RLOG(1)



NAME
       rlog - print log messages and other information about RCS files

SYNOPSIS
       rlog [ options ] file ...

DESCRIPTION
       rlog prints information about RCS files.

       Filenames matching an RCS suffix denote RCS files; all others denote working files.  Names are paired as explained in ci(1).

       rlog  prints  the following information for each RCS file: RCS file name, working file name, head (i.e., the number of the latest revision on the trunk), default branch, access list, locks, symbolic
       names, suffix, total number of revisions, number of revisions selected for printing, and descriptive text.  This is followed by entries for the selected revisions in reverse chronological order  for
       each  branch.   For  each revision, rlog prints revision number, author, date/time, state, number of lines added/deleted (with respect to the previous revision), locker of the revision (if any), and
       log message.  All times are displayed in Coordinated Universal Time (UTC) by default; this can be overridden with -z.  Without options, rlog prints complete information.  The options below  restrict
       this output.

       -L  Ignore RCS files that have no locks set.  This is convenient in combination with -h, -l, and -R.

       -R  Print only the name of the RCS file.  This is convenient for translating a working file name into an RCS file name.

       -h  Print only the RCS file name, working file name, head, default branch, access list, locks, symbolic names, and suffix.

       -t  Print the same as -h, plus the descriptive text.

       -N  Do not print the symbolic names.

       -b  Print information about the revisions on the default branch, normally the highest branch on the trunk.

       -ddates
           Print  information  about  revisions  with  a  checkin date/time in the ranges given by the semicolon-separated list of dates.  A range of the form d1<d2 or d2>d1 selects the revisions that were
           deposited between d1 and d2 exclusive.  A range of the form <d or d> selects all revisions earlier than d.  A range of the form d< or >d selects all revisions dated later than d.  If < or  >  is
           followed  by  =  then the ranges are inclusive, not exclusive.  A range of the form d selects the single, latest revision dated d or earlier.  The date/time strings d, d1, and d2 are in the free
           format explained in co(1).  Quoting is normally necessary, especially for < and >.  Note that the separator is a semicolon.

       -l[lockers]
           Print information about locked revisions only.  In addition, if the comma-separated list lockers of login names is given, ignore all locks other than those held by  the  lockers.   For  example,
           rlog -L -R -lwft RCS/* prints the name of RCS files locked by the user wft.

       -r[revisions]
           prints  information  about revisions given in the comma-separated list revisions of revisions and ranges.  A range rev1:rev2 means revisions rev1 to rev2 on the same branch, :rev means revisions
           from the beginning of the branch up to and including rev, and rev: means revisions starting with rev to the end of the branch containing rev.  An argument that is a branch means all revisions on
           that  branch.   A  range of branches means all revisions on the branches in that range.  A branch followed by a . means the latest revision in that branch.  A bare -r with no revisions means the
           latest revision on the default branch, normally the trunk.

       -sstates
           prints information about revisions whose state attributes match one of the states given in the comma-separated list states.

       -w[logins]
           prints information about revisions checked in by users with login names appearing in the comma-separated list logins.  If logins is omitted, the user's login is assumed.

       -q  This option has no effect; it is provided for consistency with other commands.

       -T  This option has no effect; it is present for compatibility with other RCS commands.

       -V  Print RCS's version number.

       -Vn Emulate RCS version n when generating logs.  See co(1) for more.

       -xsuffixes
           Use suffixes to characterize RCS files.  See ci(1) for details.

       rlog prints the intersection of the revisions selected with the options -d, -l, -s, and -w, intersected with the union of the revisions selected by -b and -r.

       -zzone specifies the date output format, and specifies the default time zone for date in the -ddates option.  The zone should be empty, a numeric UTC offset, or the special string LT for local time.
              The  default  is an empty zone, which uses the traditional RCS format of UTC without any time zone indication and with slashes separating the parts of the date; otherwise, times are output in
              ISO 8601 format with time zone indication.  For example, if local time is January 11, 1990, 8pm Pacific Standard Time, eight hours west of UTC, then the time is output as follows:

                     option    time output
                     -z        1990/01/12 04:00:00        (default)
                     -zLT      1990-01-11 20:00:00-08
                     -z+05:30  1990-01-12 09:30:00+05:30

EXAMPLES
           rlog  -L  -R  RCS/*
           rlog  -L  -h  RCS/*
           rlog  -L  -l  RCS/*
           rlog  RCS/*

       The first command prints the names of all RCS files in the subdirectory RCS that have locks.  The second command prints the headers of those files, and the third prints the headers plus the log mes-
       sages of the locked revisions.  The last command prints complete information.

ENVIRONMENT
       RCSINIT
              Options prepended to the argument list, separated by spaces.  A backslash escapes spaces within an option.  The RCSINIT options are prepended to the argument lists of most RCS commands.  Use-
              ful RCSINIT options include -q, -V, -x, and -z.

       RCS_MEM_LIMIT
              An integer lim, measured in kilobytes, specifying the threshold under which commands will try to use memory-based operations for processing the RCS file.  (For RCS files of size lim kilobytes
              or greater, RCS will use the slower standard input/output routines.)  Default value is 256.

       TMPDIR Name  of  the  temporary  directory.   If  not  set, the environment variables TMP and TEMP are inspected instead and the first value found is taken; if none of them are set, a host-dependent
              default is used, typically /tmp.

DIAGNOSTICS
       The exit status is zero if and only if all operations were successful.

IDENTIFICATION
       Author: Walter F. Tichy.
       Manual Page Revision: 5.8; Release Date: 2011-08-30.
       Copyright © 2010, 2011 Thien-Thi Nguyen.
       Copyright © 1990, 1991, 1992, 1993, 1994, 1995 Paul Eggert.
       Copyright © 1982, 1988, 1989 Walter F. Tichy.

SEE ALSO
       ci(1), co(1), ident(1), rcs(1), rcsdiff(1), rcsintro(1), rcsmerge(1), rcsfile(5).

       Walter F. Tichy, RCS--A System for Version Control, Software--Practice & Experience 15, 7 (July 1985), 637-654.

BUGS
       The separator for revision ranges in the -r option used to be - instead of :, but this leads to confusion when symbolic names contain -.  For backwards compatibility rlog -r still supports the old -
       separator, but it warns about this obsolete use.



GNU RCS 5.8                                                                                       2011-08-30                                                                                          RLOG(1)
