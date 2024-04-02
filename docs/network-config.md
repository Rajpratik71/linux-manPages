NETWORK-CONFIG(8)                                             System Manager's Manual                                            NETWORK-CONFIG(8)

NAME
       network-config - Simple network configuration tool

SYNOPSIS
       network-config [options]

DESCRIPTION
       network-config  is  a  simple  and  easy to use program that helps configuring the network interfaces for linux-based operating systems. It
       allows have multiple configurations for the same computer and to easy configure NAT for internet sharing. It can also be used to  scan  for
       wireless networks.  It is written in perl and uses gtk2+, but also works as a command line program.

OPTIONS
       -h     Show summary of options.

       -tl    Lists all the configurations

       -ts CONFIG
              Shows CONFIG configuration

       -tc CONFIG FORMAT
              Changes the CONFIG configuration
              FORMAT example : name=test,eth0[dhcp=TRUE ip=192.168. netmask=255.]
              formats : name,icon,description,dns_auto,dns1,dns2,dns3,default_net
              devices formats : active,ip,netmask,gateway,nat,dhcp,w_wep,
              w_wpa,w_ssid,w_rate -ta CONFIG Applies the CONFIG configuration

AUTHOR
       network-config was written by Munteanu Alexandru Ionut.

       This manual page was written by Marvin Stark <marv@der-marv.de>

                                                                 January  9, 2007                                                NETWORK-CONFIG(8)
