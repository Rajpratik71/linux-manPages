net-snmp-create-v3-user(1)                                                                         Net-SNMP                                                                        net-snmp-create-v3-user(1)



NAME
       net-snmp-create-v3-user - create a SNMPv3 user in net-snmp configuration file

SYNOPSIS
       net-snmp-create-v3-user [-ro] [-A authpass] [-a MD5|SHA] [-X privpass] [-x DES|AES] [username]

DESCRIPTION
       The net-snmp-create-v3-user shell script is designed to create a new user in net-snmp configuration file (/var/net-snmp/snmpd.conf by default).


OPTIONS
       --version
              displays the net-snmp version number

       -ro    creates a user with read-only permissions

       -A authpass
              specifies the authentication password

       -a MD5|SHA
              specifies the authentication password hashing algorithm

       -X privpass
              specifies the encryption password

       -x DES|AES
              specifies the encryption algorithm



V5.7.2                                                                                           17 Sep 2008                                                                       net-snmp-create-v3-user(1)
