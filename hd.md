HD(4)                      Linux Programmer's Manual                     HD(4)



NNAAMMEE
       hd - MFM/IDE hard disk devices

DDEESSCCRRIIPPTTIIOONN
       The hhdd** devices are block devices to access MFM/IDE hard disk drives in
       raw mode.  The master drive on the primary IDE controller (major device
       number 3) is hhddaa; the slave drive is hhddbb.  The master drive of the
       second controller (major device number 22) is hhddcc and the slave is hhdddd.

       General IDE block device names have the form hhdd_X, or hhdd_X_P, where _X is a
       letter denoting the physical drive, and _P is a number denoting the
       partition on that physical drive.  The first form, hhdd_X, is used to
       address the whole drive.  Partition numbers are assigned in the order
       the partitions are discovered, and only nonempty, nonextended
       partitions get a number.  However, partition numbers 1–4 are given to
       the four partitions described in the MBR (the "primary" partitions),
       regardless of whether they are unused or extended.  Thus, the first
       logical partition will be hhdd_X55.  Both DOS-type partitioning and BSD-
       disklabel partitioning are supported.  You can have at most 63
       partitions on an IDE disk.

       For example, _/_d_e_v_/_h_d_a refers to all of the first IDE drive in the
       system; and _/_d_e_v_/_h_d_b_3 refers to the third DOS "primary" partition on
       the second one.

       They are typically created by:

           mknod -m 660 /dev/hda b 3 0
           mknod -m 660 /dev/hda1 b 3 1
           mknod -m 660 /dev/hda2 b 3 2
           ...
           mknod -m 660 /dev/hda8 b 3 8
           mknod -m 660 /dev/hdb b 3 64
           mknod -m 660 /dev/hdb1 b 3 65
           mknod -m 660 /dev/hdb2 b 3 66
           ...
           mknod -m 660 /dev/hdb8 b 3 72
           chown root:disk /dev/hd*

FFIILLEESS
       _/_d_e_v_/_h_d_*

SSEEEE AALLSSOO
       cchhoowwnn(1), mmkknnoodd(1), ssdd(4), mmoouunntt(8)

CCOOLLOOPPHHOONN
       This page is part of release 4.16 of the Linux _m_a_n_-_p_a_g_e_s project.  A
       description of the project, information about reporting bugs, and the
       latest version of this page, can be found at
       https://www.kernel.org/doc/man-pages/.



Linux                             2017-09-15                             HD(4)
