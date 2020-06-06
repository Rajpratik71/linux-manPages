VBETOOL(1)                                                                                    User Commands                                                                                    VBETOOL(1)

NAME
       vbetool - run real-mode video BIOS code to alter hardware state

SYNOPSIS
       vbetool   [[vbestate   save|restore]|[vbemode   set|get]|[vgamode]|[dpms   on|off|standby|suspend|reduced]|[post  [romfile]]|[vgastate  on|off]|[vbefp  panelid|panelsize|getbrightness|setbright‐
       ness|invert]]

DESCRIPTION
       vbetool uses lrmi in order to run code from the video BIOS. Currently, it is able to alter DPMS states, save/restore video card state and attempt to initialize the video card from scratch.

OPTIONS
       vbetool takes the following options:

       vbestate
              vbetool will use the VESA 0x4f0f extensions to save or restore hardware state. This will be sent to or read from stdin. This information is highly hardware specific - do  not  attempt  to
              restore state saved from a different machine. This command will not work unless you are at a text console, as it interferes badly with X.

       dpms   vbetool  will  use the VESA 0x4f10 extensions to alter the power management state of your screen. "On", "off", "standby", "suspend" and "reduced" are acceptable further options and deter‐
              mine which state will be activated.

       vbemode
              vbetool will get or set the current VESA mode. "get" will return the current mode number on stdout - "set" will set the mode to the next argument.

       vgamode
              vbetool will set the legacy VGA mode to the following numeric argument.

       post   vbetool will attempt to run BIOS code located at c000:0003. This is the code run by the system BIOS at boot in order to intialise the video hardware. Note that  on  some  machines  (espe‐
              cially  laptops),  not all of this code is present after system boot - as a result, executing this command may result in undefined behaviour. This command must be run from a text console,
              as it will otherwise interfere with the operation of X. This command takes an optional argument which is the location of a file containing a ROM image. If provided,  this  image  will  be
              mapped to the c000 segment and used instead of the system's video BIOS.

       vgastate
              vbetool  will enable or disable the current video card. On most hardware, disabling will cause the hardware to stop responding until it is reenabled. You probably don't want to do this if
              you're using a framebuffer.

       vbefp  vbetool will execute a VESA flat panel interface call.

              panelid will provide information about the panel

              panelsize will provide the size of the panel

              getbrightness will provide the current screen brightness as an integer

              setbrightness accepts an integer as an argument and will set the screen brightness to that

              invert will invert the colours of the screen

BUGS
       Switching dpms modes may interact badly with X on some systems.

       The vbestate command may behave in strange ways.

       The post command may result in the execution of arbitrary code that happens to be lying around in the area where chunks of your video BIOS used to be.

       The VESA specification does not require that "vbemode get" provides the correct mode if the current mode was set via some means other than the VESA BIOS extensions.

       The VESA flat panel interface ceased development at the proposal stage.  panelid and panelsize will work on many machines, but the other arguments are unlikely to  be  implemented  on  available
       hardware.

AUTHOR
       vbetool  was  written  by  Matthew  Garrett  <mjg59@srcf.ucam.org>,  based  on  code  from  read-edid  by  John  Fremlin <john@fremlin.de>, LRMI (http://sourceforge.net/projects/lrmi/) and XFree
       (http://www.xfree86.org). It is released under the terms of the GNU General Public License.

vbetool 0.2                                                                                  31 December 2004                                                                                  VBETOOL(1)
