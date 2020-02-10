PLIPCONFIG(8)                                                                                                                                                                               PLIPCONFIG(8)

NAME
       plipconfig - fine tune PLIP device parameters

SYNOPSIS
       plipconfig interface
       plipconfig interface [nibble NN] [trigger NN] [unit NN]

DESCRIPTION
       Plipconfig  is  used  to (hopefully) improve PLIP performance by changing the default timing parameters used by the PLIP protocol. Results are dependent on the parallel port hardware, cable, and
       the CPU speed of each machine on each end of the PLIP link.

       If the single interface argument is given, plipconfig displays the status of the given interface only.  Otherwise, it will try to set the options.

OPTIONS
       nibble NN
              Sets the nibble wait value in microseconds. Default is 3000.

       trigger NN
              Sets the trigger wait value in microseconds. Default is 500.

       PLIP speed can in some cases be improved by lowering the default values.  Values which are too low may cause excess use of CPU, poor interrupt response time resulting in  serial  ports  dropping
       characters, or in dropping of PLIP packets. Changing the plip MTU can also affect PLIP speed.

NOTE
       If you get no response it is far more likely the irq is wrong and needs setting with ifconfig. The few cases where the default parameters will be too fast are those using very long cables. Some‐
       thing you should never do as the parallel port is not specified or designed for driving long cable runs.

SEE ALSO
       ifconfig(8)

BUGS
       Non.

AUTHOR
       John Paul Morrison, <jmorriso@bogomips.ee.ubc.ca>, <ve7jpm@ve7jpm.ampr.org>

                                                                                             17 February 1995                                                                               PLIPCONFIG(8)
