ED2K_HASH(1)                                                       User Commands                                                      ED2K_HASH(1)

NAME
       ed2k_hash - A tool for generating ed2k-links

SYNOPSIS
       ed2k_hash [OPTIONS] <FILES or DIRECTORIES>

DESCRIPTION
       ed2k_hash  is useful for people who want to know the ed2k-links of files they are not currently sharing, or who want the ed2k-links for all
       files in certain directories etc. You can hash single files, multiple files, whole directories, or whole directory trees.

OPTIONS
       -a     wrap html link around ed2k-link (<a href="..."></a>)

       -p     in html link print basename _with_ path component

       -h     show this helpscreen

       -v     be verbose (show extra information)

       -r     recursively descend into directories

       -x     do not descend into directories

       -w     wait for keystroke when finished

AUTHOR
       This manual page was written by Tiago Bortoletto Vaz <tiago@debian-ba.org> for the Debian GNU/Linux system (but may be used by others).

ed2k_hash                                                         September 2009                                                      ED2K_HASH(1)
