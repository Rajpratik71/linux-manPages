AMARCHIVER(8)                                                                           System Administration Commands                                                                          AMARCHIVER(8)



NAME
       amarchiver - Create, extract or list amanda archive

SYNOPSIS
       amarchiver --version|--create|--extract|--list [--verbose] [--file file] [filename]...

DESCRIPTION
       Amarchiver manipulates amanda archive file. On creation, amarchiver doesn't recurse into directories. If a filename specifies a directory, it will be ignored. If it specifies a character device,
       amarchiver reads the device and archives the data. If a filename specifies a named pipe, amarchiver reads the named pipe and archives the data.

       Note that this tool is more limited than the Amanda archive library, and may not be appropriate for some archive files -- particularly those which use non-strings in their filenames.

OPTIONS
       --version
           print the amarchiver version

       --create
           Create an amanda archive. Only the supplied filenames are included. With one --verbose, lists the filenames. With two, lists the filenames and sizes.

       --list
           List the filenames in an amanda archive. No additional filenames are allowed on the command line.

       --extract
           Extract an amanda archive. If filenames are supplied, only those files are extracted. Files are created in the current directory, suffixed with a dot ('.') and the attribute ID.

       --verbose
           Give more information.

       --file file
           Create, list or extract from the given file instead of stdin/stdout.

SEE ALSO
       amanda(8), amanda-archive-format(5)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHORS
       Dustin J. Mitchell <dustin@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)

       Jean-Louis Martineau <martineau@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)



Amanda 3.3.3                                                                                      01/10/2013                                                                                    AMARCHIVER(8)
