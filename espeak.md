ESPEAK(1)                                                                                  General Commands Manual                                                                                  ESPEAK(1)



NAME
       espeak - A multi-lingual software speech synthesizer.

SYNOPSIS
       espeak [options] [words]

DESCRIPTION
       espeak is a software speech synthesizer for English, and some other languages.

OPTIONS
       -ffile Text file to speak.

       --stdin
              Read text input from stdin instead of a file

       If neither -f nor --stdin, words are spoken, or if none then text is spoken from stdin, each line separately.

       -ainteger
              Amplitude, 0 to 20, default is 10.

       -ginteger
              Word gap. Pause between words, units of 10 ms at the default speed.

       -kinteger
              Indicate capital letters with: 1=sound, 2=the word "capitals", higher values = a pitch increase (try -k20).

       -linteger
              Line length. If not zero (which is the default), consider lines less than this length as and-of-clause.

       -pinteger
              Pitch adjustment, 0 to 99, default is 50.

       -sinteger
              Speed in words per minute, default is 160.

       -vvoicename
              Use voice file of this name from espeak-data/voices.

       -wfile Write output to this WAV file, rather than speaking it directly.

       -b     Input text is 8-bit encoding.

       -m     Indicates  that the text contains SSML (Speech Synthesis Markup Language) tags or other XML tags. Those SSML tags which are supported are interpreted. Other tags, including HTML, are ignored,
              except that some HTML tags such as <hr> <h2> and <li> ensure a break in the speech.

       -q     Quiet, don't produce any speech (may be useful with -x).

       -x     Write phoneme mnemonics to stdout.

       -X     Write phonemes mnemonics and translation trace to stdout.

       -z     No final sentence pause at the end of the text.

       --compile[=voicename]
              Compile the pronunciation rules and dictionary in the current directory. The voicename is optional and specifies which language to use.

       --ipa[=ipa]
              Write phonemes to stdout using International Phonetic Alphabet. If ipa is 1 use ties, if 2 use ZWJ, if 3 separate with "_".

       --path=path
              Specifies the directory containing the espeak-data directory.

       --pho  Write mbrola phoneme data (.pho) to stdout or to the file in --phonout.

       --phonout=filename
              Write output from -x, -X commands and mbrola phoneme data to this file.

       --punct[=characters]
              Speak the names of punctuation characters during speaking. If characters is omitted, all punctuation is spoken.

       --split=minutes
              Starts a new WAV file every minutes. Used with -w.

       --stdout
              Write speech output to stdout.

       --voices[=language]
              Lists the available voices. If language is present then only those voices which are suitable for that language are listed.

       -h, --help
              Show summary of options.

       --version
              Show version information.

AUTHOR
       eSpeak was written by Jonathan Duddington <jonsd@jsd.clara.co.uk>. The webpage for this package can be found at http://espeak.sourceforge.net/.

       This manual page was written by Luke Yelavich <themuso@ubuntu.com>, for the Ubuntu project (but may be used by others).  Several updates by Jaroslav Škarvada <jskarvad@redhat.com>.



                                                                                                July 25, 2007                                                                                       ESPEAK(1)
