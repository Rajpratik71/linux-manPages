PTEX(1)                                                                          General Commands Manual                                                                          PTEX(1)

NAME
       ptex, uptex, eptex, euptex - Japanese "Publishing TeX"

SYNOPSIS
       ptex [options] [&format] [file|\commands]

DESCRIPTION
       pTeX  (ptex)  is  a  TeX  engine with extensions for Japanese typesetting, including features related to line breaking rules, inter-character spacing and vertical writing. It was
       first developed by ASCII Corporation, in the aim of providing a Japanese TeX which can be used for commercial publishing. For pTeX, the character set available is limited to  JIS
       X 0208, namely JIS level-1 and level-2.

       upTeX  (uptex) is a Unicode-enabled pTeX with extensions for better handling of CJK (Chinese, Japanese and Korean) multilingual documents.  It has been developed by Takuji Tanaka
       since 2007.

       e-pTeX (eptex) is a merge of e-TeX and pTeX.

       e-upTeX (euptex) is a merge of e-TeX and upTeX.

       In the following sections, we refer to these engines as (e-)(u)pTeX.

       (e-)(u)pTeX's handling of its command-line arguments is similar to that of the other TeX programs in the web2c implementation.

OPTIONS
       Here we list only additions/deletions of command line options which are specific to (e-)(u)pTeX. For (u)pTeX, other options are similar to TeX. For e-(u)pTeX, other  options  are
       similar to e-TeX.

       Additions (supported by ptexenc library):

       -kanji string
              Sets the input Japanese Kanji code.  The string can be either euc (EUC-JP), jis (ISO-2022-JP), sjis (Shift_JIS), and utf8 (UTF-8).  For (e-)upTeX, uptex is also allowed.

       -kanji-internal string
              Sets the internal Kanji code.  The string can be either euc, and sjis.  For (e-)upTeX, uptex is also allowed.

       Deletions:

       -enc   In this version of (e-)(u)pTeX, encTeX extensions are not available.

SEE ALSO
       tex(1), etex(1).

AUTHORS
       This   version   of   (e-)(u)pTeX   is   maintained  by  Japanese  TeX  Development  Community  <https://texjp.org>.   For  bug  reports,  open  an  issue  at  GitHub  repository
       <https://github.com/texjporg/tex-jp-build>, or send an e-mail to <issue@texjp.org>.

       This manual page was written by Hironobu Yamashita.

Web2C 2019/dev                                                                         27 May 2018                                                                                PTEX(1)
