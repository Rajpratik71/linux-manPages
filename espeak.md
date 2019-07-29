ESPEAK(1)                                                                                  General Commands Manual                                                                                  ESPEAK(1)



NAME
       espeak - A multi-lingual software speech synthesizer.

SYNOPSIS
       espeak [options] [<words>]

DESCRIPTION
       espeak is a software speech synthesizer for English, and some other languages.

OPTIONS
       -h     Show summary of options.

       -f <text file>
              Text file to speak

       --stdin
              Read text input from stdin instead of a file

       If neither -f nor --stdin, <words> are spoken, or if none then text is spoken from stdin, each line separately.

       -q     Quiet, don't produce any speech (may be useful with -x)

       -a <integer>
              Amplitude, 0 to 20, default is 10

       -l <integer>
              Line length. If not zero (which is the default), consider lines less than this length as and-of-clause

       -p <integer>
              Pitch adjustment, 0 to 99, default is 50

       -s <integer>
              Speed in words per minute, default is 160

       -v <voice name>
              Use voice file of this name from espeak-data/voices

       -b     Input text is 8-bit encoding

       -m     Indicates  that the text contains SSML (Speech Synthesis Markup Language) tags or other XML tags. Those SSML tags which are supported are interpreted. Other tags, including HTML, are ignored,
              except that some HTML tags such as <hr> <h2> and <li> ensure a break in the speech.

       -w <wave file name>
              Write output to this WAV file, rather than speaking it directly

       -x     Write phoneme mnemonics to stdout

       -X     Write phonemes mnemonics and translation trace to stdout. If rules files have been built with --compile=debug, line numbers will also be displayed.

       --stdout
              Write speech output to stdout

       --compile=<voice name>
              Compile the pronunciation rules and dictionary in the current directory. =<voice name> is optional and specifies which language

       --path=<path>
              Specifies the directory containing the espeak-data directory

       --phonout=<filename>
              Write output from -x -X commands and mbrola phoneme data to this file

       --punct="<characters>"
              Speak the names of punctuation characters during speaking. If =<characters> is omitted, all punctuation is spoken.

       -k <integer>
              Indicate capital letters with: 1=sound, 2=the word "capitals", higher values = a pitch increase (try -k20).

       --voices[=<language code>]
              Lists the available voices. If =<language code> is present then only those voices which are suitable for that language are listed.

       --compile=voicename
              Compile the pronunciation rules and dictionary in the current directory. =<voice name> is optional and specifies which language

       --compile=debug
              Compile the pronunciation rules and dictionary in the current directory as above, but include line numbers, that get shown when -X is used.

AUTHOR
       eSpeak was written by Jonathan Duddington <jonsd@jsd.clara.co.uk>. The webpage for this package can be found at http://espeak.sourceforge.net/.

       This manual page was written by Luke Yelavich <themuso@ubuntu.com>, for the Ubuntu project (but may be used by others).



                                                                                                July 25, 2007                                                                                       ESPEAK(1)
