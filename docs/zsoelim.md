ZSOELIM(1)                                                                                    Manual pager utils                                                                                   ZSOELIM(1)



NAME
       zsoelim - satisfy .so requests in roff input

SYNOPSIS
       zsoelim [-CVh] [file ...]

DESCRIPTION
       zsoelim parses file arguments, or if none are specified, its standard input for lines of the form:

       .so <filename>

       These  requests  are  replaced by the contents of the filename specified.  If the request cannot be met, zsoelim looks for filename.ext where .ext can be one of .gz, .Z or .z.  Other extension types
       may be supported depending upon compile time options.  If the request can be met by a compressed file, this file is decompressed using an appropriate decompressor and its output is used  to  satisfy
       the request.

       Traditionally,  soelim programs were used to allow roff preprocessors to be able to preprocess the files referred to by the requests.  This particular version was written to circumvent problems cre-
       ated by support for compressed manual pages.

OPTIONS
       -C, --compatible
              This flag is available for compatibility with other soelim programs.  Its use is to enable .so requests followed by something other than whitespace.  As this is already the default behaviour,
              it is ignored.

       -h, --help
              Print a help message and exit.

       -V, --version
              Display version information.

SEE ALSO
       groff(1), man(1), nroff(1), troff(1)

AUTHOR
       Wilf. (G.Wilford@ee.surrey.ac.uk).
       Fabrizio Polacco (fpolacco@debian.org).
       Colin Watson (cjwatson@debian.org).



2.6.6                                                                                             2014-01-23                                                                                       ZSOELIM(1)
