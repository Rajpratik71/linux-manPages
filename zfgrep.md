ZGREP(1)                                                      General Commands Manual                                                     ZGREP(1)

NAME
       zgrep - search possibly compressed files for a regular expression

SYNOPSIS
       zgrep [ grep_options ] [ -e ] pattern filename...

DESCRIPTION
       Zgrep  invokes  grep  on  compressed  or  gzipped  files.   These  grep  options  will  cause  zgrep  to  terminate  with  an  error  code:
       (-[drRzZ]|--di*|--exc*|--inc*|--rec*|--nu*).  All other options specified are passed directly to grep.  If no file is specified,  then  the
       standard input is decompressed if necessary and fed to grep.  Otherwise the given files are uncompressed if necessary and fed to grep.

       If the GREP environment variable is set, zgrep uses it as the grep program to be invoked.

EXIT CODE
       2 - An option that is not supported was specified.

AUTHOR
       Charles Levert (charles@comm.polymtl.ca)

SEE ALSO
       grep(1), gzexe(1), gzip(1), zdiff(1), zforce(1), zmore(1), znew(1)

                                                                                                                                          ZGREP(1)
