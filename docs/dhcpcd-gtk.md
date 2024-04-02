DHCPCD-GTK(8)                                                 System Manager's Manual                                                DHCPCD-GTK(8)

NAME
     dhcpcd-gtk — a GTK+ frontend for network configuration

DESCRIPTION
     dhcpcd-gtk is a GTK+ frontend for network configuration.  It uses dhcpcd(8) as the backend and communicates to it and optionally
     wpa_supplicant(8) via dhcpcd_dbus.

   wpa_supplicant
     dhcpcd-gtk relies on wpa_supplicant(8) being configured to write its sockets to /var/run/wpa_supplicant. dhcpcd-gtk relies on
     wpa_supplicant(8) being started by the operating system.  If dhcpcd-gtk is used to select and set pass phrases for wireless networks then
     update_config=1 needs to be set in wpa_supplicant.conf.

SEE ALSO
     dhcpcd(8), wpa_supplicant(8), wpa_supplicant.conf(5)

AUTHORS
     Roy Marples <roy@marples.name>

BUGS
     Please report them to http://roy.marples.name/projects/dhcpcd

BSD                                                                July 9, 2010                                                                BSD
