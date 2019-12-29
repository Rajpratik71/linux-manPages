WPA_PASSPHRASE(8)                                                                    WPA_PASSPHRASE(8)

NAME
       wpa_passphrase - Generate a WPA PSK from an ASCII passphrase for a SSID

SYNOPSIS
       wpa_passphrase [ ssid ] [ passphrase ]

OVERVIEW
       wpa_passphrase  pre-computes  PSK  entries  for  network  configuration blocks of a wpa_suppli‐
       cant.conf file. An ASCII passphrase and SSID are used to generate a 256-bit PSK.

OPTIONS
       ssid   The SSID whose passphrase should be derived.

       passphrase
              The passphrase to use. If not included on the command line, passphrase will be read from
              standard input.

SEE ALSO
       wpa_supplicant.conf(5) wpa_supplicant(8)

LEGAL
       wpa_supplicant  is  copyright  (c)  2003-2019,  Jouni  Malinen <j@w1.fi> and contributors.  All
       Rights Reserved.

       This program is licensed under the BSD license (the one with advertisement clause removed).

                                           17 September 2019                         WPA_PASSPHRASE(8)
