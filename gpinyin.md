GPINYIN(1)                                                    General Commands Manual                                                   GPINYIN(1)

NAME
       gpinyin - Chinese European-like writing within groff

SYNOPSIS
       gpinyin [-] [--] [ filespec ....]
       gpinyin -h|--help
       gpinyin -v|--version

DESCRIPTION
       This is a preprocesor for groff(1).  It allows to add the Chinese European-like language Pinyin into groff(7) files.

OPTIONS
   Breaking Options
       An option is breaking, when the program just writes the information that was asked for and then stops.  All other arguments will be ignored
       by that.  The breaking options are here

       -h | --help
              Print help information with a short explanation of options to standard output.

       -v | --version
              Print version information to standard output.

   Filespec Options
       So far, there are only filespec and breaking options.

       filespec arguments are file names or the minus sign - for standard input.  As usual, the argument -- can be used in order to let  all  fol‐
       lowing arguments mean file names, even if the names begin with a minus character -.

PINYIN PARTS
       Pinyin parts in groff files are enclosed by two .pinyin requests with different arguments.  The starting request is
              \.pinyin start
       or
              \.pinyin begin
       and the ending request is
              \.pinyin stop
       or
              \.pinyin end

PINYIN DETAILS
       Pinyin is used for writing the Chinese language in a European-like (romanization) way.  The Chinese language consists of more than 400 syl‐
       lables, each with one of 5 different tones.  In Pinyin, such toned syllables can be appended to word-like connections.

   Syllables
       The Chinese language is based on about 411 defined syllables, see ⟨http://en.wikipedia.org/wiki/Pinyin_table⟩.

       In Pinyin, each syllable consists of 1 to 6 European-like letters, the normal ASCII characters in upper and lower case,  the  only  unusual
       characters are the U dieresis (umlaut) in both cases, i.e.  [a-zA-ZüÜ].

       In  the groff gpinyin input, all ASCII letters are written as usual.  But the u/U dieresis can be written as either as \['u] or ue in lower
       case or \['U], Ue, UE in upper case.

   Tones
       Each syllable has exactly one of 5 defined tones.  The 5th tone is not written at all, but each tone 1 to 4 is written as an accent above a
       defined vowel within the syllable.

       In the source file, these tones are written by adding a number 0 to 5 after the syllable name.

       In each writing, the tone numbers 1 to 4 are transformed into accents above vowels.

       The  1st  tone is the horizontal macron \[a-] ¯ , similar to a minus or sub character, but on top of the vowel.  In each source file, write
       the 1st tone as syllable1.

       The 2nd tone is the accute accent \[aa] ´.  In each source file, write the 2nd tone as syllable2.

       The 3rd tone is the caron sign, \[ah] ˇ , which looks a bit like a small v above the vowel.  In each source file, write  the  3rd  tone  as
       syllable3.

       The 4th tone is the grave accent \[ga] `.  In each source file, write the 4th tone as syllable4.

       The  5th  tone is the no-tone.  The numbers 0 and 5 can be used for the (no-tone).  The no-tone number can be omitted, when the syllable is
       the end of some word.  But within a word of syllables, one of the no-tone numbers 0 or 5 must be written.

SEE ALSO
       groff(1)
       grog(1)
       groffer(1)
              Man-pages with section 1 related to groff.  They can be called with either
                     man name
                     groffername

       groff(7)
       groff_char(7)
              Man-pages with section 7 related to groff.  They can be called with either
                     man 7 name
                     groffer 7 name

       Internet documents related to pinyin are
              Wikipedia pinyin ⟨http://en.wikipedia.org/wiki/Pinyin⟩,
              Pinyin Table ⟨http://en.wikipedia.org/wiki/Pinyin_table⟩,
              Unicode vowels for Pinyin ⟨http://;www.sino.uni-heidelberg.de/course_resources/s02/py-vowels.htm⟩,
              pinyintoUnicode ⟨http://www.foolsworkshop.com/ptou/index.html⟩,
              Online Chinese Tools ⟨http://www.mandarintools.com/⟩,
              Main pinyin website ⟨http://www.pinyin.info/index.html⟩,
              Where do the tone marks go?  ⟨http://www.pinyin.info/rules/where.html⟩,
              Pinyin for TeX 1 ⟨http://git.savannah.gnu.org/gitweb/?p=cjk.git;a=blob_plain;f=doc/pinyin.txt;hb=HEAD⟩,
              Pinyin for TeX 2 ⟨http://git.savannah.gnu.org/gitweb/?p=cjk.git;a=blob_plain;f=texinput/pinyin.sty;hb=HEAD⟩.

COPYING
       Copyright © 2014 Free Software Foundation, Inc.

       This file is part of gpinyin, which is part of groff, a free software project.

       You can redistribute it and/or modify it under the terms of the GNU General Public License version 2 as  published  by  the  Free  Software
       Foundation.

       The license text is available in the internet at ⟨http://www.gnu.org/licenses/gpl-2.0.html⟩.

AUTHORS
       This file was written by Bernd Warken <groff-bernd.warken-72@web.de>.

Groff Version 1.22.3                                              28 January 2016                                                       GPINYIN(1)
