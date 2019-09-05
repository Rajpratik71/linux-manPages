PROCINFO(8)                                                                                  Linux System Manual                                                                                  PROCINFO(8)



NAME
       procinfo - display system status gathered from /proc


SYNOPSIS
       procinfo [ -fsmadiDSbrChv ] [ -nN ] [ -Ffile ]


DESCRIPTION
       procinfo gathers some system data from the /proc directory and prints it nicely formatted on the standard output device.

       The meanings of the fields are as follows:


       Memory:
              See the man page for free(1) (preferably the proc-version of free (If you weren't around during the Linux 1.x days, that's the only version of free you'll have)).


       Bootup:
              The time the system was booted.


       Load average:
              The  average  number of jobs running, followed by the number of runnable processes and the total number of processes (if your kernel is recent enough), followed by the PID of the last process
              run (idem).


       user:  The amount of time spent running jobs in user space.


       nice:  The amount of time spent running niced jobs in user space.


       system:
              The amount of time spent running in kernel space.  Note: the time spent servicing interrupts is not counted by the kernel (and nothing that procinfo can do about it).


       idle:  The amount of time spent doing nothing.


       uptime:
              The time that the system has been up. The above four should more or less add up to this one.


       page in:
              The number of disk block paged into core from disk. (A block is almost always 1 kilobyte).


       page out:
              The reverse of the above. (What does that mean, anyways?)


       swap in:
              The number of memory pages paged in from swapspace.


       swap out:
              The number of memory pages paged out to swapspace.


       context:
              The total number of context switches since bootup.


       disk 1-4:
              The number of times your hard disks have been accessed. This won't work for 1.0.x/1.1.x kernels unless you have applied the diskstat patch available elsewhere to your kernel, and  might  give
              surprising  results  if all your hard disks are of the same type (e.g. all IDE, all SCSI). [I'm not sure to what extend this is still true with recent kernels, but I don't have a mixed system
              so I can't check.]


       Interrupts:
              This is either a single number for all IRQ channels together if your kernel is older than version 1.0.5, or two rows of numbers for each IRQ channel if your kernel  is  at  version  1.0.5  or
              later. On Intel architecture there are sixteen different IRQ channels, and their default meanings are as follows:

              0      Timer channel 0
              1      Keyboard
              2      Cascade for controller 2 (which controls IRQ 8-15)
              3      Serial Port 2
              4      Serial Port 1
              5      Parallel Port 2
              6      Floppy Diskette Controller
              7      Parallel Port 1
              8      Real-time Clock
              9      Redirected to IRQ2
              10     --
              11     --
              12     --
              13     Math Coprocessor
              14     Hard Disk Controller
              15     --

              Note  that  the  meanings of the IRQ channels for parallel ports, serial ports and those left empty may have been changed depending on your hardware setup. If that's the case on your machine,
              you're probably aware of it. If you're not, upgrade to at least Linux 1.1.43 and let procinfo enlighten you about who uses what.

       Modules:
              The modules (loadable device drivers) installed on your machine, with their sizes in kilobytes. (Only with -m or -a option). Modules with a use count larger than 0 are marked with  an  aster-
              isk.


       Character and Block Devices:
              All available devices with their major numbers. (Only with -m or -a option).

       File Systems:
              All available file systems. (Only with -m or -a option). Those that do not require an actual device (like procfs itself) are noted between square brackets.

OPTIONS
       -f     Run procinfo continuously full-screen.

       -nN    Pause  N  second  between  updates.  This option implies -f. It may contain a decimal point.  The default is 5 seconds. When run by root with a pause of 0 seconds, the program will run at the
              highest possible priority level.

       -m     Show info about modules and device drivers instead of CPU and memory stats.

       -a     Show all information that procinfo knows how to find.

       -d     For memory, CPU times, paging, swapping, disk, context and interrupt stats, display values per second rather than totals. This option implies -f.

       -D     Same as -d, except that memory stats are displayed as totals.

       -S     When running with -d or -D, always show values per second, even when running with -n N with N greater than one second.

       -Ffile Redirect output to file (usually a tty). Nice if, for example, you want to run procinfo permanently on a virtual console or on a terminal, by starting it from init(8) with a line like:

              p8:23:respawn:/usr/bin/procinfo -biDn1 -F/dev/tty8


       -b     If your kernel is recent enough to display separate read and write numbers for disk I/O, the -b flag makes procinfo display numbers of blocks rather that numbers of I/O requests  (neither  of
              which is, alas, reliably translatable into kilobytes).

       -i     Normally  the IRQ portion of the display is squeezed to only display non-zero IRQ channels. With this option you'll get the full list, but on Alphas and on Intel boxen with 2.1.104 kernels or
              later procinfo won't fit inside a 80x24 screen anymore. Price of progress, I suppose.

       -r     This option adds an extra line to the memory info showing 'real' free memory, just as free(1) does.

       -h     Print a brief help message.

       -v     Print version info.

INTERACTIVE COMMANDS
       When running procinfo fullscreen, you can change its behaviour by pressing n, d, D, S, i, m, a, r and b, which have the same effect as the corresponding command line options.  In  addition  you  can
       press  q  which  quits the program; s which switches back to the main screen after pressing m or a; t which switches back to displaying totals after pressing d or D; <space> which freezes the screen
       untill you press another key again; C and R which sets and releases a checkpoint in totals mode; and finally Ctrl-L which refreshes the screen.

FILES
       /proc  The proc file system.

BUGS
       What, me worry?

SEE ALSO
       free(1), uptime(1), w(1), init(8), proc(5).

AUTHOR
       Sander van Malssen <svm@kozmix.cistron.nl>



18th Release                                                                                      2001-03-02                                                                                      PROCINFO(8)
