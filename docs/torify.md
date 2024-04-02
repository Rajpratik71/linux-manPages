TORIFY(1)                                                           Tor Manual                                                           TORIFY(1)

NAME
       torify - wrapper for torsocks and tor

SYNOPSIS
       torify application [application’s arguments]

DESCRIPTION
       torify is a simple wrapper that calls torsocks with a tor-specific configuration file.

       It is provided for backward compatibility; instead you should use torsocks.

WARNING
       When used with torsocks, torify should not leak DNS requests or UDP data.

       torify can leak ICMP data.

       torify will not ensure that different requests are processed on different circuits.

SEE ALSO
       tor(1), torsocks(1)

AUTHORS
       Peter Palfrader and Jacob Appelbaum wrote this manual.

Tor                                                                 07/13/2019                                                           TORIFY(1)
