VLNA(1)                                                                          General Commands Manual                                                                          VLNA(1)

NAME
       vlna - adds tilde after each non-syllabic preposition

USAGE
       vlna [options] [filenames]

PREFACE
       There  exists  a  special  Czech  and Slovak typographical rule: you cannot leave the non-syllabic preposition on the end of one line and continue writting text on next line. For
       example, you cannot write down the text "v lese" (in a forest) like "v<new-line>lese". The program vlna adds the asciitilde between such preposition and the next word and removes
       the space(s) in this place.  It means, the program converts "v lese" to "v~lese". You can use this program as a preporcessor before TeXing. Moreower, you can set another sequence
       to store instead asciitilte (see the -x option).

DESCRIPTION
       The program vlna processes one or more files, searches the non-syllabic prepositions followed by space(s) in these files and converts this/these space(s) to asciitilde  for  each
       such occurrence.

       In  the processed file, the activity of the program can be blocked by %~- sequence and the activity can be restored again by the %~+ sequence. These sequences can include spaces,
       it means that % ~- is a correct sequence too.

       The rule to recognize a preposition follows: The arbitrary number of opening parentheses can be written before the preposition and before these (optional) parentheses must be the
       space,  tabelator or new-line. The preposition itself is one-letter word, the letters have to be from this set: {KkSsVvZzOoUuAI}. See the -v option if you want to change this set
       of letters. From version 1.2, the TeX sequence can be written before preposition and before the  brace.  Example:  "<new-line>([V  lese"  is  converted  to  "<new-line>([V~lese".
       Another example: "\uv{V lese}" is converted to "\uv{V~lese}".

       One  or more blank-spaces have to be included after preposition before next word. The blank-space means space or tabelator.  One <new-line> can be here too.  All these characters
       are removed and replaced by asciitilde (or by another string, see -x option). If <new-line> is deleted, another <new-line> is created  before  preposition  (and  before  optional
       parentheses) in order to the number of lines is kept unchanged.  Example: "... V<new-line><tabelator>lese" is converted to "...<new-line>V~lese".

       The  program checks the consintence of TeX's math environments (if -m option isn't used). For example the "$...$$...$" sequence (it means the display mode switch inside the text-
       math mode) generates a warning. Empty line inside display mode generates a warning too and the program processes next text like in normal (non-math) mode. The  existence  of  the
       "$" inside display mode are accepted because the constructions like $$..\hbox{..$..$}..$$ are allowed and common.

       The  consistence  of  verbatim mode is checked on the end of the file.  If the file ends but the verbatim mode does not end the warning is printed.  This behavior can be switched
       off by -n or -w options.

       The program suppresses the tilde changing after letters like prepositions but they are not prepositions because the \TeX or \LaTeX sequence precedes. Example: "vlastnosti \TeX  u
       jsou"  is  not  converted  to  "vlastnosti  \TeX  u~jsou",  because  this  text is printed (after TeX processing) like "vlastnosti TeXu jsou". The letter "u" is a suffix here, no
       preposition.

OPTIONS
       The options are optional and can be written in arbitrarty order separated by space.

       -f     Filter. The [filenames] are treated as follows:

              vlna -f filename1 filename2
                  Input is filename1, output is filename2.

              vlna -f filename1
                  Input is filename1, output is stdout.

              vlna -f
                  Input is stdin, output is stdout.

              vlna filename1 [filename2 [filename3 ...]]
                  If the -f option is omitted then each file is processed independently and it is re-written.

       -s     The silent mode. No messages, warnings, statistics are printed.  Only errors which terminates the program untimely are printed.  If this parameter is omitted then  banner,
              warnings and statistics are printed to stderr.

       -r     Do not create the backups. The option -r is irrelevant if the -f option is used. If the -f and -r options aren't used then each re-written file is stored with its original
              contents to a backup file (the name of backup file is the same as filename, only the tilde is used instead of the last character).

       -v characters
              The set of characters treated as non-syllabic prepositions is declared by this option. Default: -v KkSsVvZzOoUuAI.  The space between -v and characters is required.

       -x code
              The code is a string written in hexadecimal notation (even hexa digits is required). This string will be saved after prepositions instead asciitilde which is default.  The
              example:  -x  C2A0  two bytes are stored after each non-syllabic preposition, first byte has C2 code and second byte has A0 code. This example means that NO-BREAK SPACE in
              UTF8 encoding will be used after prepositions.  Another example: -x 00A0 the NO-BREAK SPACE in UTF16 encoding.  Another example: -x 48454C4C4F the  string  HELLO  will  be
              used.  The space between -x and code is required.

       -m     The  math-modes  ($...$  and  $$...$$) are ignored.  It means that non-syllabic prepositions is searched in math-mode too.  Default (without -m option): no changes in math
              modes are done because (for example) "v" is variable in math-mode, no preposition.

       -n     The verbatim mode (\verb<char>...<char>, \begtt...\endtt) is ignored, it means the program can do a changes in verbatim  environment.   Default  (without  -n  option):  no
              changes in verbatim mode are done.

       -l     The LaTeX mode. The following environments are treated as display mode: \begin{display}...\end{display} and \begin{equation}...\end{equation} and the following environment
              is treated as verbatim mode: \begin{verbatim}...\end{verbatim}.

       -w     The web mode (Knuth's web, no www:-). The following sequences are treated as verbatim: @<, @d...@*, @space or @>|.  It means program code is  unchanged  in  *.w  or  *.web
              files, only web-comments are processed.

EXAMPLES
       vlna -m -n -s -r file
              The program has a behavior similar to the old vlnka program.

       vlna *.tex
              All files with .tex suffix in current directory will be processed (and possibly changed). (The "*" is UNIX-shell feautre).

       vlna -f file > /dev/null
              Only the consistence checking of math and verbatim modes is processed.  No changes are done.

AUTHORS
       Petr Olsak <olsak@math.feld.cvut.cz>.  Man page (Czech original) and Makefile is created by Rulolf Cejka

                                                                                      March 30 2009                                                                               VLNA(1)
