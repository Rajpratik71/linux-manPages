XML_SPELLCHECK(1)                                                                    User Contributed Perl Documentation                                                                    XML_SPELLCHECK(1)



NAME
       xml_spellcheck - spellcheck XML files

SYNOPSIS
         xml_spellcheck [options] <files>

DESCRIPTION
       xml_spellcheck lets you spell check the content of an XML file.  It extracts the text (the content of elements and optionally of attributes), call a spell checker on it and then recreates the XML
       document.

OPTIONS
       Note that all options can be abbreviated to the first letter

       --conf <configuration_file>
           Gets the options from a configuration file. NOT IMPLEMENTED YET.

       --spellchecker <spellchecker>
           The command to use for spell checking, including any option

           By default "aspell -c" is used

       --backup-extension <extension>
           By default the original file is saved with a ".bak" extension. This option changes the extension

       --attributes
           Spell check attribute content. By default attribute values are NOT spell checked. NOT YET IMPLEMENTED

       --exclude_elements <list_of_excluded_elements>
           A list of elements that should not be spell checked

       --include_elements <list_of_included_elements>
           A list of elements that should be spell checked (by default all elements are spell checked).

           "--exclude_elements" and "--include_elements" are mutually exclusive

       --pretty_print <optional_pretty_print_style>
           A pretty print style for the document, as defined in XML::Twig. If the option is provided without a value then the "indented" style is used

       --version
           Dislay the tool version and exit

       --help
           Display help message and exit

       --man
           Display longer help message and exit

EXAMPLES
BUGS
TODO
       --conf option
       --attribute option

PRE-REQUISITE
       XML::Twig, Getopt::Long, Pod::Usage, File::Temp XML::Twig requires XML::Parser.

SEE ALSO
       XML::Twig

COPYRIGHT AND DISCLAIMER
       This program is Copyright 2003 by Michel Rodriguez

       This program is free software; you can redistribute it and/or modify it under the terms of the Perl Artistic License or the GNU General Public License as published by the Free Software Foundation
       either version 2 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER- CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
       General Public License for more details.

       If you do not have a copy of the GNU General Public License write to the Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

AUTHOR
       Michel Rodriguez <mirod@xmltwig.com>

       xml_spellcheck is available at http://www.xmltwig.com/xmltwig/



perl v5.18.2                                                                                      2012-05-17                                                                                XML_SPELLCHECK(1)
