Bla(8)                                                                                           Kernel tools                                                                                          Bla(8)



NAME
       klogconsole - Tells the kernel to what terminal it should copy messages

SYNOPSIS
       klogconsole [-l <console_loglevel>] [-r <virtual_console>]

DESCRIPTION
       The program klogconsole tells the kernel to what terminal and starting from what level it should copy printk(9) messages.

   General Options
       -l <console_loglevel>
              This option sets the console log level.

       -r <virtual_console>
              This option sets the virtual console which is used by the kernel for its messages,

EXAMPLE
       klogconsole -r10

FILES
       /proc/kmsg

       /proc/sys/kernel/printk

SEE ALSO
       printk(9), klogd(8).

AUTHOR
       klogconsole was written by Hans Lermen <lermen@elserv.ffm.fgan.de> in 1996 and published under GPL.  Parts of the routine switch_printk_console() was taken from Kevin Buhr <buhr@stat.wisc.edu>.



3rd Berkeley Distribution                                                                      August 20, 2001                                                                                         Bla(8)
