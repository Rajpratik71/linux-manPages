LSDEV(8)                                                                                     Linux System Manual                                                                                     LSDEV(8)



NAME
       lsdev - display information about installed hardware


SYNOPSIS
       lsdev


DESCRIPTION
       lsdev gathers information about your computer's installed hardware from the interrupts, ioports and dma files in the /proc directory, thus giving you a quick overview of which hardware uses what I/O
       addresses and what IRQ and DMA channels.


OPTIONS
       None.


FILES
       /proc/interrupts
              IRQ channels.


       /proc/ioports
              I/O memory addresses.


       /proc/dma
              DMA channels.


BUGS
       lsdev can't always figure out which lines in the three examined files refer to one and the same device, because these files sometimes use different names for the same piece of hardware. For example,
       in  some  kernels the keyboard is referred to as `kbd' in /proc/ioports and as `keyboard' in /proc/interrupts.  This should be fixed in the kernel, not in lsdev (as has indeed happened for this par-
       ticular example).

       The program does however try to match lines by stripping anything after a space or open parenthesis from the name, so that e.g. the `serial' lines from /proc/interrupts match the `serial(set)' lines
       from /proc/ioports.  This attempt at DWIM might be considered a bug in itself.

       This program only shows the kernel's idea of what hardware is present, not what's actually physically available.


SEE ALSO
       procinfo(8).


AUTHOR
       Sander van Malssen <svm@kozmix.cistron.nl>



3rd Release                                                                                       1998-05-31                                                                                         LSDEV(8)
