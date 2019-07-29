xkbvleds(1)                                                   General Commands Manual                                                  xkbvleds(1)

NAME
       xkbvleds - XKB extension user utility

SYNOPSIS
       xkbvleds [-indpy <name>] [-watch <leds>] [[-+]automatic] [[-+]explicit] [[-+]name] [[-+]real] [[-+]virtual] [-intersection] [-union]

DESCRIPTION
       This  program  is  used  to  display the state of LEDs on an XKB keyboard.  It reports the changes in the fundamental components of the XKB
       state which includes the effective compatibility state. The default set of LEDs is -union +name +automatic +real.

OPTIONS
       -indpy <name>
               Mask of LEDs to watch

       -watch <leds>
               turn on synchronization

       ∓automatic
               (Don't) watch automatic LEDs

       ∓explicit
               (Don't) watch explicit LEDs

       ∓name   (Don't) watch named LEDs

       ∓real   (Don't) watch real LEDs

       ∓virtual
               (Don't) watch virtual LEDs

       -intersection
               Watch only LEDs in all desired sets

       -union  Watch LEDs in any desired sets

       -help   print list of options and exit

       -version
               print program version and exit

X Version 11                                                      xkbutils 1.0.4                                                       xkbvleds(1)
