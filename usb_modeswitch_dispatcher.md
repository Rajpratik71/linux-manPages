USB_MODESWITCH_DISPATCHER(1)                                  General Commands Manual                                 USB_MODESWITCH_DISPATCHER(1)

NAME
       usb_modeswitch_dispatcher - Linux wrapper for usb_modeswitch (not intended for direct invocation)

SYNOPSIS
       usb_modeswitch_dispatcher

DESCRIPTION
       usb_modeswitch_dispatcher  will  do detailed device checking and will subsequently use the Linux-independent usb_modeswitch binary together
       with the selected device config file to switch the mode of certain USB devices.

       If no drivers are taking care of the device after the mode switch, the dispatcher will try to load and bind the "option" serial  driver  to
       any  USB  interfaces  with class 0xff, in order to make the device useable in case it is not recognized by that driver yet. This may or may
       not work.

       This program is called by udev and is not supposed to be called directly by the user.

SEE ALSO
       usb_modeswitch(1).

                                                                                                                      USB_MODESWITCH_DISPATCHER(1)
