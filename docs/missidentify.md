MISSIDENTIFY(1)                                                   Jesse Kornblum                                                   MISSIDENTIFY(1)

NAME
       missidentify - Find executable files without an executable extension

SYNOPSIS
       missidentify [-rqablv] [-s|-S len] [-Vh] [FILES]

DESCRIPTION
       Miss  Identify  looks at the header of every file it processes and determines if it is a PE executable (Windows executable). Such files can
       include programs, device drivers, and DLLs. By default the program displays the filename if the extension of the file does not match one of
       the  known  executable  extensions  (.exe,  .com, .sys, or .dll). Other options can make the program display the filename of all executable
       files.

       -r     Enables recursive mode. All subdirectories are traversed. Please note that recursive mode cannot be used to examine all files  of  a
              given file extension. For example, calling missidentify -r *.txt will examine all files in directories that end in .txt.

       -q     Silent mode. All error messages except fatal errors are surpressed.

       -a     Display filenames of all executables

       -b     Enables bare mode. Strips any leading directory information from displayed filenames.  This flag may not be used in conjunction with
              the -l flag.

       -l     Enables relative file paths. Instead of printing the absolute path for each file, displays the relative file path  as  indicated  on
              the command line.  This flag may not be used in conjunction with the -b flag.

       -v     Verbose mode. Displays the name of every 10th file as a progress indicator.

       -s-S len
              Prints  strings  of  length  len with each filename. With lowercase letter, puts filename before string. With uppercase letter, puts
              strings before filename.

       -h     Show a help screen and exit.

       -V     Show the version number and exit.

BUGS
       The program can be fooled by any file with more than 1024 bytes between the MZ header and the PE header.

AUTHOR
       Miss Identify was written by Jesse Kornblum
       http://missidentify.sf.net/

COPYRIGHT
       Copyright (C) 2008 Jesse Kornblum. This is free software. You may redistribute copies of it under the  terms  of  the  GNU  General  Public
       License version 2. There is NO WARRANTY. See the file COPYING for more details.

SEE ALSO
       file(1)

Jesse Kornblum                                                  v1.0 - 20 Feb 2008                                                 MISSIDENTIFY(1)
