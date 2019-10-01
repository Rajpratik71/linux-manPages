XML_PP(1)                                                                            User Contributed Perl Documentation                                                                            XML_PP(1)



NAME
       xml_pp - xml pretty-printer

SYNOPSYS
       xml_pp [options] [<files>]

DESCRIPTION
       XML pretty printer using XML::Twig

OPTIONS
       -i[<extension>]
           edits the file(s) in place, if an extension is provided (no space between "-i" and the extension) then the original file is backed-up with that extension

           The rules for the extension are the same as Perl's (see perldoc perlrun): if the extension includes no "*" then it is appended to the original file name, If the extension does contain one or
           more "*" characters, then each "*" is replaced with the current filename.

       -s <style>
           the style to use for pretty printing: none, nsgmls, nice, indented, record, or record_c (see XML::Twig docs for the exact description of those styles), 'indented' by default

       -p <tag(s)>
           preserves white spaces in tags. You can use several "-p" options or quote the tags if you need more than one

       -e <encoding>
           use XML::Twig output_encoding (based on Text::Iconv or Unicode::Map8 and Unicode::String) to set the output encoding. By default the original encoding is preserved.

           If this option is used the XML declaration is updated (and created if there was none).

           Make sure that the encoding is supported by the parser you use if you want to be able to process the pretty_printed file (XML::Parser does not support 'latin1' for example, you have to use
           'iso-8859-1')

       -l  loads the documents in memory instead of outputing them as they are being parsed.

           This prevents a bug (see BUGS) but uses more memory

       -f <file>
           read the list of files to process from <file>, one per line

       -v  verbose (list the current file being processed)

       --  stop argument processing (to process files that start with -)

       -h  display help

EXAMPLES
         xml_pp foo.xml > foo_pp.xml           # pretty print foo.xml
         xml_pp < foo.xml > foo_pp.xml         # pretty print from standard input

         xml_pp -v -i.bak *.xml                # pretty print .xml files, with backups
         xml_pp -v -i'orig_*' *.xml            # backups are named orig_<filename>

         xml_pp -i -p pre foo.xhtml            # preserve spaces in pre tags

         xml_pp -i.bak -p 'pre code' foo.xml   # preserve spaces in pre and code tags
         xml_pp -i.bak -p pre -p code foo.xml  # same

         xml_pp -i -s record mydb_export.xml   # pretty print using the record style

         xml_pp -e utf8 -i foo.xml             # output will be in utf8
         xml_pp -e iso-8859-1 -i foo.xml       # output will be in iso-8859-1

         xml_pp -v -i.bak -f lof               # pretty print in place files from lof

         xml_pp -- -i.xml                      # pretty print the -i.xml file

         xml_pp -l foo.xml                     # loads the entire file in memory
                                               # before pretty printing it

         xml_pp -h                             # display help

BUGS
       Elements with mixed content that start with an embedded element get an extra \n

         <elt><b>b</b>toto<b>bold</b></elt>

       will be output as

         <elt>
           <b>b</b>toto<b>bold</b></elt>

       Using the "-l" option solves this bug (but uses more memory)

TODO
       update XML::Twig to use Encode with perl 5.8.0

AUTHOR
       Michel Rodriguez <mirod@xmltwig.com>



perl v5.16.3                                                                                      2012-11-14                                                                                        XML_PP(1)
