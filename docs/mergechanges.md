MERGECHANGES(1)                                               General Commands Manual                                              MERGECHANGES(1)

NAME
       mergechanges - merge multiple changes files

SYNOPSIS
       mergechanges [-d] [-f] [-S] [-i] file1 file2 [file...]

DESCRIPTION
       mergechanges merges two or more .changes files, merging the Architecture, Description and Files (and Checksums-*, if present) fields of the
       two.  There are checks made to ensure that the changes files are from the same source package and version and use  the  same  changes  file
       Format.  The first changes file is used as the basis and the information from the later ones is merged into it.

       The  output  is  normally written to stdout.  If the -f option is given, the output is written to package_version_multi.changes instead, in
       the same directory as the first changes file listed.

       If the -d option is given and the output is generated successfully, the input files will be deleted.

       If the -i or --indep option is given, source packages and architecture-independent (Architecture: all) packages are included in the output,
       but architecture-dependent packages are not.

       If the -S or --source option is given, only source packages are included in the output.

AUTHOR
       Gergely  Nagy  <algernon@debian.org>,  modifications  by  Julian  Gilbey  <jdg@debian.org>,  Mark  Hymers <mhy@debian.org>, Adam D. Barratt
       <adam@adam-barratt.org.uk>, and Simon McVittie <smcv@debian.org>.

DEBIAN                                                           Debian Utilities                                                  MERGECHANGES(1)
