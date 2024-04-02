FROMMAC(1)                                                    General Commands Manual                                                   FROMMAC(1)

NAME
       frommac - Receive files from the Macintosh

SYNOPSIS
       frommac [ - options ]

DESCRIPTION
       frommac receives files from the Macintosh and processes them subject to the options specified.

OPTIONS
       In  the  absence of any options, frommac receives a single file and stores it in MacBinary format, giving the output file ".bin" extensions
       and placing it in the current working directory.

       -3     Write files in fork format (.info, .data and .rsrc files.)

       -f     As -3, but empty data and rsrc files are not created.

       -r     Write resource forks only (.rsrc files.)

       -d     Write data forks only (.data files.)

       -u     As -d, but the codes for CR and LF are interchanged, the filename extension is .text.

       -U     As -u, but there is no filename extension.

       -a     Write files in AppleShare format.  This option is only valid if the program is compiled with support for some  form  of  AppleShare.
              The current directory must be a valid AppleShare folder.

       -s     Write received files to standard output in MacBinary format.

       -l     List every file received.

       -m     Receive multiple files.  Entering ^X (CNTRL-X) after the last file will terminate the program.

       -x     Use the XMODEM protocol for transmission.

       -y     Use the YMODEM protocol for transmission (not yet supported.)

       -z     Use the ZMODEM protocol for transmission (not yet supported.)

       -o     Use the pre-beta version of XMODEM.

       -T     Allow  for  time-out detection during the protocol.  Normally you will not need this option because on occasion, when network delays
              do occur, time-out detection interferes with a good transmission.  Also, when for some reason the connection is broken  the  program
              will  normally  receive a hang-up signal and terminate.  However, in some situations it might be necessary to early detect time-outs
              (because of communication loss or whatever, without loss of connection).  You should check whether use of this option has profits in
              your  situation  or not.  Normally when transmission errors did occur entering a number of times ^X (CNTRL-X) will gracefully termi‐
              nate the program.

       -V     Gives the patchlevel of the program, and other information.  Other options are ignored and the program quits immediately.

       -H     Give short information about the options.  Other options are ignored and the program quits immediately.

BUGS
       As this is a beta release, there may still be some problems.

SEE ALSO
       macutil(1)

AUTHOR
       Dik T. Winter, CWI, Amsterdam, The Netherlands (dik@cwi.nl)

       Parts of the code are based on codes from: Dave Johnson.

3rd Berkeley Distribution                                        October 22, 1992                                                       FROMMAC(1)
