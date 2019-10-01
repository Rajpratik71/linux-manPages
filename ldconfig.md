LDCONFIG(8)                                                                               Linux Programmer's Manual                                                                               LDCONFIG(8)



NAME
       ldconfig - configure dynamic linker run-time bindings

SYNOPSIS
       /sbin/ldconfig [ -nNvXV ] [ -f conf ] [ -C cache ] [ -r root ] directory ...
       /sbin/ldconfig -l [ -v ] library ...
       /sbin/ldconfig -p

DESCRIPTION
       ldconfig creates the necessary links and cache to the most recent shared libraries found in the directories specified on the command line, in the file /etc/ld.so.conf, and in the trusted directories
       (/lib and /usr/lib).  The cache is used by the run-time linker, ld.so or ld-linux.so.  ldconfig checks the header and filenames of the libraries it encounters when determining which versions  should
       have their links updated.

       ldconfig will attempt to deduce the type of ELF libs (i.e., libc5 or libc6/glibc) based on what C libs, if any, the library was linked against.

       Some  existing  libs  do  not contain enough information to allow the deduction of their type.  Therefore, the /etc/ld.so.conf file format allows the specification of an expected type.  This is used
       only for those ELF libs which we can not work out.  The format is "dirname=TYPE", where TYPE can be libc4, libc5, or libc6.  (This syntax also works on the command line.)  Spaces  are  not  allowed.
       Also see the -p option.  ldconfig should normally be run by the superuser as it may require write permission on some root owned directories and files.

OPTIONS
       -v     Verbose mode.  Print current version number, the name of each directory as it is scanned, and any links that are created.  Overrides quiet mode.

       -n     Only process directories specified on the command line.  Don't process the trusted directories (/lib and /usr/lib) nor those specified in /etc/ld.so.conf.  Implies -N.

       -N     Don't rebuild the cache.  Unless -X is also specified, links are still updated.

       -X     Don't update links.  Unless -N is also specified, the cache is still rebuilt.

       -f conf
              Use conf instead of /etc/ld.so.conf.

       -C cache
              Use cache instead of /etc/ld.so.cache.

       -r root
              Change to and use root as the root directory.

       -l     Library mode.  Manually link individual libraries.  Intended for use by experts only.

       -p     Print the lists of directories and candidate libraries stored in the current cache.

FILES
       /lib/ld.so          run-time linker/loader
       /etc/ld.so.conf     File containing a list of colon, space, tab, newline, or comma-separated directories in which to search for libraries.
       /etc/ld.so.cache    File containing an ordered list of libraries found in the directories specified in /etc/ld.so.conf, as well as those found in /lib and /usr/lib.

SEE ALSO
       ldd(1), ld.so(8)

COLOPHON
       This page is part of release 3.53 of the Linux man-pages project.  A description of the project, and information about reporting bugs, can be found at http://www.kernel.org/doc/man-pages/.



GNU                                                                                               2012-05-10                                                                                      LDCONFIG(8)
