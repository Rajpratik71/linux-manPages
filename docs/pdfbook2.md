pdfbook2(1)                                                             pdfbook2 - transform pdf files to booklets                                                            pdfbook2(1)

NAME
       pdfbook2 - transform pdf files into booklets for double-sided printing

SYNOPSIS
       pdfbook2 [ options ] INPUT [ INPUT, ...]

DESCRIPTION
       Create  print-ready  PDF  files  from  some INPUT PDF files for booklet printing. The resulting files need to be printed in landscape/long edge double sided printing. The default
       paper format depends on the locale and is choosen by pdfjam. It can be set with the --paper option.

       Before the pdf is composed the INPUT file is cropped to the relevant area in order to discard unnecessary white spaces. In this process, all pages are cropped to the same  dimen‐
       sions. Extra margins can be defined at the edges of the booklet and in the middle where the binding occurs.

       The OUTPUT is written to INPUT-book.pdf. Existing files will be overwritten. All input files are processed seperatly.

EXAMPLE
       To simply create a booklet from input.pdf you can use

              pdfbook2 input.pdf

       to create input-book.pdf. To select a special type of paper you can do

              pdfbook2 --paper=letter input.pdf

       for letter or

              pdfbook2 --paper=a4paper input.pdf

       for standard A4. To increase the inner margin for binding use

              pdfbook2 --inner-margin=200 input.pdf

       to increase the default value of 150. You can submit multiple files to the script for processing like

              pdfbook2 input1.pdf input2.pdf

       which will result in input1-book.pdf and input2-book.pdf.

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show help message and exit

   GENERAL
       -p, --paper=STR
              Format of the output paper dimensions as latex keyword (e.g. a4paper, letterpaper, legalpaper, ...)

       -s, --short-edge
              Format the booklet for short-edge double-sided printing

       -n, --no-crop
              Prevent the cropping to the content area

   MARGINS
       -o, --outer-margin=INT
              Defines the outer margin in the booklet (default: 40)

       -i, --inner-margin=INT
              Defines the inner margin between the pages in the booklet (default: 150)

       -t, --top-margin=INT
              Defines the top margin in the booklet (default: 30)

       -b, --bottom-margin=INT
              Defines the bottom margin in the booklet (default: 30)

   ADVANCED
       --signature=INT
              Define the signature for the booklet handed to pdfjam, needs to be multiple of 4 (default: 4)

       --signature*=INT
              Same as --signature

       --resolution=INT
              Resolution used by ghostscript in bp (default: 72)

SEE ALSO
       pdfbook(1), pdfjam(1), pdfcrop(1)

ABOUT
       pdfbook2 v1.2
       (c) 2015 Johannes Neumann (http://www.neumannjo.de)
       licensed under GPLv3 (http://www.gnu.org/licenses/gpl-3.0)
       based on pdfbook by David Firth with help from Marco Pessotto

LICENSE
       This  program  is  free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free  Software Foundation, either
       version 3 of the License, or (at your option)  any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or  FITNESS FOR A  PARTICULAR  PUR‐
       POSE.   See  the  GNU  General  Public  License  for   more  details.  You  should  have  received  a copy of the GNU General Public  License along with this program. If not, see
       <http://www.gnu.org/licenses/>.

                                                                                       June 3, 2015                                                                           pdfbook2(1)
