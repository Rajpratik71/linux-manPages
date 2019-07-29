inputattach(1)             General Commands Manual             inputattach(1)

NAME
       inputattach - attach a serial line to an input-layer device

SYNOPSIS
       inputattach  [--daemon]  [--always]  [--noinit]  [--baud baud>] <mode>
       <device>

DESCRIPTION
       inputattach attaches a serial line to an input-layer device via a line
       discipline.

       Exactly  one  of  the available modes must be specified on the command
       line.

OPTIONS
       --daemon
              Forks into the background.

       --always
              Ignore initialization failures when attaching the device.

       --noinit
              Skip device initialization.

       --baud Specify the baud rate to use. (This is only  necessary  if  the
              default rate is incorrect.)

   Modes
       -dump, --dump
              Just enable device.

       -eeti, --eetiegalax
              EETI eGalaxTouch.

       -ep, --easypen
              Genius EasyPen 3x4 tablet.

       -elo3b, --elo261-280
              ELO Touchscreen, 3-byte mode.

       -elo4b, --elo271-140
              ELO touchscreen, 4-byte mode.

       -elo6b, --elo4002
              ELO touchscreen, 6-byte mode.

       -elo, --elotouch
              ELO touchscreen, 10-byte mode.

       -fjt, --fujitsu
              Fujitsu serial touchscreen.

       -ipaq, --h3600ts
              Ipaq h3600 touchscreen.

       -ham, --hampshire
              Hampshire touchscreen.

       -ifor, --iforce
              I-Force joystick or wheel.

       -ms3, --intellimouse
              Microsoft IntelliMouse.

       -lk, --lkkbd
              DEC LK201 / LK401 keyboards.

       -mag, --magellan
              Magellan / SpaceMouse.

       -bare, --microsoft
              2-button Microsoft mouse.

       -mmw, --mmwheel
              Logitech mouse with 4-5 buttons or a wheel.

       -mman4, --mouseman4
              4-button Logitech / Genius mouse.

       -mman, --mouseman
              3-button Logitech / Genius mouse.

       -msc, --mousesystems
              3-button Mouse Systems mouse.

       -ms, --mshack
              3-button mouse in Microsoft mode.

       -mtouch, --mtouch
              MicroTouch (3M) touchscreen.

       -newt, --newtonkbd
              Newton keyboard.

       -pm3k, --penmount3000
              PenMount 3000 touchscreen.

       -pm6k, --penmount6000
              PenMount 6000 touchscreen.

       -pmm1, --penmount6250
              PenMount 6250 touchscreen.

       -pm9k, --penmount9000
              PenMount 9000 touchscreen.

       -ps2m, --ps2mult
              PS/2 serial multiplexer.

       -ps2ser, --ps2serkbd
              PS/2 via serial keyboard.

       -pulse8-cec, --pulse8-cec
              Pulse Eight HDMI CEC dongle.

       -sbl, --spaceball
              SpaceBall 2003 / 3003 / 4000 FLX.

       -orb, --spaceorb
              SpaceOrb 360 / SpaceBall Avenger.

       -sting, --stinger
              Gravis Stinger.

       -ipaqkbd, --stowawaykbd
              Stowaway keyboard.

       -skb, --sunkbd
              Sun Type 4 and Type 5 keyboards.

       -sun, --sunmouse
              3-button Sun mouse.

       -taos, --taos-evm
              TAOS evaluation module.

       -t213, --touchit213
              Sahara Touch-iT213 Tablet PC.

       -tr, --touchright
              Touchright serial touchscreen.

       -tw, --touchwin
              Touchwindow serial touchscreen.

       -tsc, --tsc
              TSC-10/25/40 serial touchscreen.

       -twidjoy, --twiddler-joy
              Handykey Twiddler used as a joystick.

       -twid, --twiddler
              Handykey Twiddler chording keyboard.

       -vs, --vsxxx-aa
              DEC VSXXX-AA / VSXXX-GA mouse and VSXXX-A tablet.

       -w8001, --w8001
              Wacom  W8001  pen  and/or touch devices. The default baud rate,
              38400bps, allows for touch-only or pen and touch  devices;  for
              pen-only devices, "--baud 19200" must be specified.

       -wacom_iv, --wacom_iv
              Wacom protocol IV tablet.

       -war, --warrior
              WingMan Warrior.

       -zhen, --zhen-hua
              Zhen Hua 5-byte protocol.

AUTHORS
       inputattach  was  written by Vojtech Pavlik and Arndt Schoenewald, and
       improved by many others; see the linuxconsole tools documentation  for
       details.

       This  manual page was written by Stephen Kitt <steve@sk2.org>, for the
       Debian GNU/Linux system (but may be used by others).

inputattach                    January 9, 2016                 inputattach(1)
