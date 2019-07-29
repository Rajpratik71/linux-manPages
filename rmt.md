RMT(1)                                                                                      Schily´s USER COMMANDS                                                                                     RMT(1)



NAME
       rmt - remote magnetic tape protocol server

SYNOPSIS
       /opt/schily/sbin/rmt
       /etc/rmt /sbin/rmt


DESCRIPTION
       This is the description of the enhanced Schily version of the rmt remote tape server program.  rmt is a program used by programs like star and ufsdump that like to access remote magnetic tape drives
       and files through an interprocess communication connection.  rmt is normally started up with an rexec(3) or rcmd(3) call.

       The rmt program accepts open, close, read, write and seek requests as well as requests that are specific to magnetic tapes.  rmt performs the commands and then responds with a status indication.

       This version of the rmt server gives full compatibility to the original BSD version, the enhanced Sun version and the enhanced GNU version.  In addition to the Sun and GNU  enhancements,  it  imple-
       ments  further  abstractions for better cross platform compliance.  It supports best speed and best compliance even when server and client code are running on different platforms.  It is prepared to
       be installed as a user shell in the passwd file to create remote tape specific logins and security checking.  To use the enhanced compatibility features, you need  to  either  use  the  remote  tape
       client code from star which is available in librmt or reimplement its features.

       All responses are send back in ASCII.  They are in one of the following two forms.

       Successful commands have responses of

              Anumber\n

       where number is the ASCII representation of a decimal number that usually is the return code of the corresponding system call.  Unsuccessful commands are responded to with

              Eerror-number\nerror-message\n

       where  error-number  is one of the possible error numbers described in intro(2), and error-message is the corresponding error string as retrieved by strerror(3).  Note that the error number is valid
       on the remote system where the rmt code runs and may have a different meaning on the local system.

       The protocol implements the following commands:

              Odevice\nmode\n

              Odevice\nmode symbolic_mode\n
                             Open the specified device or file using the indicated mode.  device is a full path name, and mode is an ASCII representation of a decimal number suitable for  being  passed  as
                             second  parameter  to open(2).  A variant of the open command includes the symbolic_mode string which is a GNU extension.  If both, mode and symbolic_mode are present, they are
                             separated by a space character; symbolic_mode appears on the same line as the numeric mode.  It is send using the same notation as used in a C  source  (e.g.   O_RDWR|O_CREAT).
                             If  the symbolic_mode is send to the server, the numeric mode is ignored.  The symbolic notation allows to send the expected open mode over the wire, using a system independent
                             method.  This is needed because different operating systems usually define all bits in a different way. An exception are the lowest two bits.  The lowest two bits allow to code
                             O_RDONLY,O_WRONLY and O_RDWR.  To prevent unexpected behavior, rmt masks the numeric open mode with 0x03 before using it as argument to the open(2) call.  If you need more bits
                             in the second parameter ot open(2), you need to use the symbolic mode.

                             If no file /etc/default/rmt exists, only filenames starting with /dev/ are accepted for security reasons.

                             If a device is already open, it is closed before a new open is performed.

                             A RMT protocol VERSION 1 client should issue a
                             I-1\n0\n
                             command just after opening a file or device. This is needed to tell the server that the client is aware of the official order of the mt_op codes in the range 0..7 and  that  is
                             maps deviating values to the official ones.

              Cdevice\n      Close the currently open device or file.  The argument device is ignored.

              Rcount\n       Read  count bytes of data from the open device or file.  rmt performs the requested read(2) operation and responds with Acount-read\n if the read operation was successful; oth-
                             erwise an error in standard format is returned.  If the read operation was successful, the data read is sent directly after the response described above.

              Wcount\n       Write data to the open device or file.  After reading the command specification, rmt reads count bytes from the network connection and aborts if a premature EOF is encountered.
                             The return value from the write(2) operation is returned as reply.

                             The following whence values are supported:

                             0      Mapped to SEEK_SET.

                             1      Mapped to SEEK_CUR.

                             2      Mapped to SEEK_END.

                             3      Mapped to SEEK_DATA If avalable on the remote system.

                             4      Mapped to SEEK_HOLE If avalable on the remote system.

              Lwhence\noffset\n
                             Perform an lseek(2) operation on the open device or file using the specified parameters.  The return value from the lseek(2) operation is returned as reply.

                             On large file aware operating systems, rmt will correctly handle large lseek(2) requests.

              S              The  old  non-portable  status call.  This call should not be used anymore, it has been replaced by the new RMT protocol version 1 extended status call below.  If the currently
                             open device is a magnetic tape, return the magnetic tape status, as obtained with a MTIOCGET ioctl call.  If the open device is not a magnetic tape, an error is  returned.   If
                             the  MTIOCGET  operation was successful, an “ack” is sent with the size of the status buffer, then the status buffer is sent.  As the status buffer is sent in binary, this com-
                             mand it considered outdated. Please use the extended status command instead.  This command is not terminated by a new-line.

              ssub-command   The new portable status call.  This command is part of the RMT protocol version 1.  If the currently open device is a magnetic tape, return a single  specified  member  of  the
                             magnetic  tape  status  structure, as obtained with a MTIOCGET ioctl call.  If the open device is not a magnetic tape, an error is returned.  If the MTIOCGET operation was suc-
                             cessful, the numerical value of the structure member is returned in decimal.  The following sub commands are supported:

                             T      return the content of the structure member mt_type which contains the type of the magnetic tape device.

                             D      return the content of the structure member mt_dsreg which contains the “drive status register”.

                             E      return the content of the structure member mt_erreg which contains the “error register”.

                                    This structure member must be retrieved first because it is cleared after each MTIOCGET ioctl call.  The librmt will always retrieve the member mt_erreg first when it is
                                    told to retrieve a complete status structure.

                             R      return the content of the structure member mt_resid which contains the residual count of the last I/O.

                             F      return the content of the structure member mt_fileno which contains the block number of the current tape position.

                             B      return the content of the structure member mt_blkno which contains the block number of the current tape position.

                             f      return the content of the structure member mt_flags which contains MTF_ flags from the driver.

                             b      return the content of the structure member mt_bf which contains the optimum blocking factor.

                             This command is not terminated with a new-line.

              Ioperation\ncount\n
                             Perform  a MTIOCOP ioctl(2) command using the specified parameters.  The parameters are interpreted as the ASCII representations of the decimal values to place in the mt_op and
                             mt_count fields of the structure used in the ioctl call.  When the operation is successful the return value is the count parameter.  Only Opcodes 0..7 are unique across differ-
                             ent  architectures.   But  as  in many cases Linux does not even follow this rule.  If we know that we have been called by a RMT protocol VERSION 1 client, we may safely assume
                             that the client is not using Linux mapping over the wire but the standard mapping described below:

                             -1     Retrieve the version number of the rmt server and tell the server that the client is aware of the official order of the MTIOCOP  ioctl(2)  opcodes  in  the  range  0..7.
                                    Local mt_op codes must be remapped to the official values before sending them over the wire.

                                    The  answer  of  the  current  version  of rmt is 1.  Old rmt implementations send an error code back when this command is used.  Future rmt implementations with further
                                    enhancements will send an answer with a value > 1.

                             0      Issue a MTWEOF command (write count end-of-file records).

                             1      Issue a MTFSF command (forward space over count file marks).

                             2      Issue a MTBSF command (backward space over count file marks).

                             3      Issue a MTFSR command (forward space count inter-record gaps).

                             4      Issue a MTBSR command (backward space count inter-record gaps).

                             5      Issue a MTREW command (rewind).

                             6      Issue a MTOFFL command (rewind and put the drive off-line).

                             7      Issue a MTNOP command (no operation, set status only).

              ioperation\ncount\n
                             Perform a MTIOCOP ioctl(2) command using the specified parameters.  This command is a RMT protocol VERSION 1 extension and implements support for commands beyond  MTWEOF..MTNOP
                             (0..7).   The parameters are interpreted as the ASCII representations of the decimal values described below.  They are converted into the local values mt_op and mt_count fields
                             of the structure used in the ioctl call according to the actual values found in <sys/mtio.h>.  When the operation is successful the return value is the count parameter.

                             0      Issue a MTCACHE command (switch cache on).

                             1      Issue a MTNOCACHE command (switch cache off).

                             2      Issue a MTRETEN command (retension the tape).

                             3      Issue a MTERASE command (erase the entire tape).

                             4      Issue a MTEOM command (position to end of media).

                             5      Issue a MTNBSF command (backward space count files to BOF).

              v\n            Return the version of the rmt server. This is currently the decimal number 1.

       Any other command causes rmt to exit.

FILES
       /etc/default/rmt
              The file /etc/default/rmt allows to set up rules to limit the accessibility of files based on rules.  This feature is typically used when the rmt run from a non  personal  but  task  specific
              login.

              Default values can be set for the following options in /etc/default/rmt.  For example:

              DEBUG=/tmp/rmt.debug
              USER=tape
              ACCESS=tape    myhost.mydomain.org /dev/rmt/*

              All keywords must be on the beginning of a line.

              DEBUG  If you like to get debug information, set this to a file name where rmt should put debug information.

              USER   The  name  of  a  user  (local  to the magnetic tape server) that may use the services of the rmt server.  More than one USER=name line is possible.  A line USER=* grants access to all
                     users.

              ACCESS This keyword is followed by three parameters separated by a TAB.  The name of a user (local to the magnetic tape server host) that may use the services of the rmt  server  followed  by
                     the name of a host from where operation is granted and a file specifier pattern for a file or file sub tree that may be accessed if this ACCESS line matches.  More than one ACCESS=name
                     host path line is possible.

                     If standard input of rmt is not a socket from a remote host, rmt will compare the host entry from /etc/default/rmt with the following strings:

                     PIPE      If stdin is a UNIX pipe.

                               If you like to allow remote connections that use the ssh protocol, you need to use the word PIPE instead of thr real hostname in the matching ACCESS= line.

                     ILLEGAL_SOCKET
                               If getpeername() does not work for stdin.

                     NOT_IP    If getpeername() works for stdin but is not connected to an internet socket.

SEE ALSO
       star(1), ufsdump(1), ufsrestore(1), intro(2), open(2), close(2), read(2), write(2), ioctl(2), lseek(2), getpeername(3), rcmd(3), rexec(3), strerror(3), mtio(7), rmtopen(3), rmtclose(3),  rmtread(3),
       rmtwrite(3), rmtseek(3), rmtioctl(3), rmtstatus(3)


DIAGNOSTICS
       All responses are send to the network connection.  They use the form described above.

NOTES
       To use rmt as a remote file access protocol you need to use the symbolic open modes as e.g. the O_CREAT flag is not unique between different architectures.

       In  order  to  allow  this  implementation to be used as a remote file access protocol, it accepts file names up to 4096 bytes with the open command.  Other rmt implementations allow no more than 64
       bytes.

       The possibility to create a debug file by calling rmt file has been disabled for security reasons.  If you like to debug rmt edit /etc/default/rmt and insert a DEBUG entry.

       This implementation of rmt adds some security features to the server that make it behave slightly different from older implementations.  Read the above documentation about the file  /etc/default/rmt
       to make sure your local installation is configured for your needs.

       To grant the same permissions as with old rmt servers, create a file /etc/default/rmt and add the following lines to this file:

       USER=*
       ACCESS=* * *

       Note that the three fields in the ACCESS= line need to be separated by a TAB character.

       Be  very careful when designing patterns to match path names that may be accepted for open.  If a pattern would allow to include /../ in the path, a possible intruder could virtually access any path
       on your system.  For this reason, /../ is not allowed to appear in a path regardless of the pattern.

BUGS
       None known.

HISTORY
       The rmt command first appeared on BSD in march 1981. This rmt server is a new implementation that tries to be compatible to all existing implementations.  It is the only known implementation that in
       addition tries to fix the data exchange problems between different architectures.


AUTHOR
       Joerg Schilling
       Seestr. 110
       D-13353 Berlin
       Germany

       Mail bugs and suggestions to:

       schilling@fokus.fhg.de or js@cs.tu-berlin.de or joerg@schily.isdn.cs.tu-berlin.de



Joerg Schilling                                                                                  Release 1.1                                                                                           RMT(1)
