TOC2CUE(1)                                                                                          CDRDAO                                                                                         TOC2CUE(1)



NAME
       toc2cue - converts a TOC files of cdrdao(1) into a .cue file


SYNOPSIS
       toc2cue [-v verbosity_level] input_toc_file output_cue_file

       toc2cue [-V]


DESCRIPTION
       toc2cue converts a TOC file of cdrdao(1) into a .cue file.

       Please note that the resulting cue file is only valid if the toc-file was created with cdrdao(1) using the commands 'read-toc' or 'read-cd'. For manually created or edited toc-files the cue file may
       not be correct. This program just checks for the most obvious toc-file features that cannot be converted to a cue file. Furthermore, if the toc-file contains audio tracks the byte order of the image
       file will be wrong. This will result in static noise when the cue file is used for recording (even with cdrdao(1) itself).


OPTIONS
       -v verbosity_level
              Sets  the  verbosity  level  to  use,  can be a integer between 1 and 3. By default, only fatal errors are displayed. A verbosity level of 1 shows warnings, 2 warnings and errors, 3 warnings,
              errors and internal errors.

       -V     Prints the version of toc2cue.


SEE ALSO
       cdrdao(1)


AUTHOR
       toc2cue was written by Andreas Mueller <andreas@daneb.de> and is part of cdrdao(1).

       This manual page was written by Francois Wendling <frwendling@free.fr> and revised by Daniel Baumann <daniel@debian.org>, for the Debian project (but may be used by others).



1.2.2                                                                                             2006-11-17                                                                                       TOC2CUE(1)
