ZDIFF(1)                                                                                   General Commands Manual                                                                                   ZDIFF(1)



NAME
       zcmp, zdiff - compare compressed files

SYNOPSIS
       zcmp [ cmp_options ] file1 [ file2 ]
       zdiff [ diff_options ] file1 [ file2 ]

DESCRIPTION
       Zcmp  and  zdiff  are used to invoke the cmp or the diff program on files compressed via gzip.  All options specified are passed directly to cmp or diff.  If only 1 file is specified, then the files
       compared are file1 and an uncompressed file1.gz.  If two files are specified, then they are uncompressed if necessary and fed to cmp or diff.  The exit status from cmp or diff is preserved.

SEE ALSO
       cmp(1), diff(1), zmore(1), zgrep(1), znew(1), zforce(1), gzip(1), gzexe(1)

BUGS
       Messages from the cmp or diff programs refer to temporary filenames instead of those specified.



                                                                                                                                                                                                     ZDIFF(1)
