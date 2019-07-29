WPA_ACTION(8)                                                                                                                        WPA_ACTION(8)

NAME
       wpa_action - wpa_cli action script

SYNOPSIS
       wpa_action IFACE ACTION

DESCRIPTION
       wpa_action  is  a shell script designed to control the ifupdown framework according to ACTION events received from wpa_supplicant.  wpa_cli
       receives CONNECTED and DISCONNECTED events from wpa_supplicant via the crtl_iface socket and gives  the  ACTION  event  to  the  wpa_action
       script as an argument, along with the IFACE to be acted upon.

       wpa_action also receives an environment variable from wpa_cli, WPA_ID_STR, containing an alphanumeric identification string for the CURRENT
       network block. WPA_ID_STR is provided by the 'id_str' network block option of wpa_supplicant.conf, and provides a means to map  the  ACTION
       to a LOGICAL interface configured in the interfaces file.

       If  either  the  ifupdown  interfaces or ifstate file cannot be found, wpa_action will exit silently (status 0). wpa_action will search the
       following locations for their existence:
            /etc/network/run/ifstate
            /run/network/ifstate
            /etc/network/interfaces

IFACE
       Network interface to be acted upon, for example 'eth1' or 'wlan0'.

ACTION
       An ACTION to be performed on the IFACE.

       CONNECTED
              wpa_supplicant has completed authentication.  ifup IFACE=WPA_ID_STR is invoked and the action is logged to syslog. Network  settings
              for the LOGICAL interface WPA_ID_STR are applied.

       DISCONNECTED
              wpa_supplicant  has detected disconnection.  ifdown IFACE=WPA_ID_STR is invoked and the action is logged to syslog. Network settings
              for the LOGICAL interface WPA_ID_STR are undone.

       stop   The 'stop' ACTION is a called manually by the user, to stop the wpa_cli daemon, invoke ifdown IFACE (if the IFACE is present in  the
              ifstate file) and stop the wpa_supplicant daemon.

       reload The  'reload'  ACTION can be used to reload the wpa_supplicant configuration file specified by wpa-roam . 'restart' is a synonym for
              'reload' and can be used equally. The action is logged to /var/log/wpa_action.log.

ENVIRONMENT
       An alphanumeric identification string provided by the 'id_str' network block option of wpa_supplicant.conf is exported to wpa_action as  an
       environment  variable,  WPA_ID_STR.  When 'id_str' is not configured for the CURRENT network block, 'default' is substituted for the absent
       WPA_ID_STR environment variable.

       A unique network identifier, WPA_ID, is exported to wpa_action. It is the number assigned to the CURRENT wpa_supplicant network block (net‐
       work_id).

USAGE
       The  only  reasons for wpa_action to be explicitly executed by the user is to stop wpa_cli from controlling ifupdown or reload the wpa_sup‐
       plicant.conf file after editing.

              wpa_action eth1 stop

       Otherwise, wpa_action is given as an argument to a wpa_cli daemon.

              wpa_cli -i eth1 -a /sbin/wpa_action -B

       This can be done by using the wpa-roam option in the interfaces file. wpa-roam takes one  argument,  a  user  provided  wpa_supplicant.conf
       file.

       The  inet  METHOD must be 'manual' for this interface, as it will be configured according to wpa_cli action events. Also supply a 'default'
       interfaces stanza using the dhcp inet METHOD so that networks without an 'id_str' option can fallback to attempting to receive  an  ip  via
       dhcp.  If  one  or  more networks requires additional network configuration, provide an unique 'id_str' for each network, and an interfaces
       stanza using the 'id_str' value as a LOGICAL interface. The following interfaces file is configured to use dhcp for any network without  an
       'id_str', a static ip for the network with an 'id_str' of 'home_static' and dhcp plus an additional post-up command for the network with an
       'id_str' of 'uni'.

       An example wpa_supplicant.conf configured to roam between 3 different networks:

              network={
                   ssid="foo"
                   id_str="uni"
                   key_mgmt=NONE
              }

              network={
                   ssid="bar"
                   id_str="home_static"
                   psk=123456789...
              }

              network={
                   ssid=""
                   key_mgmt=NONE
              }

       The corresponding interfaces file would contain LOGICAL interfaces, that correlate to each unique 'id_str' provided  by  the  configuration
       file:

              iface eth1 inet manual
                   wpa-driver wext
                   wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf

              iface default inet dhcp

              iface uni inet dhcp

              iface home_static inet static
                      address 192.168.0.20
                      netmask 255.255.255.0
                      network 192.168.0.0
                      broadcast 192.168.0.255
                      gateway 192.168.0.1

SEE ALSO
       wpa_cli(8), wpa_supplicant(8), wpa_supplicant.conf(5), ifup(8), interfaces(5)

AUTHOR
       This manual page was written by Kel Modderman <kel@otaku42.de> for the Debian GNU system (but may be used by others).

                                                                    26 May 2006                                                      WPA_ACTION(8)
