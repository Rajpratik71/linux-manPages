VBOXHEADLESS(1)                              User Commands                             VBOXHEADLESS(1)

NAME
       VBoxHeadless - x86 virtualization solution

DESCRIPTION
       Oracle VM VirtualBox Headless Interface (C) 2008-2019 Oracle Corporation All rights reserved.

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

       -c, -record, --record
              Record the VM screen output to a file

       -w, --videowidth
              Video frame width when recording

       -h, --videoheight
              Video frame height when recording

       -r, --videobitrate
              Recording bit rate when recording

       -f, --filename
              File name when recording. The codec used will be chosen based on file extension

VBoxHeadless                                 January 2019                              VBOXHEADLESS(1)
