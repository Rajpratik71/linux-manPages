LATEX-GIT-LOG(1)                                                                     Robin Schneider                                                                     LATEX-GIT-LOG(1)

NAME
       latex-git-log - Generates the version history of a git project as LaTeX source code.

SYNOPSIS
       latex-git-log [options]

       Options:

         --author          set this if you want the author included
         --startcommit     set the start value of count commit
         --width           set the width in cm of the commit message field in the LaTeX table
         --git-c-add       set an base URL to link to a commit
         --user            set a github user to derive the base URL
         --repo            set a github repository to derive the base URL
         --lang            language of the legend and all strings in the output
         --version, -v     print version of this script
         --help            brief help message
         --man             full documentation

OPTIONS
       --width Set the width in cm of the commit message field in the LaTeX table. If this parameter is not set then the table is not vertically limited. That means that if you have a
               very long commit message then the table will probably not fit on the page and you will get a "Overfull" error message from TeX.

               In this case you should specify the width of the column containing the commit messages.  I normally use something like --width=14 for DIN A4 in landscape.

       --git-c-add
               Set an base URL to link to a commit.  This script will automatically try to use the base URL for github.

       --lang  Set the language of the legend and all strings in the output. Be default the language of your system is used but you can overwrite this with this parameter.

               Currently this script only supports English and German. If you need a translation to another language then you can either create a .po file or I can register this project
               on one of those websites for online translation.

Example
       You can use it like this:

           latex-git-log --width=6 --lang=en > example-output.tex

DEPENDENCIES
   Of this script
       This module requires these other modules and libraries:

           IPC::System::Simple
           Locale::Maketext::Simple

       Everything else should already be installed.

   To compile the output
       The table is using the longtable package and the links to a web resource for each commit use the \href macro from hyperref. So these two packages have to be loaded.

       Furthermore you need to defined the macro \longtableendfoot which will be expanded on the bottom of every page if the table will be continued on the next page. You can defined it
       to a localized message to inform the reader that this table is not complete and will be continued.

DESCRIPTION
       This program will output the entire version history as table written in LaTeX if it is executed within a git repository.

       It is intended that you redirect the standard output of this script to a file which can then be included from your main TeX document.

       Because the table can be very large you might want to put the thing on a landscape page.

Version
       0.9

AUTHOR
       Robin Schneider <ypid23@aol.de>

Development
       Source code repository: https://github.com/ypid/typesetting/tree/master/scripts/latex-git-log

       Please report bugs and feature requests at https://github.com/ypid/typesetting/issues

LICENSE AND COPYRIGHT
       Copyright (C) 2012-2013 by Robin Schneider

       This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either
       version 3 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
       PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

       Dieses Programm ist Freie Software: Sie kA~Xnnen es unter den Bedingungen der GNU General Public License, wie von der Free Software Foundation, Version 3 der Lizenz oder (nach
       Ihrer Option) jeder spA~Xteren verA~Xffentlichten Version, weiterverbreiten und/oder modifizieren.

       Dieses Programm wird in der Hoffnung, dass es nA~Xtzlich sein wird, aber OHNE JEDE GEWA~XHRLEISTUNG, bereitgestellt; sogar ohne die implizite GewA~Xhrleistung der
       MARKTFA~XHIGKEIT oder EIGNUNG FA~XR EINEN BESTIMMTEN ZWECK.  Siehe die GNU General Public License fA~Xr weitere Details.

       Sie sollten eine Kopie der GNU General Public License zusammen mit diesem Programm erhalten haben. Wenn nicht, siehe <http://www.gnu.org/licenses/>.

latex-git-log                                                                           2013-06-16                                                                       LATEX-GIT-LOG(1)
