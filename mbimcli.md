MBIMCLI(1)                                                                                      User Commands                                                                                      MBIMCLI(1)



NAME
       mbimcli - Control MBIM devices

DESCRIPTION
   Usage:
              lt-mbimcli [OPTION?] - Control MBIM devices

   Help Options:
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-basic-connect
              Show Basic Connect Service options

       --help-phonebook
              Show Phonebook Service options

       --help-dss
              Show Device Service Stream options

       --help-ms-firmware-id
              Show Microsoft Firmware ID Service options

       --help-ms-host-shutdown
              Show Microsoft Host Shutdown Service options

       Basic Connect options

       --query-device-caps
              Query device capabilities

       --query-subscriber-ready-status
              Query subscriber ready status

       --query-radio-state
              Query radio state

       --set-radio-state=[(on|off)]
              Set radio state

       --query-device-services
              Query device services

       --query-pin-state
              Query PIN state

       --enter-pin=[(current PIN)]
              Enter PIN

       --change-pin=[(current PIN),(new PIN)]
              Change PIN

       --enable-pin=[(current PIN)]
              Enable PIN

       --disable-pin=[(current PIN)]
              Disable PIN

       --enter-puk=[(PUK),(new PIN)]
              Enter PUK

       --query-home-provider
              Query home provider

       --query-preferred-providers
              Query preferred providers

       --query-visible-providers
              Query visible providers

       --query-registration-state
              Query registration state

       --register-automatic
              Launch automatic registration

       --query-signal-state
              Query signal state

       --query-packet-service-state
              Query packet service state

       --attach-packet-service
              Attach to the packet service

       --detach-packet-service
              Detach from the packet service

       --query-connection-state=[SessionID]
              Query connection state (SessionID is optional, defaults to 0)

       --connect=["key=value,..."]
              Connect (allowed keys: session-id, apn, auth (PAP|CHAP|MSCHAPV2), username, password)

       --query-ip-configuration=[SessionID]
              Query IP configuration (SessionID is optional, defaults to 0)

       --disconnect=[SessionID]
              Disconnect (SessionID is optional, defaults to 0)

       --query-packet-statistics
              Query packet statistics

       Phonebook options

       --phonebook-query-configuration
              Query the phonebook configuration

       --phonebook-read=[(Phonebook index)]
              Read phonebook entry with given index

       --phonebook-read-all
              Read all phonebook entries

       --phonebook-write=[(Name),(Number)[,(Index)]]
              Add new phonebook entry or update an existing one

       --phonebook-delete=[(Phonebook index)]
              Delete phonebook entry with given index

       --phonebook-delete-all
              Delete all phonebook entries

       Device Service Stream options

       --dss-connect=[(UUID),(Session ID)]
              Connect DSS session

       --dss-disconnect=[(UUID),(Session ID)]
              Disconnect DSS session

       Microsoft Firmware ID options

       --ms-query-firmware-id
              Query firmware ID

       Microsoft Host Shutdown options

       --ms-notify-host-shutdown
              Notify that host is shutting down

   Application Options:
       -d, --device=[PATH]
              Specify device path

       -p, --device-open-proxy
              Request to use the 'mbim-proxy' proxy

       --no-open=[Transaction ID]
              Do not explicitly open the MBIM device before running the command

       --no-close
              Do not close the MBIM device after running the command

       --noop Don't run any command

       -v, --verbose
              Run action with verbose logs, including the debug ones

       --silent
              Run action with no logs; not even the error/warning ones

       -V, --version
              Print version

       mbimcli  1.14.2  Copyright  (2013-2014)  Aleksander Morgado License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html> This is free software: you are free to change and redis‐
       tribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for mbimcli is maintained as a Texinfo manual.  If the info and mbimcli programs are properly installed at your site, the command

              info mbimcli

       should give you access to the complete manual.



mbimcli                                                                                          August 2017                                                                                       MBIMCLI(1)
