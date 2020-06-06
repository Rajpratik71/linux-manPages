VBOXSDL(1)                                                                                    User Commands                                                                                    VBOXSDL(1)

NAME
       VBoxSDL - x86 virtualization solution

DESCRIPTION
       Oracle VM VirtualBox SDL GUI version3 (C) 2005-2016 Oracle Corporation All rights reserved.

   Usage:
       --startvm <uuid|name>
              Virtual machine to start, either UUID or name

       --separate
              Run a separate VM process or attach to a running VM

       --hda <file>
              Set temporary first hard disk to file

       --fda <file>
              Set temporary first floppy disk to file

       --cdrom <file>
              Set temporary CDROM/DVD to file/device ('none' to unmount)

       --boot <a|c|d|n>
              Set temporary boot device (a = floppy, c = 1st HD, d = DVD, n = network)

       --memory <size>
              Set temporary memory size in megabytes

       --vram <size>
              Set temporary size of video memory in megabytes

       --fullscreen
              Start VM in fullscreen mode

       --fullscreenresize
              Resize the guest on fullscreen

       --fixedmode <w> <h> <bpp> Use a fixed SDL video mode with given width, height and bits per pixel

       --nofstoggle
              Forbid switching to/from fullscreen mode

       --noresize
              Make the SDL frame non resizable

       --nohostkey
              Disable all hostkey combinations

       --nohostkeys ...
              Disable specific hostkey combinations, see below for valid keys

       --nograbonclick
              Disable mouse/keyboard grabbing on mouse click w/o additions

       --detecthostkey
              Get the hostkey identifier and modifier state

       --hostkey <key> {<key2>} <mod> Set the host key to the values obtained using --detecthostkey

       --termacpi
              Send an ACPI power button event when closing the window

       --vrdp <ports>
              Listen for VRDP connections on one of specified ports (default if not specified)

       --discardstate
              Discard saved state (if present) and revert to last snapshot (if present)

       --settingspw <pw>
              Specify the settings password

       --settingspwfile <file>
              Specify a file containing the settings password

       --[no]rawr0
              Enable or disable raw ring 3

       --[no]rawr3
              Enable or disable raw ring 0

       --[no]patm
              Enable or disable PATM

       --[no]csam
              Enable or disable CSAM

       --[no]hwvirtex
              Permit or deny the usage of VT-x/AMD-V

   Key bindings:
       <hostkey> +
              f            Switch to full screen / restore to previous view h           Press ACPI power button n           Take a snapshot and continue execution p           Pause / resume execution q
              Power off r           VM reset s           Save state and power off

       <del>  Send <ctrl><alt><del>

       <F1>...<F12>
              Send <ctrl><alt><Fx>

VBoxSDL                                                                                         June 2016                                                                                      VBOXSDL(1)
