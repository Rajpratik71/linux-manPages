XML_MERGE(1)                                                                         User Contributed Perl Documentation                                                                         XML_MERGE(1)



NAME
         xml_merge - merge back XML files split with C<xml_split>

DESCRIPTION
       "xml_merge" takes several xml files that have been split using "xml_split" and recreates a single file.

OPTIONS
       -o <output_file>
           unless this option is used the program output goes to STDOUT

       -i  the files use XInclude instead of processing instructions (they were created using the "-i" option in "xml_split")

       -v  verbose output

       -V  outputs version and exit

       -h  short help

       -m  man (requires pod2text to be in the path)

EXAMPLES
         xml_merge foo-00.xml             # output to stdout
         xml_merge -o foo.xml foo-00.xml  # output to foo.xml

SEE ALSO
       XML::Twig, xml_split

TODO/BUGS
AUTHOR
       Michel Rodriguez <mirod@cpan.org>

LICENSE
       This tool is free software; you can redistribute it and/or modify it under the same terms as Perl itself.



perl v5.18.2                                                                                      2012-05-17                                                                                     XML_MERGE(1)
