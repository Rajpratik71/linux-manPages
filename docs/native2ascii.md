native2ascii(1)                                             Internationalization Tools                                             native2ascii(1)

NAME
       native2ascii - Creates localizable applications by converting a file with characters in any supported character encoding to one with ASCII
       and/or Unicode escapes or vice versa.

SYNOPSIS
       native2ascii [ inputfile ] [ outputfile ]

       inputfile
              The encoded file to be converted to ASCII.

       outputfile
              The converted ASCII file.

DESCRIPTION
       The native2ascii command converts encoded files supported by the Java Runtime Environment (JRE) to files encoded in ASCII, using Unicode
       escapes (\uxxxx) notation for all characters that are not part of the ASCII character set. This process is required for properties files
       that contain characters not in ISO-8859-1 character sets. The tool can also perform the reverse conversion.

       If the outputfile value is omitted, then standard output is used for output. If, in addition, the inputfile value is omitted, then standard
       input is used for input.

OPTIONS
       -reverse
              Perform the reverse operation: Converts a file encoded in ISO-8859-1 with Unicode escapes to a file in any character encoding
              supported by the JRE.

       -encoding encoding_name
              Specifies the name of the character encoding to be used by the conversion procedure. If this option is not present, then the default
              character encoding (as determined by the java.nio.charset.Charset.defaultCharset method) is used. The encoding_name string must be
              the name of a character encoding that is supported by the JRE. See Supported Encodings at
              http://docs.oracle.com/javase/8/docs/technotes/guides/intl/encoding.doc.html

       -Joption
              Passes option to the Java Virtual Machine (JVM), where option is one of the options described on the reference page for the Java
              application launcher. For example, -J-Xms48m sets the startup memory to 48 MB. See java(1).

JDK 8                                                            21 November 2013                                                  native2ascii(1)
