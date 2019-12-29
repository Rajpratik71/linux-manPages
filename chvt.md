CHVT(1)                                 General Commands Manual                                CHVT(1)

NAME
       chvt - change foreground virtual terminal

SYNOPSIS
       chvt N

DESCRIPTION
       The  command chvt N makes /dev/ttyN the foreground terminal.  (The corresponding screen is cre‐
       ated if it did not exist yet.  To get rid of unused VTs, use deallocvt(1).)  The  key  combina‐
       tion (Ctrl-)LeftAlt-FN (with N in the range 1-12) usually has a similar effect.

                                            26 January 1997                                    CHVT(1)
