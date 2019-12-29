SPD-CONF(1)                                  User Commands                                 SPD-CONF(1)

NAME
       spd-conf - manual page for spd-conf 0.9.1

DESCRIPTION
       usage: spd-conf [-h] [-u] [-c] [-C] [-d] [-s] [--test-festival]

              [--test-espeak] [--test-alsa] [--test-pulse] [-e] [-n] [-D] [--version]

       A simple tool for basic configuration of Speech Dispatcher and problem diagnostics

   optional arguments:
       -h, --help
              show this help message and exit

       -u, --create-user-conf
              Create Speech Dispatcher configuration for the given user

       -c, --config-basic-settings-user
              Configure basic settings in user configuration

       -C, --config-basic-settings-system
              Configure basic settings in system-wide configuration

       -d, --diagnostics
              Diagnose problems with the current setup

       -s, --test-spd-say
              Test connection to Speech Dispatcher using spd-say

       --test-festival
              Test whether Festival works as a server

       --test-espeak
              Test whether Espeak works as a standalone binary

       --test-alsa
              Test ALSA audio output

       --test-pulse
              Test Pulse Audio output

       -e, --espeak
              Use espeak to synthesize messages

       -n, --dont-ask
              Do not ask any questions, always use default values

       -D, --debug
              Debug a problem and generate a report

       --version
              Print version and copyright info

COPYRIGHT
       Copyright © 2002-2012 Brailcom, o.p.s.
       This is free software; you can redistribute it and/or modify it under the terms of the GNU Gen‐
       eral Public License as published by the Free Software Foundation; either version 2, or (at your
       option) any later version. Please see COPYING for more details.

spd-conf 0.9.1                                August 2019                                  SPD-CONF(1)
