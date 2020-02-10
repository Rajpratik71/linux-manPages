PM-ACTION(8)                                                                               pm-utils User Manual                                                                              PM-ACTION(8)

NAME
       pm-action - Suspend or Hibernate your computer

SYNOPSIS
       pm-hibernate [--help]

       pm-suspend [--quirk-*] [--help]

       pm-suspend-hybrid [--quirk-*] [--help]

DESCRIPTION
       This manual page documents briefly the pm-action, pm-hibernate, pm-suspend and pm-suspend-hybrid commands. This manual page was originally written for the Debian(TM) distribution and has been
       adopted by the pm-utils project.

       These commands can be used to put the machine in a sleep state. The precise way how this is done can be influenced by installing executables and configuration snippets. For some options external
       programs are needed.

       These commands will usually be called by UPower or hald when triggered to do so by a program in a desktop session such as gnome-power-manager. Calling them from the command line is also
       possible, but it is not guaranteed that all programs in your desktop session keep working as expected.

       pm-suspend
           During suspend most devices are shutdown, and system state is saved in RAM. The system still requires power in this state. Most modern systems require 3 to 5 seconds to enter and leave
           suspend, and most laptops can stay in suspend mode for 1 to 3 days before exhausting their battery.

       pm-hibernate
           During hibernate the system is fully powered off, and system state is saved to disk. The system does not require power, and can stay in hibernate mode indefinitely. Most modern systems
           require 15 to 45 seconds to enter and leave hibernate, and entering and leaving hibernate takes longer when you have more memory.

       pm-suspend-hybrid
           Hybrid-suspend is the process where the system does everything it needs to hibernate, but suspends instead of shutting down. This means that your computer can wake up quicker than for normal
           hibernation if you do not run out of power, and you can resume even if you run out of power. s2both(8) is an hybrid-suspend implementation.

OPTIONS
       On some hardware putting the video card in the suspend state and recovering from it needs some special quirk handling. With the --quirk-* options of the pm-suspend and pm-suspend-hybrid commands
       you can select which quirks should be used.

       If pm-suspend, pm-hibernate, or pm-suspend-hybrid are invoked without any commandline parameters, they will try to grab the correct quirks from the internal quirk database.

       --quirk-dpms-on
           This option forces the video hardware to turn on the screen during resume. Most video adapters turn on the screen themselves, but if you get a blank screen on resume that can be turned back
           on by moving the mouse or typing then this option may be useful.

       --quirk-dpms-suspend
           This option forces the video hardware to turn off the screen when suspending. Most video adapters seem to do this correctly, but some do not, which wastes lots of power. If your screen is
           still on after successfully suspending you may need to use this option.

       --quirk-radeon-off
           This option forces Radeon hardware to turn off the display during suspend and turn it back on during resume. You only need to do this on some old ThinkPads of the '30 series (T30, X31,
           R32,... ) with Radeon video hardware.

       --quirk-s3-bios
           This option calls the video BIOS during S3 resume. Unfortunately, it is not always allowed to call the video BIOS at this point, so sometimes adding this option can actually break resume on
           some systems.

       --quirk-s3-mode
           This option initializes the video card into a VGA text mode, and then uses the BIOS to set the video mode. On some systems S3 BIOS only initializes the video BIOS to text mode, and so both
           S3 BIOS and S3 MODE are needed.

       --quirk-vbe-post
           This option will attempt to reinitialize the video card when resuming from suspend, using the same code the system BIOS uses at boot in order to initialize the video hardware. Not all video
           cards need this, and using this option on systems where it is not needed can cause a system to lock up when resuming.

       --quirk-vbemode-restore
           This option will save and restore the current VESA mode which may be necessary to avoid X screen corruption. Using this feature on Intel graphics hardware is probably a bad idea.

       --quirk-vbestate-restore
           This option saves and restores some low level hardware state which may be invalid after suspend.

       --quirk-vga-mode-3
           This option will try to force the video card into a standard text mode on resume.

       --quirk-save-pci
           Save the PCI config space for the VGA card.

       --store-quirks-as-lkw
           Save the quirks the video adaptor required by pm-suspend or pm-suspend-hybrid as an .quirkdb file that is specific to this system. The file will be saved in
           /var/cache/pm-utils/last_known_working.quirkdb. This parameter will only save the actual quirks that were used to successfully suspend/resume a system, and will be specific to the exact
           configuration of that system, including the video hardware, video driver, and whether or not kernel modesetting was used. If the system configuration changes, like after a kernel upgrade,
           this file will be overwritten.

FILES
       /etc/pm/config.d
           The files in this directory are evaluated in C sort order. These files can be provided by individual packages outside of pm-utils. If a global configuration variable is set, the value set to
           will be appended to the previous value. If any other variable is set, it will be ignored. The syntax is simply: VAR_NAME=value. See the CONFIGURATION VARIABLES section for valid variables
           defined by pm-utils. External packages can define others, see their respective documentation for more information.

       /etc/pm/sleep.d, /usr/lib/pm-utils/sleep.d
           Programs in these directories (called hooks) are combined and executed in C sort order before suspend and hibernate with as argument 'suspend' or 'hibernate'. Afterwards they are called in
           reverse order with argument 'resume' and 'thaw' respectively. If both directories contain a similar named file, the one in /etc/pm/sleep.d will get preference. It is possible to disable a
           hook in the distribution directory by putting a non-executable file in /etc/pm/sleep.d, or by adding it to the HOOK_BLACKLIST configuration variable.

       /var/log/pm-suspend.log
           The log file shows what was done on the last suspend/hibernate and resume/thaw.

SLEEP HOOK ORDERING CONVENTION
       00 - 49
           User and most package supplied hooks. If a hook assumes that all of the usual services and userspace infrastructure is still running, it should be here.

       50 - 74
           Service handling hooks. Hooks that start or stop a service belong in this range. At or before 50, hooks can assume that all services are still enabled.

       75 - 89
           Module and non-core hardware handling. If a hook needs to load/unload a module, or if it needs to place non-video hardware that would otherwise break suspend or hibernate into a safe state,
           it belongs in this range. At or before 75, hooks can assume all modules are still loaded.

       90 - 99
           Reserved for critical suspend hooks.

CONFIGURATION VARIABLES
       Configuration variables defined by pm-utils. These can be set in any file in /etc/pm/config.d/.

       SLEEP_MODULE [=kernel]
           The default suspend backend to use. Valid values are:

           kernel
               The built-in kernel suspend/resume support. Use this if nothing else is supported on your system. The kernel backend is always used if nothing else is available.

           uswsusp
               If your system has support for the userspace suspend programs (s2ram/s2disk/s2both), then use this.

           tuxonice
               If your system has support for tuxonice/suspend2, use this.

       HIBERNATE_RESUME_POST_VIDEO [=no]
           If video should be posted after hibernate, just like after suspend. You should not normally need to set this.

       SUSPEND_MODULES
           Space separated list of modules to unload before suspend.

       HOOK_BLACKLIST
           Space separated list of hooks that should be disabled.

       ADD_PARAMETERS
           Space separated list of command line parameters that should be added. If special quirks are needed for your system, you can add them here.

       DROP_PARAMETERS
           Space separated list of command line parameters that should be ignored. If particular quirks are causing problems for your system, you can add them here. If you want to remove all parameters
           use all.

       HIBERNATE_MODE
           Default method to power down the system when hibernating. If not set, the system will use the kernel default as a default value. Check /sys/power/disk for valid values. The default value
           will be surrounded by [square brackets].

       NEED_CLOCK_SYNC
           If your system clock drifts across a suspend/resume or hibernate/thaw cycle, you should set this to true. This will cause pm-utils to synchronize the system clock whenever going through a
           sleep/wake cycle at the expense of making suspend/resume take longer.

       PM_HIBERNATE_DELAY [=900]
           If you are using kernel suspend/resume and invoke pm-suspend-hybrid, this environment variable controls how many seconds the system will wait after going into suspend before waking back up
           and hibernating. By default, this is set to 900 seconds (15 minutes).

RETURN VALUES
       Return values less than 128 mean that pm-action failed before trying to put the system in the requested power saving state. A return value of 128 means that pm-action tried to put the machine in
       the requested power state but failed. A return value greater than 128 means pm-action encountered an error and also failed to enter the requested power saving state.

DEBUGGING
       Debugging suspend/resume can be a tricky process, and is covered in more detail in /usr/share/doc/pm-utils/README.debugging.

BUGS
       The upstream BTS can be found at https://bugs.freedesktop.org/. Select 'pm-utils' as product.

SEE ALSO
       s2ram(8), s2disk(8), s2both(8), pm-is-supported(1), pm-powersave(8), vbetool(8), radeontool(8)

AUTHOR
       Tim Dijkstra <tim@famdijkstra.org>
           Manpage author.

COPYRIGHT
       Copyright © 2007 Tim Dijkstra

       This manual page was originally written for the Debian(TM) system, and has been adopted by the pm-utils project.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or (at your option) any later version published by the Free
       Software Foundation.

pm-action                                                                                      Apr 25, 2007                                                                                  PM-ACTION(8)
