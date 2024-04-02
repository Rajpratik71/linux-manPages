NOKOGIRI(1)                                                                                                                            NOKOGIRI(1)

NAME
       nokogiri - an HTML, XML, SAX, and Reader parser

DESCRIPTION
       Nokogiri (鋸) is an HTML, XML, SAX, and Reader parser. Among Nokogiri’s many features is the ability to search documents via XPath or CSS3
       selectors.  The nokogiri command parses a document, and launches an interactive ruby session (irb(1)), allowing one to analysing the result
       interactively.

SYNOPSYS
       nokogiri <uri|path> [options]

OPTIONS
       --type [TYPE]
           Set the type of the document to be parsed

       -E, --encoding encoding
           Set the encoding of the document

       -e command
           Specifies script from command-line

       --rng <uri|path>
           Validate using this rng file

       -?, --help
           Show a message very similar to this man page

       -v, --version
           Show the version of the program

EXAMPLES
       nokogiri http://www.ruby-lang.org/

       nokogiri ./public/index.html

       curl -s http://nokogiri.org | nokogiri -e'p $_.css("h1").length'

                                                                    2016-03-13                                                         NOKOGIRI(1)
