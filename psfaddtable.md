PSFADDTABLE(1)                          General Commands Manual                         PSFADDTABLE(1)

NAME
       psfaddtable - add a Unicode character table to a console font

SYNOPSIS
       psfaddtable fontfile tablefile outfile

DESCRIPTION
       psfaddtable  takes  a console font in .psf format given by fontfile and merges it with the Uni‐
       code character table given by tablefile to produce a font file with an embedded  character  ta‐
       ble,  which  is  written  to outfile.  An input file name of "-" denotes standard input, and an
       output file name of "-" denotes standard output.  If the fontfile already contains an  embedded
       character table, it is ignored.

TABLE FILE FORMAT
       Each  line  in the tablefile should be either blank, contain a comment (preceded by #), or con‐
       tain a sequence of numbers in either decimal (default), octal (preceded by 0),  or  hexadecimal
       (preceded  by 0x) format, separated by spaces or tabs.  The first number on each line indicates
       the glyph slot in the font that is being referred  to,  this  is  between  0  and  0xff  for  a
       256-character  font  and  0  and 0x1ff for a 512-character font.  Any subsequent numbers on the
       same line are Unicodes matched by this specific glyph slot.  Instead of a  single  Unicode  one
       may  have a sequence of Unicodes separates by commas, to denote that the glyph depicts the cor‐
       responding composed symbol.  It is permissible to have multiple lines for the same glyph.

SEE ALSO
       setfont(8), psfgettable(1), psfstriptable(1), psfxtable(1)

                                              25 Oct 1994                               PSFADDTABLE(1)
