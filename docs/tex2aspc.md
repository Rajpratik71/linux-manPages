TEX2ASPC(1)                                                                                                                                                                   TEX2ASPC(1)

NAME
       tex2aspc - converts conventional MusiXTeX scores to .aspc format for processing by autosp(1).

SYNOPSIS
       tex2aspc [-v | --version | -h | --help]

       tex2aspc infile[.tex] [outfile[.aspc]]

       This  program  re-factors (sequences of) conventional note-spacing commands (\notes \Notes \NOtes ...)  in a measure into a single \anotes command.  This is intended for "legacy"
       scores in order to take advantage of features only provided by autosp(1), such as "global" skips and processing of TransformNotes commands.

LIMITATIONS
       tex2aspc assumes that & and | (rather than \nextinstrument and \nextstaff) are used to separate instruments and staffs.

       User-defined macros are not processed or expanded.

SEE ALSO
       autosp(1)

       musixdoc.pdf

AUTHOR
       This program and manual page were written by Bob Tennent <rdt@cs.queensu.ca>.

                                                                                        2018-02-14                                                                            TEX2ASPC(1)
