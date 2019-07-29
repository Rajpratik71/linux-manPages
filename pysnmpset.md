PYSNMPCMD(1)                                                          PySNMP                                                          PYSNMPCMD(1)

NAME
       pysnmpcmd - options and behaviour common to most of the PySNMP command-line tools

SYNOPSIS
       pysnmpcmd [OPTIONS] AGENT [PARAMETERS]

DESCRIPTION
       This  manual  page describes the common options for the PySNMP commands: pysnmpbulkwalk, pysnmpget, pysnmpset, pysnmptranslate, pysnmpwalk.
       The command line applications use the SNMP protocol to communicate with an SNMP capable network entity, an agent.  Individual  applications
       typically  (but  not necessarily) take additional parameters that are given after the agent specification.  These parameters are documented
       in the manual pages for each application.

OPTIONS
       -a authProtocol
              Set the authentication protocol (MD5 or SHA) used for authenticated SNMPv3 messages.

       -A authPassword
              Set the authentication pass phrase used for authenticated SNMPv3 messages.

       -c community
              Set the community string for SNMPv1/v2c transactions.

       -d     Dump (in hexadecimal) the raw SNMP packets sent and received.

       -D TOKEN[,...]
              Turn on debugging output for the given TOKEN(s).  Try all for extremely verbose output.

       -e engineID
              Set the authoritative (security) engineID used for SNMPv3 REQUEST messages.  It is typically not necessary to specify  this,  as  it
              will usually be discovered automatically.

       -E engineID
              Set  the  context  engineID  used  for  SNMPv3 REQUEST messages scopedPdu.  If not specified, this will default to the authoritative
              engineID.

       -h, --help
              Display a brief usage message and then exit.

       -H     Display a list of configuration file directives understood by the command and then exit.

       -I [hu]
              Specifies input parsing options. See INPUT OPTIONS below.

       -l secLevel
              Set the securityLevel used for SNMPv3 messages (noAuthNoPriv|authNoPriv|authPriv).  Appropriate pass phrase(s)  must  provided  when
              using any level higher than noAuthNoPriv.

       -m MIBLIST
              Specifies a colon separated list of MIB modules (not files) to load for this application.

              The special keyword ALL is used to load all MIB modules in the MIB directory search list.  Every file whose name does not begin with
              "." will be parsed as if it were a MIB file.

       -M DIRLIST
              Specifies a colon separated list of directories to search for MIBs.  Note that MIBs specified using the -m  option  will  be  loaded
              from one of the directories listed by the -M option (or equivalents).

       -n contextName
              Set the contextName used for SNMPv3 messages.  The default contextName is the empty string "".

       -O [abeEfnqQsStTuUvxX]
              Specifies output printing options. See OUTPUT OPTIONS below.

       -r retries
              Specifies the number of retries to be used in the requests. The default is 5.

       -t timeout
              Specifies the timeout in seconds between retries. The default is 1.

       -u secName
              Set the securityName used for authenticated SNMPv3 messages.

       -v 1 | 2c | 3
              Specifies  the  protocol  version  to use: 1 (RFCs 1155-1157), 2c (RFCs 1901-1908), or 3 (RFCs 2571-2574).  The default is typically
              version 3.

       -V, --version
              Display version information for the application and then exit.

       -x privProtocol
              Set the privacy protocol (DES or AES) used for encrypted SNMPv3 messages.

       -X privPassword
              Set the privacy pass phrase used for encrypted SNMPv3 messages.

       -Z boots,time
              Set the engineBoots and engineTime used for authenticated SNMPv3 messages.  This will initialize the  local  notion  of  the  agents
              boots/time  with  an  authenticated  value stored in the LCD.  It is typically not necessary to specify this option, as these values
              will usually be discovered automatically.

AGENT SPECIFICATION
       The string AGENT in the SYNOPSIS above specifies the remote SNMP entity with which to communicate.  This specification takes the form:

              [<transport-specifier>:]<transport-address>

       At its simplest, the AGENT specification may consist of a hostname, or an IPv4 address in the standard "dotted  quad"  notation.   In  this
       case,  communication will be attempted using UDP/IPv4 to port 161 of the given host.  Otherwise, the <transport-address> part of the speci‐
       fication is parsed according to the following table:

           <transport-specifier>       <transport-address> format

           udp                         hostname[:port] or IPv4-address[:port]

       Note that <transport-specifier> strings are case-insensitive so that, for example, "tcp" and "TCP" are equivalent.  Here are some examples,
       along with their interpretation:

       hostname:161            perform  query  using  UDP/IPv4  datagrams to hostname on port 161.  The ":161" is redundant here since that is the
                               default SNMP port in any case.

       udp:hostname            identical to the previous specification.  The "udp:" is redundant here since UDP/IPv4 is the default transport.

OUTPUT OPTIONS
       The format of the output from SNMP commands can be controlled using various parameters of the -O flag.  The effects  of  these  sub-options
       can be seen by comparison with the following default output (unless otherwise specified):
              $ snmpget -c public -v 1 localhost sysUpTime.0
              SNMPv2-MIB::sysUpTime.0 = Timeticks: (14096763) 1 day, 15:09:27.63

       -Oa    Display  string  values as ASCII strings (unless there is a DISPLAY-HINT defined for the corresponding MIB object).  By default, the
              library attempts to determine whether the value is a printable or binary string, and displays it accordingly.

              This option does not affect objects that do have a Display Hint.

       -Ob    Display table indexes numerically, rather than trying to interpret the instance subidentifiers as string or OID values:
                  $ snmpgetnext -c public -v 1 localhost vacmSecurityModel
                  SNMP-VIEW-BASED-ACM-MIB::vacmSecurityModel.0."wes" = xxx
                  $ snmpgetnext -c public -v 1 -Ob localhost vacmSecurityModel
                  SNMP-VIEW-BASED-ACM-MIB::vacmSecurityModel.0.3.119.101.115 = xxx

       -Oe    Removes the symbolic labels from enumeration values:
                  $ snmpget -c public -v 1 localhost ipForwarding.0
                  IP-MIB::ipForwarding.0 = INTEGER: forwarding(1)
                  $ snmpget -c public -v 1 -Oe localhost ipForwarding.0
                  IP-MIB::ipForwarding.0 = INTEGER: 1

       -OE    Modifies index strings to escape the quote characters:
                  $ snmpgetnext -c public -v 1 localhost vacmSecurityModel
                  SNMP-VIEW-BASED-ACM-MIB::vacmSecurityModel.0."wes" = xxx
                  $ snmpgetnext -c public -v 1 -OE localhost vacmSecurityModel
                  SNMP-VIEW-BASED-ACM-MIB::vacmSecurityModel.0.\"wes\" = xxx

              This allows the output to be reused in shell commands.

       -Of    Include the full list of MIB objects when displaying an OID:
                  .iso.org.dod.internet.mgmt.mib-2.system.sysUpTime.0 =
                             Timeticks: (14096763) 1 day, 15:09:27.63

       -On    Displays the OID numerically:
                  .1.3.6.1.2.1.1.3.0 = Timeticks: (14096763) 1 day, 15:09:27.63

       -Oq    Removes the equal sign and type information when displaying varbind values:
                  SNMPv2-MIB::sysUpTime.0 1:15:09:27.63

       -OQ    Removes the type information when displaying varbind values:
                  SNMPv2-MIB::sysUpTime.0 = 1:15:09:27.63

       -Os    Display the MIB object name (plus any instance or other subidentifiers):
                  sysUpTime.0 = Timeticks: (14096763) 1 day, 15:09:27.63

       -OS    Display the name of the MIB, as well as the object name:
                  SNMPv2-MIB::sysUpTime.0 = Timeticks: (14096763) 1 day, 15:09:27.63

              This is the default OID output format.

       -Ot    Display TimeTicks values as raw numbers:
                  SNMPv2-MIB::sysUpTime.0 = 14096763

       -OT    If values are printed as Hex strings, display a printable version as well.

       -Ou    Display the OID in the traditional UCD-style (inherited from the original CMU code).  That means removing  a  series  of  "standard"
              prefixes from the OID, and displaying the remaining list of MIB object names (plus any other subidentifiers):
                  system.sysUpTime.0 = Timeticks: (14096763) 1 day, 15:09:27.63

       -OU    Do not print the UNITS suffix at the end of the value.

       -Ov    Display the varbind value only, not the OID:
                  $ snmpget -c public -v 1 -Oe localhost ipForwarding.0
                  INTEGER: forwarding(1)

       -Ox    Display  string  values  as  Hex strings (unless there is a DISPLAY-HINT defined for the corresponding MIB object).  By default, the
              library attempts to determine whether the value is a printable or binary string, and displays it accordingly.

              This option does not affect objects that do have a Display Hint.

       -OX    Display table indexes in a more "program like" output, imitating a traditional array-style index format:
                  $ snmpgetnext -c public -v 1 localhost ipv6RouteTable
                  IPv6-MIB::ipv6RouteIfIndex.63.254.1.0.255.0.0.0.0.0.0.0.0.0.0.0.64.1 = INTEGER: 2
                  $ snmpgetnext -c public -v 1 -OE localhost ipv6RouteTable
                  IPv6-MIB::ipv6RouteIfIndex[3ffe:100:ff00:0:0:0:0:0][64][1] = INTEGER: 2

       Most of these options can also be configured via configuration tokens.  See the snmp.conf(5) manual page for details.

INPUT OPTIONS
       The interpretation of input object names and the values to be assigned can be controlled using various parameters  of  the  -I  flag.   The
       default behaviour will be described at the end of this section.

       -Ib    specifies  that the given name should be regarded as a regular expression, to match (case-insensitively) against object names in the
              MIB tree.  The "best" match will be used - calculated as the one that matches the closest to the beginning of the node name and  the
              highest in the tree.  For example, the MIB object vacmSecurityModel could be matched by the expression vacmsecuritymodel (full name,
              but different case), or vacm.*model (regexp pattern).

              Note that '.' is a special character in regular expression patterns, so the expression cannot  specify  instance  subidentifiers  or
              more  than  one  object  name.   A  "best  match" expression will only be applied against single MIB object names.  For example, the
              expression sys*ontact.0 would not match the instance sysContact.0 (although sys*ontact would match sysContact).  Similarly, specify‐
              ing a MIB module name will not succeed (so SNMPv2-MIB::sys.*ontact would not match either).

       -Ih    disables the use of DISPLAY-HINT information when assigning values.  This would then require providing the raw value:
                  snmpset ... HOST-RESOURCES-MIB::hrSystemData.0
                                  x "07 D2 0C 0A 02 04 06 08"
              instead of a formatted version:
                  snmpset ... HOST-RESOURCES-MIB::hrSystemDate.0
                                  = 2002-12-10,2:4:6.8

       -Ir    disables  checking table indexes and the value to be assigned against the relevant MIB definitions.  This will (hopefully) result in
              the remote agent reporting an invalid request, rather than checking (and rejecting) this before it is sent to the remote agent.

              Local checks are more efficient (and the diagnostics provided also tend to be more precise), but disabling this behaviour is partic‐
              ularly useful when testing the remote agent.

       -IR    enables  "random  access"  lookup of MIB names.  Rather than providing a full OID path to the desired MIB object (or qualifying this
              object with an explicit MIB module name), the MIB tree will be searched for the  matching  object  name.   Thus  .iso.org.dod.inter‐
              net.mib-2.system.sysDescr.0 (or SNMPv2-MIB::sysDescr.0) can be specified simply as sysDescr.0.

              Warning:
                     Since  MIB object names are not globally unique, this approach may return a different MIB object depending on which MIB files
                     have been loaded.

              The MIB-MODULE::objectName syntax has the advantage of uniquely identifying a particular MIB object, as well as being slightly  more
              efficient (and automatically loading the necessary MIB file if necessary).

       -Is SUFFIX
              adds  the  specified  suffix  to each textual OID given on the command line.  This can be used to retrieve multiple objects from the
              same row of a table, by specifying a common index value.

       -IS PREFIX
              adds the specified prefix to each textual OID given on the command line.  This can be used to specify an explicit  MIB  module  name
              for all objects being retrieved (or for incurably lazy typists).

       -Iu    enables  the  traditional  UCD-style approach to interpreting input OIDs.  This assumes that OIDs are rooted at the 'mib-2' point in
              the tree (unless they start with an explicit '.' or include a MIB module name).  So the sysDescr instance above would be  referenced
              as system.sysDescr.0.

       Object  names  specified  with a leading '.' are always interpreted as "fully qualified" OIDs, listing the sequence of MIB objects from the
       root of the MIB tree.  Such objects and those qualified by an explicit MIB module name are unaffected by the -Ib, -IR and -Iu flags.

       Otherwise, if none of the above input options are specified, the default behaviour for a "relative" OID is to try and interpret  it  as  an
       (implicitly) fully qualified OID, then apply "random access" lookup (-IR), followed by "best match" pattern matching (-Ib).

ENVIRONMENT VARIABLES
       PREFIX The standard prefix for object identifiers (when using UCD-style output).  Defaults to .iso.org.dod.internet.mgmt.mib-2

       MIBS   The  list  of  MIBs  to  load.  Defaults  to SNMPv2-TC:SNMPv2-MIB:IF-MIB:IP-MIB:TCP-MIB:UDP-MIB:SNMP-VACM-MIB.  Overridden by the -m
              option.

       MIBDIRS
              The list of directories to search for MIBs. Defaults to DATADIR/snmp/mibs.  Overridden by the -M option.

FILES
       SYSCONFDIR/snmp/snmpd.conf
              Agent configuration file. See snmpd.conf(5).

       SYSCONFDIR/snmp/snmp.conf

       ~/.snmp/snmp.conf
              Application configuration files. See snmp.conf(5).

SEE ALSO
       pysnmpbulkwalk(1), pysnmpget(1), pysnmpset(1), pysnmpbulktranslate(1), pysnmpwalk(1).

Version 4                                                           1 May 2007                                                        PYSNMPCMD(1)
