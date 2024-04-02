CGDCBXD(8)                                                                                     libcgroup Manual                                                                                    CGDCBXD(8)



NAME
       cgdcbxd - control group dcb event net_prio daemon


SYNOPSIS
       cgdcbxd [options]


DESCRIPTION
       cgdcbxd is a daemon used to monitor DCB netlink events and manage the net_prio control group subsystem. The daemon keeps the hierarchy and priority mappings in sync with DCBX Application events.

       When  a DCB netlink event is received cgdcbxd parses the application TLV and identifies new, updated, and deleted application tuples. The DCBX application TLV uses the selector, protocol ID and pri‐
       ority fields to identify and set application priority. The selector field specifies the protocol ID type supported types are

       Ethertype = 1
       TCP or SCTP = 2
       UDP or DCCP = 3
       TCP, SCTP UDP, and DCCP = 4

       The protocol ID field specifies the port or ethertype depending on the selector field and the priority gives a priority value (0-7). Used to set the net_prio.ifpriomap.

       When a new application tuple is identified cgdcbxd creates a control group under the net_prio subsystem using the directory cgdcbx-<selector>-<protocolID>.

       The <selector> field uses the IEEE selector values listed above for both CEE DCBX and IEEE DCBX versions.

       This control group will be managed by cgdcbx and the ifpriomap will be kept in sync with the application TLV. If a DCB netlink event removes the application  selector-protocolID  tuple  then  cgdcbx
       removes the control group.

       This  may  be used with cgrulesengd to create configuration rules that map applications and users to DCBX selector-protocolID tuples. Note protocol ID and selector values use the well-known protocol
       type and port or ethertype defined by the IANA (Internet Assigned Numbers Authority) the application are not required to use the well-known ports this is only used to identify the application.


OPTIONS
       -h     Display help.

       -n     Don't fork the daemon, stay in the foreground.

       -v     Show version

FILES
       /etc/cgrules.conf
       the default libcgroup configuration file

SOURCES
       o      IEEE 802.1Qaz (http://www.ieee802.org/1/pages/dcbridges.html) o IANA (http://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xml)

NOTES
       Support for the net_prio subsystem was added in the 3.3 Linux kernel.

Signals
       SIGUSR1 dumps list of managed interfaces and control groups with priomaps.

SEE ALSO
       cgrulesengd(8), cgrules.conf(5) lldpad(8), lldptool(8),

AUTHOR
       John Fastabend <john.r.fastabend@intel.com>



Linux                                                                                             2012-01-16                                                                                       CGDCBXD(8)
