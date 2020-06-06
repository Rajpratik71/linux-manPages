RMT(8)                                                                                 BSD System Manager's Manual                                                                                 RMT(8)

NAME
     rmt — remote magtape protocol module

SYNOPSIS
     rmt

DESCRIPTION
     Rmt is a program used by tar, cpio, mt, and the remote dump and restore programs in manipulating a magnetic tape drive through an interprocess communication connection.  Rmt is normally started up
     with an rexec(3) or rcmd(3) call or the rsh(1) command.

     The rmt program accepts requests specific to the manipulation of magnetic tapes, performs the commands, then responds with a status indication.  All responses are in ASCII and in one of two forms.
     Successful commands have responses of:

           Anumber\n

     Number is an ASCII representation of a decimal number.  Unsuccessful commands are responded to with:

           Eerror-number\nerror-message\n

     Error-number is one of the possible error numbers described in intro(2) and error-message is the corresponding error string as printed from a call to perror(3).  The protocol is comprised of the
     following commands, which are sent as indicated - no spaces are supplied between the command and its arguments, or between its arguments, and ‘\n’ indicates that a newline should be supplied:

     Odevice\nmode\n
             Open the specified deviceusing the indicated mode.Deviceis a full pathname and modeis an ASCIIrepresentation of a decimal number suitable for passing to open(2).If a device had already
             been opened, it is closed before a new open is performed.

     Cdevice\n
             Close the currently open device.  The devicespecified is ignored.

     Loffset\nwhence\n
             Perform an lseek(2) operation using the specified parameters.  The response value is that returned from the lseek call.

     Wcount\n
             Write data onto the open device.  Rmt reads count bytes from the connection, aborting if a premature end-of-file is encountered.  The response value is that returned from the write(2)
             call.

     Rcount\n
             Read count bytes of data from the open device.  If count exceeds the size of the data buffer (10 kilobytes), it is truncated to the data buffer size.  rmt then performs the requested
             read(2) and responds with Acount-read\n if the read was successful; otherwise an error in the standard format is returned.  If the read was successful, the data read is then sent.

     Ioperation\ncount\n
             Perform a MTIOCOP ioctl(2) command using the specified parameters.  The parameters are interpreted as the ASCII representations of the decimal values to place in the mt_op and mt_count
             fields of the structure used in the ioctl call.  The return value is the count parameter when the operation is successful.

     S       Return the status of the open device, as obtained with a MTIOCGET ioctl call.  If the operation was successful, an ``ack'' is sent with the size of the status buffer, then the status buf‐
             fer is sent (in binary).

     Any other command causes rmt to exit.

DIAGNOSTICS
     All responses are of the form described above.

SEE ALSO
     tar(1), cpio(1), mt(1), rsh(1), rcmd(3), rexec(3), mtio(4), rdump(8), rrestore(8)

BUGS
     People should be discouraged from using this for a remote file access protocol.

HISTORY
     The rmt command appeared in 4.2BSD.

4.2 Berkeley Distribution                                                                   December 11, 1993                                                                   4.2 Berkeley Distribution
