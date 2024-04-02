ICUPKG(8)                                  ICU 60.2 Manual                                  ICUPKG(8)

NAME
       icupkg - extract or modify an ICU .dat archive

SYNOPSIS
       icupkg  [ -h, -?, --help ] [ -tl, --type l | -tb, --type b | -te, --type e ] [ -c, --copyright
       | -C, --comment comment ] [ -a, --add list ] [ -r, --remove list ] [ -x, --extract  list  ]  [
       -l, --list ] [ -s, --sourcedir source ] [ -d, --destdir destination ] [ -w, --writepkg ] [ -m,
       --matchmode mode ] infilename [ outfilename ]

DESCRIPTION
       icupkg reads the input ICU .dat package file, modify it according to the options, swap  it  to
       the desired platform properties (charset & endianness), and optionally write the resulting ICU
       .dat package to the output file.  Items are removed, then added, then  extracted  and  listed.
       An ICU .dat package is written if items are removed or added, or if the input and output file‐
       names differ, or if the -w, --writepkg option is set.

       If the input filename is "new" then an empty package is created.  If the  output  filename  is
       missing,  then  it  is  automatically generated from the input filename. If the input filename
       ends with an l, b, or e matching its platform properties, then the output filename  will  con‐
       tain the letter from the -t, --type option.

       This  tool  can also be used to just swap a single ICU data file, replacing the former icuswap
       tool. For this mode, provide the infilename (and optional outfilename) for a  non-package  ICU
       data  file.  Allowed options include -t, -w, -s and -d The filenames can be absolute, or rela‐
       tive to the source/dest dir paths.  Other options are not allowed in this mode.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -tl, --type l
              Output for little-endian/ASCII charset family.  The output type defaults to  the  input
              type.

       -tb, --type b
              Output  for  big-endian/ASCII  charset  family.   The output type defaults to the input
              type.

       -te, --type e
              Output for big-endian/EBCDIC charset family.  The output type  defaults  to  the  input
              type.

       -c,--copyright
              Include the ICU copyright notice in the resulting data.

       -C, --comment comment
              Include  the  specified  comment  in  the  resulting  data instead of the ICU copyright
              notice.

       -a, --add list
              Add items from the list to the package. The list can be a single filename with  a  .txt
              file extension containing a list of item filenames, or an ICU .dat package filename.

       -r, --remove list
              Remove  items  from the list from the package. The list can be a single filename with a
              .txt file extension containing a list of item filenames, or an ICU .dat  package  file‐
              name.

       -x, --extract list
              Extract  items from the list from the package. The list can be a single filename with a
              .txt file extension containing a list of item filenames, or an ICU .dat  package  file‐
              name.

       -m, --matchmode mode
              Set the matching mode for item names with wildcards.

       -s, --sourcedir source
              Set the source directory to source.  The default source directory is the current direc‐
              tory.

       -d, --destdir destination
              Set the destination directory to destination.  The default destination directory is the
              current directory.

       -l, --list
              List the package items to stdout (after modifying the package).

LIST FILE SYNTAX
       Items are listed on one or more lines and separated by whitespace (space+tab).  Comments begin
       with # and are ignored. Empty lines are ignored. Lines where the first non-whitespace  charac‐
       ter is one of "%&'()*+,-./:;<=>?_ are also ignored to reserve for future syntax.

       Items  for removal or extraction may contain a single * wildcard character. The * matches zero
       or more characters. If -m, --matchmode noslash is set, then the * character does not match the
       / character.

       Items  must  be listed relative to the package, and the --sourcedir or the --destdir path will
       be prepended. The paths are only prepended to item filenames while adding or extracting items,
       not to ICU .dat package or list filenames.

       Paths  may  contain  / instead of the platform's file separator character and are converted as
       appropriate.

AUTHORS
       Markus Scherer
       George Rhoten

VERSION
       1.0

COPYRIGHT
       Copyright (C) 2006 IBM, Inc. and others.

SEE ALSO
       pkgdata(1) genrb(1)

ICU MANPAGE                                 18 August 2006                                  ICUPKG(8)
