DTD2VIM(1)                                                        [FIXME: manual]                                                       DTD2VIM(1)

NAME
       dtd2vim - creates XML data file for Vim7 omni completion from DTDs

SYNOPSIS
       dtd2vim {filename.dtd} [dialectname]

DESCRIPTION
       This manual page documents brieftly the dtd2vim program. For more information see its HTML documentation in
       /usr/share/doc/vim-scripts/html/dtd2vim.html.

       Starting from version 7 Vim supports context aware completion of XML files (and others). In particular, when the file being edited is an
       XML file, completion can be driven by the grammar extracted from a Document Type Definition (DTD).

       For this feature to work the user should put an XML data file corresponding to the desired DTD in a autoload/xml directory contained in a
       directory belonging to Vim's 'runtimepath' (for example ~/.vim/autoload/xml/).

       dtd2vim is the program that creates XML data files from DTDs. Given as input a DTD file.dtd it will create a file.vim XML data file.
       dialectname will be part of dictionary name and will be used as argument for the :XMLns command.

OPTIONS
       None.

SEE ALSO
       vim (1).

       In the Vim online help: :help compl-omni, :help ft-xml-omni, :help :XMLns.

       dtd2vim is fully documented in /usr/share/doc/vim-scripts/html/dtd2vim.html.

AUTHOR
       This manual page was written by Stefano Zacchiroli <zack@debian.org> for the Debian system (but may be used by others). Permission is
       granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later version
       published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

AUTHOR
       Stefano Zacchiroli
           Author.

COPYRIGHT
       Copyright © 2007 Stefano Zacchiroli

[FIXME: source]                                                     05 Feb 2007                                                         DTD2VIM(1)
