MENDEX(1)                                                                        General Commands Manual                                                                        MENDEX(1)

NAME
       mendex - Japanese index processor

SYNOPSIS
       mendex [-ilqrcgfEJSU] [-s sty] [-d dic] [-o ind] [-t log] [-p no] [-I enc] [--help] [--] [ idx0 idx1 idx2 ...]

DESCRIPTION
       The  program  mendex is a general purpose hierarchical index generator; it accepts one or more input files (.idx; often produced by a text formatter such as ), sorts the entries,
       and produces an output file which can be formatted. It is almost compatible with makeindex, and additional feature for handling readings of kanji words is also available.
       The formats of the input and output files are specified in a style file.  The readings of kanji words can be specified in a dictionary file.
       The index can have up to three levels (0, 1, and 2) of subitem nesting.

OPTIONS
       -i        Take input from stdin, even when index files are specified.

       -l        Set ´sort by character order´. By default, ´sort by word order´ is used.  Details are described below.

       -q        Quiet mode; send no message to stderr, except error messages and warnings.

       -r        Disable implicit page range formation. By default, three or more successive pages are automatically abbreviated as a range (e.g. 1–5).

       -c        Compress sequence of intermediate blanks (space(s) and/or tab(s)) into a space and ignore leading and trailing blank(s).  By  default,  blanks  in  the  index  key  are
                 retained.

       -g        Make Japanese index head A-line (A, Ka, Sa, ...) of the gojuon table (Japanese syllabary). By default, all the characters in the gojuon table are used.

       -f        Force to output Kanji characters even non-existent in dictionaries.

       -s sty    Employ sty as the style file.

       -d dic    Employ dic as the dictionary file. The dictionary file is composed of lists of <index_word reading>.

       -o ind    Employ ind as the output index file. By default, the file name is created by appending the extension ind to the base name of the first input file.

       -t log    Employ log as the transcript file. By default, the file name is created by appending the extension ilg to the base name of the first input file.

       -p no     Set  the  starting  page number of the output index list to be no. The argument no may be numerical or one of the following: any (the next page to the end of contents),
                 odd (the next odd page to the end of contents), even (the next even page to the end of contents).

       -E        Set input/output character encoding to EUC-JP.

       -J        Set input/output character encoding to JIS (ISO-2022-JP).

       -S        Set input/output character encoding to Shift_JIS.

       -U        Set input/output character encoding to UTF-8.

       -I enc    Set internal character encoding to enc. The argument enc may be euc (EUC-JP) or utf8 (UTF-8).  The default is set to utf8.

       --help    Show summary of options.

       --        Arguments after -- are not taken as options.

STYLE FILE
       The style file informs mendex about the format of the idx input files and the intended format of the final output file. The format is upper compatible with the one for makeindex.
       The style file contains a list of <specifier attribute> pairs.  There are two types of specifiers: input and output.  Pairs do not have to appear in any particular order.  A line
       begun by ´%´ is a comment.

       Input file style parameter

       keyword  <string>             "\\indexentry"
                                     Command with an argument of index entry.

       arg_open  <char>              ´{´
                                     Opening delimiter which shows the beginning of index entry.

       arg_close  <char>             ´}´
                                     Closing delimiter which shows the end of index entry.

       range_open  <char>            ´(´
                                     Opening delimiter which shows the beginning of page range.

       range_close  <char>           ´)´
                                     Closing delimiter which shows the end of page range.

       level  <char>                 ´!´
                                     Delimiter which shows lower level.

       actual  <char>                ´@´
                                     Symbol which shows the next sequence is to appear as index strings in the output file.

       encap  <char>                 ´|´
                                     Symbol which shows the next sequence is to be used as command name attached to the page number.

       page_compositor  <string>     "-"
                                     Separator between page levels for a style with multi-levels of page numbers.

       page_precedence  <string>     "rnaRA"
                                     Priority of expression for page number.  ´R´ and ´r´ correspond to Roman. ´n´ corresponds to arabic numeral.  ´A´ and ´a´ correspond to Latin alpha‐
                                     bet.

       quote  <char>                 ´"´
                                     Escape character for mendex parameters.

       escape  <char>                ´\\´
                                     Escape character for general scripts.

       Output file style parameter

       preamble  <string>            "\\begin{theindex}\n"
                                     Preamble of output file.

       postamble  <string>           "\n\n\\end{theindex}\n"
                                     Postamble of output file.

       setpage_prefix  <string>      "\n  \\setcounter{page}{"
                                     Prefix of page number if start page is designated.

       setpage_suffix  <string>      "}\n"
                                     Suffix of page number if start page is designated.

       group_skip  <string>          "\n\n  \\indexspace\n"
                                     Strings to insert vertical space before new section of index.

       lethead_prefix  <string>      ""
                                     Prefix of heading for newly appeared heading letter.

       heading_prefix  <string>      ""
                                     Same as lethead_prefix.

       lethead_suffix  <string>      ""
                                     Suffix of heading for newly appeared heading letter.

       heading_suffix  <string>      ""
                                     Same as lethead_suffix.

       lethead_flag  <number>        0
                                     Flag to control output of heading letters.  ´0´, ´1´ and ´-1´ respectively denotes no output, uppercase and lowercase.

       heading_flag  <number>        0
                                     Same as lethead_flag.

       item_0  <string>              "\n  \\item "
                                     Command sequence inserted between primary level entries.

       item_1  <string>              "\n     \\subitem "
                                     Command sequence inserted between sub level entries.

       item_2  <string>              "\n       \\subsubitem "
                                     Command sequence inserted between subsub level entries.

       item_01  <string>             "\n    \\subitem "
                                     Command sequence inserted between primaly and sub level entries.

       item_x1  <string>             "\n    \\subitem "
                                     Command sequence inserted between primary and sub level entries when main entry does not have page number.

       item_12  <string>             "\n    \\subsubitem "
                                     Command sequence inserted between sub and subsub level entries.

       item_x2  <string>             "\n    \\subsubitem "
                                     Command sequence inserted between sub and subsub level entries when sub level entry does not have page number.

       delim_0  <string>             ", "
                                     Delimiter string between primary level entry and first page number.

       delim_1  <string>             ", "
                                     Delimiter string between sub level entry and first page number.

       delim_2  <string>             ", "
                                     Delimiter string between subsub level entry and first page number.

       delim_n  <string>             ", "
                                     Delimiter string between page numbers commonly used for any entry level.

       delim_r  <string>             "--"
                                     Delimiter string between pages to show page range.

       delim_t  <string>             ""
                                     Delimiter string output at the end of page number list.

       suffix_2p  <string>           ""
                                     String to be inserted in place of delim_n and the next page number when the two pages are contiguous.
       It works only when the parameter is defined.

       suffix_3p  <string>           ""
                                     String to be inserted in place of delim_r and the third page number when the three pages are contiguous.  The parameter is prior to suffix_mp.
       It works only when the parameter is defined.

       suffix_mp  <string>           ""
                                     String to be inserted in place of delim_r and the last page number when the three or more pages are contiguous.
       It works only when the parameter is defined.

       encap_prefix  <string>        "\\"
                                     Prefix for an encapsulating command when the encapsulating command is added to the page number.

       encap_infix  <string>         "{"
                                     Prefix just before the page number when the encapsulating command is added to the page number.

       encap_suffix  <string>        "}".
                                     Suffix after the page number when the encapsulating command is added to the page number.

       line_max  <number>            72
                                     Maximum number of one line.  If exceed the number, lines are folded.

       indent_space  <string>        ""
                                     Space for indent which inserted to top of folded line.

       indent_length  <number>       16
                                     Length of space for indent which inserted to top of folded line.

       symhead_positive  <string>    "Symbols"
                                     Strings to output as heading letter for numbers and symbols when lethead_flag or heading_flag is positive number.

       symhead_negative  <string>    "symbols"
                                     Strings to output as heading letter for numbers and symbols when lethead_flag or heading_flag is negative number.

       symbol  <string>              ""
                                     Strings to output as heading letter for numbers and symbols when symbol_flag is non zero.
       If specified, the option is prior to symhead_positive and symhead_negative.  (Extended by mendex)

       symbol_flag  <number>         1
                                     Flag to output of symbol. If ´0´, do not output.  (Extended by mendex)

       letter_head  <number>         1
                                     Flag of heading letter for Japanese Kana.  If ´1´ and ´2´, Katakana and Hiragana is used, respectively.  (Extended by mendex)

       priority  <number>            0
                                     Flag of sorting method for index words composed of Japanese and non-Japanese (ex. Latin scripts).  If non zero, one space (U+20) is inserted between
                                     Japanese sequence and non-Japanese sequence in sorting procedure.  (Extended by mendex)

       character_order  <string>     "SEJ"
                                     Order of scripts and symbols.  ´S´, ´E´ and ´J´ respectively denotes symbol, English and Japanese.  (Extended by mendex)

ABOUT JAPANESE PROCESSING
       mendex has an additional feature to simplify the procedure of handling Japanese indexes, compared to makeindex. Users can save the effort of manually  specifying  a  reading  for
       every kanji word.
       Japanese  kanji  words  are usually sorted by the syllables of their readings (´Yomi´), which can be represented by kana (Hiragana, Katakana) scripts.  mendex accepts index words
       specified in kana expression directly on an input file, and also accepts conversion from index words to kana scripts by referring to Japanese dictionaries.

       Examples of internal simplification of syllables are shown below.

              かぶしきがいしゃ         かふしきかいしや
              マッキントッシュ         まつきんとつしゆ
              ワープロ            わあふろ

       The dictionary file consists of list with <´index_word´ ´reading´>.  The index word can be written in any scripts (kanji, kana, etc), and the  reading  must  be  in  Hiragana  or
       Katakana scripts.  The delimiter between the index word and its reading is one or more tab(s) or space(s).
       An example of a Japanese dictionary is shown below.

              漢字      かんじ
              読み      よみ
              環境      かんきょう
              α         アルファ

       Here,  each index word is allowed to have only one Yomi.  Though some kanji words (ex. 「表」) may have more than one Yomi´s (ex. 「ひょう」 and 「おもて」), only one of them can
       be registered in the dictionary.  When some different Yomi´s are needed, they should be specified explicitly in kana expression (ex. \index{ひょう@表}  or  \index{おもて@表})  on
       the input file.
       Moreover,  a dictionary file is automatically referred by setting the file name at an environment variable INDEXDEFAULTDICTIONARY.  The dictionary set by the environment variable
       can be used together with file(s) specified by -d option.

ABOUT SORTING PROCEDURE
       mendex sorts indexes as is (´sort by word order´) by default.  Setting -l option, spaces between words in an index are truncated prior to sorting procedure  (´sort  by  character
       order´).
       Even when sort by character order, the index at output remains the original sequence without the truncation.
       Follows show an example.

              sort by word order       sort by character order
              X Window            Xlib
              Xlib                XView
              XView                    X Window

       In  addition,  two sorting methods can be applied for indexes which contains both Japanese kana and other scripts (e.g. Latin script).  By setting priority 0 (default) and 1 at a
       style file, a space between Japanese Kana and other scripts is inserted and not inserted respectively, prior to the sorting procedure.
       Follows show an example.

              priority=0               priority=1
              index sort               indファイル
              indファイル              index sort

ENVIRONMENT VARIABLES
       mendex refers environment variables as follows.

       INDEXSTYLE
                 Directory where index style files exist.

       INDEXDEFAULTSTYLE
                 Index style file to be referred to as default.

       INDEXDICTIONARY
                 Directory where dictionary files exist.

       INDEXDEFAULTDICTIONARY
                 Dictionary file which is automatically read.

DETAIL
       Detailed specification is compatible with makeindex.

KNOWN ISSUES
       When plural page number expression is used, .idx files should be specified along with the order of page numbers. Otherwise, wrong page numbers might be output.

SEE ALSO
       tex(1), latex(1), makeindex(1)

AUTHOR
       This manual page was written by Japanese  Development Community.

                                                                                                                                                                                MENDEX(1)
