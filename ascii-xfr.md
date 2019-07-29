ASCII-XFR(1)                                                    Linux Users Manual                                                    ASCII-XFR(1)

NAME
       ascii-xfr - upload/download files using the ASCII protocol

SYNOPSIS
       ascii-xfr -s|-r [-ednv] [-l linedelay] [-c characterdelay] filename

DESCRIPTION
       Ascii-xfr  Transfers  files in ASCII mode. This means no flow control, no checksumming and no file-name negotiation. It should only be used
       if the remote system doesn't understand anything else.

       The ASCII protocol transfers files line-by-line. The EOL (End-Of-Line) character is transmitted as CRLF. When receiving, the  CR  character
       is  stripped  from the incoming file.  The Control-Z (ASCII 26) character signals End-Of-File, if option -e is specified (unless you change
       it to Control-D (ASCII 4) with -d).

       Ascii-xfr reads from stdin when receiving, and sends data on stdout when sending. Some form of input or output  redirection  to  the  modem
       device is thus needed when downloading or uploading, respectively.

OPTIONS
       -s     Send a file.

       -r     Receive a file. One of -s or -r must be present.

       -e     Send the End-Of-File character (Control-Z, ASCII 26 by default) when uploading has finished.

       -d     Use the Control-D (ASCII 4) as End-Of-File character.

       -n     Do not translate CR to CRLF and vice versa.

       -v     Verbose: show transfer statistics on the stderr output.

       -l milliseconds
              When transmitting, pause for this delay after each line.

       -c milliseconds
              When transmitting, pause for this delay after each character.

       file   Name of the file to send or receive. When receiving, any existing file by this name will be truncated.

USAGE WITH MINICOM
       If  you  want to call this program from minicom(1), start minicom and go to the Options menu. Select File transfer protocols.  Add the fol‐
       lowing lines, for example as protocols I and J.

       I  Ascii    /usr/bin/ascii-xfr -sv   Y   U   N   Y
       J  Ascii    /usr/bin/ascii-xfr -rv   Y   D   N   Y

AUTHOR
       Miquel van Smoorenburg, miquels@cistron.nl
       Jukka Lahtinen, walker@netsonic.fi

SEE ALSO
       minicom(1)

                                                           $Date: 2006-10-28 14:35:59 $                                               ASCII-XFR(1)
