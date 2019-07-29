update-fonts-scale(8)                                                                   System Manager's Manual                                                                  update-fonts-scale(8)

NAME
       update-fonts-scale - generate fonts.scale files

SYNOPSIS
       update-fonts-scale [OPTION] directory ...

DESCRIPTION
       update-fonts-scale  assembles  a  fonts.scale  file  in  an  X  font directory using one or more scale files found in a subdirectory of /etc/X11/fonts/.  It is typically invoked only from the
       post-installation and post-removal scripts of a package containing scalable fonts usable by the X Window System whose X LFD font names are not in the font files themselves, but may be invoked
       at  any  time  to  reconstruct  fonts.scale  files.  For each directory, which is either an absolute path to an X font directory or (preferably) simply the last component of its path (such as
       ‘75dpi’  or  ‘misc’),  update-fonts-scale  will  assemble  either  /usr/lib/X11/fonts/directory/fonts.scale  or  /usr/share/fonts/X11/directory/fonts.scale  from  the  index  files  found  at
       /etc/X11/fonts/directory/package.scale, where package is the name of the package installing the fonts.

       This  enables multiple packages to provide names for fonts in the same directory.  No font package actually provides the fonts.scale file in the X font directory itself, so there is no danger
       of overwriting one package's font names with those of another.

       For instance, the two packages ‘xfonts-scalable’ (real) and ‘xfonts-nifty’ (hypothetical) may  both  install  fonts  into  the  directory  /usr/lib/X11/fonts/Type1.   They  each  place  their
       fonts.scale  files  in  /etc/X11/fonts/Type1/xfonts-scalable.scale and /etc/X11/fonts/Type1/xfonts-nifty.scale (respectively).  update-fonts-scale concatenates these two files (as well as any
       others that match /etc/X11/fonts/Type1/*.scale) into /usr/lib/X11/fonts/Type1/fonts.scale.

       The format for fonts.scale files is given in the mkfontdir(1x) manual page.

       An example of how to use update-fonts-scale in package maintainer scripts is provided in the Debian Policy Manual.

OPTIONS
       -h, --help displays a brief usage message and exits.

OPERANDS
       update-fonts-scale takes one or more X font directory names to operate on as operands.  Only the final path component of the directory name should be specified; e.g.,
              update-fonts-scale 75dpi
       is correct, while ‘update-fonts-scale /usr/X11R6/lib/X11/fonts/75dpi’ and ‘update-fonts-scale /usr/lib/X11/fonts/75dpi’ are not.

ENVIRONMENT
       COLUMNS
              indicates the width of the terminal device in character cells.  This value is used for formatting diagnostic messages.  If not set, the terminal is queried using stty(1)  to  determine
              its width.  If that fails, a value of ‘80’ is assumed.

       DEBUG  determines  whether  low-level  diagnostic messages are issued to standard error output.  A null (empty) or unset value indicates that they are not, and a non-null value indicates that
              they are.

DIAGNOSTICS
   Errors
       usage error: one or more font directories must be provided
              update-fonts-scale was invoked without operands.  Supply one or more X font directory names to operate on.

       usage error: unrecognized option
              update-fonts-scale was invoked with an unrecognized option argument.  Use only the options documented in “OPTIONS”, above.

       fatal error: path to X font directory must be used
              A directory name was supplied that was not an X font directory name.  Supply X font directory names only.

   Warnings
       warning: absolute path directory was provided
              Usage of absolute paths is deprecated.  Use only the final component of the X font directory name for directory.

       warning: directory does not exist or is not a directory
              The supplied directory was invalid.  update-fonts-scale skipped it.

   Notes
       Notes are only displayed under special circumstances; see “ENVIRONMENT”.  above.

       note: index references nonexistent font file filename
              The index file /etc/X11/fonts/directory/package.scale, refers to a nonexistent font file, filename.  This is normal when package has been removed, but not purged from the  system.   In
              other circumstances, it likely indicates an error in package.

EXIT STATUS
       0      update-fonts-scale ran successfully.

       1      update-fonts-scale experienced a fatal error; see the section on diagnostic messages above.

       2      update-fonts-scale was invoked with invalid arguments.

BUGS
       See  the  Debian  Bug  Tracking  System  ⟨https://bugs.debian.org/xfonts-utils⟩.   If you wish to report a bug in update-fonts-scale, please see /usr/share/doc/debian/bug-reporting.txt or the
       reportbug(1) command.

AUTHOR
       update-fonts-scale was written by Branden Robinson.

SEE ALSO
       mkfontdir(1x)

Debian Project                                                                                2004-11-12                                                                         update-fonts-scale(8)
