UPDATE-PERL-SAX-PARSERS(8)                                            Debian                                            UPDATE-PERL-SAX-PARSERS(8)

NAME
       update-perl-sax-parsers - (de)register Perl SAX parser modules

SYNOPSIS
       update-perl-sax-parsers [options] --add parser_module

       update-perl-sax-parsers [options] --remove parser_module

       update-perl-sax-parsers [options] --update

DESCRIPTION
       update-perl-sax-parsers  inserts,  updates  and  removes individual Perl SAX parser module info files in the directory /var/lib/libxml-sax-
       perl/ParserDetails.d and the overall Perl SAX parser modules info file /etc/perl/XML/SAX/ParserDetails.ini.

OPTIONS
       --add  Adds the per-module info file for the indicated Perl SAX parser module to the directory /var/lib/libxml-sax-perl/ParserDetails.d.

       --remove
              Removes the per-module info file for Perl SAX parser module from the directory /var/lib/libxml-sax-perl/ParserDetails.d.

       --update
              updates the overall Perl SAX parser modules info file /etc/perl/XML/SAX/ParserDetails.ini.  The modules will be listed in  an  order
              of ascending priority. See the PARSER PRIORITIES section below.

              The file will be managed with ucf(1) , unless the --file option is used. See also the --ucf option below.

       --directory
              When used with --add or with --remove indicates the ParserDetails.d directory to use for storing the per-module Perl SAX parser mod‐
              ule info file.  When used one or more times with --update indicates the ParserDetails.d directories to be used as source for  gener‐
              ating the ParserDetails.ini file.  Default is /var/lib/libxml-sax-perl/ParserDetails.d.

       --file Indicates the ParserDetails.ini file up be updated.  Default is /etc/perl/XML/SAX/ParserDetails.ini.

       --priority XX
              Specifies  the priority of the SAX parser module to be added removed.  The priority will be encoded to the filename of the ParserDe‐
              tails.d entry. See the PARSER PRIORITIES section below.

              This option was added in version 0.3 of update-perl-sax-parsers .  Use the value "0" to disable the encoding and match the behaviour
              of earlier versions of the script.

              The default priority value is 50, unless --directory was specified, in which case the default is 0 (disabled.)

       --ucf X
              Forcibly  enable  (X != 0) or disable (X = 0) of ucf(1) .  By default, ucf(1) will be used to manage the ParserDetails.ini file when
              --file is not specified.

       --quiet
              Prevents any diagnostic output.

       --test Prevents the modification of any files and enables debugging mode.

       --version
              Displays the version information and exits.

       --help Display the usage information and exits.

PARSER PRIORITIES
       Starting with version 0.3 of update-perl-sax-parsers , the parsers are assigned a priority value that is encoded  into  the  names  of  the
       files in the ParserDetails.d directory. Specifically, the file name will be "XX-Some::Module", where XX denotes the priority and Some::Mod‐
       ule is the name of the parser module.

       When --update is called, the parsers are listed in an order of ascending priority into the ParserDetails.ini file. The last parser  in  the
       file, ie. the one with the highest priority, is the default XML::SAX parser.

       Parsers  with  the same priority are sorted alphabetically by their name.  This is contrary to the behaviour of earlier versions, where the
       sort order was undefined and depended on the underlying file system.

NOTE
       Installing the original package from CPAN into /usr/local breaks the Debian package, since the former is in Perl's @INC before the  latter.
       So, please don't do this.

       If there's a new version of XML::SAX simply file a wishlist against the Debian package and wait for the update.

SEE ALSO
       /usr/share/doc/libxml-sax-perl/README.Debian

AUTHORS
       Ardo van Rangelrooij <ardo@debian.org>

       Niko Tyni            <ntyni@iki.fi>

COPYRIGHT
       Copyright © 2001-2003 Ardo van Rangelrooij

       Copyright © 2007 Niko Tyni

       This is free software; see the GNU General Public Licence version 2 or later for copying conditions.  There is no warranty.

0.3                                                                  Nov 2007                                           UPDATE-PERL-SAX-PARSERS(8)
