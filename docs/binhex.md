BINHEX(1)                                                     General Commands Manual                                                    BINHEX(1)

NAME
       binhex - Hexifies a series of files

SYNOPSIS
       binhex [ - options ] [ files ]

DESCRIPTION
       binhex  takes  the files specified in files and hexifies them in BinHex 4.0 format on standard output subject to the options specified.  If
       files also specifies directories they are followed recursively, and all files found will be hexified.  If no files parameter is  specified,
       binhex reads a MacBinary stream from standard input and hexifies the files found; folder information is lost.

OPTIONS
       In  the  absence  of  any  options, binhex takes the specified files and silently hexifies them to BinHex 4.0 format, writing the result to
       standard output.  Directories named in files are followed recursively, all files found will be hexified.  Files are assumed to be in MacBi‐
       nary  format.  However, if the filename ends with .info the file is assumed to be the info fork of a MacIntosh file split amongst more than
       one file.  In that case the files with .data and .rsrc extensions are also read (if present).  Also, if the info fork is mentioned  in  the
       parameter list, the names of data and resource forks can also be mentioned, but those will be ignored (this is to allow wild-card expansion
       by the shell.)  Further, if some form of AppleShare is supported by the installed program, and if the current directory, or one of the  di‐
       rectories  found during recursive processing, is a directory in the format of the supported version of AppleShare, those files will be han‐
       dled according to the properties of AppleShare.

       -r     No intelligent file-processing is performed; all files named are assumed to be plain resource files, and are  hexified  as  if  they
              were MacIntosh resource files with creator "RSED" and type "RSRC", unless another creator and/or type are specified.

       -d     No  intelligent  file-processing  is performed; all files named are assumed to be plain data files, and are hexified as if they were
              MacIntosh data files with creator "MACA" and type "TEXT", unless another creator and/or type are specified.

       -u     As -d, but the codes for CR and LF are interchanged.

       -U     Is a synonym for -u.

       -c creator
              Defines the creator name to be used if one of the previous options is specified.

       -t type
              Defines the type name to be used if one of the previous options is specified.

       -R     Do not use run-length encoding during the conversion.  This option may speed up the encoding a bit, but it is  merely  a  historical
              artifact.

       -l     List every file and directory processed.

       -i     Do not output files, give information only (implies -l.)

       -q     Ask the user for every file/directory whether it should be visited (implies -l.)

       -V     Gives the patchlevel of the program, and other information.  Other options are ignored and the program quits immediately.

       -H     Give short information about the options.  Other options are ignored and the program quits immediately.

BUGS
       As this is a beta release, there may still be some problems.

SEE ALSO
       macutil(1)

AUTHOR
       Dik T. Winter, CWI, Amsterdam, The Netherlands (dik@cwi.nl)

3rd Berkeley Distribution                                        October 22, 1992                                                        BINHEX(1)
