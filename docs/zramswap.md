zramswap(1)                             General Commands Manual                            zramswap(1)

NAME
       zramswap - configure swap on zram

SYNOPSIS
       zramswap [OPTION]

DESCRIPTION
       zram is a Linux feature that allows a user to create compressed ramdisks.

       zramswap sets up swap in zram, which effectively allows you to compress memory.

       Common use cases:

       On machines with low memory, mitigates the tedious situation where the machine is out of memory
       and then it starts swapping to disk only to lose a large amount of disk bandwidth.

       On machines where the main swap file is on flash memory, zramswap  may  only  provide  marginal
       performance  increase  (especially  on fast SSD media), however, it will prevent some amount of
       wear on your flash memory. zramswap is especially beneficial if your main flash is on SD/MMC/CF
       card.

       On servers that run many virtual machines or containers, zramswap allows you to optimise memory
       usage by swapping out data that's not often accessed, but when a user needs to  access  it,  it
       will be available fast. It allows you to overcommit on memory with a negligible hit on your ap‐
       plication performance (and often an improvement in performance where you can use more main mem‐
       ory for filesystem cache).

OPTIONS
       Usage: zramswap [OPTION]

       ZRAMSWAP Options

        start
              Sets up zram swap.

        stop
              Tears down zram swap.

        status
              Displays zram swap usage and compression ratio.

REPORTING BUGS
       Please file issues at: https://salsa.debian.org/jcc/zram-tools/issues

AUTHORS
       This manual page was written by Jonathan Carter <jcarter@linux.com>

zramswap                                      2018-10-04                                   zramswap(1)
