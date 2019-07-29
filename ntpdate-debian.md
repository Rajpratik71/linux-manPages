ntpdate-debian(8)                                             System Manager's Manual                                            ntpdate-debian(8)

NAME
       ntpdate-debian - set the date and time via NTP

SYNOPSIS
       ntpdate-debian [-bBdoqsuv] [-a key] [-e authdelay] [-k keyfile] [-o version] [-p samples] [-t timeout]

DESCRIPTION
       ntpdate-debian is identical to ntpdate(8) except that it uses the configuration in /etc/default/ntpdate by default.  ntpdate sets the local
       date and time by polling Network Time Protocol (NTP) servers.

                                                                                                                                 ntpdate-debian(8)
