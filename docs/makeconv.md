MAKECONV(1)                                ICU 60.2 Manual                                MAKECONV(1)

NAME
       makeconv - compile a converter table

SYNOPSIS
       makeconv  [ -h, -?, --help ] [ -c, --copyright ] [ -v, --verbose ] [ -d, --destdir destination
       ] convertertable ...

DESCRIPTION
       makeconv converts the ICU converter table convertertable into a binary file. The  binary  file
       has the same base name as convertertable but has a .cnv extension (instead of the typical .ucm
       extension of the convertertable file).  This binary file can then be read directly by ICU,  or
       used by pkgdata(1) for incorporation into a larger archive or library.

       The  convertertable  must  be  in the ICU ucm (Unicode Codepage Mapping) format in order to be
       understood by makeconv.  The ICU ucm format is  similar  to  the  IBM  NLTC  upmap/tpmap/rpmap
       files.   Comments  in the convertertable are handled as follows. If a comment (starting with a
       `#' sign) that is after some text does contain the fallback indicator `|' then only  the  text
       starting  with the `#' sign, and ending before the `|' sign, is ignored.  Otherwise, or if the
       comment is the first thing on the line, the comment runs up to the end of the line. This  spe‐
       cial  handling  of  comments is to accommodate the practice of putting fallback information in
       comments in the strict IBM NLTC ucmap format.

       Note that new converters will be automatically found by ICU after their installation in  ICU's
       data  directory.  They do not need to be listed in the convrtrs.txt(5) converters aliases file
       in order to be available to applications using ICU.  They do need to be listed  there  if  one
       wants to give them aliases, or tags, though.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -c, --copyright
              Include a copyright notice in the binary data.

       -v, --verbose
              Display extra informative messages during execution.

       -d, --destdir destination
              Set  the  destination  directory  to destination.  The default destination directory is
              specified by the environment variable ICU_DATA.

CAVEATS
       If an existing converter table is changed and recompiled using makeconv, the resulting  binary
       file must be packaged in the same way that it was packaged initially. For example, if convert‐
       ers were grouped together in an archive or a library with  pkgdata(1),  then  the  archive  or
       library must be rebuilt with the new binary file.  A standalone binary converter file will not
       take precedence over a packaged one.

ENVIRONMENT
       ICU_DATA  Specifies the directory containing ICU data. Defaults to  ${prefix}/share/icu/60.2/.
                 Some tools in ICU depend on the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.

VERSION
       60.2

COPYRIGHT
       Copyright (C) 2000 IBM, Inc. and others.

SEE ALSO
       convrtrs.txt(5)
       pkgdata(1)

ICU MANPAGE                                 16 April 2002                                 MAKECONV(1)
