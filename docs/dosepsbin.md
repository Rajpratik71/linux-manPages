DOSEPSBIN(1)                                                               User Contributed Perl Documentation                                                               DOSEPSBIN(1)

NAME
       dosepsbin -- Extract PS/WMF/TIFF sections from DOS EPS binary files

VERSION
       2012-03-22 v1.2

SYNOPSIS
       The progam dosepsbin analyses an EPS file that is not a plain ASCII PostScript file but given as DOS EPS binary file.

           dosepsbin [options] <input file>

       First it analyzes the input file, validates its header and summarizes the available sections. Depending on the given options, the sections are then written to files.

       Options:

           --eps-file <file>      Write PS section to <file>.
           --wmf-file <file>      Write WMF section to <file>.
           --tiff-file <file>      Write TIFF section to <file>.
           --inputfile <file>     The name of the input file.
           --verbose              Verbose output.
           --quiet                Only errors and warnings are printed.
           --help                 Brief help message.
           --man                  Full documentation.
           --version              Print version identification.

       The files for output must be different from the input file.

DESCRIPTION
       DOS EPS Binary File Format

       A Encapsulated PostScript (EPS) file can also given in a special binary format to support the inclusion of a thumbnail. The file format starts with a binary header that contains
       the positions of the possible sections:

       * Postscript (PS)
       * Windows Metafile Format (WMF)
       * Tag Image File Format (TIFF)

       The PS section must be present and either the WMF file or the TIFF file should be given.

OPTIONS
       --eps-file=<file>
           The PS section is written to <file>. The output file must be different from the input file.

       --wmf-file=<file>
           The WMF section is written to <file> if present. The output file must be different from the input file.

       --tiff-file=<file>
           The TIFF section is written to <file> if present. The output file must be different from the input file.

       --inputfile=<file>
           The input file can also be given directly on the command line.  If the file does not exist, then the file with extension `.eps' is tried.

       --verbose
           Verbose messages.

       --quiet
           No messages are printed except for errors and warnings.

       --help
           Display help screen.

       --man
           Prints manual page.

       --version
           Print version identification and exit.

EXAMPLES
       The following command extracts the PS section from file test.eps and stores the result in file test-ps.eps:

           dosepsbin --eps-file test-ps.eps test.eps

AUTHOR
       Heiko Oberdiek, email: heiko.oberdiek at googlemail.com

COPYRIGHT AND LICENSE
       Copyright 2011-2012 by Heiko Oberdiek.

       This library is free software; you may redistribute it and/or modify it under the same terms as Perl itself (Perl Artistic License/GNU General Public License, version 2).

SEE ALSO
       The DOS EPS binary file format is described in section "5.2 Windows Metafile or TIFF":

           Adobe Developer Support,
           Encapsulated PostScript File Format Specification,
           Version 3.0,
           1992-05-01,
           http://partners.adobe.com/public/developer/en/ps/5002.EPSF_Spec.pdf

HISTORY
       2011/11/10 v1.0
         * First version.
       2011/12/05 v1.1
         * Typo fixed in help text (thanks Peter Breitenlohner).
       2012/03/22 v1.2
         * Fix in validation test for offset of PS section.

perl v5.8.1                                                                          2012-03-22 v1.2                                                                         DOSEPSBIN(1)
