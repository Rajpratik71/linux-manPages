SPD-CONF(1)                                                                             General Commands Manual                                                                            SPD-CONF(1)

NAME
       spd-conf - A simple tool for basic configuration of Speech Dispatcher and problem diagnostics

SYNOPSIS
       spd-conf [options]

DESCRIPTION
       spd-conf is a simple tool for basic configuration of Speech Dispatcher and problem diagnostics

OPTIONS
       -h, --help
              show this help message and exit

       -e, --espeak
              Use espeak to synthesize messages

       --test-festival
              Test whether Festival works as a server

       -s, --test-spd-say
              Test connection to Speech Dispatcher using spd-say

       --test-pulse
              Test Pulse Audio

       -c, --config-basic-settings-user
              Configure basic settings in user configuration

       -u, --create-user-conf
              Create Speech Dispatcher configuration for the given user

       -C, --config-basic-settings-system
              Configure basic settings in system-wide configuration

       -n, --dont-ask
              Do not ask any questions, always use default values

       --test-alsa
              Test ALSA audio

       --test-espeak
              Test whether Espeak works as a standalone binary

       -d, --diagnostics
              Diagnose problems with the current setup

       -D, --debug
              Debug a problem and generate a report

AUTHOR
       spd-conf was written by Hynek Hanke <hanke@brailcom.org>. The webpage for this package can be found at http://www.freebsoft.org/speechd.

       This manual page was written by Luke Yelavich <themuso@ubuntu.com>, for the Ubuntu project (but may be used by others).

                                                                                            August 24, 2009                                                                                SPD-CONF(1)
