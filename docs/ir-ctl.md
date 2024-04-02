IR-CTL(1)                                                          User Commands                                                         IR-CTL(1)

NAME
       ir-ctl - a swiss-knife tool to handle raw IR and to set lirc options

SYNOPSIS
       ir-ctl [OPTION]...
       ir-ctl [OPTION]... --features
       ir-ctl [OPTION]... --send [file to send]
       ir-ctl [OPTION]... --scancode [protocol and scancode to send]
       ir-ctl [OPTION]... --keycode [keycode to send]
       ir-ctl [OPTION]... --receive [save to file]

DESCRIPTION
       ir-ctl is a tool that allows one to list the features of a lirc device, set its options, receive raw IR, and send IR.

       IR can be sent as the keycode of a keymap, or using a scancode, or using raw IR.

       Note: You need to have read or write permissions on the /dev/lirc device for options to work.

OPTIONS
       -d, --device=DEV
              lirc device to control, /dev/lirc0 by default

       -f, --features
              List the features of the lirc device.

       -r, --receive[=FILE]
              Receive IR and print to standard output if no file is specified, else save to the filename.

       -s, --send=FILE
              Send  IR in text file. It must be in the format described below. If this option is specified multiple times, send all files in-order
              with a 125ms gap between them. The gap length can be modified with --gap.

       -S, --scancode=PROTOCOL:SCANCODE
              Send the IR scancode in the protocol specified. The protocol must one of the protocols listed below, followed by  a  colon  and  the
              scancode  number.  If  this  option  is specified multiple times, send all scancodes in-order with a 125ms gap between them. The gap
              length can be modified with --gap.

       -K, --keycode=KEYCODE
              Send the KEYCODE from the keymap which must be specified with --keymap. If this option is specified multiple times,  send  all  key‐
              codes in-order with a 125ms gap between them. The gap length can be modified with --gap.

       -k, --keymap=KEYMAP
              The  rc  keymap  file  in toml format. The format is described in the rc_keymap(5) man page. This file is used to select the KEYCODE
              from.

       -1, --oneshot
              When receiving, stop receiving after the first message, i.e. after a space or timeout of more than 19ms is received.

       --mode2
              When receiving, output IR in mode2 format. One line per space or pulse.

       -w, --wideband
              Use the wideband receiver if available on the hardware. This is also known as learning mode. The measurements should be more precise
              and any carrier frequency should be accepted.

       -n, --narrowband
              Switches back to the normal, narrowband receiver if the wideband receiver was enabled.

       -R, --carrier-range=RANGE
              Set the accepted carrier range for the narrowband receiver. It should be specified in the form 30000-50000.

       -m, --measure-carrier
              If  the  hardware  supports  it, report what the carrier frequency is on receiving. You will get the keyword carrier followed by the
              frequency.  This might use the wideband receiver although this is hardware specific.

       -M, --no-measure-carrier
              Disable reporting of the carrier frequency. This should make it possible to use the narrowband receiver. This is the default.

       -t, --timeout=TIMEOUT
              Set the length of a space at which the receiver goes idle, specified in microseconds.

       -c, --carrier=CARRIER
              Sets the send carrier frequency.

       -D, --duty-cycle=DUTY
              Set the duty cycle for sending in percent if the hardware support it.

       -e, --emitters=EMITTERS
              Comma separated list of emitters to use for sending. The first emitter is number 1. Some devices only support enabling  one  emitter
              (the winbond-cir driver).

       -g, --gap=GAP
              Set  the gap between scancodes or the gap between files when multiple files are specified on the command line. The default is 125000
              microseconds.

       -?, --help
              Prints the help message

       --usage
              Give a short usage message

       -v, --verbose
              Verbose output; this prints the IR before sending.

       -V, --version
              print the v4l2-utils version

   Format of file
       When sending or receiving raw IR, two formats can be used. The first is a list of integers representing pulse and  space  values.  A  pulse
       value can be prefixed with + and a space with -, but this is optional. The rc-5 scancode 0x1e01 is encoded so:

       +889 -889 +1778 -1778 +889 -889 +889 -889 +889 -889 +1778 -889 +889 -889 +889 -889 +889 -889 +889 -889 +889 -1778 +889

       The  other  format  mimics  the mode2 tool. This produces one line per space or pulse. For receiving it can selected by specifying --mode2.
       Here is the same message as above, now encoded in mode2:

            carrier 36000
            pulse 940
            space 860
            pulse 1790
            space 1750
            pulse 880
            space 880
            pulse 900
            space 890
            pulse 870
            space 900
            pulse 1750
            space 900
            pulse 890
            space 910
            pulse 840
            space 920
            pulse 870
            space 920
            pulse 840
            space 920
            pulse 870
            space 1810
            pulse 840

       Note that in this format, the carrier can also be specified. This can only by done with a separate --carrier=38000 command line option with
       the first format.

       Rather  than specifying just the raw IR, in this format you can also specify the scancode and protocol you want to send. This will also au‐
       tomatically set the correct carrier. The above can be written as:

            scancode rc5:0x1e01

       If multiple scancodes are specified in a file, a gap is inserted between scancodes if there is no space between them (see --gap). One  file
       can  only  have  one carrier frequency, so this might cause problems if different protocols are specified in one file if they use different
       carrier frequencies.

       Note that there are device-specific limits of how much IR can be sent at a time. This can be both the length of the IR and  the  number  of
       different lengths of space and pulse.

   Supported Protocols
       A  scancode  with protocol can be specified on the command line or in the pulse and space file. The following protocols are supported: rc5,
       rc5x_20, rc5_sz, jvc, sony12, sony15, sony20, nec, necx, nec32, sanyo,  rc6_0,  rc6_6a_20,  rc6_6a_24,  rc6_6a_32,  rc6_mce,  sharp,  imon,
       rc_mm_12,  rc_mm_24,  rc_mm_32.   If the scancode starts with 0x it will be interpreted as a hexadecimal number, and if it starts with 0 it
       will be interpreted as an octal number.

   Wideband and narrowband receiver
       Most IR receivers have a narrowband and wideband receiver. The narrowband receiver can receive over longer distances (usually around 10 me‐
       tres without interference) and is limited to certain carrier frequencies.

       The wideband receiver is for higher precision measurements and when the carrier frequency is unknown; however it only works over very short
       distances (about 5 centimetres). This is also known as learning mode.

       For most drivers, enabling carrier reports using -m also enables the wideband receiver.

   Global state
       All the options which can be set for lirc devices are maintained until the device is powered down or a new option is set.

EXIT STATUS
       On success, it returns 0. Otherwise, it will return the error code.

EXAMPLES
       To list all capabilities of /dev/lirc2:
            ir-ctl -f -d /dev/lirc2

       To show the IR of the first button press on a remote in learning mode:
            ir-ctl -r -m -w

       Note that ir-ctl -rmw would receive to a file called mw.

       To restore the normal (longer distance) receiver:
            ir-ctl -n -M

       To send the pulse and space file play on emitter 3:
            ir-ctl -e 3 --send=play

       To send the rc-5 hauppauge '1' scancode:
            ir-ctl -S rc5:0x1e01

       To send the rc-5 hauppauage '1' key from the hauppauge keymap:
            ir-ctl -k hauppauge.toml -K KEY_NUMERIC_1

BUGS
       Report bugs to Linux Media Mailing List <linux-media@vger.kernel.org>

COPYRIGHT
       Copyright (c) 2016 by Sean Young.

       License GPLv2: GNU GPL version 2 <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       To display decoded IR, or set IR decoding options, see ir-keytable(1).

       The keymap format is described in rc_keymap(5).

v4l-utils 1.18.0                                                  Tue Jul 5 2016                                                         IR-CTL(1)
