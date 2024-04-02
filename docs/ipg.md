PG3(8)                                                                                 System Manager's Manual: iputils                                                                                PG3(8)



NAME
       pg3, ipg, pgset - send stream of UDP packets

SYNOPSIS
       source ipg


       pg


       pgset COMMAND


DESCRIPTION
       ipg  is not a program, it is script which should be sourced to bash. When sourced it loads module pg3 and exports a few of functions accessible from parent shell. These macros are pg to start packet
       injection and to get the results of run; and pgset to setup packet generator.

       pgset can send the following commands to module pg3:

COMMAND
       odev DEVICE
              Name of Ethernet device to test. See warning below.

       pkt_size BYTES
              Size of packet to generate. The size includes all the headers: UDP, IP, MAC, but does not account for overhead internal to medium, i.e. FCS and various paddings.

       frags NUMBER
              Each packet will contain NUMBER of fragments.  Maximal amount for linux-2.4 is 6. Far not all the devices support fragmented buffers.

       count NUMBER
              Send stream of NUMBER of packets and stop after this.

       ipg TIME
              Introduce artificial delay between packets of TIME microseconds.

       dst IP_ADDRESS
              Select IP destination where the stream is sent to.  Beware, never set this address at random. pg3 is not a toy, it creates really tough stream. Default value is 0.0.0.0.

       dst MAC_ADDRESS
              Select MAC destination where the stream is sent to.  Default value is 00:00:00:00:00:00 in hope that this will not be received by any node on LAN.

       stop   Abort packet injection.

WARNING
       When output device is set to some random device different of hardware Ethernet device, pg3 will crash kernel.

       Do not use it on VLAN, ethertap, VTUN and other devices, which emulate Ethernet not being real Ethernet in fact.

AUTHOR
       pg3 was written by Robert Olsson <robert.olsson@its.uu.se>.

SECURITY
       This can be used only by superuser.

       This tool creates floods of packets which is unlikely to be handled even by high-end machines. For example, it saturates gigabit link with 60 byte packets when used with Intel's e1000.  In  face  of
       such stream switches, routers and end hosts may deadlock, crash, explode.  Use only in test lab environment.

AVAILABILITY
       pg3 is part of iputils package and the latest versions are  available in source form at http://www.skbuff.net/iputils/iputils-current.tar.bz2.



iputils-121221                                                                                20 September 2014                                                                                        PG3(8)
