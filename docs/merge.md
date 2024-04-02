MERGE(1)                                                                                   General Commands Manual                                                                                   MERGE(1)



NAME
       merge - three-way file merge

SYNOPSIS
       merge [ options ] file1 file2 file3

DESCRIPTION
       merge incorporates all changes that lead from file2 to file3 into file1.  The result ordinarily goes into file1.  merge is useful for combining separate changes to an original.  Suppose file2 is the
       original, and both file1 and file3 are modifications of file2.  Then merge combines both changes.

       A conflict occurs if both file1 and file3 have changes in a common segment of lines.  If a conflict is found, merge normally outputs a warning and brackets the  conflict  with  <<<<<<<  and  >>>>>>>
       lines.  A typical conflict will look like this:

              <<<<<<< file A
              lines in file A
              =======
              lines in file B
              >>>>>>> file B

       If there are conflicts, the user should edit the result and delete one of the alternatives.

OPTIONS
       -A     Output conflicts using the -A style of diff3(1), if supported by diff3.  This merges all changes leading from file2 to file3 into file1, and generates the most verbose output.

       -E, -e These options specify conflict styles that generate less information than -A.  See diff3(1) for details.  The default is -E.  With -e, merge does not warn about conflicts.

       -L label
              This option may be given up to three times, and specifies labels to be used in place of the corresponding file names in conflict reports.  That is, merge -L x -L y -L z a b c generates output
              that looks like it came from files x, y and z instead of from files a, b and c.

       -p     Send results to standard output instead of overwriting file1.

       -q     Quiet; do not warn about conflicts.

       -V     Print RCS's version number.

DIAGNOSTICS
       Exit status is 0 for no conflicts, 1 for some conflicts, 2 for trouble.

IDENTIFICATION
       Author: Walter F. Tichy.
       Manual Page Revision: 5.8; Release Date: 2011-08-30.
       Copyright © 2010, 2011 Thien-Thi Nguyen.
       Copyright © 1990, 1991, 1992, 1993, 1994, 1995 Paul Eggert.
       Copyright © 1982, 1988, 1989 Walter F. Tichy.

SEE ALSO
       diff3(1), diff(1), rcsmerge(1), co(1).

BUGS
       It normally does not make sense to merge binary files as if they were text, but merge tries to do it anyway.



GNU RCS 5.8                                                                                       2011-08-30                                                                                         MERGE(1)
