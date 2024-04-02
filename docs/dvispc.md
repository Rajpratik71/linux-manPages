DVISPC(1)                                                                        General Commands Manual                                                                        DVISPC(1)

NAME
       dvispc - Modify a DVI file to be page-independent in specials

SYNOPSIS
       dvispc [-c] [-bvz] input_dvi_file [output_dvi_file]

       dvispc -d input_dvi_file

       dvispc -s [-p..] input_dvi_file [output_text_file]

       dvispc -a [-ltv] [-J..] [-p..] [-r..]  input_dvi_file [output_text_file]

       dvispc -x[..]  [-ltv] [-r..]  [input_text_file] output_dvi_file

DESCRIPTION
       Dvispc is a utility to modify/edit  DVI file with the following features:

           Mode option -c (default):
               modify an input DVI to be page-independent in specials (default)

           Mode option -d:
               check if an input DVI is page-independent in specials

           Mode option -s:
               show all specials in the input DVI

           Mode option -a:
               translate DVI into a Text (like dv2dt in dtl)

           Mode option -x:
               translate Text into a DVI (like dt2dv in dtl)

       (1) The main feature of dvispc is the first one, to make a page-independent DVI file.

       A  "pure"  DVI  file  must  be actually page-independent.  However in recent years, DVI files with lots of \special's (color, annotation etc.) are commonly used, and they are not
       always page-independent. In such case, for example, dviselect or dvidvi fails to preserve \special's (e.g. page color might be lost).

       The program dvispc corrects such page-"dependent" DVI files to be page-independent, which can be safely processed by dviselect or dvidvi and then properly converted to other for‐
       mats such as PostScript and PDF.

       (2) To know whether such a correction is needed or not, dvispc -d will suffice.

       (3) The mode -s lists all specials found in the input DVI as-is, with a preceding number which denotes the page where it appears.  For example,

              [1]
              {color push  Black}
              {color pop}
              {color push rgb 1 0 0}
              {color pop}
              [2]
              {color push  Black}
              {color pop}

       This feature is equivalent to a program dvispecials in TeX-Guy package <http://www-masu.ist.osaka-u.ac.jp/%7Ekakugawa/TeX-Guy/> and dvii -s <https://ctan.org/pkg/dvii>.

       (4)  The  mode  -a  and -x correspond to dv2dt and dt2dv in the dtl (= DVI Text Language) package respectively. By default dvispc -a formats the output text in its own style, but
       DTL-compatible format is available with -t option. Also, dvispc -x can accept DTL-compatible text input.

SUPPORTED SPECIALS
       Currently dvispc supports the followings:

           dvips-compatible specials
               color push, color pop, background
           dvipdfm(x) specials
               pdf:bcolor, pdf:ecolor, pdf:bgcolor, pdf:bann, pdf:eann
           tpic specials:
               pn

       Other specials might be supported in the future if needed.

SEE ALSO
       dviselect(1), dvidvi(1), dvips(1), dvipdfmx(1)

AUTHOR
       The program dvispc is derived from the DVIOUT package (DVI previewer for Windows) by Toshio OSHIMA ("SHIMA"), Yoshiki OTOBE, and Kazunori ASAYAMA.  Current version is  maintained
       by Japanese  Development Community <https://texjp.org>.
       For  more  information,  please  refer  to  dvispc-en.txt (in English) and dvispc-ja.txt (in Japanese) on our GitHub repository, <https://github.com/texjporg/tex-jp-build> (under
       source/texk/dviout-util directory).

                                                                                                                                                                                DVISPC(1)
