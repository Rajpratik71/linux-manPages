DERB(1)                                    ICU 60.2 Manual                                    DERB(1)

NAME
       derb - disassemble a resource bundle

SYNOPSIS
       derb  [  -h,  -?,  --help  ] [ -V, --version ] [ -v, --verbose ] [ -e, --encoding encoding ] [
       --bom ] [ -t, --truncate [ size ] ] [ -s, --sourcedir source ] [ -d, --destdir destination ] [
       -i, --icudatadir directory ] [ -c, --to-stdout ] bundle ...

DESCRIPTION
       derb  reads  the compiled resource bundle files passed on the command line and write them back
       in text form.  The resulting text files have a .txt extension while compiled  resource  bundle
       source files typically have a .res extension.

       It is customary to name the resource bundles by their locale name, i.e. to use a local identi‐
       fier for the bundle filename, e.g.  ja_JP.res for Japanese (Japan) data, or root.res  for  the
       root  bundle.   This  is especially important for derb since the locale name is not accessible
       directly from the compiled resource bundle, and to know which locale to ask for  when  opening
       the  bundle.   derb  will  produce  a  file  whose  base name is the base name of the compiled
       resource file itself.  If the --to-stdout, -c option is used, however, the text will be  writ‐
       ten on the standard output.

OPTIONS
       -h, -?, --help
              Print help about usage and exit.

       -V, --version
              Print the version of derb and exit.

       -v, --verbose
              Display extra informative messages during execution.

       -A, --suppressAliases
              Don't follow aliases when producing output.

       -e, --encoding encoding
              Set  the  encoding used to write output files to encoding.  The default encoding is the
              invariant (subset of ASCII or EBCDIC) codepage for the system  (see  section  INVARIANT
              CHARACTERS).  The choice of the encoding does not affect the data, just their represen‐
              tation. Characters that cannot be represented in the encoding will be represented using
              \uhhhh escape sequences.

       --bom  Write a byte order mark (BOM) at the beginning of the file.

       -l, --locale locale
              Set the locale for the resource bundle, which is used both in the generated text and as
              the base name of the output file.

       -t, --truncate [ size ]
              Truncate individual resources (strings or binary data) to size bytes.  The  default  if
              size is not specified is 80 bytes.

       -s, --sourcedir source
              Set the source directory to source.  The default source directory is the current direc‐
              tory.  If - is passed for source, then the bundle will be looked  for  in  its  default
              location, specified by the ICU_DATA environment variable (or defaulting to the location
              set when ICU was built if ICU_DATA is not set).

       -d, --destdir destination
              Set the destination directory to destination.  The  default  destination  directory  is
              specified  by  the  environment  variable  ICU_DATA or is the location set when ICU was
              built if ICU_DATA is not set.

       -i, --icudatadir directory
              Look for any necessary ICU data files in directory.  For example, when processing  col‐
              lation overrides, the file ucadata.dat must be located.  The default ICU data directory
              is specified by the environment variable ICU_DATA.

       -c, --to-stdout
              Write the disassembled bundle on standard output instead of into a file.

CAVEATS
       When the option --bom is used, the character U+FEFF is written  in  the  destination  encoding
       regardless  of whether it is a Unicode transformation format (UTF) or not.  This option should
       only be used with an UTF encoding, as byte order marks are not meaningful for other encodings.

INVARIANT CHARACTERS
       The invariant character set consists of the following set of characters, expressed as a  stan‐
       dard  POSIX regular expression: [a-z]|[A-Z]|[0-9]|_| |+|-|*|/.  This is the set which is guar‐
       anteed to be available regardless of code page.

ENVIRONMENT
       ICU_DATA  Specifies the directory containing ICU data. Defaults to  ${prefix}/share/icu/60.2/.
                 Some tools in ICU depend on the presence of the trailing slash. It is thus important
                 to make sure that it is present if ICU_DATA is set.

AUTHORS
       Vladimir Weinstein
       Yves Arrouye

VERSION
       1.0

COPYRIGHT
       Copyright (C) 2002 IBM, Inc. and others.

SEE ALSO
       genrb(1)

ICU MANPAGE                                   7 Mar 2014                                      DERB(1)
