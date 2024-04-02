VCONFIG(8)                                                                                 System Manager's Manual                                                                                 VCONFIG(8)



NAME
       vconfig - VLAN (802.1q) configuration program.

SYNOPSIS
       vconfig [lots of long options]

DESCRIPTION
       The vconfig program allows you to create and remove vlan-devices on a vlan enabled kernel. Vlan-devices are virtual ethernet devices which represents the virtual lans on the physical lan.

OPTIONS
       add [interface-name] [vlan-id]
              Creates a vlan-device on [interface-name]. The resulting vlan-device will be called according to the nameing convention set.

       rem [vlan-device]
              Removes the named vlan-device.

       set_flag [vlan-device] 0 | 1
              When  1,  ethernet  header reorders are turned on. Dumping the device will appear as a common ethernet device without vlans. When 0(default) however, ethernet headers are not reordered, which
              results in vlan tagged packets when dumping the device. Usually the default gives no problems, but some packet filtering programs might have problems with it.


       set_egress_map [vlan-device] [skb-priority] [vlan-qos]
              This flags that outbound packets with a particular skb-priority should be tagged with the particular vlan priority vlan-qos. The default vlan priority is 0.


       set_ingress_map [vlan-device] [skb-priority] [vlan-qos]
              This flags that inbound packets with the particular vlan priority vlan-qos should be queued with a particular skb-priority. The default skb-priority is 0.


       set_name_type VLAN_PLUS_VID | VLAN_PLUS_VID_NO_PAD | DEV_PLUS_VID | DEV_PLUS_VID_NO_PAD
              Sets the way vlan-device names are created. Use vconfig without arguments to see the different formats.



       NOTES  VLAN will use Broadcom's NICE interface when the network device supports it. This is necessary, since usually the hardware of these devices already removes the  vlan  tag  from  the  ethernet
              packet.  The  set_flag option on vlan-devices created on such a physical network device will be ignored.  Dumping the network-device will show only untagged(non-vlan) traffic, and dumping the
              vlan-devices will only show traffic intended for that vlan, without the tags.

FILES
       /proc/net/vlan/config
       /proc/net/vlan/[vlan-device]


SEE ALSO
       ip(8), ifconfig(8)

AUTHORS
       This manual page was written by Ard van Breemen <ard@kwaak.net>
       The vlan patch is written by Ben Greear <greearb@candelatech.com>



                                                                                                                                                                                                   VCONFIG(8)
