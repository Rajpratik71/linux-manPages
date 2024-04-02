OPENSC-NOTIFY(1)                             OpenSC Tools                            OPENSC-NOTIFY(1)

NAME
       opensc-notify - monitor smart card events and send notifications

SYNOPSIS
       opensc-notify [OPTIONS]

DESCRIPTION
       The opensc-notify utility is used to monitor smart card events and send the appropriate
       notification.

OPTIONS
       --help, -h
           Print help and exit.

       --version, -V
           Print version and exit.

   Mode: customized
       Send customized notifications.

       --title [STRING], -t [STRING]
           Specify the title of the notification.

       --message [STRING], -m [STRING]
           Specify the main text of the notification.

   Mode: standard
       Manually send standard notifications.

       --notify-card-inserted, -I
           See notify_card_inserted in opensc.conf (default=off).

       --notify-card-removed, -R
           See notify_card_removed in opensc.conf (default=off).

       --notify-pin-good, -G
           See notify_pin_good in opensc.conf (default=off).

       --notify-pin-bad, -B
           See notify_pin_bad in opensc.conf (default=off).

AUTHORS
       opensc-notify was written by Frank Morgner <frankmorgner@gmail.com>.

opensc                                        06/10/2019                             OPENSC-NOTIFY(1)
