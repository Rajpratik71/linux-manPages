DVI2FAX(1)                                                                                 General Commands Manual                                                                                 DVI2FAX(1)



NAME
       dvi2fax - convert a TeX DVI file to G3 fax format

SYNOPSIS
       dvi2fax [-hi|-lo] file[.dvi] [options for dvips]

DESCRIPTION
       dvi2fax uses dvips(1) to convert a TeX DVI file to PostScript, then gs(1) to convert the PostScript to G3 fax file format.

OPTIONS
       -hi use high fax resolution (204x196 dpi) (default).

       -lo use low fax resolution (204x98).

       dvips options can follow the file name.

EXAMPLE
       Example: dvi2fax foo -l 2

SEE ALSO
       dvips(1), gs(1).



                                                                                               October 30, 1999                                                                                    DVI2FAX(1)
