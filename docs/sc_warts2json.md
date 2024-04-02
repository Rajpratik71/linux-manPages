SC_WARTS2JSON(1)                                            BSD General Commands Manual                                           SC_WARTS2JSON(1)

NAME
     sc_warts2json — JSON dump of information contained in a warts file.

SYNOPSIS
     sc_warts2json [file ...]

DESCRIPTION
     The sc_warts2json utility provides a JSON dump of information contained in a sequence of warts files.  The output is the same as that which
     would have been provided by scamper if the JSON output option had been chosen instead of the warts output option when the data was collected.

EXAMPLES
     The command:

        sc_warts2json file1.warts file2.warts

     will decode and print the contents of file1.warts, followed by the contents of file2.warts.

     The command:

        gzcat file1.warts.gz | sc_warts2json

     will print the contents of the uncompressed file supplied on stdin.

SEE ALSO
     scamper(1), sc_wartsdump(1), sc_warts2text(1)

AUTHORS
     sc_warts2json is written by Matthew Luckie <mjl@luckie.org.nz>.  The JSON output format for traceroute and ping was built on an initial pro‐
     totype provided by Brian Hammond of Internap Network Services Corporation.  The JSON output format for tbit and dealias was implemented by
     Matthew Luckie.

BSD                                                                July 18, 2013                                                               BSD
