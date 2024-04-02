TOMAC(1)                                                      General Commands Manual                                                     TOMAC(1)

NAME
       tomac - Transmit files to the Mac

SYNOPSIS
       tomac [ - options ] [ files ]

DESCRIPTION
       tomac  takes the files specified in tomac and transmits them to the Mac subject to the options specified.  If files also specifies directo‐
       ries they are followed recursively, and all files found will be transmitted.  If no files parameter is specified, binhex reads a  MacBinary
       stream from standard input and transmits the files found; folder information is lost.

OPTIONS
       In  the  absence  of  any options, tomac takes the specified files and transmits them to to the Mac using the XMODEM protocol.  Directories
       named in files are followed recursively, all files found will be transmitted.  Files are assumed to be in MacBinary  format.   However,  if
       the  filename  ends  with .info the file is assumed to be the info fork of a MacIntosh file split amongst more than one file.  In that case
       the files with .data and .rsrc extensions are also read (if present).  Also, if the info fork is mentioned in the parameter list, the names
       of  data and resource forks can also be mentioned, but those will be ignored (this is to allow wild-card expansion by the shell.)  Further,
       if some form of AppleShare is supported by the installed program, and if the current directory, or one of the directories found during  re‐
       cursive processing, is a directory in the format of the supported version of AppleShare, those files will be handled according to the prop‐
       erties of AppleShare.

       -r     No intelligent file-processing is performed; all files named are assumed to be plain resource files, and are transmitted as if  they
              were MacIntosh resource files with creator "RSED" and type "RSRC", unless another creator and/or type are specified.

       -d     No intelligent file-processing is performed; all files named are assumed to be plain data files, and are transmitted as if they were
              MacIntosh data files with creator "MACA" and type "TEXT", unless another creator and/or type are specified.

       -u     As -d, but the codes for CR and LF are interchanged.

       -U     Is a synonym for -u.

       -c creator
              Defines the creator name to be used if one of the previous options is specified.

       -t type
              Defines the type name to be used if one of the previous options is specified.

       -l     List every file and directory processed.

       -i     Do not transmit files, give information only (implies -l.)

       -q     Ask the user for every file/directory whether it should be visited (implies -l.)

       -x     Use the XMODEM protocol for transmission.

       -y     Use the YMODEM protocol for transmission (not yet supported.)

       -z     Use the ZMODEM protocol for transmission (not yet supported.)

       -o     Use the pre-beta version of XMODEM.

       -T     Allow for time-out detection during the protocol.  Normally you will not need this option because on occasion, when  network  delays
              do  occur,  time-out detection interferes with a good transmission.  Also, when for some reason the connection is broken the program
              will normally receive a hang-up signal and terminate.  However, in some situations it might be necessary to early  detect  time-outs
              (because of communication loss or whatever, without loss of connection).  You should check whether use of this option has profits in
              your situation or not.

       -V     Gives the patchlevel of the program, and other information.  Other options are ignored and the program quits immediately.

       -H     Give short information about the options.  Other options are ignored and the program quits immediately.

BUGS
       As this is a beta release, there may still be some problems.

SEE ALSO
       macutil(1)

AUTHOR
       Dik T. Winter, CWI, Amsterdam, The Netherlands (dik@cwi.nl)

       Parts of the code are based on codes from: Dave Johnson.

3rd Berkeley Distribution                                        October 22, 1992                                                         TOMAC(1)
