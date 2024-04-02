RCSDIFF(1)                                                                                 General Commands Manual                                                                                 RCSDIFF(1)



NAME
       rcsdiff - compare RCS revisions

SYNOPSIS
       rcsdiff [ -ksubst ] [ -q ] [ -rrev1 [ -rrev2 ] ] [ -T ] [ -V[n] ] [ -xsuffixes ] [ -zzone ] [ diff options ] file ...

DESCRIPTION
       rcsdiff runs diff(1) to compare two revisions of each RCS file given.

       Filenames matching an RCS suffix denote RCS files; all others denote working files.  Names are paired as explained in ci(1).

       The  option -q suppresses diagnostic output.  Zero, one, or two revisions may be specified with -r.  The option -ksubst affects keyword substitution when extracting revisions, as described in co(1);
       for example, -kk -r1.1 -r1.2 ignores differences in keyword values when comparing revisions 1.1 and 1.2.  To avoid excess output from locker name substitution, -kkvl is assumed if (1)  at  most  one
       revision option is given, (2) no -k option is given, (3) -kkv is the default keyword substitution, and (4) the working file's mode would be produced by co -l.  See co(1) for details about -T, -V, -x
       and -z.  Otherwise, all options of diff(1) that apply to regular files are accepted, with the same meaning as for diff.

       If both rev1 and rev2 are omitted, rcsdiff compares the latest revision on the default branch (by default the trunk) with the contents of the corresponding working file.  This is useful  for  deter-
       mining what you changed since the last checkin.

       If rev1 is given, but rev2 is omitted, rcsdiff compares revision rev1 of the RCS file with the contents of the corresponding working file.

       If both rev1 and rev2 are given, rcsdiff compares revisions rev1 and rev2 of the RCS file.

       Both rev1 and rev2 may be given numerically or symbolically.

EXAMPLE
       The command

               rcsdiff  f.c

       compares the latest revision on the default branch of the RCS file to the contents of the working file f.c.

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
       Exit status is 0 for no differences during any comparison, 1 for some differences, 2 for trouble.

IDENTIFICATION
       Author: Walter F. Tichy.
       Manual Page Revision: 5.8; Release Date: 2011-08-30.
       Copyright © 2010, 2011 Thien-Thi Nguyen.
       Copyright © 1990, 1991, 1992, 1993 Paul Eggert.
       Copyright © 1982, 1988, 1989 Walter F. Tichy.

SEE ALSO
       ci(1), co(1), diff(1), ident(1), rcs(1), rcsintro(1), rcsmerge(1), rlog(1).

       Walter F. Tichy, RCS--A System for Version Control, Software--Practice & Experience 15, 7 (July 1985), 637-654.



GNU RCS 5.8                                                                                       2011-08-30                                                                                       RCSDIFF(1)
