testlibraw(1)                                                                                  Linux IEEE 1394                                                                                  testlibraw(1)



NAME
       testlibraw - run basic functionality tests on libraw1394

SYNOPSIS
       testlibraw

DESCRIPTION
       testlibraw attaches to the Linux IEEE 1394 subsystem through libraw1394 and tries to read data from all connected nodes.  It therefore acts as a check that:

       *      libraw1394 is installed correctly

       *      the IEEE 1394 subsystem is loaded in the kernel and of a supported version

       *      libraw1394 and kernel side raw1394 can communicate

       *      connected nodes can be reached and do respond.

       The read transactions are of a form that all powered up nodes conforming to the IEEE 1394 standard have to be able to respond to.

       The source of this program also acts as a demonstration of libraw1394 programming, including initialization, transactions and the event loop.

EXAMPLE RUN
       FIXME: insert example here

BUGS
       None known.

SEE ALSO
       http://linux1394.sourceforge.net/

AUTHOR
       Andreas Bombe <aeb@debian.org>



                                                                                               libraw1394 2.1.0                                                                                 testlibraw(1)
