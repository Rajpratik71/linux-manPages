SC_WARTS2TEXT(1)                                            BSD General Commands Manual                                           SC_WARTS2TEXT(1)

NAME
     sc_warts2text — simple dump of information contained in a warts file.

SYNOPSIS
     sc_warts2text [-d ip2descr-file] [file ...]

DESCRIPTION
     The sc_warts2text utility provides a simple dump of information contained in a sequence of warts files.  The output is the same as that which
     would have been provided by scamper if the text output option had been chosen instead of the warts output option when the data was collected.
     The options are as follows:

     -d ip2descr-file
             specifies the name of a file with IP-address, description mappings, one mapping per line.  See the examples section for further
             information.

     While the output of sc_warts2text is structured and suitable for initial analyses of results, the format of the output is not suitable for
     automated parsing and analysis as the output of sc_warts2text will change overtime with no regard to backwards compatibility.  Analyses of
     the contents of a warts file should be made using specialised programs which link against the scamper file API.

EXAMPLES
     The command:

        sc_warts2text file1.warts file2.warts

     will decode and print the contents of file1.warts, followed by the contents of file2.warts.

     The command:

        gzcat file1.warts.gz | sc_warts2text

     will print the contents of the uncompressed file supplied on stdin.

     Given a set of IP-address, description pairs in a file name mappings.txt:

        192.0.2.1 "foo"
        192.0.2.2 "bar"

     then the command gzcat file1.warts.gz | sc_warts2text -d mappings.txt will print the description associated with a given destination address
     before each result is presented.

SEE ALSO
     scamper(1), sc_wartsdump(1), sc_warts2json(1)

AUTHORS
     sc_warts2text is written by Matthew Luckie <mjl@luckie.org.nz>.

BSD                                                              October 15, 2010                                                              BSD
