W3MMAN(1)                                                     General Commands Manual                                                    W3MMAN(1)

NAME
       w3mman - an interface to the on-line reference manuals via w3m(1)

SYNOPSIS
       w3mman [-M path] [section] page
       w3mman [-M path] -k keyword
       w3mman -l file

DESCRIPTION
       w3mman is a pager for manual pages, using w3m(1).

OPTIONS
       A summary of options is included below.

       -M path
              Specify path as MANPATH.

       -k keyword
              Specify keyword.

       -l file
              Specify a file.

ENVIRONMENT
       Two variables are available for debugging.

       W3MMAN_W3M
              If W3MMAN_W3M is set, its value is used instead of w3m.

       W3MMAN_MAN
              If W3MMAN_MAN is set, its value is used instead of /usr/bin/man.

FILES
       /usr/lib/w3m/cgi-bin/w3mman2html.cgi
              manual page to HTML convertor.

SEE ALSO
       man(1), w3m(1).

AUTHOR
       This manual page was written by Fumitoshi UKAI <ukai@debian.or.jp>, for the Debian GNU/Linux system (but may be used by others).

                                                                   Nov 23, 2014                                                          W3MMAN(1)
