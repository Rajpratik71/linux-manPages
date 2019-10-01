ifup(8)                                                                            System Administration tools and Daemons                                                                            ifup(8)



NAME
       ifup - bring a network interface up

       ifdown - take a network interface down

SYNOPSIS
       ifup CONFIG [boot]

       ifdown CONFIG


DESCRIPTION
       The  ifup and ifdown commands may be used to configure (or, respec- tively, deconfigure) network interfaces based on interface definitions in the files /etc/sysconfig/network and /etc/sysconfig/net‐
       work-scripts/ifcfg-<configuration>

       These scripts take one argument normally: the name of the configuration (e.g. eth0). They are called with a second argument of "boot" during the boot sequence so that devices that are not  meant  to
       be brought up on boot (ONBOOT=no, see below) can be ignored at that time.


FILES
       /etc/sysconfig/network


       /etc/sysconfig/network-scripts/ifcfg-<configuration>
              The file defining an interface.


SEE ALSO
       /usr/share/doc/initscripts-*/sysconfig.txt



                                                                                                  2009-10-27                                                                                          ifup(8)
