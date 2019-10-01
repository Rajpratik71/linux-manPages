RCSMERGE(1)                                                                                General Commands Manual                                                                                RCSMERGE(1)



NAME
       rcsmerge - merge RCS revisions

SYNOPSIS
       rcsmerge [options] file

DESCRIPTION
       rcsmerge incorporates the changes between two revisions of an RCS file into the corresponding working file.

       Filenames matching an RCS suffix denote RCS files; all others denote working files.  Names are paired as explained in ci(1).

       At  least  one revision must be specified with one of the options described below, usually -r.  At most two revisions may be specified.  If only one revision is specified, the latest revision on the
       default branch (normally the highest branch on the trunk) is assumed for the second revision.  Revisions may be specified numerically or symbolically.

       rcsmerge prints a warning if there are overlaps, and delimits the overlapping regions as explained in merge(1).  The command is useful for incorporating changes into a checked-out revision.

OPTIONS
       -A     Output conflicts using the -A style of diff3(1), if supported by diff3.  This merges all changes leading from file2 to file3 into file1, and generates the most verbose output.

       -E, -e These options specify conflict styles that generate less information than -A.  See diff3(1) for details.  The default is -E.  With -e, rcsmerge does not warn about conflicts.

       -ksubst
              Use subst style keyword substitution.  See co(1) for details.  For example, -kk -r1.1 -r1.2 ignores differences in keyword values when merging the changes from 1.1 to 1.2.  It  normally  does
              not make sense to merge binary files as if they were text, so rcsmerge refuses to merge files if -kb expansion is used.

       -p[rev]
              Send the result to standard output instead of overwriting the working file.

       -q[rev]
              Run quietly; do not print diagnostics.

       -r[rev]
              Merge with respect to revision rev.  Here an empty rev stands for the latest revision on the default branch, normally the head.

       -T     This option has no effect; it is present for compatibility with other RCS commands.

       -V     Print RCS's version number.

       -Vn    Emulate RCS version n.  See co(1) for details.

       -xsuffixes
              Use suffixes to characterize RCS files.  See ci(1) for details.

       -zzone Use zone as the time zone for keyword substitution.  See co(1) for details.

EXAMPLES
       Suppose  you  have released revision 2.8 of f.c.  Assume furthermore that after you complete an unreleased revision 3.4, you receive updates to release 2.8 from someone else.  To combine the updates
       to 2.8 and your changes between 2.8 and 3.4, put the updates to 2.8 into file f.c and execute

           rcsmerge  -p  -r2.8  -r3.4  f.c  >f.merged.c

       Then examine f.merged.c.  Alternatively, if you want to save the updates to 2.8 in the RCS file, check them in as revision 2.8.1.1 and execute co -j:

           ci  -r2.8.1.1  f.c
           co  -r3.4  -j2.8:2.8.1.1  f.c

       As another example, the following command undoes the changes between revision 2.4 and 2.8 in your currently checked out revision in f.c.

           rcsmerge  -r2.8  -r2.4  f.c

       Note the order of the arguments, and that f.c will be overwritten.

ENVIRONMENT
       RCSINIT
              Options prepended to the argument list, separated by spaces.  A backslash escapes spaces within an option.  The RCSINIT options are prepended to the argument lists of most RCS commands.  Use‐
              ful RCSINIT options include -q, -V, -x, and -z.

       RCS_MEM_LIMIT
              An integer lim, measured in kilobytes, specifying the threshold under which commands will try to use memory-based operations for processing the RCS file.  (For RCS files of size lim kilobytes
              or greater, RCS will use the slower standard input/output routines.)  Default value is 256.

       TMPDIR Name of the temporary directory.  If not set, the environment variables TMP and TEMP are inspected instead and the first value found is taken; if  none  of  them  are  set,  a  host-dependent
              default is used, typically /tmp.

DIAGNOSTICS
       Exit status is 0 for no overlaps, 1 for some overlaps, 2 for trouble.

IDENTIFICATION
       Author: Walter F. Tichy.
       Manual Page Revision: 5.9.0; Release Date: 2014-06-10.
       Copyright © 2010-2013 Thien-Thi Nguyen.
       Copyright © 1990, 1991, 1992, 1993, 1994, 1995 Paul Eggert.
       Copyright © 1982, 1988, 1989 Walter F. Tichy.

SEE ALSO
       ci(1), co(1), ident(1), merge(1), rcs(1), rcsdiff(1), rlog(1), rcsfile(5).

       Walter F. Tichy, RCS--A System for Version Control, Software--Practice & Experience 15, 7 (July 1985), 637-654.

       The full documentation for RCS is maintained as a Texinfo manual.  If the info(1) and RCS programs are properly installed at your site, the command

              info rcs

       should give you access to the complete manual.  Additionally, the RCS homepage:

              http://www.gnu.org/software/rcs/

       has news and links to the latest release, development site, etc.



GNU RCS 5.9.0                                                                                     2014-06-10                                                                                      RCSMERGE(1)
