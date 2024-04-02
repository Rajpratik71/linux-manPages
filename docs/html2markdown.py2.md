HTML2MARKDOWN(1)                                                   User Commands                                                  HTML2MARKDOWN(1)

NAME
       html2markdown - converts a page of HTML into markdown.

SYNOPSIS
       html2markdown [options...] [(filename|url) [encoding]]

DESCRIPTION
       html2markdown downloads the specified HTML page, and converts it to text marked up with markdown.  The source HTML page may be a local file
       or remote URL.  If not specified, it will be read from standard input.  The output is printed to standard output.

       If an encoding is specified, it will override any encoding information provided by the HTTP Server.  When not specified,  python-feedparser
       (if available) will be used to determine the source encoding.  If not available, or when reading local files, the encoding is assumed to be
       UTF-8.

OPTIONS
       --no-wrap-links
              Don't wrap long links.

       --ignore-emphasis
              Don't include any formatting for emphasis.

       --reference-links
              Use reference style links instead of in-line links.

       --ignore-links
              Don't include any formatting for links.

       --protect-links
              Protect links from line breaks surrounding them with angle brackets.

       --ignore-images
              Don't include any formatting for images.

       --images-to-alt
              Discard image data, only keep alt text.

       --images-with-size
              Write image tags with height and width attrs as raw html to retain dimensions.

       -g, --google-doc
              Convert an html-exported Google Document.

       -d, --dash-unordered-list
              Use a dash rather than a star for unordered list items.

       -e, --asterisk-emphasis
              Use an asterisk rather than an underscore for emphasized text.

       -b BODY_WIDTH, --body-width=BODY_WIDTH
              Number of characters per output line, 0 for no wrap.

       -i LIST_INDENT, --google-list-indent=LIST_INDENT
              Number of pixels Google indents nested lists.

       -s, --hide-strikethrough
              Hide strike-through text. Only relevant when -g is specified as well.

       --escape-all
              Escape all special characters. Output is less readable, but avoids corner case formatting issues.

       --bypass-tables
              Format tables in HTML rather than Markdown syntax.

       --single-line-break
              Use a single line break after a block element rather than two line breaks.  NOTE: Requires --body-width=0.

       --unicode-snob
              Use unicode throughout document.

       --no-automatic-links
              Do not use automatic links wherever applicable.

       --no-skip-internal-links
              Do not skip internal links.

       --links-after-para
              Put links after each paragraph instead of document.

       --mark-code
              Mark program code blocks with [code]...[/code].

       --decode-errors=DECODE_ERRORS
              What to do in case of decode errors. ignore, strict, and replace are acceptable values.

       --version
              Show program's version number and exit.

       -h, --help
              Show a help message and exit.

AUTHOR
       This manpage was written for Debian, by Stefano Rivera <stefanor@debian.org>.

html2markdown 2015.6.21                                              July 2015                                                    HTML2MARKDOWN(1)
