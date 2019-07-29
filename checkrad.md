CHECKRAD(5)                                                     File Formats Manual                                                    CHECKRAD(5)

NAME
       checkrad -- See if a user is (still) logged in on a certain port.

SYNOPSIS
       checkrad [-d] nas-type nas-ip nas-port login session-id

DESCRIPTION
       Checkrad  is  used  by  the  radius  server  to check if its idea of a user logged in on a certain port/NAS is correct if a double login is
       detected.

       Returns: 0 = no duplicate, 1 = duplicate, >1 = error.

OPTIONS
       -d     Enable printing of debugging informations.

       nas-type
              Type of port/NAS. Can be one of:

              ·      ascend

              ·      bay

              ·      cisco

              ·      cisco_l2tp

              ·      computone

              ·      cvx

              ·      digitro

              ·      dot1x

              ·      livingston

              ·      max40xx

              ·      mikrotik

              ·      mikrotik_snmp

              ·      multitech

              ·      netserver

              ·      other

              ·      pathras

              ·      patton

              ·      portslave

              ·      pr3000

              ·      pr4000

              ·      redback

              ·      tc

              ·      usrhiper

              ·      versanet

              The "other" type cause checkrad to skip any check and always returns 1.

       nas-ip IP address of the NAS to check.

       nas-port
              The NAS port to check (may be ignored by some nas-type).

       login  The login name to check.

       session-id
              Session to check. (actually ignored by all nas-type)

SEE ALSO
       radiusd(8)

AUTHOR
       Written by Miquel van Smoorenburg, miquels@cistron.nl.

       This manual page was written by Marco Nenciarini <mnencia@debian.org> for the Debian project (but may be used by others).

                                                                  13 January 2006                                                      CHECKRAD(5)
