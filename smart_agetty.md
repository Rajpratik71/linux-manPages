smart_agetty(1)                                                                             Emulate agetty console                                                                            smart_agetty(1)



NAME
       smart_agetty - Emulate agetty for a non vga/framebuffer console

SYNOPSIS
       smart_agetty [OPTIONS] <GETTYSPEED> <GETTYDEVICE> <GETTYTERM>

DESCRIPTION
       smart_agetty is a wrapper script around agetty. It accepts the following options:

OPTIONS
       -i|-h|-L|-m|-n|-w|<options>
              Normal getty options. See
              $ man 8 agetty
              for more details.

       GETTYSPEED
              The speed of the getty device.

       GETTYDEVICE
              The used tty device - as listed in /dev.

       GETTYTERM
              The  value  to  be used for the TERM environment variable. This overrides whatever init(8) may have set, and is inherited by login and the shell.

DIAGNOSTICS
       The following diagnostics may be issued on kmsg:

       Can not determine 'getty device' speed.
              stty speed could not autodetect the speed of the given device.
       unhandled stdout
              Autoconsole could not guess the right output console.

BUGS
       Please visit http://bugs.opensuse.org/ to get a guidance on how to submit bugreports.

SEE ALSO
       agetty(8)

COPYRIGHT
       2010 SuSE Linux Products GmbH, Nuernberg, Germany.

AUTHOR
       Lars Vogdt <lrupp@suse.de>



3rd Berkeley Distribution                                                                       May 18th, 2010                                                                                smart_agetty(1)
