update-fonts-alias(8)                   System Manager's Manual                  update-fonts-alias(8)

NAME
       update-fonts-alias - compile fonts.alias files

SYNOPSIS
       update-fonts-alias [OPTION] directory ...

DESCRIPTION
       update-fonts-alias  assembles a fonts.alias file in an X font directory using one or more alias
       files found in a subdirectory of /etc/X11/fonts/.   It  is  typically  invoked  only  from  the
       post-installation  and  post-removal scripts of a package containing X Window System fonts that
       provide aliases for their XLFD names, but may be invoked at any time to reconstruct fonts.alias
       files.   For each directory, which is simply the last component of its path (such as ‘75dpi’ or
       ‘misc’), update-fonts-alias will assemble  either  /usr/lib/X11/fonts/directory/fonts.alias  or
       /usr/share/fonts/X11/directory/fonts.alias   from  the  files  found  in  /etc/X11/fonts/direc‐
       tory/package.alias.

       This enables multiple packages to provide aliases for fonts in the  same  directory.   No  font
       package  actually  provides the fonts.alias file in the X font directory itself, so there is no
       danger of overwriting one package's aliases with those of another.

       For instance, the two packages ‘xfonts-base’  and  ‘xfonts-base-transcoded’  may  both  install
       fonts  into  the directory /usr/lib/X11/fonts/misc.  They each place their fonts.alias files in
       /etc/X11/fonts/misc/xfonts-base.alias and /etc/X11/fonts/misc/xfonts-base-transcoded.alias (re‐
       spectively).  update-fonts-alias concatenates these two files (as well as any others that match
       /etc/X11/fonts/misc/*.alias) into /usr/lib/X11/fonts/misc/fonts.alias.

       The format of fonts.alias files is described in the mkfontdir(1x) manual page.

       An example of how to use update-fonts-alias in package maintainer scripts is  provided  in  the
       Debian Policy Manual.

OPTIONS
       -h, --help displays a brief usage message and exits.

OPERANDS
       update-fonts-alias  takes  one  or more X font directory names to operate on as operands.  Only
       the final path component of the directory name should be specified; e.g.,
              update-fonts-alias 75dpi
       is correct, while ‘update-fonts-alias /usr/X11R6/lib/X11/fonts/75dpi’  and  ‘update-fonts-alias
       /usr/lib/X11/fonts/75dpi’ are not.

ENVIRONMENT
       COLUMNS
              indicates  the  width of the terminal device in character cells.  This value is used for
              formatting diagnostic messages.  If not set, the terminal is queried  using  stty(1)  to
              determine its width.  If that fails, a value of ‘80’ is assumed.

DIAGNOSTICS
   Errors
       usage error: one or more font directories must be provided
              update-fonts-alias  was  invoked  without operands.  Supply one or more X font directory
              names to operate on.

       usage error: unrecognized option
              update-fonts-alias was invoked with an unrecognized option argument.  Use only  the  op‐
              tions documented in “OPTIONS”, above.

       fatal error: path to X font directory must be used
              A  directory name was supplied that was not an X font directory name.  Supply X font di‐
              rectory names only.

   Warnings
       warning: absolute path directory was provided
              Usage of absolute paths is deprecated.  Use only the final component of the X  font  di‐
              rectory name for directory.

       warning: directory does not exist or is not a directory
              The supplied directory was invalid.  update-fonts-alias skipped it.

EXIT STATUS
       0      update-fonts-alias ran successfully.

       1      update-fonts-alias  experienced  a  fatal  error; see the section on diagnostic messages
              above.

       2      update-fonts-alias was invoked with invalid arguments.

BUGS
       See the Debian Bug Tracking System ⟨https://bugs.debian.org/xfonts-utils⟩.  If you wish to  re‐
       port a bug in update-fonts-alias, please see /usr/share/doc/debian/bug-reporting.txt or the re‐
       portbug(1) command.

AUTHOR
       update-fonts-alias was written by Branden Robinson.

SEE ALSO
       mkfontdir(1x)

Debian Project                                2004-11-11                         update-fonts-alias(8)
