CHVT(1)                                                                                    General Commands Manual                                                                                    CHVT(1)



NAME
       chvt - change foreground virtual terminal

SYNOPSIS
       chvt [ --userwait ] N

DESCRIPTION
       The  command  chvt  N  makes  /dev/ttyN  the  foreground  terminal.   (The corresponding screen is created if it did not exist yet.  To get rid of unused VTs, use deallocvt(1).)  The key combination
       (Ctrl-)LeftAlt-FN (with N in the range 1-12) usually has a similar effect.

       The --userwait option causes the system to loop in userspace waiting for the new terminal to become active, as opposed to the kernel-side VT_WAITACTIVE ioctl.



                                                                                               26 January 1997                                                                                        CHVT(1)
