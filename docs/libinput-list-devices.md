libinput-list-devices(1)                                                                       libinput Manual                                                                       libinput-list-devices(1)



NAME
       libinput-list-devices - list local devices as recognized by libinput

SYNOPSIS
       libinput list-devices [--help]

DESCRIPTION
       The  libinput list-devices tool creates a libinput context on the default seat "seat0" and lists all devices recognized by libinput. Each device shows available configurations the respective default
       configuration setting.

       For configuration options that allow multiple different settings (e.g. scrolling), all available settings are listed. The default setting is prefixed by an asterisk (*).

       This tool usually needs to be run as root to have access to the /dev/input/eventX nodes.

OPTIONS
       --help  Print help

NOTES
       Some specific feature may still be available on a device even when no configuration is exposed, a lack of a configuration option does not necessarily mean that this feature does not work.

       A device may be recognized by libinput but not handled by the X.Org libinput driver or the Wayland compositor.

       An xorg.conf(5) configuration entry or Wayland compositor setting may have changed configurations on a device. The libinput list-devices tool only shows the device's default configuration,  not  the
       current configuration.

LIBINPUT
       Part of the libinput(1) suite



libinput 1.10.7                                                                                                                                                                      libinput-list-devices(1)
