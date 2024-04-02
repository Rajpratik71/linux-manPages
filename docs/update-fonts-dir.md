update-fonts-dir(8)                                                                     System Manager's Manual                                                                    update-fonts-dir(8)

NAME
       update-fonts-dir - compile fonts.dir files

SYNOPSIS
       update-fonts-dir [OPTION] directory ...

DESCRIPTION
       update-fonts-dir  creates  a  fonts.dir  file  in  an  X  font directory by invoking mkfontdir(1x) with the appropriate arguments.  It is typically invoked only from the post-installation and
       post-removal scripts of a package containing fonts for the X Window System, but may be invoked at any time to reconstruct fonts.dir files.  For each directory, which is simply the last compo‐
       nent of its path (such as ‘75dpi’ or ‘misc’), update-fonts-dir will generate either /usr/lib/X11/fonts/directory/fonts.dir or /usr/share/fonts/X11/directory/fonts.dir from the fonts.scale and
       font files found within it.

       This enables multiple packages to provide names for fonts in the same directory.  No font package actually provides the fonts.dir file in the X font directory itself, so there is no danger of
       overwriting one package's font names with those of another.

       For  instance, the two packages ‘xfonts-base’ (real) and ‘xfonts-nifty’ (hypothetical) may both install fonts into the directory /usr/lib/X11/fonts/misc, and update-fonts-dir will ensure that
       the fonts.dir file in that directory contains information about the font files provided by both packages.

       The format of fonts.dir files is described in the mkfontdir(1x) manual page.

       An example of how to use update-fonts-dir in package maintainer scripts is provided in the Debian Policy Manual.

OPTIONS
       -h, --help displays a brief usage message and exits.

       -7, --x11r7-layout switches the font layout to the one introduced in X11R7: fonts in /usr/share/fonts/X11/directory (default is: fonts in /usr/lib/X11/fonts/directory)

OPERANDS
       update-fonts-dir takes one or more X font directory names to operate on as operands.  Only the final path component of the directory name should be specified; e.g.,
              update-fonts-dir 75dpi
       is correct, while ‘update-fonts-dir /usr/X11R6/lib/X11/fonts/75dpi’ and ‘update-fonts-dir /usr/lib/X11/fonts/75dpi’ are not.

ENVIRONMENT
       COLUMNS
              indicates the width of the terminal device in character cells.  This value is used for formatting diagnostic messages.  If not set, the terminal is queried using stty(1)  to  determine
              its width.  If that fails, a value of ‘80’ is assumed.

DIAGNOSTICS
   Errors
       usage error: one or more font directories must be provided
              update-fonts-dir was invoked without operands.  Supply one or more X font directory names to operate on.

       usage error: unrecognized option
              update-fonts-dir was invoked with an unrecognized option argument.  Use only the options documented in “OPTIONS”, above.

       fatal error: path to X font directory must be used
              A directory name was supplied that was not an X font directory name.  Supply X font directory names only.

   Warnings
       warning: absolute path directory was provided
              Usage of absolute paths is deprecated.  Use only the final component of the X font directory name for directory.

       warning: directory does not exist or is not a directory
              The supplied directory was invalid.  update-fonts-dir skipped it.

EXIT STATUS
       0      update-fonts-dir ran successfully.

       1      update-fonts-dir experienced a fatal error; see the section on diagnostic messages above.

       2      update-fonts-dir was invoked with invalid arguments.

BUGS
       See  the Debian Bug Tracking System ⟨https://bugs.debian.org/xfonts-utils⟩.  If you wish to report a bug in update-fonts-dir, please see /usr/share/doc/debian/bug-reporting.txt or the report‐
       bug(1) command.

AUTHOR
       update-fonts-dir was written by Branden Robinson.

SEE ALSO
       mkfontdir(1x)

Debian Project                                                                                2004-11-11                                                                           update-fonts-dir(8)
