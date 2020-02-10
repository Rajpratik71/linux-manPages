VBOXCONTROL(8)                                                                       System Administration Utilities                                                                       VBOXCONTROL(8)

NAME
       VBoxControl - x86 virtualization solution

DESCRIPTION
       Oracle VM VirtualBox Guest Additions Command Line Management Interface3 (C) 2008-2016 Oracle Corporation All rights reserved.

       Usage:

       VBoxControl [-V|--version]           print version number and exit VBoxControl --nologo ...             suppress the logo

       VBoxControl  guestproperty            get <property> [--verbose] VBoxControl guestproperty            set <property> [<value> [--flags <flags>]] VBoxControl guestproperty            delete|unset
       <property> VBoxControl guestproperty            enumerate [--patterns <patterns>] VBoxControl guestproperty            wait <patterns>

       [--timestamp <last timestamp>]
              [--timeout <timeout in ms>

       VBoxControl sharedfolder             list [-automount] VBoxControl writecoredump VBoxControl writelog [-n|--no-newline] [--] <msg> VBoxControl takesnapshot VBoxControl savestate VBoxControl sus‐
       pend VBoxControl poweroff VBoxControl help                     [command] VBoxControl version

VBoxControl                                                                                     June 2016                                                                                  VBOXCONTROL(8)
