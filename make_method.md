MAKE_METHOD(1p)                                         User Contributed Perl Documentation                                        MAKE_METHOD(1p)

NAME
       make_method - Turn Perl code into an XML description for RPC::XML::Server

SYNOPSIS
           make_method --name=system.identification --helptext='System ID string'
               --signature=string --code=ident.pl --output=ident.xpl

           make_method --base=methods/identification

DESCRIPTION
       This is a simple tool to create the XML descriptive files for specifying methods to be published by an RPC::XML::Server-based server.

       If a server is written such that the methods it exports (or publishes) are a part of the running code, then there is no need for this tool.
       However, in cases where the server may be separate and distinct from the code (such as an Apache-based RPC server), specifying the routines
       and filling in the supporting information can be cumbersome.

       One solution that the RPC::XML::Server package offers is the means to load publishable code from an external file. The file is in a simple
       XML dialect that clearly delinates the externally-visible name, the method signatures, the help text and the code itself. These files may
       be created manually, or this tool may be used as an aide.

REQUIRED ARGUMENTS
       There are no required arguments, but if there are not sufficient options passed you will be told by an error message.

OPTIONS
       The tool recognizes the following options:

       --help
           Prints a short summary of the options.

       --name=STRING
           Specifies the published name of the method being encoded. This is the name by which it will be visible to clients of the server.

       --namespace=STRING
           Specifies a namespace that the code of the method will be evaluated in, when the XPL file is loaded by a server instance.

       --type=STRING
           Specify the type for the resulting file. "Type" here refers to whether the container tag used in the resulting XML will specify a
           procedure or a method. The default is method. The string is treated case-independant, and only the first character ("m" or "p") is
           actually regarded.

       --version=STRING
           Specify a version stamp for the code routine.

       --hidden
           If this is passe, the resulting file will include a tag that tells the server daemon to not make the routine visible through any
           introspection interfaces.

       --signature=STRING [ --signature=STRING ... ]
           Specify one or more signatures for the method. Signatures should be the type names as laid out in the documentation in RPC::XML, with
           the elements separated by a colon. You may also separate them with spaces, if you quote the argument. This option may be specified more
           than once, as some methods may have several signatures.

       --helptext=STRING
           Specify the help text for the method as a simple string on the command line.  Not suited for terribly long help strings.

       --helpfile=FILE
           Read the help text for the method from the file specified.

       --code=FILE
           Read the actual code for the routine from the file specified. If this option is not given, the code is read from the standard input
           file descriptor.

       --output=FILE
           Write the resulting XML representation to the specified file. If this option is not given, then the output goes to the standard output
           file descriptor.

       --base=NAME
           This is a special, "all-in-one" option. If passed, all other options are ignored.

           The value is used as the base element for reading information from a file named BASE.base. This file will contain specification of the
           name, version, hidden status, signatures and other method information. Each line of the file should look like one of the following:

           Name: STRING
               Specify the name of the routine being published. If this line does not appear, then the value of the --base argument with all
               directory elements removed will be used.

           Version: STRING
               Provide a version stamp for the function. If no line matching this pattern is present, no version tag will be written.

           Hidden: STRING
               If present, STRING should be either "yes" or "no" (case not important).  If it is "yes", then the method is marked to be hidden
               from any introspection API.

           Signature: STRING
               This line may appear more than once, and is treated cumulatively. Other options override previous values if they appear more than
               once. The portion following the "Signature:" part is taken to be a published signature for the method, with elements separated by
               whitespace. Each method must have at least one signature, so a lack of any will cause an error.

           Helpfile: STRING
               Specifies the file from which to read the help text. It is not an error if no help text is specified.

           Codefile: STRING
               Specifies the file from which to read the code. Code is assumed to be Perl, and will be tagged as such in the resulting file.

           Codefile[lang]: string
               Specifies the file from which to read code, while also identifying the language that the code is in. This allows for the creation
               of a XPL file that includes multiple language implementations of the given method or procedure.

           Any other lines than the above patterns are ignored.

           If no code has been read, then the tool will exit with an error message.

           The output is written to BASE.xpl, preserving the path information so that the resulting file is right alongside the source files. This
           allows constructs such as:

               make_method --base=methods/introspection

FILE FORMAT AND DTD
       The file format for these published routines is a very simple XML dialect.  This is less due to XML being an ideal format than it is the
       availability of the parser, given that the RPC::XML::Server class will already have the parser code in core. Writing a completely new
       format would not have gained anything.

       The Document Type Declaration for the format can be summarized by:

           <!ELEMENT  proceduredef (name, namespace?, version?, hidden?,
                                    signature+, help?, code)>
           <!ELEMENT  methoddef  (name, namespace?, version?, hidden?,
                                  signature+, help?, code)>
           <!ELEMENT  functiondef (name, namespace?, version?, hidden?,
                                   signature+, help?, code)>
           <!ELEMENT  name       (#PCDATA)>
           <!ELEMENT  namespace  (#PCDATA)>
           <!ELEMENT  version    (#PCDATA)>
           <!ELEMENT  hidden     EMPTY>
           <!ELEMENT  signature  (#PCDATA)>
           <!ELEMENT  help       (#PCDATA)>
           <!ELEMENT  code       (#PCDATA)>
           <!ATTLIST  code       language (#PCDATA)>

       The file "rpc-method.dtd" that comes with the distribution has some commentary in addition to the actual specification.

       A file is (for now) limited to one definition. This is started by the one of the opening tags "<methoddef>", "<functiondef>" or
       "<proceduredef>". This is followed by exactly one "<name>" container specifying the method name, an optional version stamp, an optional
       hide-from-introspection flag, one or more "<signature>" containers specifying signatures, an optional "<help>" container with the help
       text, then the "<code>" container with the actual program code. All text should use entity encoding for the symbols:

           & C<&amp;> (ampersand)
           E<lt> C<&lt;>  (less-than)
           E<gt> C<&gt;>  (greater-than)

       The parsing process within the server class will decode the entities. To make things easier, the tool scans all text elements and encodes
       the above entities before writing the file.

   The Specification of Code
       This is not "Programming 101", nor is it "Perl for the Somewhat Dim".  The code that is passed in via one of the "*.xpl" files gets passed
       to "eval" with next to no modification (see below). Thus, badly-written or malicious code can very well wreak havoc on your server. This is
       not the fault of the server code. The price of the flexibility this system offers is the responsibility on the part of the developer to
       ensure that the code is tested and safe.

       Code itself is treated as verbatim as possible. Some edits may occur on the server-side, as it make the code suitable for creating an
       anonymous subroutine from. The make_method tool will attempt to use a "CDATA" section to embed the code within the XML document, so that
       there is no need to encode entities or such. This allows for the resulting *.xpl files to be syntax-testable with "perl -cx". You can aid
       this by ensuring that the code does not contain either of the two following character sequences:

           ]]>

           __DATA__

       The first is the "CDATA" terminator. If it occurs naturally in the code, it would trigger the end-of-section in the parser. The second is
       the familiar Perl token, which is inserted so that the remainder of the XML document does not clutter up the Perl parser.

EXAMPLES
       The RPC::XML distribution comes with a number of default methods in a subdirectory called (cryptically enough) "methods". Each of these is
       expressed as a set of ("*.base", "*.code", "*.help") files. The Makefile.PL file configures the resulting Makefile such that these are used
       to create "*.xpl" files using this tool, and then install them.

DIAGNOSTICS
       Most problems come out in the form of error messages followed by an abrupt exit.

EXIT STATUS
       The tool exits with a status of 0 upon success, and 255 otherwise.

CAVEATS
       I don't much like this approach to specifying the methods, but I liked my other ideas even less.

BUGS
       Please report any bugs or feature requests to "bug-rpc-xml at rt.cpan.org", or through the web interface at
       <http://rt.cpan.org/NoAuth/ReportBug.html?Queue=RPC-XML>. I will be notified, and then you'll automatically be notified of progress on your
       bug as I make changes.

SUPPORT
       ·   RT: CPAN's request tracker

           <http://rt.cpan.org/NoAuth/Bugs.html?Dist=RPC-XML>

       ·   AnnoCPAN: Annotated CPAN documentation

           <http://annocpan.org/dist/RPC-XML>

       ·   CPAN Ratings

           <http://cpanratings.perl.org/d/RPC-XML>

       ·   Search CPAN

           <http://search.cpan.org/dist/RPC-XML>

       ·   Source code on GitHub

           <http://github.com/rjray/rpc-xml>

LICENSE AND COPYRIGHT
       This module and the code within are released under the terms of the Artistic License 2.0
       (http://www.opensource.org/licenses/artistic-license-2.0.php). This code may be redistributed under either the Artistic License or the GNU
       Lesser General Public License (LGPL) version 2.1 (http://www.opensource.org/licenses/lgpl-2.1.php).

SEE ALSO
       RPC::XML, RPC::XML::Server

CREDITS
       The XML-RPC standard is Copyright (c) 1998-2001, UserLand Software, Inc.  See <http://www.xmlrpc.com> for more information about the XML-
       RPC specification.

AUTHOR
       Randy J. Ray <rjray@blackperl.com>

perl v5.20.2                                                        2015-06-12                                                     MAKE_METHOD(1p)
