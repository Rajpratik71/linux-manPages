TTX(1)                                                      BSD General Commands Manual                                                     TTX(1)

NAME
     ttx — tool for manipulating TrueType and OpenType fonts

SYNOPSIS
     ttx [option ...] file ...

DESCRIPTION
     ttx is a tool for manipulating TrueType and OpenType fonts.  It can convert TrueType and OpenType fonts to and from an XML-based format
     called TTX.  TTX files have a ‘.ttx’ extension.

     For each file argument it is given, ttx detects whether it is a ‘.ttf’, ‘.otf’ or ‘.ttx’ file and acts accordingly: if it is a ‘.ttf’ or
     ‘.otf’ file, it generates a ‘.ttx’ file; if it is a ‘.ttx’ file, it generates a ‘.ttf’ or ‘.otf’ file.

     By default, every output file is created in the same directory as the corresponding input file and with the same name except for the exten‐
     sion, which is substituted appropriately.  ttx never overwrites existing files; if necessary, it appends a suffix to the output file name be‐
     fore the extension, as in Arial#1.ttf.

   General options
     -h        Display usage information.

     -d dir    Write the output files to directory dir instead of writing every output file to the same directory as the corresponding input file.

     -o file   Write the output to file instead of writing it to the same directory as the corresponding input file.

     -v        Be verbose.  Write more messages to the standard output describing what is being done.

     -a        Allow virtual glyphs ID's on compile or decompile.

   Dump options
     The following options control the process of dumping font files (TrueType or OpenType) to TTX files.

     -l        List table information.  Instead of dumping the font to a TTX file, display minimal information about each table.

     -t table  Dump table table.  This option may be given multiple times to dump several tables at once.  When not specified, all tables are
               dumped.

     -x table  Exclude table table from the list of tables to dump.  This option may be given multiple times to exclude several tables from the
               dump.  The -t and -x options are mutually exclusive.

     -s        Split tables.  Dump each table to a separate TTX file and write (under the name that would have been used for the output file if
               the -s option had not been given) one small TTX file containing references to the individual table dump files.  This file can be
               used as input to ttx as long as the referenced files can be found in the same directory.

     -i        Don't disassemble TrueType instructions.  When this option is specified, all TrueType programs (glyph programs, the font program
               and the pre-program) are written to the TTX file as hexadecimal data instead of assembly.  This saves some time and results in
               smaller TTX files.

     -y n      When decompiling a TrueType Collection (TTC) file, decompile font number n, starting from 0.

   Compilation options
     The following options control the process of compiling TTX files into font files (TrueType or OpenType):

     -m fontfile
               Merge the input TTX file file with fontfile.  No more than one file argument can be specified when this option is used.

     -b        Don't recalculate glyph bounding boxes.  Use the values in the TTX file as is.

THE TTX FILE FORMAT
     You can find some information about the TTX file format in documentation.html.  In particular, you will find in that file the list of tables
     understood by ttx and the relations between TrueType GlyphIDs and the glyph names used in TTX files.

EXAMPLES
     In the following examples, all files are read from and written to the current directory.  Additionally, the name given for the output file
     assumes in every case that it did not exist before ttx was invoked.

     Dump the TrueType font contained in FreeSans.ttf to FreeSans.ttx:

           ttx FreeSans.ttf

     Compile MyFont.ttx into a TrueType or OpenType font file:

           ttx MyFont.ttx

     List the tables in FreeSans.ttf along with some information:

           ttx -l FreeSans.ttf

     Dump the ‘cmap’ table from FreeSans.ttf to FreeSans.ttx:

           ttx -t cmap FreeSans.ttf

NOTES
     On MS-Windows and MacOS, ttx is available as a graphical application to which files can be dropped.

SEE ALSO
     documentation.html

     fontforge(1), ftinfo(1), gfontview(1), xmbdfed(1), Font::TTF(3pm)

AUTHORS
     ttx was written by Just van Rossum <just@letterror.com>.

     This manual page was written by Florent Rougon <f.rougon@free.fr> for the Debian GNU/Linux system based on the existing FontTools documenta‐
     tion.  It may be freely used, modified and distributed without restrictions.

                                                                   May 18, 2004
