XKBCOMP(1)                                                                               General Commands Manual                                                                               XKBCOMP(1)

NAME
       xkbcomp - compile XKB keyboard description

SYNOPSIS
       xkbcomp [option] source [ destination ]

DESCRIPTION
       The  xkbcomp  keymap  compiler  converts a description of an XKB keymap into one of several output formats.   The most common use for xkbcomp is to create a compiled keymap file (.xkm extension)
       which can be read directly by XKB-capable X servers or utilities.   The keymap compiler can also produce C header files or XKB source files.  The C  header  files  produced  by  xkbcomp  can  be
       included by X servers or utilities that need a built-in default keymap.  The XKB source files produced by xkbcomp are fully resolved and can be used to verify that the files which typically make
       up an XKB keymap are merged correctly or to create a single file which contains a complete description of the keymap.

       The source may specify an X display, or an .xkb or .xkm file;  unless explicitly specified, the format of destination depends on the format of the source.   Compiling a .xkb (keymap source) file
       generates a .xkm (compiled keymap file) by default.   If the source is a .xkm file or an X display, xkbcomp generates a keymap source file by default.

       If the destination is an X display, the keymap for the display is updated with the compiled keymap.

       The  name  of  the  destination is usually computed from the name of the source, with the extension replaced as appropriate.  When compiling a single map from a file which contains several maps,
       xkbcomp constructs the destination file name by appending an appropriate extension to the name of the map to be used.

OPTIONS
       -a      Show all keyboard information, reporting implicit or derived information as a comment.  Only affects .xkb format output.

       -C      Produce a C header file as output (.h extension).

       -dflts  Compute defaults for any missing components, such as key names.

       -em1 msg
               Print msg before printing first error message.

       -emp msg
               Print msg at the start of each message line.

       -eml msg
               If there were any errors, print msg before exiting.

       -help, -?
               Show available options.

       -Idir   Specifies top-level directories to be searched for files included by the keymap description.  After all directories specified by -I options have been searched, the current directory  and
               finally, the default xkb directory /usr/share/X11/xkb will be searched.

               To  prevent  the  current  and default directories from being searched, use the -I option alone (i.e. without a directory), before any -I options that specify the directories you do want
               searched.

       -i deviceid
               If source or destination is a valid X display, load the keymap from/into the device with the specified ID (not name).

       -l      List maps that specify the map pattern in any files listed on the command line (not implemented yet).

       -m name Specifies a map to be compiled from an file with multiple entries.

       -merge  Merge the compiled information with the map from the server (not implemented yet).

       -o name Specifies a name for the generated output file.  The default is the name of the source file with an appropriate extension for the output format.

       -opt parts
               Specifies a list of optional parts.  Compilation errors in any optional parts are not fatal.  Parts may consist of any combination of the letters c, g,k,s,t which specify the compatibil‐
               ity map, geometry, keycodes, symbols and types, respectively.

       -Rdir   Specifies the root directory for relative path names.

       -synch  Force synchronization for X requests.

       -version
               Print version number.

       -w lvl  Controls the reporting of warnings during compilation.  A warning level of 0 disables all warnings; a warning level of 10 enables them all.

       -xkb    Generate a source description of the keyboard as output (.xkb extension).

       -xkm    Generate a compiled keymap file as output (.xkm extension).

SEE ALSO
       X(7)

COPYRIGHT
       Copyright 1994, Silicon Graphics Computer Systems and X Consortium, Inc.
       See X(7) for a full statement of rights and permissions.

AUTHOR
       Erik Fortune, Silicon Graphics

X Version 11                                                                                  xkbcomp 1.3.0                                                                                    XKBCOMP(1)
