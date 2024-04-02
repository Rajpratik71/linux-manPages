SC_WARTS2PCAP(1)                                            BSD General Commands Manual                                           SC_WARTS2PCAP(1)

NAME
     sc_warts2pcap — write packets included in warts object to a pcap file.

SYNOPSIS
     sc_warts2pcap [-o outfile] [-s sort] [file ...]

DESCRIPTION
     The sc_warts2pcap utility provides the ability to extract packets embedded in the tbit, sting, and sniff warts objects and write them to a
     pcap file, which can be read by tcpdump and wireshark.  The options are as follows:

     -o outfile
             specifies the name of the output file.  If no output file is specified, it will be written to the standard output, provided that it
             is not a tty.

     -o sort
             specifies how the pcap records (packets) are sorted before being written out.  By default, no sorting is applied; the packets are
             grouped as they are in the warts file.  If packet sorting is specified, the packets are written out in timestamp order.  Note that
             this operation requires the packets to be read into memory to be sorted, so it will require a corresponding amount of memory to com‐
             plete.

EXAMPLES
     The command:

        sc_warts2pcap -o output.pcap file1.warts file2.warts

     will read the packet objects from file1.warts, and then file2.warts, and write them to output.pcap.

     The command:

        gzcat file1.warts.gz | sc_warts2pcap -s packet >file1.pcap

     will read the contents of the uncompressed warts file supplied on stdin, sort the packets by their timestamp, and then write the output to
     file1.pcap.

SEE ALSO
     scamper(1), tcpdump(1)

AUTHORS
     sc_warts2pcap is written by Stephen Eichler and Matthew Luckie.

BSD                                                              October 15, 2010                                                              BSD
