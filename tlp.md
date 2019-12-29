tlp(8)                                     Power Management                                     tlp(8)

NAME
       tlp - apply laptop power saving settings

SYNOPSIS
       tlp command [parameters] [-- <config> ... ]

DESCRIPTION
       Apply power saving settings manually and control ThinkPad battery features.

COMMANDS
       start  Initialize  tlp  and  apply  power saving settings according to the actual power source.
              Also use to apply a changed configuration.

       bat    Apply power saving settings for battery power source.

       true   Same as bat.

       ac     Apply power saving settings for AC power source.

       false  Same as ac.

       usb    Enable autosuspend for all USB devices, except blacklisted ones.

       bayoff Turn off optical drive in UltraBay/MediaBay.  The drive may be re-enabled by pulling the
              eject lever or pushing the media eject button on newer models.

       setcharge [START_CHARGE STOP_CHARGE] [BAT0|BAT1] (ThinkPads only)
              Set  charge  thresholds  of main (BAT0) or auxiliary (BAT1) battery temporarily.  Values
              must be between 1 and 100, STOP_CHARGE > START_CHARGE + 3.   Configured  thresholds  are
              restored  upon next system boot-up. When called without arguments, configured thresholds
              are set.

       fullcharge [BAT0|BAT1] (ThinkPads only)
              Set charge thresholds of main (BAT0) or auxiliary  (BAT1)  battery  to  factory  presets
              (96/100)  temporarily  (causing a full charge).  Configured thresholds are restored upon
              next system boot-up.

       chargeonce [BAT0|BAT1] (ThinkPads only)
              Charge main (BAT0) or auxiliary (BAT1) battery to the stop charge  threshold  once  (by‐
              passing start threshold).  Configured thresholds are restored upon next system boot-up.

       discharge [BAT0|BAT1] (ThinkPads only)
              Force complete discharge of main (BAT0) or auxiliary (BAT1) battery.

       recalibrate [BAT0|BAT1] (ThinkPads only)
              Battery  recalibration: completely discharge main (BAT0) or auxiliary (BAT1) battery and
              recharge to 100%.

       diskid Show disk ids for configuration.

       -- PARAM=value ...
              Add parameters to temporarily overwrite the system configuration (for this program invo‐
              cation only).

NOTES
       For ThinkPads with more than one battery the selection works as follows:

              BAT0 - Main or internal battery

              BAT1 - Ultrabay, Slice or replaceable battery

EXAMPLES
       Apply thresholds of 70 / 90% to the main battery:

              tlp setcharge 70 90 BAT0

       Charge the auxiliary battery to full capacity:

              tlp fullcharge BAT1

       Recalibrate the main battery:

              tlp recalibrate BAT0

FILES
       /etc/default/tlp
              System-wide configuration file containing all power saving settings.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       tlp-stat(8), bluetooth(1), wifi(1), wwan(1).

       Project homepage: ⟨http://linrunner.de⟩

AUTHOR
       (c) 2018 Thomas Koch <linrunner at gmx.net>

TLP 1.2                                       2019-03-03                                        tlp(8)
