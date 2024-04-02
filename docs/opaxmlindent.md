
opaxmlindent(8)                                                                             IFSFFCLIRG (Man Page)                                                                             opaxmlindent(8)



NAME
       opaxmlindent



       (Linux) Takes well-formed XML as input, filters out comments, and generates a uniformly-indented equivalent XML file. Use opaxmlindent to reformat files for easier reading and review, also to refor‐
       mat a file for easy comparison with diff.

Syntax
       opaxmlindent [-t|-k] [-i indent] [ input_file]

Options
       --help    Produces full help text.


       -t        Trims leading and trailing whitespace in tag contents.


       -k        In tags with purely whitespace that contain newlines, keeps newlines as-is. Default is to format as an empty list.


       -i indent Sets indentation to use per level. Default is 4.


       input_file
                 Specifies the XML file to read. Default is stdin.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opaxmlindent(8)
