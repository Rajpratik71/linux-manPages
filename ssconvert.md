SSCONVERT(1)                                                           GNOME                                                          SSCONVERT(1)

NAME
       ssconvert - a command line spreadsheet format converter

SYNOPSIS
       ssconvert [OPTIONS] infile outfile

       ssconvert [OPTIONS] --merge-to outfile infile1 infile2 ...

DESCRIPTION
       ssconvert  is  a  command  line utility to convert spreadsheet files between various spreadsheet file formats. It is a companion utility to
       Gnumeric, the powerful spreadsheet program created by the GNOME project.

       ssconvert accepts either file names or URIs as infile outfile. The special URIs fd://0 and fd://1 can be used for standard input and  stan‐
       dard output respectively.

OPTIONS
       This  program  follows  the  usual GNU command line syntax, with single letter options starting with a single dash (`-') and longer options
       starting with two dashes (`--').

   Main options
       --recalc
              Recalculate all cells before writing the result.

       --list-exporters
              List the available exporters (file formats that can be written).

       -T, --export-type=ID
              Specify which exporter to use; see below for a list. This is only necessary when the right format does not follow  from  the  output
              file name.

       -O, --export-options=optionsstring
              Specify  parameters  for the chosen exporter.  optionsstring is a list of parameter=value pairs, separated by spaces.  The parameter
              names and values allowed are specific to the exporter and are documented below. Multiple parameters can be specified

       --list-importers
              List the available importers (file formats that can be read).  -I, --import-type=ID Specify which importer to use; see below  for  a
              list. This is only necessary when the right format does not follow from the input file name.

       -E, --import-encoding=STRING
              Specify an encoding for imported content.

       -M, --merge-to=FILENAME
              Merge  a collection of workbooks into one.  Sheet size will expand to the largest in all the workbooks.  Names in the scope of indi‐
              vidual workbooks will end up in the scope of the merged workbook.  The merge will be aborted if there are name conflicts.

       -S, --export-file-per-sheet
              Export a file for each sheet if the exporter only supports one sheet at a time.  The output filename is treated  as  a  template  in
              which  sheet  number  is  substituted  for %n and/or sheet name is substituted for %s.  If there are not substitutions, a default of
              ".%s" is added.

   Help options
       -v, --version
              Display ssconvert's version.

       -h, --help, --usage
              Display a brief usage message.

       --help-all
              Show all help options.

       --help-libspreadsheet
              Show Gnumeric options.

   Path options
       -L, --lib-dir=STRING
              Set the root library directory.

       -D, --data-dir=STRING
              Adjust the root data directory.

LIST OF IMPORTER/EXPORTER IDS
       The following IDs can be can be used both for import (reading) and export (writing).

       Gnumeric_XmlIO:sax
              Gnumeric's XML file format (*.gnumeric)

       Gnumeric_OpenCalc:openoffice
              OpenDocument  ⟨http://en.wikipedia.org/wiki/OpenDocument⟩  or  OpenOffice  Calc   ⟨http://en.wikipedia.org/wiki/OpenOffice.org_Calc⟩
              (*.sxc, *.ods) format.  As an exporter, this is ODF/OpenOffice without foreign elements (*.ods).

       Gnumeric_dif:dif
              Data Interchange Format ⟨http://en.wikipedia.org/wiki/Data_Interchange_Format⟩ (*.dif)

       Gnumeric_paradox:paradox
              Paradox database ⟨http://en.wikipedia.org/wiki/Paradox_%28database%29⟩ or primary index file (*.db, *.px)

       Gnumeric_stf:stf_assistant
              Text (configurable)

       Gnumeric_sylk:sylk
              MultiPlan  ⟨http://en.wikipedia.org/wiki/Multiplan⟩  Symbolic  Link  (SYLK)  ⟨http://en.wikipedia.org/wiki/SYmbolic_LinK_%28SYLK%29⟩
              (*.slk)

       Gnumeric_Excel:xlsx
              Microsoft Excel (tm) 2007 ("Office Open XML", OOXML ⟨http://en.wikipedia.org/wiki/XLSX⟩ ) format

LIST OF IMPORTANT IMPORTER IDS
       Gnumeric_stf:stf_csvtab
              Comma or tab separated values (CSV/TSV) (*.csv)

       Gnumeric_html:html
              HTML (*.html, *.htm)

       Gnumeric_Excel:excel
              Microsoft Excel (tm) (*.xls)

       Gnumeric_Excel:excel_xml
              Microsoft Excel (tm) 2003 SpreadsheetML

LIST OF OTHER IMPORTER IDS
       Gnumeric_QPro:qpro
              Quattro Pro ⟨http://en.wikipedia.org/wiki/Quattro_Pro⟩ (*.wb1, *.wb2, *.wb3)

       Gnumeric_applix:applix
              Applix (*.as)

       Gnumeric_lotus:lotus
              Lotus 1-2-3 ⟨http://en.wikipedia.org/wiki/Lotus_1-2-3⟩ (*.wk1, *.wks, *.123)

       Gnumeric_mps:mps
              MPS (Mathematical Programming System) format ⟨http://en.wikipedia.org/wiki/MPS_%28format%29⟩ Linear programming  and  mixed  integer
              programming file format (*.mps)

       Gnumeric_oleo:oleo
              GNU Oleo ⟨http://en.wikipedia.org/wiki/GNU_Oleo⟩ (*.oleo)

       Gnumeric_plan_perfect:pln
              PlanPerfect Format (PLN)

       Gnumeric_psiconv:psiconv
              Psion (*.psisheet)

       Gnumeric_sc:sc
              SC/xspread

       Gnumeric_xbase:xbase
              xBase ⟨http://en.wikipedia.org/wiki/XBase⟩ (*.dbf) file format

LIST OF IMPORTANT EXPORTER IDS
       Gnumeric_OpenCalc:odf
              ODF/OpenOffice with foreign elements (*.ods)

       Gnumeric_glpk:glpk
              GLPK Linear Program Solver

       Gnumeric_html:html40
              HTML 4.0 (*.html)

       Gnumeric_html:html40frag
              HTML (*.html) fragment

       Gnumeric_html:xhtml
              XHTML (*.html)

       Gnumeric_html:xhtml_range
              XHTML range - for export to clipboard

       Gnumeric_pdf:pdf_assistant
              Portable Document Format (*.PDF)

       Gnumeric_stf:stf_csv
              Comma separated values (CSV)

       Gnumeric_Excel:excel_dsf
              Microsoft Excel (tm) 97/2000/XP & 5.0/95

LIST OF OTHER EXPORTER IDS
       Gnumeric_Excel:excel_biff7
              Microsoft Excel (tm) 5.0/95

       Gnumeric_Excel:excel_biff8
              Microsoft S Excel (tm) 97/2000/XP

       Gnumeric_GnomeGlossary:po
              Gnome Glossary PO file format

       Gnumeric_html:html32
              HTML 3.2 (*.html)

       Gnumeric_html:latex
              LaTeX 2e (*.tex)

       Gnumeric_html:latex_table
              LaTeX 2e (*.tex) table fragment

       Gnumeric_html:roff
              TROFF ⟨http://en.wikipedia.org/wiki/Troff⟩ (*.me) format.

       Gnumeric_lpsolve:lpsolve
              LPSolve ⟨http://sourceforge.net/projects/lpsolve/⟩ Mixed Integer Linear Programming (MILP) solver

OPTIONS FOR THE PORTABLE DOCUMENT FORMAT (*.pdf) EXPORTER
       sheet  Name  of the workbook sheet to operate on.  You can specify several sheets by repeating this option. If this option is not given the
              active sheet (i. e. the sheet that was active when the file was saved) is used.  This is ignored if the object option is given.

       object Name of the sheet object to print. If this option is given any sheet option is ignored.  Only the first object given is exported.

       paper  Paper size. Valid values include "A4" for ISO A4 and "na_letter_8.5x11in" for US Letter. If an individual graph is specified through
              the object option, then a paper size of "fit" reduces the size of the paper to the size of the graph.

OPTIONS FOR THE CONFIGURABLE TEXT (*.txt) EXPORTER
       sheet  Name  of the workbook sheet to operate on.  You can specify several sheets by repeating this option. If this option is not given the
              active sheet (i. e. the sheet that was active when the file was saved) is used.

       eol    End Of Line convention; how lines are terminated.  "unix" for linefeed, "mac" for carriage return;  "windows"  for  carriage  return
              plus linefeed.

       charset
              The character encoding of the output. Defaults to UTF-8.

       locale The  locale to use for number and date formatting.  Defaults to the current locale as reported by locale(1).  Consult locale -a out‐
              put for acceptable values.

       quote  The character or string used for quoting fields. Defaults to "\"" (quotation mark / double quote).

       separator
              The string used to separate fields. Defaults to space.

       format How cells should be formatted.  Acceptable values: "automatic" (apply automatic formatting; default), "raw" (output data raw, unfor‐
              matted), or "preserve" (preserve the formatting from the source document).

              This deals with the difference between a cell's contents and the way those contents are formatted.

              Consider  a cell in a Gnumeric input document that was input as "4/19/73" in a US locale, with a format set to "d-mmm-yyyy" and thus
              formatted as "19-Apr-1973".

              With the default format setting of "automatic" it will be output as "1973/04/19". With "preserve", the formatting will be  preserved
              and  it  will be output as "19-Apr-1973". With "raw" it will be output as "26773" (Gnumeric's internal representation: days since an
              epoch).

       transliterate-mode
              How to handle unrepresentable characters (characters that cannot be represented in the chosen  output  character  set).   Acceptable
              values: "transliterate", or "escape".

       quoting-mode
              When does data need to be quoted?  "never", "auto" (puts quotes where needed), or "always". Defaults to "never".

       quoting-on-whitespace
              Controls whether initial or terminal whitespace forces quoting. Defaults to TRUE.

EXAMPLE
       To convert the Gnumeric file foo.gnumeric to a Microsoft Excel(TM) format file foo.xls:

       ssconvert foo.gnumeric foo.xls

       The export format can be specified explicitly, to override the default (which is based on the file extension):

       ssconvert --export-type=Gnumeric_stf:stf_csv foo.xls foo.txt

       To convert an Excel format file statfuns.xls to a text file, specifying the semicolon as the separator character:

       ssconvert -O 'separator=; format=raw' samples/excel/statfuns.xls statfuns.txt

LICENSE
       ssconvert  is  licensed  under  the  terms of the General Public License (GPL), version 2 or 3. For information on this license look at the
       source code that came with the software or see the GNU project page ⟨http://www.gnu.org⟩.

COPYRIGHT
       The copyright on the Gnumeric software and source code is held by the individual authors as is documented in the source code.

AUTHOR
       ssconvert's primary author is Jody Goldberg <jody@gnome.org>; ssconvert builds on the Gnumeric codebase.

       The initial version of this manpage was written by J.H.M. Dassen (Ray) <jdassen@debian.org>.

SEE ALSO
       gnumeric(1), ssdiff(1), ssgrep(1), ssindex(1)

       The Gnumeric Homepage ⟨http://www.gnome.org/projects/gnumeric/⟩.

       The GNOME project page ⟨http://www.gnome.org/⟩.

gnumeric                                                            2011-11-04                                                        SSCONVERT(1)
