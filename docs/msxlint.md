MSXLINT(1)                                                                                                                                                                     MSXLINT(1)

NAME
       msxlint - detects incorrectly formatted notes lines in a MusiXTeX source file.

SYNOPSIS
       msxlint [-v | --version | -h | --help]

       msxlint [-d | --debug]...  [infile[.tex]...]

       If no infiles are specifed, standard input is used.

USAGE
       The format that notes commands are expected to match is determined by \instrumentnumber and \setstaffs commands, or uses of the \TransformNotes macro defined in musixtnt.tex (see
       musixdoc.pdf), or re-definitions of the \vnotes macro.  Output consists of messages about format errors, with listings of the ill-formatted lines.

LIMITATIONS
       User-defined  macros are not processed or expanded.  Notes commands (\notes, \Notes, etc.)  can have line breaks, but other commands must fit on one line.

SEE ALSO
       fixmsxpart(1)

       musixdoc.pdf

AUTHOR
       This program and manual page were written by Bob Tennent <rdt@cs.queensu.ca>.

                                                                                        2015-02-05                                                                             MSXLINT(1)
