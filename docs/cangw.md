CANGW(1)                                                           User Commands                                                          CANGW(1)

NAME
       cangw - manual page for cangw 2018.02.0-1~ubuntu16.04.1~ppa1

SYNOPSIS
       cangw [options]

DESCRIPTION
       cangw - manage PF_CAN netlink gateway.

   Commands:
       -A     (add a new rule)

       -D     (delete a rule)

       -F     (flush / delete all rules)

       -L     (list all rules)

   Mandatory:
       -s <src_dev>
              (source netdevice)

       -d <dst_dev>
              (destination netdevice)

OPTIONS
       -t     (preserve src_dev rx timestamp)

       -e     (echo sent frames - recommended on vcanx)

       -i     (allow to route to incoming interface)

       -u <uid>
              (user defined modification identifier)

       -l <hops>
              (limit the number of frame hops / routings)

       -f <filter>
              (set CAN filter)

       -m <mod>
              (set frame modifications)

       -x <from_idx>:<to_idx>:<result_idx>:<init_xor_val>
              (XOR checksum)

       -c <from>:<to>:<result>:<init_val>:<xor_val>:<crctab[256]>
              (CRC8 cs)

       -p <profile>:[<profile_data>]
              (CRC8 checksum profile & parameters)

       Values are given and expected in hexadecimal values. Leading 0s can be omitted.

   <filter> is a <value><mask> CAN identifier filter:
       <can_id>:<can_mask>
              (matches when <received_can_id> & mask == can_id & mask)

       <can_id>~<can_mask>
              (matches when <received_can_id> & mask != can_id & mask)

       <mod> is a CAN frame modification instruction consisting of <instruction>:<can_frame-elements>:<can_id>.<can_dlc>.<can_data>

       <instruction>
              is one of 'AND' 'OR' 'XOR' 'SET'

       <can_frame-elements>
              is _one_ or _more_ of 'I'dentifier 'L'ength 'D'ata

       <can_id>
              is an u32 value containing the CAN Identifier

       <can_dlc>
              is an u8 value containing the data length code (0 .. 8)

       <can_data>
              is always eight(!) u8 values containing the CAN frames data

       The max. four modifications are performed in the order AND -> OR -> XOR -> SET

   Supported CRC 8 profiles:
       Profile '1' (1U8)
              - add one additional u8 value

       Profile '2' (16U8)
              - add u8 value from table[16] indexed by (data[1] & 0xF)

       Profile '3' (SFFID_XOR)
              - add u8 value (can_id & 0xFF) ^ (can_id >> 8 & 0xFF)

EXAMPLES
       cangw -A -s can0 -d vcan3 -e -f 123:C00007FF -m SET:IL:333.4.1122334455667788

cangw 2018.02.0-1~ubuntu16.04.1~ppa1                               October 2018                                                           CANGW(1)
