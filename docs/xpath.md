XPATH(1p)                                                                          User Contributed Perl Documentation                                                                          XPATH(1p)

NAME
       xpath - a script to query XPath statements in XML documents.

SYNOPSIS
       xpath [-s suffix] [-p prefix] [-n] [-q] -e query [-e query] ... [file] ...

DESCRIPTION
       xpath uses the XML::XPath perl module to make XPath queries to any XML document. The XML::XPath module aims to comply exactly to the XPath specification at "http://www.w3.org/TR/xpath" and yet
       allows extensions to be added in the form of functions.

       The script takes any number of XPath pointers and tries to apply them to each XML document given on the command line. If no file arguments are given, the query is done using "STDIN" as an XML
       document.

       When multiple queries exist, the result of the last query is used as context for the next query and only the result of the last one is output.  The context of the first query is always the root
       of the current document.

OPTIONS
   -q
       Be quiet. Output only errors (and no separator) on stderr.

   -e
       Never use an external DTD, ie. instantiate the XML::Parser module with 'ParseParamEnt => 0'.

   -s suffix
       Place "suffix" at the end of each entry. Default is a linefeed.

   -p prefix
       Place "prefix" preceding each entry. Default is nothing.

BUGS
       The author of this man page is not very fluant in english. Please, send him (fabien@tzone.org) any corrections concerning this text.

       See also XML::XPath(3pm).

SEE ALSO
       XML::XPath(3pm).

HISTORY
       This module is copyright 2000 Fastnet Software Ltd. This is free software, and as such comes with NO WARRANTY. No dates are used in this module. You may distribute this module under the terms of
       either the Gnu GPL,  or under specific licencing from Fastnet Software Ltd.  Special free licencing consideration will be given to similarly free software. Please don't flame me for this licence
       - I've put a lot of hours into this code, and if someone uses my software in their product I expect them to have the courtesy to contact me first.

       Full support for this module is available from Fastnet Software Ltd on a pay per incident basis. Alternatively subscribe to the Perl-XML mailing list by mailing lyris@activestate.com with the
       text:

               SUBSCRIBE Perl-XML

       in the body of the message. There are lots of friendly people on the list, including myself, and we'll be glad to get you started.

       Matt Sergeant, matt@sergeant.org

       This man page was added as well as some serious modifications to the script by Fabien Ninoles <fabien@debian.org> for the Debian Project.

perl v5.22.1                                                                                    2016-02-14                                                                                      XPATH(1p)
