ISCSID(8)                                                                                Linux Administrator's Manual                                                                               ISCSID(8)



NAME
       iscsid - Open-iSCSI daemon

SYNOPSIS
       iscsid [OPTION]

DESCRIPTION
       The  iscsid  implements  the control path of iSCSI protocol, plus some management facilities. For example, the daemon could be configured to automatically re-start discovery at startup, based on the
       contents of persistent iSCSI database.

OPTIONS
       [-c|--config=]config-file
              Read configuration from config-file rather than the default /etc/iscsi/iscsid.conf file.

       [-i|--initiatorname=]iname-file
              Read initiator name from iname-file rather than the default /etc/iscsi/initiatorname.iscsi file.

       [-f|--foreground]
              run iscsid in the foreground.

       [-d|--debug=]debug_level
              print debugging information. Valid values for debug_level are 0 to 8.

       [-u|--uid=]uid
              run under user ID uid (default is the current user ID)

       [-g|--gid=]gid
              run under user group ID gid (default is the current user group ID).

       [-n|--no-pid-file]
              do not write a process ID file.

       [-p|--pid=]pid-file
              write process ID to pid-file rather than the default /var/run/iscsid.pid

       [-h|--help]
              display this help and exit

       [-v|--version]
              display version and exit.


FILES
       /etc/iscsi/iscsid.conf
              The configuration file read by iscsid and iscsiadm on startup.

       /etc/iscsi/initiatorname.iscsi
              The file containing the iSCSI initiatorname and initiatoralias read by iscsid and iscsiadm on startup.

       /etc/iscsi/nodes
              Open-iSCSI persistent configuration database


SEE ALSO
       iscsiadm(8)


AUTHORS
       Open-iSCSI project <http://www.open-iscsi.com/>
       Alex Aizman <itn780@yahoo.com>
       Dmitry Yusupov <dmitry_yus@yahoo.com>



                                                                                                  July 2005                                                                                         ISCSID(8)
