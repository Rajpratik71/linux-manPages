FESTIVAL(1)                                                                                General Commands Manual                                                                                FESTIVAL(1)



NAME
       festival_client - client access to festiva; text-to-speech server mode

SYNOPSIS
       festival_client [options] [file0] [file1] ...



DESCRIPTION
       Allows sending commands and/or test to a festival test-to-speech server.  Festival may be started in server mode using the option --server

       festival-clinet allows waveforms ot be generated faster as not time is required for start up.  See the festival manual for more details on recommended use.


OPTIONS
       --server <string>
               hostname (or IP number) of server

       --port <int> {1314}
               port number of server process (1314)

       --output <string>
               file to save output waveform to

       --otype <string> {riff}
               output type for waveform

       --passwd <string>
               server passwd in plain text (optional)

       --prolog <string>
               filename containing commands to be sent to the server before standard commands (useful when using --ttw)

       --async Asynchronous mode, server may send back multiple waveforms per text file

       --ttw   Text to waveform: take text from first arg or stdin get server to return waveform(s) stored in output or operated on by aucommand.

       --withlisp
               Output lisp replies from server.

       --tts_mode <string>
               TTS mode for file (default is fundamental).

       --aucommand <string>
               command to be applied to each waveform retruned from server. Use $FILE in string to refer to waveform file

BUGS
       This still isn't as general as it should be.  It seems to require lots of special little options which suggests the general options aren't right.


AUTHOR
       Alan W Black and Paul Taylor
       (C) Centre for Speech Technology Research
       University of Edinburgh
       80 South Bridge
       Edinburgh EH1 1HN
       http://www.cstr.ed.ac.uk/projects/festival.html



                                                                                                 1st Aug 1997                                                                                     FESTIVAL(1)
