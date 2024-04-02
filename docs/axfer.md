AXFER(1)                                General Commands Manual                               AXFER(1)

NAME
       axfer  -  command-line sound recorder and player for sound devices and nodes supported by Linux
       sound subsystem (Advanced Linux Sound Architecture, also known as ALSA).

SYNOPSYS
       axfer subcommand direction options

       subcommand = transfer | list | version | help

       direction = capture | playback

       options = ( depends on subcommand )

DESCRIPTION
       The axfer is a command-line recorder and player to transfer audio data frame between sound  de‐
       vices/nodes and files/stdin/stdout.

OPTIONS
   Subcommand
       transfer
              Performs  transmission of audio data frame. Its detail is described in axfer-transfer(1)
              manual.

       list   Dumps  lists  of  available  sound  devices  and  nodes.  Its  detail  is  described  in
              axfer-list(1) manual.

       version
              Prints version of this application (as the same version as alsa-utils package).

       help   Prints a short message about subcommands for users to enter this application.

   Direction
       capture
              Operates for capture transmission.

       playback
              Operates for playback transmission.

EXIT STATUS
       EXIT_SUCCESS (0) if run time successfully finished, else EXIT_FAILURE (1).

UNIT TEST
       This  program  has unit tests for internal implementation. Please refer to the manual of axfer-
       transfer for details.

COMPATIBILITY TO APLAY
       The axfer is designed to be compatible to aplay(1) as much as possible. In command line, execu‐
       tions  of  aplay/arecord files under $PATH runs axfer with compatibility mode if filesystem has
       symbolic link from the aplay/arecord to axfer.

           $ ln -s aplay axfer
           $ ln -s arecord axfer

   A string to which arg[0] points
       When args[0] in run time points to string ended with 'aplay', it has the same meaning of  play‐
       back  direction. When it points to string ended with 'arecord', it has the same meaning of cap‐
       ture direction.

   Options acknowledged as list subcommand
       Options of -l , --list-devices , -L , --list-pcms are acknowledged as list subcommand.  Without
       them, the run time performs transfer subcommand.

REPORTING BUGS
       Report  any  bugs to mailing list of ALSA community <alsa-devel@alsa-project.org> where the de‐
       velopment and maintenance is primarily done. Bug tracking service of alsa-utils  repository  on
       github.com is also available.

SEE ALSO
       axfer-transfer(1), axfer-list(1), alsamixer(1), amixer(1)

AUTHOR
       Takashi Sakamoto <o-takashi@sakamocchi.jp>

alsa-utils                                 28 November 2018                                   AXFER(1)
