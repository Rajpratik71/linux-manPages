DVCONT(1)                                                                                  General Commands Manual                                                                                  DVCONT(1)



NAME
       dvcont - send control commands to DV cameras

SYNOPSIS
       dvcont <command1> [ <command2> ... ]

DESCRIPTION
       dvcont  is  a  command line tool to send control commands via an IEEE1394 link to a device that implements the AV/C specifications by the 1394 Trade Association.  Or for the non-techies: dvcont lets
       you remote control your DV camera via a Firewire cable.  The following commands are understood:

       dev <number>
              Select device number on chain to use. (dvcont tries to automatically detect the camera. Use the dev command BEFORE any other commands for manual control.)

       play   Tell the camera to play. If already playing, it toggles slow-motion.

       reverse
              Tell the camera to play in reverse. If already playing, it toggles slow-motion.

       trickplay < -14 to +14 >
              Tell the camera to play at various speeds.  0 = forward play, -14  = fastest reverse, -8 = 1X reverse, -1 = slowest reverse, 1 = slowest forward, 8 = 1X forward, 14 = fastest  forward.   (Not
              supported by all cameras.)

       stop   Tell the camera to stop playing.

       rewind Tell the camera to rewind. (Use in stop or play mode.)

       ff     Tell the camera to fast forward. (Use in stop or play mode.)

       pause  Tell the camera to toggle pause play.

       next   Tell the camera to go to the next frame. (Use in pause mode.)

       nextindex
              Tell the camera to search for the next scene. (Use in pause or play mode.)

       prev   Tell the camera to go to the previous frame. (Use in pause mode)

       previndex
              Tell the camera to search for the previous scene. (Use in pause or play mode)

       record Tell the camera to record. (Use with caution!)

       eject  Tell the camera to eject the tape. (Not supported by all cameras.)

       timecode
              Report the timecode on tape in the format HH:MM:SS:FF (hours, minutes, seconds, intra-second frames).

       seek <timecode>
              Tell the camera to go to the timecode, given in format HH:MM:SS:FF as above.

       status Report the status of the device.

       pluginfo
              Report available plugs.

       verbose
              Tell the program to tell you debug info.

       version
              Tell the program to tell you the program version.

       help   Tell the program to show you a help screen.

AUTHORS
       dvcont  was  written by Jason Howard <jason@spectsoft.com> and Dan Dennedy <dan@dennedy.org>.  This man page was written with the help of help2man by Daniel Kobras <kobras@debian.org> for the Debian
       GNU/Linux distribution (but may be used by others). Updated by Dan Dennedy <dan@dennedy.org>.




                                                                                                September 2002                                                                                      DVCONT(1)
