USSP-PUSH(1)                                                       User commands                                                      USSP-PUSH(1)

NAME
       ussp-push - send file via bluetooth with the object push protocol

SYNOPSIS
       ussp-push [--dev devid] [--timeo sec] [--debug] {DEVICE | BTADDR@[BTCHAN]} LFILE RFILE

DESCRIPTION
       ussp-push is a program that can be used to send files using OBEX (OBject EXchange) protocol over Bluetooth.

OPTIONS
       --dev
           specify the devid of the bluetooth host controller

       --timeo
           app specifies the RFCOMM connect timeout in seconds

       --debug
           enable debug messages.

       DEVICE
           an RFCOMM TTY device file

       BTADDR
           the remote bluetooth address to send the file to, the @ sign must follow the address

       BTCHAN
           the remote bluetooth channel to send the file to

       LFILE
           the local file name

       RFILE
           the remote file name

AUTHOR
       This manpage was written by Hendrik Sattler <post@hendrik-sattler.de> for the Debian project.

ussp-push 0.9                                                       2006-09-27                                                        USSP-PUSH(1)
