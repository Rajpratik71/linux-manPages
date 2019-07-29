SLCANPTY(1)                                                        User Commands                                                       SLCANPTY(1)

NAME
       slcanpty - manual page for slcanpty 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       slcanpty <pty> <can interface>

DESCRIPTION
       ./slcanpty  creates  a pty for applications using the slcan ASCII protocol and converts the ASCII data to a CAN network interface (and vice
       versa)

       e.g. './slcanpty /dev/ptyc0 can0' creates /dev/ttyc0 for the slcan application e.g. for pseudo-terminal './slcanpty /dev/ptmx can0' creates
       /dev/pts/N

slcanpty 2018.02.0-1~ubuntu16.04.1~ppa1                            October 2018                                                        SLCANPTY(1)
