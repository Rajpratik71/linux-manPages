MIMEOPEN(1p)                                                                       User Contributed Perl Documentation                                                                       MIMEOPEN(1p)

NAME
       mimeopen - Open files by mimetype

SYNOPSIS
       mimeopen [options] [-] files

DESCRIPTION
       This script tries to determine the mimetype of a file and open it with the default desktop application. If no default application is configured the user is prompted with an "open with" menu in
       the terminal.

       To use this script you need the freedesktop mime-info database and the freedesktop desktop-file-utils package. See File::MimeInfo::Applications(3) for more details.

OPTIONS
       -a, --ask
           Do not execute the default application but ask which application to run.  This does not change the default application.

       -d, --ask-default
           Let the user choose a new default program for given files.

       -n, --no-ask
           Don't ask the user which program to use. Choose the default program or the first program known to handle the file mimetype. This does not set the default application.

       -M, --magic-only
           Do not check for extensions, globs or inode type, only look at the content of the file. This is particularly useful if for some reason you don't trust the name or the extension a file has.

       --database=mimedir:mimedir:...
           Force the program to look in these directories for the shared mime-info database. The directories specified by the basedir specification are ignored.

       -D, --debug
           Print debug information about how the mimetype was determined.

       -h, --help
       -u, --usage
           Print a help message and exits.

       -v, --version
           Print the version of the program and exit.

DEPRECATED OPTIONS
       -L, --dereference
           Follow symbolic links.  Deprecated because this is the logical default for this command.  Ignored silently.

BUGS
       If you find bugs, please file them in our Github issue tracker at <https://github.com/mbeijen/File-MimeInfo/issues>.

       See File::MimeInfo::Applications(3) and File::DesktopEntry(3) for some limitations.

AUTHOR
       Jaap Karssenberg <pardus@cpan.org> Maintained by Michiel Beijen <michiel.beijen@gmail.com>

COPYRIGHT
       Copyright (c) 2002, 2012 Jaap G Karssenberg. All rights reserved.  This program is free software; you can redistribute it and/or modify it under the same terms as Perl.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       mimetype(1), update-mime-database(1), update-desktop-database(1), File::MimeInfo(3), File::MimeInfo::Applications(3)

perl v5.20.2                                                                                    2015-02-23                                                                                   MIMEOPEN(1p)
