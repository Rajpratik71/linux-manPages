SC_WARTSDUMP(1)                                             BSD General Commands Manual                                            SC_WARTSDUMP(1)

NAME
     sc_wartsdump — verbose dump of information contained in a warts file.

SYNOPSIS
     sc_wartsdump [file ...]

DESCRIPTION
     The sc_wartsdump provides a verbose dump of information contained in a sequence of warts files.  While the output is structured and suitable
     for initial analyses of results, the format of the output is not suitable for automated parsing and analysis as the output of sc_wartsdump
     will change overtime with no regard to backwards compatibility.  Analyses of the contents of a warts file should be made using specialised
     programs which link against the scamper file API.

EXAMPLES
     The command:

        sc_wartsdump file1.warts file2.warts

     will decode and print the contents of file1.warts, followed by the contents of file2.warts.

     The command:

        gzcat file1.warts.gz | sc_wartsdump

     will print the contents of the uncompressed file supplied on stdin.

SEE ALSO
     scamper(1), sc_warts2text(1)

AUTHORS
     sc_wartsdump is written by Matthew Luckie <mjl@luckie.org.nz>.

BSD                                                              October 15, 2010                                                              BSD
