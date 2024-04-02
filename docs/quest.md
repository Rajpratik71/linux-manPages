QUEST(1)                                    User Commands                                    QUEST(1)

NAME
       quest - Xapian command line search tool

SYNOPSIS
       quest [OPTIONS] 'QUERY'

DESCRIPTION
       quest - Xapian command line search tool

       NB: QUERY should be quoted to protect it from the shell.

OPTIONS
       -d, --db=DIRECTORY
              database to search (multiple databases may be specified)

       -m, --msize=MSIZE
              maximum number of matches to return

       -c, --check-at-least=HOWMANY
              minimum number of matches to check

       -s, --stemmer=LANG
              set the stemming language, the default is 'english' (pass 'none' to disable stemming)

       -p, --prefix=PFX:TERMPFX
              add a prefix

       -b, --boolean-prefix=PFX:TERMPFX
              add a boolean prefix

       -f, --flags=FLAG1[,FLAG2]...
              specify  QueryParser flags.  Valid flags: auto_multiword_synonyms, auto_synonyms, bool‐
              ean, boolean_any_case, cjk_ngram, default, lovehate, partial, phrase, pure_not,  spell‐
              ing_correction, synonym, wildcard

       -o, --default-op=OP
              specify  QueryParser  default operator (default: or).  Valid operators: and, elite_set,
              max, near, or, phrase, synonym

       -w, --weight=SCHEME
              specify weighting scheme to use (default: bm25).   Valid  schemes:  bb2,  bm25,  bm25+,
              bool, dlh, dph, ifb2, ineb2, inl2, lm, pl2, pl2+, tfidf, trad

       -h, --help
              display this help and exit

       -v, --version
              output version information and exit

xapian-core 1.4.5                            October 2017                                    QUEST(1)
