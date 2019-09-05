RST2ODT_PREPSTYLES(1)                                             text processing                                            RST2ODT_PREPSTYLES(1)

NAME
       rst2odt_prepstyles - strip paper size specifications off of rst2odt stylesheets

SYNOPSIS
       rst2odt_prepstyles FILE

DESCRIPTION
       rst2odt(1) uses a stylesheet file as a template for the ODT files it creates.  The stock styles.odt file shipped with it comes without page
       dimensions.  When rst2odt is run and detects that there no paper size is given in the stylesheet,  it  is  automatically  determined  using
       paperconf(1).

       When  editing stylesheets with OpenOffice.org Writer (or similar programs), the resulting files always carry a page size.  rst2odt respects
       this setting and ensures that documents processed with custom stylesheets look the same regardless of the host it is running  on.   If  you
       want  to get the original behavior, i.e. a system-dependent paper size, you can run rst2odt_prepstyles over your custom stylesheet.  Remem‐
       ber to re-run the command whenever you change the file with a word processor.

AUTHOR
       odtwriter is Copyright © 2006-2008 Dave Kuhlman <dkuhlman@rexx.com>

       This manual page was written by Michael Schutte for the Debian GNU/Linux system (but may be used by others).

                                                                                                                             RST2ODT_PREPSTYLES(1)
