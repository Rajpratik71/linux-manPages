SPD-SAY(1)                                                                                    User Commands                                                                                    SPD-SAY(1)

NAME
       spd-say - send text-to-speech output request to speech-dispatcher

SYNOPSIS
       spd-say [options] "some text"

DESCRIPTION
       spd-say sends text-to-speech output request to speech-dispatcher process which handles it and ideally outputs the result to the audio system.

OPTIONS
       -r, --rate
              Set the rate of the speech (between -100 and +100, default: 0)

       -p, --pitch
              Set the pitch of the speech (between -100 and +100, default: 0)

       -i, --volume
              Set the volume (intensity) of the speech (between -100 and +100, default: 0)

       -o, --output-module
              Set the output module

       -l, --language
              Set the language (iso code)

       -t, --voice-type
              Set the preferred voice type (male1, male2, male3, female1, female2, female3, child_male, child_female)

       -m, --punctuation-mode
              Set the punctuation mode (none, some, all)

       -s, --spelling
              Spell the message

       -x, --ssml
              Set SSML mode on (default: off)

       -e, --pipe-mode
              Pipe from stdin to stdout plus Speech Dispatcher

       -P, --priority
              Set priority of the message (important, message, text, notification, progress; default: text)

       -N, --application-name
              Set the application name used to establish the connection to specified string value (default: spd-say)

       -n, --connection-name
              Set the connection name used to establish the connection to specified string value (default: main)

       -w, --wait
              Wait till the message is spoken or discarded

       -S, --stop
              Stop speaking the message being spoken in Speech Dispatcher

       -C, --cancel
              Cancel all messages in Speech Dispatcher

       -v, --version
              Print version and copyright info

       -h, --help
              Print this info

ENVIRONMENT
       SPEECHD_ADDRESS
              specifies TCP endpoint where speech-dispatcher is listening and to which spd-say should connect. Has form of <method>:<address>, where <method> is one of unix_socket and inet_socket.  The
              <address> is either path to Unix domain socket if method is unix_socket, of IP address if method is inet_socket.

SEE ALSO
       speech-dispatcher(1)

       The full documentation for spd-say is maintained as a Texinfo manual.  If the info and spd-say programs are properly installed at your site, the command

              info spd-say

       should give you access to the complete manual.

spd-say 0.7.1                                                                                   March 2011                                                                                     SPD-SAY(1)
