XML_SPLIT(1)                                                                         User Contributed Perl Documentation                                                                         XML_SPLIT(1)



NAME
         xml_split - cut a big XML file into smaller chunks

DESCRIPTION
       "xml_split" takes a (presumably big) XML file and split it in several smaller files. The memory used is the memory needed for the biggest chunk (ie memory is reused for each new chunk).

       It can split at a given level in the tree (the default, splits children of the root), or on a condition (using the subset of XPath understood by XML::Twig, so "section" or "/doc/section").

       Each generated file is replaced by a processing instruction that will allow "xml_merge" to rebuild the original document. The processing instruction format is "<?merge subdocs=[01] :<filename> ?>"

       File names are <file>-<nb>.xml, with <file>-00.xml holding the main document.

OPTIONS
       -l <level>
           level to cut at: 1 generates a file for each child of the root, 2 for each grand child

           defaults to 1

       -c <condition>
           generate a file for each element that passes the condition

           xml_split -c <section> will put each "section" element in its own file (nested sections are handled too)

           Note that at the moment this option is a lot slower than using "-l"

       -s <size>
           generates files of (approximately) <size>. The content of each file is enclosed in a new element ("xml_split::root"), so it's well-formed XML.  The size can be given in bytes, Kb, Mb or Gb.

       -g <nb>
           groups <nb> elements in a single file. The content of each file is enclosed in a new element ("xml_split::root"), so it's well-formed XML.

       -b <name>
           base name for the output, files will be named <base>-<nb><.ext>

           <nb> is a sequence number, see below "--nb_digits" <ext> is an extension, see below "--extension"

           defaults to the original file name (if available) or "out" (if input comes from the standard input)

       -n <nb>
           number of digits in the sequence number for each file

           if more digits than <nb> are needed, then they are used: if "--nb_digits 2" is used and 112 files are generated they will be named "<file>-01.xml" to "<file>-112.xml"

           defaults to 2

       -e <ext>
           extension to use for generated files

           defaults to the original file extension or ".xml"

       -i  use XInclude elements instead of Processing Instructions to mark where sub files need to be included

       -v  verbose output

           Note that this option can slow down processing considerably (by an order of magnitude) when generating lots of small documents

       -V  outputs version and exit

       -h  short help

       -m  man (requires pod2text to be in the path)

EXAMPLES
         xml_split foo.xml             # split at level 1
         xml_split -l 2 foo.xml        # split at level 2
         xml_split -c section foo.xml  # a file is generated for each section element
                                       # nested sections are split properly

SEE ALSO
       XML::Twig, xml_merge

TODO
       optimize the code
           any idea welcome! I have already implemented most of what I thought would improve performances.

       provide other methods that PIs to keep merge information
           XInclude is a good candidate (alpha support added in 0.04).

           using entities, which would seem the natural way to do it, doesn't work, as they make it impossible to have both the main document and the sub docs to be well-formed if the sub docs include sub-
           sub docs (you can't have entity declarations in an entity)

AUTHOR
       Michel Rodriguez <mirod@cpan.org>

LICENSE
       This tool is free software; you can redistribute it and/or modify it under the same terms as Perl itself.



perl v5.18.2                                                                                      2012-05-17                                                                                     XML_SPLIT(1)
