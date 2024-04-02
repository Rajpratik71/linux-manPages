XETEX(1)                                                                         General Commands Manual                                                                         XETEX(1)

NAME
       xetex - extended TeX with native support for Unicode, OpenType, system fonts

SYNOPSIS
       xetex [options] [&format] [file|\commands]

DESCRIPTION
       XeTeX  (xetex)  is  a  TeX engine with native support for Unicode, OpenType, and system-installed fonts, using third-party libraries (such as ICU, HarfBuzz, and Freetype). It was
       developed by Jonathan Kew for SIL.

       XeTeX includes the e-TeX extensions and many extensions from pdfTeX, sometimes with different primitive names.

       XeTeX is now released as part of TeX Live <https://tug.org/texlive>.

OPTIONS
       XeTeX's handling of its command-line arguments is similar to that of the other TeX programs in the Web2C implementation.  Here we list only additions/deletions  of  command  line
       options which are specific to XeTeX; see etex(1) for common options. Additions:

       -no-pdf
              Generate XeTeX's extended DVI (.xdv) output instead of pdf.

       -output-driver cmd
              Run cmd instead of xdvipdfmx to translate xdv to pdf.

       -papersize string
              Set pdf media size to string.

       Removals: -draftmode, -enc, -ipc, -ipc-start, -translate-file.

SEE ALSO
       tex(1), etex(1), latex(1).
       Home page: <https://tug.org/xetex>
       CTAN page: <https://ctan.org/pkg/xetex>
       Reference manual: <https://ctan.org/pkg/xetexref>

AUTHORS
       XeTeX is maintained by Jonathan Kew and others.
       Public discussion list: <http://lists.tug.org/xetex>
       Bug reports: <http://sourceforge.net/p/xetex/bugs/>

       This manual page was written by Karl Berry. It is released to the public domain.

Web2C 2019/dev                                                                         10 July 2018                                                                              XETEX(1)
