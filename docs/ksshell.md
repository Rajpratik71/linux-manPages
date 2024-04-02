KSSHELL(1)                                                                                 General Commands Manual                                                                                 KSSHELL(1)



NAME
       ksshell — an interactive kickstart shell

SYNOPSIS
       ksflatten [-i | --input INFILE]  [-o | --output OUTFILE]  [-v | --version VERSION]

DESCRIPTION
       ksshell is an interactive kickstart shell.  It optionally takes an input kickstart file as the basis, allows the user to specify additional kickstart commands, and then writes out the finished kick‐
       start file to stdout or the given file name.  This program supports all the usual readline niceties including tab completion of kickstart commands and their options,  though  not  the  values  those
       options can take.

       In addition to understanding all the kickstart commands, ksshell has some builtin commands of its own to make working with kickstart files in the context of a shell easier:

       .clear Clear the existing kickstart data, including any from INFILE.  This essentially starts you over from a blank state.

       .quit  Quit the interactive shell, either saving to the file given by OUTFILE or printing to stdout if none was given.

       .show  Print the current kickstart file state.

EXIT STATUS
       ksflatten returns 0 on success, and 1 if VERSION is incorrect.  If INFILE does not exist, a warning will be printed but the user will still be dumped to the interactive shell.

OPTIONS
       -i, --input INFILE
                 The name of the input kickstart file.

       -o, --output OUTFILE
                 Write the flattened kickstart file to OUTFILE, or stdout if no filename is given.

       -v, --version VERSION
                 Use this version of kickstart syntax when processing the file, or the latest if no version is given.

SEE ALSO
       ksvalidator (1), ksverdiff (1)



                                                                                                                                                                                                   KSSHELL(1)
