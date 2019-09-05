CABEXTRACT(1)                                                 General Commands Manual                                                CABEXTRACT(1)

NAME
       cabextract - program to extract files from Microsoft cabinet (.cab) archives

SYNOPSIS
       cabextract [-ddir] [-f] [-Fpattern] [-h] [-l] [-L] [-p] [-q] [-s] [-t] [-v]  cabinet files ...

DESCRIPTION
       cabextract  is  a  program that un-archives files in the Microsoft cabinet file format (.cab) or any binary file which contains an embedded
       cabinet file (frequently found in .exe files).

       cabextract will extract all files from all cabinet files specified on the command line.

       To extract a multi-part cabinet consisting of several files, only the first cabinet file needs to be given as an argument to cabextract  as
       it  will  automatically  look  for the remaining files. To prevent cabextract from extracting cabinet files you did not specify, use the -s
       option.

OPTIONS
       A summary of options is included below.

       -d dir Extracts all files into the directory dir.

       -f     When testing or extracting cabinet files, corrupted MSZIP blocks will be ignored. A warning will be printed  if  a  corrupted  MSZIP
              block is encountered.

       -F pattern
              Only  files with names that match the shell pattern pattern shall be listed, tested or extracted. On non-GNU systems, this match may
              be case-sensitive.

       -h     Prints a page of help and exits.

       -l     Lists the contents of the given cabinet files, rather than extracting them.

       -L     When extracting cabinet files, makes each extracted file's name lowercase.

       -p     Files shall be extracted to standard output.

       -q     When extracting cabinet files, suppresses all messages except errors and warnings.

       -s     When testing, listing or extracting cabinets which span multiple files, only cabinet files given on the command line shall be used.

       -t     Tests the integrity of the cabinet. Files are decompressed, but not written to disk or standard output.  If  the  file  successfully
              decompresses, the MD5 checksum of the file is printed.

       -v     If given alone on the command line, prints the version of cabextract and exits. Given with a list of cabinet files, it will list the
              contents of the cabinet files.

AUTHOR
       This manual page was written by Stuart Caie <kyzer@4u.net>, based on the one written by Eric Sharkey <sharkey@debian.org>, for  the  Debian
       GNU/Linux system.

SEE ALSO
       lcab(1)

                                                                 October 30, 2005                                                    CABEXTRACT(1)
