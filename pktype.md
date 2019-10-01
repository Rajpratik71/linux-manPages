PKTYPE(1)                                                                                  General Commands Manual                                                                                  PKTYPE(1)



NAME
       pktype - verify and translate a packed font bitmap file to plain text

SYNOPSIS
       pktype pk_file[pk]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  pktype program translates a packed font file (pk) (output by, for example, gftopk(1) to a file that humans can read. It also serves as a pk file-validating program (i.e., if pktype can read it,
       it's correct) and as an example of a pk-reading program for other software that wants to read pk files.

       The input pk_file on the command line may omit the suffix `pk.  The plain text translation is always written to standard output.

       The output file gives a compact encoding of the packed encoding, using conventions described in the source code. Run lengths of black pixels alternate with parenthesized run lengths of white pixels,
       and brackets are used to indicate when a row should be repeated.

ENVIRONMENT
       pktype looks for pk_file in the usual places according to Kpathsea.

       See tex(1) for the details of the searching.

SEE ALSO
       dvitype(1), gftopk(1), gftype(1).
       Donald E. Knuth et al., Metafontware.

AUTHORS
       Tomas Rokicki wrote the program, Donald E. Knuth originally ported it to Unix, Pierre MacKay originally adapted it for compilation with Web2c.



Web2C 2012                                                                                        5 May 2011                                                                                        PKTYPE(1)
