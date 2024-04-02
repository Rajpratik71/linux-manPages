ALSA-INFO.SH(1)                                                                            General Commands Manual                                                                            ALSA-INFO.SH(1)



NAME
       alsa-info.sh - command-line utility to gather information about the ALSA subsystem

SYNOPSIS
       alsa-info.sh [options]


DESCRIPTION
       alsa-info.sh is a command-line utility gathering information about the ALSA subsystem. It is used mostly for debugging purposes.


OPTIONS
       --upload
              Upload contents to the server (www.alsa-project.org or pastebin.ca).

       --no-upload
              Do not upload contents to the remote server.

       --stdout
              Print information to standard output.

       --output FILE
              Specify file for output in no-upload mode.

       --debug
              Run utility as normal, but will not delete file (usually /tmp/alsa-info.txt).

       --with-aplay
              Includes output from aplay -l.

       --with-amixer
              Includes output from amixer.

       --with-alsactl
              Includes output from alsactl.

       --with-configs
              Includes output from ~/.asoundrc and /etc/asound.conf if they exist.

       --update
              Check server for updates.

       --about
              Print information about authors.


EXAMPLES
       alsa-info.sh --no-upload
              Will gather all information and show the output file.


SEE ALSO
        aplay(1) amixer(1) alsactl(1)


AUTHOR
       alsa-info.sh was created by the ALSA team, see --about .



                                                                                               13 January 2016                                                                                ALSA-INFO.SH(1)
