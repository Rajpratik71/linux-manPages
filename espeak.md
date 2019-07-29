ESPEAK(1)                                                     General Commands Manual                                                    ESPEAK(1)

NAME
       espeak - A multi-lingual software speech synthesizer.

SYNOPSIS
       espeak [options] [<words>]

DESCRIPTION
       espeak is a software speech synthesizer for English, and some other languages.

OPTIONS
       -h     Show summary of options.

       --version
              Prints the espeak library version and the location of the espeak voice data.

       -f <text file>
              Text file to speak

       --stdin
              Read text input from stdin instead of a file

       If neither -f nor --stdin, <words> are spoken, or if none then text is spoken from stdin, each line separately.

       -q     Quiet, don't produce any speech (may be useful with -x)

       -a <integer>
              Amplitude, 0 to 200, default is 100

       -g <integer>
              Word gap. Pause between words, units of 10mS at the default speed

       -k <integer>
              Indicate capital letters with: 1=sound, 2=the word "capitals", higher values = a pitch increase (try -k20).

       -l <integer>
              Line length. If not zero (which is the default), consider lines less than this length as and-of-clause

       -p <integer>
              Pitch adjustment, 0 to 99, default is 50

       -s <integer>
              Speed in words per minute, default is 160

       -v <voice name>
              Use voice file of this name from espeak-data/voices

       -w <wave file name>
              Write output to this WAV file, rather than speaking it directly

       -b     Input text encoding, 1=UTF8, 2=8 bit, 4=16 bit

       -m     Indicates that the text contains SSML (Speech Synthesis Markup Language) tags or other XML tags. Those SSML tags which are supported
              are interpreted. Other tags, including HTML, are ignored, except that some HTML tags such as <hr> <h2> and <li> ensure  a  break  in
              the speech.

       -x     Write phoneme mnemonics to stdout

       -X     Write  phonemes  mnemonics  and  translation trace to stdout. If rules files have been built with --compile=debug, line numbers will
              also be displayed.

       -z     No final sentence pause at the end of the text

       --stdout
              Write speech output to stdout

       --compile=voicename
              Compile the pronunciation rules and dictionary in the current directory. =<voice name> is optional and specifies which language

       --compile=debug
              Compile the pronunciation rules and dictionary in the current directory as above, but include line numbers, that get shown  when  -X
              is used.

       --ipa  Write phonemes to stdout using International Phonetic Alphabet. --ipa=1 Use ties, --ipa=2 Use ZWJ, --ipa=3 Separate with _

       --path=<path>
              Specifies the directory containing the espeak-data directory

       --pho  Write mbrola phoneme data (.pho) to stdout or to the file in --phonout

       --phonout=<filename>
              Write output from -x -X commands and mbrola phoneme data to this file

       --punct="<characters>"
              Speak the names of punctuation characters during speaking. If =<characters> is omitted, all punctuation is spoken.

       --voices[=<language code>]
              Lists the available voices. If =<language code> is present then only those voices which are suitable for that language are listed.

       --voices=<directory>
              lists the voices in the specified subdirectory.

AUTHOR
       eSpeak  was  written  by  Jonathan  Duddington  <jonsd@jsd.clara.co.uk>. The webpage for this package can be found at http://espeak.source‐
       forge.net/.

       This manual page was written by Luke Yelavich <themuso@ubuntu.com>, for the Ubuntu project (but may be used by others).

                                                                  August 6, 2010                                                         ESPEAK(1)
