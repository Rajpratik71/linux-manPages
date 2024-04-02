HATTRIB(1)                                                    General Commands Manual                                                   HATTRIB(1)

NAME
       hattrib - change HFS file or directory attributes

SYNOPSIS
       hattrib [-t TYPE] [-c CREA] [-|+i] [-|+l] hfs-path [...]

       hattrib -b hfs-path

DESCRIPTION
       hattrib  permits  the  alteration of HFS file attributes. In the first form, the MacOS-defined type and creator attributes can be set using
       the -t and -c flags, respectively. A file's invisible flag can be set or cleared with +i and -i, respectively.  Finally,  a  file's  locked
       flag can be set or cleared with +l and -l.

       All  files  mentioned on the command line will receive the specified attributes, regardless of the file's current attributes. Any attribute
       not mentioned in the command line is left unchanged.

       In the second form, a single HFS pathname referring to a folder is given with the -b option, causing it to become "blessed"  as  the  MacOS
       System Folder. For this to be useful, the folder should contain valid Macintosh System and Finder files.

       Note that the locked and "blessed" attributes have little consequence to hfsutils.

SEE ALSO
       hfsutils(1), hls(1)

FILES
       $HOME/.hcwd

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            30-Aug-1998                                                         HATTRIB(1)
