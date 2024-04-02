MACSTREAM(1)                                                  General Commands Manual                                                 MACSTREAM(1)

NAME
       macstream - Convert a series of files to a MacBinary stream

SYNOPSIS
       macstream [ - options ] files

DESCRIPTION
       macstream  takes  the files specified in files and combines them to a MacBinary stream on standard output subject to the options specified.
       If files also specifies directories they are followed recursively, and all files found will be put in the MacBinary stream,  together  with
       directory information.

OPTIONS
       In  the absence of any options, macstream takes the specified files and silently combines them to a MacBinary stream, writing the result to
       standard output.  Directories named in files are followed recursively, all files found will be put in the MacBinary stream,  together  with
       directory  information.   Files  are assumed to be in MacBinary format.  However, if the filename ends with .info the file is assumed to be
       the info fork of a MacIntosh file split amongst more than one file.  In that case the files with .data and .rsrc extension  are  also  read
       (if  present).   Also, if the info fork is mentioned in the parameter list, the names of data and resource forks can also be mentioned, but
       those will be ignored (this is to allow wild-card expansion by the shell.)  Further, if some form of AppleShare is  supported  by  the  in‐
       stalled program, and if the current directory, or one of the directories found during recursive processing, is a directory in the format of
       the supported version of AppleShare, those files will be handled according to the properties of AppleShare.

       -r     No intelligent file-processing is performed; all files named are assumed to be plain resource files, and are  written  as  MacIntosh
              resource files with creator "RSED" and type "RSRC", unless another creator and/or type are specified.

       -d     No  intelligent  file-processing is performed; all files named are assumed to be plain data files, and are written as MacIntosh data
              files with creator "MACA" and type "TEXT", unless another creator and/or type are specified.

       -u     As -d, but the codes for CR and LF are interchanged.

       -U     Is a synonym for -u.

       -c creator
              Defines the creator name to be used if one of the previous options is specified.

       -t type
              Defines the type name to be used if one of the previous options is specified.

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

3rd Berkeley Distribution                                        October 22, 1992                                                     MACSTREAM(1)
