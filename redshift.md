REDSHIFT(1)                             General Commands Manual                            REDSHIFT(1)

NAME
       redshift - set color temperature of display according to time of day

SYNOPSIS
       redshift [-l LAT:LON | -l PROVIDER:OPTIONS] [-t DAY:NIGHT] [OPTIONS...]

DESCRIPTION
       redshift  adjusts the color temperature of your screen according to your surroundings. This may
       help your eyes hurt less or reduce the risk for delayed sleep phase syndrome if you are working
       in front of the screen at night.

       The  color  temperature is set according to the position of the sun. A different color tempera‐
       ture is set during night and daytime. During twilight and early morning, the color  temperature
       transitions  smoothly from night to daytime temperature to allow your eyes to slowly adapt over
       a period of about an hour. At night the color temperature should be set to match the  lamps  in
       your room. This is typically a low temperature at around 3000K-4000K (default is 4500K). During
       the day,  the  color  temperature  should  match  the  light  from  outside,  typically  around
       5500K-6500K (default is 6500K). The light has a higher temperature on an overcast day.

       In addition to the command-line tool redshift, the GUI redshift-gtk provides an alternative in‐
       terface that shows up as a notification icon in the desktop environment.

OPTIONS
       -h     Display help message.

       -v     Enable verbose output.

       -V     Show program version.

       -b DAY:NIGHT
              Screen brightness to apply (between 0.1 and 1.0).

       -c FILE
              Load settings from specified configuration file.

       -g R:G:B
              Additional gamma correction to apply.

       -l LAT:LON
              Your current location, in degrees, given as floating point numbers,  towards  north  and
              east, with negative numbers representing south and west, respectively.

       -l PROVIDER[:OPTIONS]
              Select  provider  for  automatic  location  updates  (Use  "-l  list"  to  see available
              providers).

       -m METHOD[:OPTIONS]
              Method to use to set color temperature (Use "-m list" to see available methods).

       -o     One-shot mode (do not continuously adjust color temperature). Use this with the  -P  op‐
              tion to clear the existing gamma ramps before applying the new color temperature.

       -O TEMP
              One-shot  manual mode (set color temperature).  Use this with the -P option to clear the
              existing gamma ramps before applying the new color temperature.

       -p     Print mode (only print parameters and exit).

       -P     Reset existing gamma ramps before applying new color effect.

       -x     Reset mode (remove adjustment from screen).

       -r     Disable fading between color temperatures.

       -t DAY:NIGHT
              Color temperature to set at daytime/night.

       The neutral temperature is 6500K. Using this value will not change the color temperature of the
       display.  Setting the color temperature to a value higher than this results in more blue light,
       and setting a lower value will result in more red light.

       Default temperature values:

              Daytime: 6500K, night: 4500K

CONFIGURATION FILE
       A configuration file with the name redshift.conf can optionally be placed  in  ~/.config/.  The
       file  has  standard  INI  format. General program options are placed under the redshift header,
       while options for location providers and adjustment methods are placed under a header with  the
       name of that provider or method. General options are:

       temp-day = integer
              Daytime temperature

       temp-night = integer
              Night temperature

       fade = 0 or 1
              Disable or enable fading between color temperatures when Redshift starts or stops

       brightness-day = 0.1-1.0
              Screen brightness at daytime

       brightness-night = 0.1-1.0
              Screen brightness at night

       elevation-high = decimal
              The solar elevation in degrees for the transition to daytime

       elevation-low = decimal
              The solar elevation in degrees for the transition to night

       dawn-time = HH:MM[-HH:MM]
              The  custom  time  interval  for  the transition from night to day in the morning.  When
              specified, the solar elevation will not be used to determine the  current  daytime/night
              period. If this option is set, dusk-time must also be specified.

       dusk-time = HH:MM[-HH:MM]
              The  custom  time  interval  for  the transition from day to night in the evening.  When
              specified, the solar elevation will not be used to determine the  current  daytime/night
              period. If this option is set, dawn-time must also be specified.

       gamma = R:G:B
              Gamma adjustment to apply (day and night)

       gamma-day = R:G:B
              Gamma adjustment to apply at daytime

       gamma-night = R:G:B
              Gamma adjustment to apply at night

       adjustment-method = name
              Select  adjustment method. Options for the adjustment method can be given under the con‐
              figuration file heading of the same name.

       location-provider = name
              Select location provider. Options for the location provider can be given under the  con‐
              figuration file heading of the same name.

       Options  for  location  providers and adjustment methods can be found in the help output of the
       providers and methods.

EXAMPLE
       Example for Copenhagen, Denmark:

              $ redshift -l 55.7:12.6 -t 5700:3600 -g 0.8 -m randr -v

       An example configuration file with the same effect as the above command line:

              [redshift]
              temp-day=5700
              temp-night=3600
              gamma=0.8
              adjustment-method=randr
              location-provider=manual

              [manual]
              lat=55.7
              lon=12.6

HOOKS
       Executables (e.g. scripts) placed in folder ~/.config/redshift/hooks will be run when a certain
       event happens. The first parameter to the script indicates the event and further parameters may
       indicate more details about the event. The event period-changed is indicated  when  the  period
       changes  (night,  daytime, transition). The second parameter is the old period and the third is
       the new period. The event is also signaled when Redshift starts up with the old period  set  to
       none. Any dotfiles in the folder are skipped.

       A simple script to handle these events can be written like this:

              #!/bin/sh
              case $1 in
                  period-changed)
                      exec notify-send "Redshift" "Period changed to $3"
              esac

AUTHOR
       redshift was written by Jon Lund Steffensen <jonlst@gmail.com>.

       Both  redshift  and this manual page are released under the GNU General Public License, version
       3.

BUGS
       Please report bugs to <https://github.com/jonls/redshift/issues>

KNOWN ISSUES
       redshift will not affect the color of your cursor when your graphics driver  is  configured  to
       use hardware cursors. Some graphics drivers have an option to disable hardware cursors.

                                                                                           REDSHIFT(1)
