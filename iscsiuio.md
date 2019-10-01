iscsiuio(8)                                                                                System Manager's Manual                                                                                iscsiuio(8)



NAME
       iscsiuio - iSCSI UserSpace I/O driver

SYNOPSIS
       iscsiuio [-d-f-v]

DESCRIPTION
       iscsiuio  is  the  UserSpace  I/O  driver  for  the  QLogic  NetXtreme  II  BCM5706/5708/5709  series  PCI/PCI-X  Gigabit  Ethernet  Network  Interface  Card  (NIC)  and  for the QLogic NetXtreme II
       BCM57710/57711/57712/57800/57810/57840 series PCI-E 10 Gigabit Ethernet Network Interface Card.  The driver has been tested on 2.6.28 kernels and above.

       Refer to the README.TXT from the driver package on how to compile and install the driver.

       Refer to various Linux documentations on how to configure network protocol and address.

DRIVER DEPENDENCIES
PARAMETERS
       There are very few parameters when running this application.

       -d|--debug<debuglevel>
              This is to enable debug mode where debug messages will be sent to stdout The following debug modes are supported

              DEBUG         4 - Print all messages

              INFO          3 - Print messages needed to follow the uIP code (default)

              WARN          2 - Print warning messages

              ERROR         1 - Only print critical errors

       -f|--foreground
              This is to enable foreground mode so that this application doesn't get sent into the background.

       -v|--version
              This is to print the version.

       -p|--pid<pidfile>
              Use pidfile (default  /var/run/iscsiuio.pid )

       -h|--help
              Display this help and exit.



AUTHOR
       Benjamin Li - benli@broadcom.com

       Eddie Wai - eddie.wai@broadcom.com

Maintained by
       QLogic-Storage-Upstream@qlogic.com



QLogic Corporation                                                                                12/10/2013                                                                                      iscsiuio(8)
