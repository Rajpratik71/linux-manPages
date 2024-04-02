
opaxmlfilter(8)                                                                             IFSFFCLIRG (Man Page)                                                                             opaxmlfilter(8)



NAME
       opaxmlfilter



       Processes an XML file and removes all specified XML tags. The remaining tags are output and indentation can also be reformatted. opaxmlfilter is the opposite of opaxmlextract.

Syntax
       opaxmlfilter [-t|-k] [-l] [-i indent] [-s element] [input_file]

Options
       --help    Produces full help text.


       -t        Trims leading and trailing whitespace in tag contents.


       -k        In tags with purely whitespace that contain newlines, keeps newlines as-is. Default is to format as an empty list.


       -l        Adds comments with line numbers after each end tag. This can make comparison of resulting files easier since original line numbers are available.


       -i indent Sets indentation to use per level. Default is 4.


       -s element
                 Specifies the name of the XML element to suppress. Can be used multiple times (maximum of 100) in any order.


       input_file
                 Specifies the XML file to read. Default is stdin.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opaxmlfilter(8)
