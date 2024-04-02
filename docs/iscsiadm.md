ISCSIADM(8)                                                                              Linux Administrator's Manual                                                                             ISCSIADM(8)



NAME
       iscsiadm - open-iscsi administration utility

SYNOPSIS
       iscsiadm -m discoverydb [-hV] [-d debug_level] [-P printlevel] [.BI -I  iface  -t  type  -p  ip:port [-lD] ] | [ [-p ip:port -t type] [-o operation] [-n name] [-v value] [-lD] ]

       iscsiadm -m discovery [-hV] [-d debug_level] [-P printlevel] [.BI -I  iface  -t  type  -p  ip:port [-l] ] | [ [-p ip:port] [-l|-D] ]

       iscsiadm -m node [-hV] [-d debug_level] [-P printlevel] [-L all,manual,automatic] [-U all,manual,automatic] [-S] [ [-T targetname -p ip:port -I iface ] [-l|-u|-R|-s] ] [ [-o operation] [-n name] [-v
       value] [-p ip:port] ]

       iscsiadm -m session [-hV] [-d debug_level] [-P printlevel] [ -r sessionid|sysfsdir [-R] [-u|-s|-o new] ]

       iscsiadm -m iface [-hV] [-d debug_level] [-P printlevel] [ -I ifacename | -H hostno|MAC ] [ [-o operation] [-n name] [-v value] ] [ -C ping [-a ip] [-b packetsize] [-c count] [-i interval] ]

       iscsiadm -m fw [-d debug_level] [-l]

       iscsiadm -m host [-P printlevel] [-H hostno|MAC] [ [ -C chap [-x chap_tbl_idx] ] | [ -C flashnode [-A portal_type] [-x flashnode_idx] ] | [ -C stats ] ] [ [-o operation] [-n name] [-v value] ]

       iscsiadm -k priority


DESCRIPTION
       The iscsiadm utility is a command-line tool allowing discovery and login to iSCSI targets, as well as access and management of the open-iscsi database.

       Open-iscsi does not use the term node as defined by the iSCSI RFC, where a node is a single iSCSI initiator or target. Open-iscsi uses the term node to refer to a portal on a target.

       For session mode, a session id (sid) is used. The sid of a session can be found by running iscsiadm -m session -P 1. The session id and sysfs path are  not  currently  persistent  and  is  partially
       determined by when the session is setup.


       Note that many of the node and discovery operations require that the iSCSI daemon (iscsid) be running.


OPTIONS
       -a, --ip=ipaddr
              ipaddr can be IPv4 or IPv6.

              This option is only valid for ping submode.


       -A, --portal_type=[ipv4|ipv6]
              Specify the portal type for the new flash node entry to be created.

              This option is only valid for flashnode submode of host mode and only with new operation.


       -b, --packetsize=packetsize
              Specify the ping packetsize.

              This option is only valid for ping submode.


       -c, --count=count
              count specify number of ping iterations.

              This option is only valid for ping submode.


       -C, --submode=op
              Specify the submode for mode. op must be name of submode.

              Currently iscsiadm support ping as submode for iface. For example,

              iscsiadm -m iface -I ifacename -C ping -a ipaddr -b packetsize -c count -i interval

              For host, it supports chap , flashnode and stats as submodes. For example,

              iscsiadm -m host -H hostno -C chap -x chap_tbl_idx -o operation

              iscsiadm -m host -H hostno -C flashnode -x flashnode_idx -o operation

              iscsiadm -m host -H hostno -C stats


       -d, --debug=debug_level
              print debugging information. Valid values for debug_level are 0 to 8.


       -h, --help
              display help text and exit


       -H, --host=[hostno|MAC]
              The host argument specifies the SCSI host to use for the operation. It can be the scsi host number assigned to the host by the kernel's scsi layer, or the MAC address of a scsi host.


       -i, --interval=interval
              interval specify delay between two ping iterations.

              This option is only valid for ping submode.


       -I, --interface=[iface]
              The  interface  argument specifies the iSCSI interface to use for the operation.  iSCSI interfaces (iface) are defined in /etc/iscsi/ifaces. For hardware iSCSI (qla4xxx) the iface config must
              have the hardware address (iface.hwaddress = port's MAC address) and the driver/transport_name (iface.transport_name). The iface's name is then the filename of the iface config. For  software
              iSCSI, the iface config must have either the hardware address (iface.hwaddress), or the network layer's interface name (iface.net_ifacename), and it must have the driver/transport_name

              The  available  drivers/iscsi_transports  are  tcp (software iSCSI over TCP/IP), iser (software iSCSI over InfiniBand), or qla4xxx (Qlogic 4XXXX HBAs). The hwaddress is the MAC address or for
              software iSCSI it may be the special value "default" which directs the initiator to not bind the session to a specific hardware resource and instead allow the network or InfiniBand  layer  to
              decide what to do. There is no need to create an iface config with the default behavior. If you do not specify an iface, then the default behavior is used.

              As  mentioned  above  there is a special iface name default. There are three others -- cxgb3i, bnx2i and iser, which does not bind the session to a specific card, but will bind the session to
              the cxgb3i, bnx2i or iser transport. These are experimental and the use is not supported as a stable interface yet.

              In discovery mode multiple interfaces can be specified by passing in multiple -I/--interface instances. For example,

              "iscsiadm -m discoverydb -t st -p ip:port -I iface0 -I iface2 --discover"

              Will direct iscsiadm to setup the node db to create records which will create sessions through the two intefaces passed in.

              In node mode, only a single interface is supported in each call to iscsiadm.

              This option is valid for discovery, node and iface mode.


       -k, --killiscsid=[priority]
              Currently priority must be zero. This will immediately stop all iscsid operations and shutdown iscsid. It does not logout any sessions. Running this command is the same as doing "killall isc-
              sid".  Neither should normally be used, because if iscsid is doing error recovery or if there is an error while iscsid is not running, the system may not be able to recover.  This command and
              iscsid's SIGTERM handling are experimental.


       -D, --discover
              Discover targets using the discovery record with the  recid matching the the discovery type and portal passed in. If there is no matching record, it will be created using the iscsid.conf dis-
              covery settings.  This must be passed in discoverydb mode to instruct iscsiadm to perform discovery.

              This option is only valid for SendTargets discovery mode.


       -l, --login
              For node and fw mode, login to a specified record. For discovery mode, login to all discovered targets.

              This option is only valid for discovery and node modes.


       -L, --loginall=[all|manual|automatic]
              For node mode, login all sessions with the node or conn startup values passed in or all running session, except ones marked onboot, if all is passed in.

              This option is only valid for node mode (it is valid but not functional for session mode).



       -m, --mode op
              specify the mode. op must be one of discovery, discoverydb, node, fw, host iface or session.

              If  no other options are specified: for discovery, discoverydb and node, all of their respective records are displayed; for session, all active sessions and connections are displayed; for fw,
              all boot firmware values are displayed; for host, all iSCSI hosts are displayed; and for iface, all ifaces setup in /etc/iscsi/ifaces are displayed.


       -n, --name=name
              In node mode, specify a field name in a record. In flashnode submode of host mode, specify name of the flash node parameter.

              For use with the update operator.

       -o, --op=op
              Specifies a database operator op. op must be one of new, delete, update, show or nonpersistent.

              For iface mode, apply and applyall  are also applicable.

              For flashnode submode of host mode, login and logout are also applicable.

              This option is valid for all modes except fw. Delete should not be used on a running session. If it is iscsiadm will stop the session and then delete the record.

              new creates a new database record for a given object. In node mode, the recid is the target name and portal (IP:port). In iface mode, the recid is the iface name. In discovery mode, the recid
              is the portal and discovery type.

              In session mode, the new operation logs in a new session using the same node database and iface information as the specified session.

              In  discovery  mode, if the recid and new operation is passed in, but the --discover argument is not, then iscsiadm will only create a discovery record (it will not perform discovery). If the
              --discover argument is passed in with the portal and discovery type, then iscsiadm will create the discovery record if needed, and it will create records for portals returned  by  the  target
              that do not yet have a node DB record.

              delete deletes a specified recid. In discovery mode, if iscsiadm is performing discovery it will delete records for portals that are no longer returned.

              update will update the recid with name to the specified value. In discovery mode, if iscsiadm is performing discovery the recid, name  and value arguments are not needed. The update operation
              will operate on the portals returned by the target, and will update the node records with info from the config file and command line.

              show is the default behaviour for node, discovery and iface mode. It is also used when there are no commands passed into session mode and a running sid is passed in.  name and value are  cur-
              rently ignored when used with show.

              nonpersistent instructs iscsiadm to not manipulate the node DB.


              apply will cause the network settings to take effect on the specified iface.


              applyall will cause the network settings to take effect on all the ifaces whose MAC address or host number matches that of the specific host.


              login will log into the specified flash node entry.


              logout does the logout from the given flash node entry.


       -p, --portal=ip[:port]
              Use target portal with ip-address ip and port. If port is not passed in the default port value is 3260.

              IPv6 addresses can be specified as [ddd.ddd.ddd.ddd]:port or ddd.ddd.ddd.ddd.

              Hostnames can also be used for the ip argument.


              This option is only valid for discovery, or for node operations with the new operator.

              This  should be used along with --target in node mode, to specify what the open-iscsi docs refer to as a node or node record. Note: open-iscsi's use of the word node, does not match the iSCSI
              RFC's iSCSI Node term.


       -P,  --print=printlevel
              If in node mode print nodes in tree format. If in session mode print sessions in tree format. If in discovery mode print the nodes in tree format.


       -T, --targetname=targetname
              Use target targetname.

              This should be used along with --portal in node mode, to specify what the open-iscsi docs refer to as a node or node record. Note: open-iscsi's use of the word node, does not match the  iSCSI
              RFC's iSCSI Node term.


       -r,  --sid=sid | sysfsdir
              Use session ID sid. The sid of a session can be found from running iscsiadm in session mode with the --info argument.

              Instead  of  sid,  a  sysfs  path  containing  the  session  can  be used. For example using one of the following: /sys/devices/platform/hostH/sessionS/targetH:B:I/H:B:I:L, /sys/devices/plat-
              form/hostH/sessionS/targetH:B:I, or /sys/devices/platform/hostH/sessionS, for the sysfsdir argument would result in the session with sid S to be used.

              sid | sysfsdir is only required for session mode.


       -R,  --rescan
              In session mode, if sid is also passed in rescan the session. If no sid has been passed in  rescan all running sessions.

              In node mode, rescan a session running through the target, portal, iface tuple passed in.


       -s, --stats
              Display session statistics.  This option when used with host mode, displays host statistics.


       -S, --show
              When displaying records, do not hide masked values, such as the CHAP secret (password).

              This option is only valid for node and session mode.


       -t, --type=type
              type must be sendtargets (or abbreviated as st), slp, isns or fw. Currently only sendtargets, fw, and iSNS is supported, see the DISCOVERY TYPES section.

              This option is only valid for discovery mode.


       -u, --logout
              logout for a specified record.

              This option is only valid for node and session mode.


       -U, --logoutall=[all,manual,automatic]
              logout all sessions with the node or conn startup values passed in or all running session, except ones marked onboot, if all is passed in.

              This option is only valid for node mode (it is valid but not functional for session mode).


       -v, --value=value
              Specify a value for use with the update operator.

              This option is only valid for node mode and flashnode submode of host mode.


       -V, --version
              display version and exit


       -x, --index=index
              Specify the index of the entity to operate on.

              This option is only valid for chap and flashnode submodes of host mode.


DISCOVERY TYPES
       iSCSI defines 3 discovery types: SendTargets, SLP, and iSNS.


       SendTargets
              A native iSCSI protocol which allows each iSCSI target to send a list of available targets to the initiator.


       SLP    Optionally an iSCSI target can use the Service Location Protocol (SLP) to announce the available targets. The initiator can either implement SLP queries directly or can use a separate tool to
              acquire the information about available targets.


       iSNS   iSNS (Internet Storage Name Service) records information about storage volumes within a larger network. To utilize iSNS, pass the address and optionally the port of the iSNS server to do dis-
              covery to.


       fw     Several NICs and systems contain a mini iSCSI initiator which can be used for boot. To get the values used for boot the fw option can be used.  Doing fw discovery, does not  store  persistent
              records in the node or discovery DB, because the values are stored in the system's or NIC's resource.

              Performing fw discovery will print the portals, like with other discovery methods. To see other settings like CHAP values and initiator settings, like you would in node mode, run "iscsiadm -m
              fw".

              fw support in open-iscsi is experimental. The settings and iscsiadm syntax and output format may change.


       iscsiadm supports the iSNS (isns) or SendTargets (st) discovery type. An SLP implementation is under development.


EXIT STATUS
       On success 0 is returned. On error one of the return codes below will be returned.

       Commands that operate on multiple objects (sessions, records, etc), iscsiadm/iscsistart will return the first error that is encountered.  iscsiadm/iscsistart will attempt to execute the operation on
       the objects it can. If no objects are found ISCSI_ERR_NO_OBJS_FOUND is returned.



       0      ISCSI_SUCCESS - command executed successfully.


       1      ISCSI_ERR - generic error code.


       2      ISCSI_ERR_SESS_NOT_FOUND - session could not be found.


       3      ISCSI_ERR_NOMEM - could not allocate resource for operation.

       4      ISCSI_ERR_TRANS - connect problem caused operation to fail.


       5      ISCSI_ERR_LOGIN - generic iSCSI login failure.


       6      ISCSI_ERR_IDBM - error accessing/managing iSCSI DB.


       7      ISCSI_ERR_INVAL - invalid argument.


       8      ISCSI_ERR_TRANS_TIMEOUT - connection timer exired while trying to connect.


       9      ISCSI_ERR_INTERNAL - generic internal iscsid/kernel failure.


       10     ISCSI_ERR_LOGOUT - iSCSI logout failed.


       11     ISCSI_ERR_PDU_TIMEOUT - iSCSI PDU timedout.


       12     ISCSI_ERR_TRANS_NOT_FOUND - iSCSI transport module not loaded in kernel or iscsid.


       13     ISCSI_ERR_ACCESS - did not have proper OS permissions to access iscsid or execute iscsiadm command.


       14     ISCSI_ERR_TRANS_CAPS - transport module did not support operation.


       15     ISCSI_ERR_SESS_EXISTS - session is logged in.


       16     ISCSI_ERR_INVALID_MGMT_REQ - invalid IPC MGMT request.


       17     ISCSI_ERR_ISNS_UNAVAILABLE - iSNS service is not supported.


       18     ISCSI_ERR_ISCSID_COMM_ERR - a read/write to iscsid failed.


       19     ISCSI_ERR_FATAL_LOGIN - fatal iSCSI login error.


       20     ISCSI_ERR_ISCSID_NOTCONN - could not connect to iscsid.


       21     ISCSI_ERR_NO_OBJS_FOUND - no records/targets/sessions/portals found to execute operation on.


       22     ISCSI_ERR_SYSFS_LOOKUP - could not lookup object in sysfs.


       23     ISCSI_ERR_HOST_NOT_FOUND - could not lookup host.


       24     ISCSI_ERR_LOGIN_AUTH_FAILED - login failed due to authorization failure.


       25     ISCSI_ERR_ISNS_QUERY - iSNS query failure.


       26     ISCSI_ERR_ISNS_REG_FAILED - iSNS registration/deregistration failed.



EXAMPLES
       Discover targets at a given IP address:

            iscsiadm --mode discoverydb --type sendtargets --portal 192.168.1.10 --discover

       Login, must use a node record id found by the discovery:

            iscsiadm --mode node --targetname iqn.2001-05.com.doe:test --portal 192.168.1.1:3260 --login

       Logout:

            iscsiadm --mode node --targetname iqn.2001-05.com.doe:test --portal 192.168.1.1:3260 --logout

       List node records:

            iscsiadm --mode node


       Display all data for a given node record:

            iscsiadm --mode node --targetname iqn.2001-05.com.doe:test --portal 192.168.1.1:3260


FILES
       /etc/iscsi/iscsid.conf
              The configuration file read by iscsid and iscsiadm on startup.

       /etc/iscsi/initiatorname.iscsi
              The file containing the iSCSI InitiatorName and InitiatorAlias read by iscsid and iscsiadm on startup.

       /etc/iscsi/nodes/
              This directory contains the nodes with their targets.

       /etc/iscsi/send_targets
              This directory contains the portals.


SEE ALSO
       iscsid(8)


AUTHORS
       Open-iSCSI project <http://www.open-iscsi.com/>
       Alex Aizman <itn780@yahoo.com>
       Dmitry Yusupov <dmitry_yus@yahoo.com>



                                                                                                   Sep 2006                                                                                       ISCSIADM(8)
