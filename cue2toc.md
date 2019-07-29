CUE2TOC(1)                                                                                 General Commands Manual                                                                                 CUE2TOC(1)



NAME
       cue2toc - convert CUE to TOC format


SYNOPSIS
       cue2toc [-hnqv] [-o tocfile] [-w wavefile] [cuefile]


DESCRIPTION
       Cue2toc  converts cuefile from CUE to TOC format and writes the result to tocfile.  If either cuefile or tocfile is omitted or a single dash "-" cue2toc reads from standard input and writes to stan-
       dard ouput respectively.

       CUE files are text files describing the layout of a CD-Rom and typically carry the extension ".cue".

       Cdrdao is a CD-burning application which has its own native TOC format to describe the disc layout. Although cdrdao has direct support for reading CUE files, it is currently limited to  data  tracks
       only. So cue2toc's main usefulness lies in converting CUE files containing audio tracks.

       Output of CD-Text data can be disabled with the -n option.

       CUE  files often come with MP3 files but since cdrdao doesnt support decoding them on the fly they probably must be decoded by other means prior to writing the CD (e.g. using lame).  For this reason
       you can specify a filename with the -w option to be used for all audio tracks instead of the one in the CUE file. Of course this is only really useful if all the tracks are based on the  same  file.
       This seems to be the case quite often however.

       Cue2toc normally displays warning messages for unsupported commands and constructs. The -q option disables these warnings.


OPTIONS
       -h     print a short help message


       -n     no CD-Text; disable output of CD-Text information


       -o tocfile
              write result to tocfile instead of standard ouput


       -q     quiet mode; do not print warnings


       -v     print version number


       -w wavefile
              use wavefile for all audio tracks



CUE FORMAT
       What follows is a description of the CUE format expected by cue2toc.  For information about the TOC format please consult the cdrdao(1) manual page.

       CUE files consist of commands and their arguments which must be separated from each other by any number of whitespace characters.  Space, horizontal tabulator, newline and carriage return are recog-
       nized as whitespace characters except inside strings surrounded by double quotes, where they are part of the string. Commands are not case sensitive. CD-Text data can be at most  80  characters  per
       item.

       Timecode  values are accepted in the forms "X:X:X", "X:X" and "X" where each "X" must consist of at most two digits and may be zero padded to the left. They are interpreted as "M:S:F", "S:F" and "F"
       respectively where "M" means "minutes" and must be in the range 0 <= M <= 99, "S" means "seconds" and must be in the range 0 <= S <= 59, and "F" means "frames" and must be in the range 0 <= F <= 74.

       CUE files are logically divided into a global section and one to 99 track sections. Inside these sections the following commands are allowed:


   Global Section
       REM anything_to_newline
       CATALOG string
       CDTEXTFILE string
       TITLE string
       PERFORMER string
       SONGWRITER string
       FILE string BINARY|MOTOROLA|AIFF|WAVE|MP3



       REM    Optional.  Introduces a comment. Anything from there on up to and including the next newline character is ignored. Comments can appear anywhere in the file but not between a command  and  its
              arguments.


       CATALOG
              Optional.  The Media Catalog Number of the disc. Must be exactly 13 characters.


       CDTEXTFILE
              Optional.  Specifies an external file containing CD-Text data. Ignored.


       TITLE  Optional.  The CD-Text title of the disc.


       PERFORMER
              Optional.  The CD-Text performer of the disc.


       SONGWRITER
              Optional.  The CD-Text songwriter of the disc.


       FILE   Required.   The  name  and  type  of the file to be used for all following tracks.  The string contains the name of the file followed by one of BINARY, MOTOROLA, AIFF, WAVE or MP3.  As far as
              cue2toc is concerned the type of the file is effectively ignored.  Nonetheless MOTOROLA, AIFF and MP3 cause printing of a warning message since these file types can not be used directly  with
              cdrdao.


       The first appearance of a TRACK command causes leaving of the global section and entering the track section.


   Track Section
       TRACK number mode
       REM anything_to_newline
       FLAGS [DCP] [4CH] [PRE] [SCMS]
       ISRC string
       TITLE string
       PERFORMER string
       SONGWRITER string
       PREGAP timecode
       INDEX number timecode
       POSTGAP timecode
       FILE string BINARY|MOTOROLA|AIFF|WAVE|MP3



       TRACK  Required.  Starts a new track definition. The number is ignored. The mode must be one of AUDIO, MODE1/2048, MODE1/2352, MODE2/2336 or MODE2/2352.


       FLAGS  Optional.   Defines the flags for this track. Must be followed by one or more of the following commands: DCP (digital copy permitted), 4CH (four channel audio), PRE (pre-emphasis enabled) and
              SCMS (serial copy management system).  SCMS is ignored because there is no corresponding option in the TOC format.


       ISRC   Optional.  The International Standard Recording Code for this track. Must be exactly 12 characters long.


       TITLE  Optional.  The CD-Text title of this track.


       PERFORMER
              Optional.  The CD-Text performer of this track.


       SONWRITER
              Optional.  The CD-Text songwriter of this track.


       PREGAP Optional.  The length of the track pregap to be filled with zero data.  Mutually exclusive with INDEX 0.


       POSTGAP
              Optional.  The length of the track postgap to be filled with zero data.


       INDEX  Optional.  The number must be in the range 0 <= number <= 99. Index number 1 specifies the start of the track. Index number 0 is the start of the track pregap filled with data from the  file,
              i.e.  the  difference  between  index 0 and index 1 is the length of the pregap. Index 0 is mutually exclusive with PREGAP.  Index numbers greater than 1 specify subindexes for this track and
              must be sequential.


       FILE   Optional in track section. The syntax is the same as described above and if it appears inside a track specification it takes effect on the next TRACK command.


LIMITATIONS
       The command CDTEXTFILE and the flag SCMS have no equivalent in the TOC format and are ignored.

       CUE files containing data tracks which specify a starting time greater than zero cannot be converted by cue2toc because the TOC format does not provide a way to specify a starting time  at  all  for
       data tracks. However if the CUE file does not contain any audio tracks you can try to use the CUE file directly with cdrdao.



EXAMPLE
       Suppose we have the following CUE file "uwe.froehn.cue" describing an audio CD with CD-Text data:

           REM Example CUE file with audio tracks
           CATALOG 1234567890123
           TITLE "Der Berg ruft"
           PERFORMER "Uwe Froehn"
           FILE "uwe.froehn.mp3" MP3

           TRACK 01 AUDIO
             TITLE "Meine Mama ist die Beste"
             PERFORMER "Uwe Froehn"
             SONGWRITER "Hansi Klabuster"
             REM two seconds pregap filled with audio data
             INDEX 00 00:00:00
             INDEX 01 00:02:00
             REM subindexes
             INDEX 02 00:35:17
             INDEX 03 01:12:44

           TRACK 02 AUDIO
             TITLE "Hoch oben im Tal"
             SONGWRITER "Gabi Geil"
             REM no pregap
             INDEX 01 02:45:38

           TRACK 03 AUDIO
             REM pregap with zero data
             PREGAP 00:4:47
             INDEX 01 07:58:74
             REM postgap with zero data
             POSTGAP 00:35:00

       Since cdrdao cannot decode the MP3 file on the fly this step must be carried out by hand, e.g. using lame:

           lame --decode uwe.froehn.mp3 uwe.froehn.wav

       Although  the filename appears only once in the example CUE file it gets written for every track in the TOC file so you would need to edit lots of occurences of the filename in the TOC file by hand.
       For this reason you can specify a string with the -w option to be used by cue2toc as the filename for all audio tracks. The command

           cue2toc -w uwe.froehn.wav -o uwe.froehn.toc uwe.froehn.cue

       should produce the file uwe.froehn.toc with the following content:

           CATALOG "1234567890123"
           CD_DA
           CD_TEXT {
               LANGUAGE_MAP {
                   0 : EN
               }
               LANGUAGE 0 {
                   TITLE "Der Berg ruft"
                   PERFORMER "Uwe Froehn"
               }
           }

           TRACK AUDIO
               CD_TEXT {
                   LANGUAGE 0 {
                       TITLE "Meine Mama ist die Beste"
                       PERFORMER "Uwe Froehn"
                       SONGWRITER "Hansi Klabuster"
                   }
               }
               AUDIOFILE "uwe.froehn.wav" 00:00:00 02:45:38
               START 00:02:00
               INDEX 00:35:17
               INDEX 01:12:44

           TRACK AUDIO
               CD_TEXT {
                   LANGUAGE 0 {
                       TITLE "Hoch oben im Tal"
                       SONGWRITER "Gabi Geil"
                   }
               }
               AUDIOFILE "uwe.froehn.wav" 02:45:38 05:13:36

           TRACK AUDIO
               PREGAP 00:04:47
               AUDIOFILE "uwe.froehn.wav" 07:58:74
               SILENCE 00:35:00


SEE ALSO
       cdrdao(1), lame(1)


BUGS
       Since cue2toc's definition of the CUE format is entirely based on a number of different CUE files the author came across there is a very high probability that it will not work correctly with all the
       other CUE files you might encounter. If this is the case for you please send the problematic CUE file along with the version number of cue2toc to <dermatsch@gmx.de>.



AUTHOR
       Matthias Czapla <dermatsch@gmx.de>



                                                                                                                                                                                                   CUE2TOC(1)
