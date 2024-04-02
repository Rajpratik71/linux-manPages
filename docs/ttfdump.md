TTFDUMP(1)                                                                       General Commands Manual                                                                       TTFDUMP(1)

NAME
       ttfdump - Dumping the contents of a TrueType Font file

SYNOPSIS
       ttfdump [-h] [-t tablename] [-g glyphnumber] [-c collection] [-o dumpfile] [-i] ttfile

DESCRIPTION
       ttfdump  dumps  the  contents  of  a  TrueType font file in ASCII form.  A TrueType font file is consist of various tables. Those table are divided into two categories - Required
       Tables and Optional Tables. Mulitiple TrueType fonts can be merged to a TrueType Collection.

   Options
       -h     Print a help message on standard output and exit.

       -t tablename
              If this option is specified then dump the table "tablename", otherwise dump every tables in ttfile.  Tablename can be one of the following:

              Required Tables

              cmap   character to glyph mapping table

              glyf   glyph data

              head   font header

              hhea   horizontal header

              hmtx   horizontal metrics

              loca   index to location

              maxp   maximum profile

              name   naming table

              post   PostScript information

              OS/2   OS/2 and windows specific metrics

              Optional Tables

              cvt    control value table

              fpgm   font program; not implemented yet.

              gasp   grid-fitting and scan conversion procedure (grayscale)

              hdmx   horizontal device metrics

              kern   kerning table

              LTSH   Linear threshold table

              prep   CVT program; not implemented yet

              PCLT   PCL5 table

              VDMX   Vertical Device Metrics table

              vhea   vertical metrics header

              vmtx   vertical metrics

              Additional OpenType Tables

              GPOS   glyph positioning table

              GSUB   glyph substitution table

       -g glyphnumber
              If this option is specified then dump the glyph with index glyphnumber, otherwise dump all glyphs in ttfile.

       -c collection
              Select a TrueType font in a TrueType Collection.

       -o dumpfile
              Output of the dump. If this option is not specified, dump to stdout.

       -i ttfile
              TrueType font file to be dumped.

EXAMPLE
       To dump all information in the TrueType font file times.ttf:
              ttfdump times.ttf

       To dump the required table cmap in the file:
              ttfdump -t cmap times.ttf

       To dump a single glyph with index 50:
              ttfdump -g 50 times.ttf

SEE ALSO
       TrueType 1.0 Font Files,  Technical Specification Revision 1.66 November 1995

NOTE
       Instruction disassembler in not implemented.

AUTHOR
       Li-Da Lho, ollie@ms1.hinet.net

ILX Project                                                                          14 November 2011                                                                          TTFDUMP(1)
