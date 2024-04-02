TANGLE(1)                                                                        General Commands Manual                                                                        TANGLE(1)

NAME
       tangle - translate WEB to Pascal

SYNOPSIS
       tangle [options] webfile[.web] [changefile[.ch]]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  tangle program converts a Web source document into a Pascal program that may be compiled in the usual way with the on-line Pascal compiler (e.g., pc(1)).  The output file is
       packed into lines of 72 characters or less, with the only concession to readability being the termination of lines at semicolons when this can be done conveniently.

       The Web language allows you to prepare a single document containing all the information that is needed both to produce a compilable Pascal program and to produce a well-formatted
       document  describing  the  program in as much detail as the writer may desire.  The user of Web must be familiar with both TeX and Pascal.  Web also provides a relatively simple,
       although adequate, macro facility that permits a Pascal program to be written in small easily-understood modules.

       The command line should have either one or two names on it.  The first is taken as the Web file (and .web is added if there is no extension).  If there is another name, it  is  a
       change file (and .ch is added if there is no extension).  The change file overrides parts of the Web file, as described in the Web system documentation.

       The output files are a Pascal file and a string pool file, whose names are formed by adding .p and .pool respectively to the root of the Web file name.

OPTIONS
       This version of tangle understands the following options.  Note that some of these options may render the output unsuitable for processing by a Pascal compiler.

       --help Print help message and exit.

       --length number
              Compare only the first number characters of identifiers when checking for collisions.  The default is 32, the original tangle used 7.

       --loose
              When checking for collisions between identifiers, honor the settings of the --lowercase, --mixedcase, --uppercase, and --underline options. This is the default.

       --lowercase
              Convert all identifiers to lowercase.

       --mixedcase
              Retain the case of identifiers.  This is the default.

       --strict
              When checking for collisions between identifiers, strip underlines and convert all identifiers to uppercase first.

       --underline
              Retain underlines (also known as underscores) in identifiers.

       --uppercase
              Convert all identifiers to uppercase.  This is the behaviour of the original tangle.

       --version
              Print version information and exit.

ENVIRONMENT
       The environment variable WEBINPUTS is used to search for the input files, or the system default if WEBINPUTS is not set.  See tex(1) for the details of the searching.

SEE ALSO
       pc(1), pxp(1) (for formatting tangle output when debugging), tex(1).

       Donald E. Knuth, The Web System of Structured Documentation.

       Donald E. Knuth, Literate Programming, Computer Journal 27, 97-111, 1984.

       Wayne Sewell, Weaving a Program, Van Nostrand Reinhold, 1989, ISBN 0-442-31946-0.

       Donald E. Knuth, TeX: The Program (Volume B of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13437-3.

       Donald E. Knuth, Metafont: The Program (Volume D of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13438-1.

       These last two are by far the largest extant examples of Web programs.

       There is an active Internet electronic mail discussion list on the subject of literate programming; send a subscription request to litprog-request@shsu.edu to join.

AUTHORS
       Web was designed by Donald E. Knuth, based on an earlier system called DOC (implemented by Ignacio Zabala).  The tangle and weave programs are themselves written in Web. The sys‐
       tem was originally ported to Unix at Stanford by Howard Trickey, and at Cornell by Pavel Curtis.

Web2C 2019/dev                                                                         16 June 2015                                                                             TANGLE(1)
