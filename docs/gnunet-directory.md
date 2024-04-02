gnunet-directory(1)                    General Commands Manual                    gnunet-directory(1)

NAME
       gnunet-directory - display directories

SYNOPSIS
       gnunet-directory [OPTIONS] (FILENAME)*

DESCRIPTION
       gnunet-directory  lists the contents of one or more GNUnet directories.  A GNUnet directory is
       a binary file that contains a list of GNUnet file-sharing URIs and meta data.   The  names  of
       the directory files must be passed as command-line arguments to gnunet-directory.

       -c FILENAME, --config=FILENAME
              configuration file to use (useless option since gnunet-directory does not really depend
              on any configuration options)

       -h, --help
              print help page

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -v, --version
              print the version number

NOTES
       A GNUnet directory is a file containing a list of GNUnet URIs and meta  data.   The  keys  can
       point  to files, other directories or files in namespaces.  In other words, a GNUnet directory
       is similar to UNIX directories.  The difference to tar and zip is that GNUnet  directory  does
       not  contain  the  actual  files  (except  if they are really small, in which case they may be
       inlined), just symbolic (links), similar to directories with symbolic links in  UNIX  filesys‐
       tems.   The  benefit is that the individual files can be retrieved separately (if desired) and
       if some of the files are inserted to another node in GNUnet, this just increases their  avail‐
       ability but does not produce useless duplicates (for example, it is a better idea to publish a
       collection of pictures or compressed sound files using a GNUnet directory instead of  process‐
       ing  them  with  archivers  such as tar or zip first).  Directories can contain arbitrary meta
       data for each file.

       If a directory has missing blocks (for example, some blocks failed  to  download),  GNUnet  is
       typically  able to retrieve information about other files in the directory.  Files in a GNUnet
       directory have no particular order; the GNUnet code that generates a directory can reorder the
       entries in order to better fit the information about files into blocks of 32k.  Respecting 32k
       boundaries where possible makes it easier for gnunet-directory (and other  tools)  to  recover
       information from partially downloaded directory files.

       At  the  moment,  directories  can  be created by gnunet-fs-gtk and gnunet-publish.  Just like
       ordinary files, a directory can be published in a namespace.

       GNUnet directories use the (unregistered)  mimetype  application/gnunet-directory.   They  can
       show  up  among  normal  search  results.   The  directory  file  can be downloaded to disk by
       gnunet-download(1) for later processing or be handled more directly by gnunet-fs-gtk(1).

REPORTING BUGS
       Report bugs by using mantis  <https://gnunet.org/bugs/>  or  by  sending  electronic  mail  to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-fs-gtk(1), gnunet-publish(1), gnunet-search(1), gnunet-download(1)

GNUnet                                       25 Feb 2012                          gnunet-directory(1)
