iecset(1)                                                     General Commands Manual                                                    iecset(1)

NAME
       iecset - Set or dump IEC958 status bits

SYNOPSIS
       iecset [options] [cmd arg...]

DESCRIPTION
       iecset is a small utility to set or dump the IEC958 (or so-called "S/PDIF") status bits of the specified sound card via ALSA control API.

       When  iecset  is  started  without arguments except for options, it will show the current IEC958 status in a human-readable form.  When the
       commands are given in the arguments, they are parsed and the IEC958 status bits are updated.  The resultant status is shown as well.

       The commands consist of the command directive and the argument.  As the boolean argument, yes, no,  true,  false,  or  a  digit  number  is
       allowed.

EXAMPLES
       iecset -Dhw:1
              Displays the current IEC958 status bits on the second card.  This is equivalent with -c 1.

       iecset -x
              Displays  the  current  IEC958  status  bits in a style of the arguments for the PCM stream.  The output string can be passed to the
              iec958 (or spdif) PCM type as the optional argument.

       iecset pro off audio off
              Sets the current status to the consumer-mode and turns on the non-audio bit.  The modified status will be shown, too.

OPTIONS
       -D device
              Specifies the device name of the control to open

       -c card
              Specifies the card index to open.  Equivalent with -Dhw:x.

       -n index
              Specifies the IEC958 control element index, in case you have multiple IEC958 devices and need to choose one of them.

       -x     Dumps the status in the form of AESx bytes.

       -i     Reads the command sequences from stdin.  Each line has single command.

COMMANDS
       professional <bool>
              The professional mode (true) or consumer mode (false).

       audio <bool>
              The audio mode (true) or non-audio mode (false).

       rate <int>
              The sample rate in Hz.

       emphasis <int>
              The emphasis: 0 = none, 1 = 50/15us, 2 = CCITT.

       lock <bool>
              Rate lock: locked (true), unlocked (false).  This command is for the professional mode only.

       sbits <int>
              Sample bits:  2 = 20bit, 4 = 24bit, 6 = undefined.  This command is for the professional mode only.

       wordlength <int>
              Wordlength: 0 = No, 2 = 22-18 bit, 4 = 23-19 bit, 5 = 24-20 bit, 6 = 20-16 bit.  This command is for the professional mode only.

       category <int>
              Category: the value is from 0 to 0x7f.  This command is for the consumer mode only.

       copyright <bool>
              Copyright: copyrighted (true), non-copyrighted (false).  This command is for the consumer mode only.

       original <boo>
              Original flag: original (true), 1st generation (false).  This command is for the consumer mode only.

AUTHOR
       Takashi Iwai <tiwai@suse.de>

                                                                    23 Oct 2003                                                          iecset(1)
