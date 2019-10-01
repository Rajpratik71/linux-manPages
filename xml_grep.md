XML_GREP(1)                                                                          User Contributed Perl Documentation                                                                          XML_GREP(1)



NAME
       xml_grep - grep XML files looking for specific elements

SYNOPSYS
         xml_grep [options] <file list>

       or

         xml_grep <xpath expression> <file list>

       By default you can just give "xml_grep" an XPath expression and a list of files, and get an XML file with the result.

       This is equivalent to writing

         xml_grep --group_by_file file --pretty_print indented --cond <file list>

OPTIONS
       --help
           brief help message

       --man
           full documentation

       --Version
           display the tool version

       --root <cond>
           look for and return xml chunks matching <cond>

           if neither "--root" nor "--file" are used then the element(s) that trigger the "--cond" option is (are) used. If "--cond" is not used then all elements matching the <cond> are returned

           several "--root" can be provided

       --cond <cond>
           return the chunks (or file names) only if they contain elements matching <cond>

           several "--cond" can be provided (in which case they are OR'ed)

       --files
           return only file names (do not generate an XML output)

           usage of this option precludes using any of the options that define the XML output: "--roots", "--encoding", "--wrap", "--group_by_file" or "--pretty_print"

       --count
           return only the number of matches in each file

           usage of this option precludes using any of the options that define the XML output: "--roots", "--encoding", "--wrap", "--group_by_file" or "--pretty_print"

       --strict
           without this option parsing errors are reported to STDOUT and the file skipped

       --date
           when on (by default) the wrapping element get a "date" attribute that gives the date the tool was run.

           with "--nodate" this attribute is not added, which can be useful if you need to compare 2 runs.

       --encoding <enc>
           encoding of the xml output (utf-8 by default)

       --nb_results <nb>
           output only <nb> results

       --by_file
           output only <nb> results by file

       --wrap <tag>
           wrap the xml result in the provided tag (defaults to 'xml_grep')

           If wrap is set to an empty string ("--wrap ''") then the xml result is not wrapped at all.

       --nowrap
           same as using "--wrap ''": the xml result is not wrapped.

       --descr <string>
           attributes of the wrap tag (defaults to "version="<VERSION>" date="<date>"")

       --group_by_file <optional_tag>
           wrap results for each files into a separate element. By default that element is named "file". It has an attribute named "filename" that gives the name of the file.

           the short version of this option is -g

       --exclude <condition>
           same as using "-v" in grep: the elements that match the condition are excluded from the result, the input file(s) is (are) otherwise unchanged

           the short form of this option is -v

       --pretty_print <optional_style>
           pretty print the output using XML::Twig styles ('"indented"', '"record"' or '"record_c"' are probably what you are looking for)

           if the option is used but no style is given then '"indented"' is used

           short form for this argument is -s

       --text_only
           Displays the text of the results, one by line.

       --html
           Allow HTML input, files are converted using HTML::TreeBuilder

       --Tidy
           Allow HTML input, files are converted using HTML::Tidy

   Condition Syntax
       <cond> is an XPath-like expression as allowed by XML::Twig to trigger handlers.

       exemples:
         'para'
         'para[@compact="compact"]'
         '*[@urgent]'
         '*[@urgent="1"]'
         'para[string()="WARNING"]'

       see XML::Twig for a more complete description of the <cond> syntax

       options are processedby Getopt::Long so they can start with '-' or '--' and can be abbreviated ("-r" instead of "--root" for example)

DESCRIPTION
       xml_grep does a grep on XML files. Instead of using regular expressions it uses XPath expressions (in fact the subset of XPath supported by XML::Twig)

       the results can be the names of the files or XML elements containing matching elements.

SEE ALSO
       XML::Twig Getopt::Long

LICENSE
       This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

AUTHOR
       Michel Rodriguez <mirod@xmltwig.com>



perl v5.16.3                                                                                      2012-05-17                                                                                      XML_GREP(1)
