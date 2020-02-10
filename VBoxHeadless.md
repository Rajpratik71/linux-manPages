VBOXHEADLESS(1)                                                                               User Commands                                                                               VBOXHEADLESS(1)

NAME
       VBoxHeadless - x86 virtualization solution

DESCRIPTION
       Oracle VM VirtualBox Headless Interface3 (C) 2008-2016 Oracle Corporation All rights reserved.

   Usage:
       -s, -startvm, --startvm <name|uuid>
              Start given VM (required argument)

       -v, -vrde, --vrde on|off|config
              Enable or disable the VRDE server or don't change the setting (default)

       -e, -vrdeproperty, --vrdeproperty <name=[value]> Set a VRDE property:
              "TCP/Ports" - comma-separated list of

       ports the VRDE server can bind to; dash
              between two port numbers specifies range

       "TCP/Address" - interface IP the VRDE
              server will bind to

       --settingspw <pw>
              Specify the settings password

       --settingspwfile <file>
              Specify a file containing the settings password

       -start-paused, --start-paused
              Start the VM in paused state

       -c, -capture, --capture
              Record the VM screen output to a file

       -w, --width
              Frame width when recording

       -h, --height
              Frame height when recording

       -r, --bitrate
              Recording bit rate when recording

       -f, --filename
              File name when recording. The codec used will be chosen based on file extension

VBoxHeadless                                                                                    June 2016                                                                                 VBOXHEADLESS(1)
