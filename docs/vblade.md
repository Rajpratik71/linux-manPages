vblade(8)                                                     System Manager's Manual                                                    vblade(8)

NAME
       vblade, vbladed - export data via ATA over Ethernet

SYNOPSIS
       vblade [ -m mac[,mac...] ] shelf slot netif filename

DESCRIPTION
       The vblade command starts a process that uses raw sockets to perform ATA over Ethernet, acting like a virtual EtherDrive (R) blade.

       The vbladed script can be used to daemonize the vblade process, detaching it from your terminal and sending its output to the system logs.

   Arguments
       shelf  This should be the shelf address (major AoE address) of the AoE device to create.

       slot   This should be the slot address (minor AoE address) of the AoE device to create.

       netif  The name of the ethernet network interface to use for AoE communications.

       filename
              The name of the regular file or block device to export.

   Options
       -b     The  -b  flag  takes  an argument, the advertised buffer count, specifying the maximum number of outstanding messages the server can
              queue for processing.

       -d     The -d flag selects O_DIRECT mode for accessing the underlying block device.

       -s     The -s flag selects O_SYNC mode for accessing the underlying block device, so all writes are committed to disk before  returning  to
              the client.

       -r     The -r flag restricts the export of the device to be read-only.

       -m     The  -m flag takes an argument, a comma separated list of MAC addresses permitted access to the vblade.  A MAC address can be speci‐
              fied in upper or lower case, with or without colons.

       -o     The -o flag takes an argument, the number of sectors at the beginning of the  exported  file  that  are  excluded  from  AoE  export
              (default zero).

       -l     The -l flag takes an argument, the number of sectors to export.  Defaults to the file size in sectors minus the offset.

EXAMPLE
       In  this  example,  the  root  user  on  a host named nai exports a file named "3TB" to the LAN on eth0 using AoE shelf address 11 and slot
       address 1.  The process runs in the foreground.  Using vbladed would have resulted in the process running as a daemon in the background.

              nai:~# vblade 11 1 eth0 /data/3TB

BUGS
       Users of Jumbo frames should read the README file distributed with vblade to learn about a workaround for kernel buffering limitations.

AUTHOR
       Brantley Coile (brantley@coraid.com)

                                                                                                                                         vblade(8)
