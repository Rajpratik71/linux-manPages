HIBERNATE(8)                                                HIBERNATE(8)

NAME
       hibernate  -  save your computer's state to disk, and then switch
       it off

SYNOPSIS
       hibernate [OPTION]...

DESCRIPTION
       The hibernate script (or "suspend script") is used to invoke  the
       Linux kernel's Hibernation functionality.

       When  you hibernate your machine, the contents of your computer's
       memory will be saved to disc, and your computer will switch  off.
       When  you  switch  it back on again, it will resume exactly as it
       was when you hibernated.  This script is designed  for  TuxOnIce,
       which  is  not  yet  included in the main kernel tree and must be
       downloaded  from  the  TuxOnIce  web  site  at  http://www.tuxon‐
       ice.net/,  but can also utilise the vanilla kernel interfaces for
       swsusp or pmdisk (through /proc/acpi/sleep or  /sys/power/state).
       Instructions  on  setting up the kernel can also be found on that
       web site.

       The hibernate script takes care of the  user-space  side  of  the
       suspend,  including  unloading  and reloading drivers which don't
       suspend properly, setting the system clock after resuming, taking
       down  and  bringing up network interfaces and various other hacks
       that may be required on some hardware.  By default, all  it  does
       is   restore  the  system  clock  after  suspending;  see  hiber‐
       nate.conf(5) for information on configuring the rest of its func‐
       tionality.

       If the hibernate script is invoked with a name of the form hiber‐
       nate-foo then it will  use  the  configuration  file  /etc/hiber‐
       nate/foo.conf instead of the default.

       The hibernate script accepts the following command-line options:

OPTIONS
       -h, --help      Shows this help screen.

       --version       Shows the Hibernate Script version.

       -f, --force     Ignore errors and suspend anyway.

       -k, --kill      Kill processes if needed, in order to suspend.

       -v<n>, --verbosity=<n>
                       Change verbosity level (0 = errors only, 3 = ver‐
                       bose, 4 = debug)

       -F<file>, --config-file=<file>
                       Use the given configuration file instead  of  the
                       default ()

       --dry-run       Don't actually do anything.

       -g, --restore-grub
                       Restores the grub menu to normal (use if a resume
                       was not completed  successfully)  and  exits  the
                       script. A suspend is not performed.

       --lock-console-as <username>
                       Uses vlock to lock the entire system after resum‐
                       ing, requirng you to enter the password  for  the
                       given user to unlock it. This overrides any user‐
                       name given in the configuration  file.  (Requires
                       vlock)

       -n, --no-suspend
                       Disables  actually suspending the system. This is
                       useful for testing the hibernate script itself.

       -r[0|1], --reboot[=<0|1>] (requires UseTuxOnIce on)
                       If 0 is specified, disables rebooting after writ‐
                       ing the image, regardless of the Reboot option in
                       the configuration file. If  1  or  omitted,  will
                       force a reboot after writing the image.

       --bug-report (requires UseTuxOnIce on)
                       Gathers a bunch of information about your machine
                       and writes it to standard output.  Please  attach
                       this  information  along  with any bug reports to
                       the TuxOnIce mailing list.

EXIT CODES
       The exit codes returned by the hibernate script are currently  as
       follows:

       0      Hibernation was completed successfully.

       2      Hibernation  was  aborted  due to errors from some part of
              the  script.  (eg,  modules  not  unloading,  devices   or
              filesystems in use).

       3      Hibernate  script  was  aborted by user with Ctrl+C. (This
              does not mean the suspend was aborted by a user by  press‐
              ing Escape).

       4      Hibernation was aborted by a kernel problem (hibernate.log
              and dmesg should indicate why), or the  user  aborted  the
              suspend with the Escape key.

FILES
       /etc/hibernate/hibernate.conf
                 Contains options which influence the hibernate script's
                 behaviour.  See hibernate.conf(5) for more information.

       /etc/hibernate/scriptlets.d/

       /usr/share/hibernate/scriptlets.d/

       /usr/local/share/hibernate/scriptlets.d/
                 These directories contains  "scriptlets"  that  provide
                 functionality  when  suspending  and resuming.  See the
                 SCRIPTLET-API  file  included  with  the   distribution
                 (which  can  be  found  in  /usr/share/doc/hibernate on
                 Debian systems) for information on how these work.

BUGS
       Probably lots!

       If you have problems with the hibernate script or  TuxOnIce,  the
       best   place   to   ask  is  on  the  mailing  list  -  tuxonice-
       users@lists.tuxonice.net. You will need to subscribe to post. See
       http://www.tuxonice.net/lists for details.

       If  the  suspend  process itself crashes (while "Writing caches",
       "Reading caches", or "Copying original kernel back",  etc),  then
       the   problem   lies   with  TuxOnIce  itself.  See  the  FAQ  at
       http://www.tuxonice.net/ for help on debugging.

AUTHOR
       This script was written by Bernard Blackham,  with  contributions
       from:

       ·   Carsten  Rietzschel (modules, bootsplash and grub scriptlets.
           many ideas and bugfixes)

       ·   Cameron Patrick (many bugfixes and ideas, man page and Debian
           packaging)

SEE ALSO
       hibernate.conf(5)

Linux Hibernation               May 2012                    HIBERNATE(8)
