IBIS(1)                                                                             IB MANAGEMENT IN-BAND SERVICES PACKAGE                                                                            IBIS(1)



NAME
       ibis - IB management Inband Services - an extended TCL shell

SYNOPSYS
       ibis [-port_num <port number to attach to>]

DESCRIPTION
       ibis is a TCL shell extended with interface for sending and receiving IB management datagrams (MADS).  To use this shell you will write TCL code that excersizes the regular TCL command and the spe‐
       cial API provided by this extension. Interactive use is also possible and is greatly enhanced if tclreadline package is available on the machine.

       The following sub sections provide detailed definition for the API and global objects defined by the extension. The different MADs APIs are group by the management class.

IBIS Constants
       These constants are provided by IBIS:

       Log Verbosity Flags

       [ Constant : int  ] $IBIS_LOG_NONE = 0x00
       [ Constant : int  ] $IBIS_LOG_ERROR = 0x01
       [ Constant : int  ] $IBIS_LOG_INFO = 0x02
       [ Constant : int  ] $IBIS_LOG_VERBOSE = 0x04
       [ Constant : int  ] $IBIS_LOG_DEBUG = 0x08
       [ Constant : int  ] $IBIS_LOG_FUNCS = 0x10
       [ Constant : int  ] $IBIS_LOG_FRAMES = 0x20

IBIS Functions
       This section provide the details about the functions IBIS exposes.  They all return 0 on succes.

       [return list] ibis_get_local_ports_info
           Return the list of available IB ports with GUID, LID, state and port number.

       [ returns int  ] ibis_init
           Initialize ibis object

       [ returns int  ] ibis_set_verbosity level
           Change the log verbosity

       [ returns int  ] ibis_set_port guid
           Set the port IBIS is attached to and initialize all sub packages.  Must be called once during ibis operation.

       [ returns new_uint64_t  ] ibis_get_port
           Provide the GUID of the port IBIS is attached to

       [ returns int  ] ibis_set_transaction_timeout timeout_ms
           Set the transaction time out in [msec]

       [ returns int  ] ibis_exit
           Exit IBIS.

       [ returns int  ] ibis_puts verbosity msg
           Appends a message to the OpenSM log

       IBIS Options Object

           The IBIS options are available through the predefined object: ibis_opts.  It can be manipulated using the standard Tcl methods: cget and configure.  Examples:

              ibis_opts cget -force_log_flush

              ibis_opts configure -force_log_flush TRUE

           The following are the different options that can be configured:

       [ Member data: returns boolean_t * ] -single_thread
           Run single threaded

       [ Member data: returns boolean_t * ] -force_log_flush
           If TRUE - forces flash after each log message (TRUE).

       [ Member data: returns uint8_t * ] -log_flags
           The log levels to be used

       [ Member data: returns char * ] -log_file
           The name of the log file to be used.Must be configured before ibis_init is used to make an affect

       [ Member data: returns uint64_t * ] -sm_key
           The SM_Key to be used when sending SubnetMgt and SubnetAdmin MADs

       [ Member data: returns uint64_t * ] -m_key
           The M_Key to be used when sending SubnetMgt

       [ Member data: returns uint64_t * ] -v_key
           The Vendor Key to be used when sending Vendor Specific MADs.

IBPM
       IBPM stands for IB Performance Monitoring MADs. IB provides standard facilities for tracking statistics on every port.

       This section provide the details about the functions IBPM exposes.  They all return 0 on succes.

       [ returns int  ] pmMultiMaxGet
           Obtain the maximal number of parallel queries that can be sent

       [ returns int  ] pmGetPortCounters lid port_select
           Send a "PortCounters" query to teh given LID and port

       [ returns int  ] pmGetPortCountersMulti num lid_list port_select_list
           Send a batch of "PortCounters" queries to the given list of LIDs and ports.  num - defines the number of elements in each list.

       [ returns int  ] pmGetExtPortCountersMulti num lid_list port_select_list
           Send a batch of "ExtendedPortCounters" queries to the given list of LIDs and ports.  num - defines the number of elements in each list.

       [ returns int  ] pmClrAllCounters lid port_select
           Sends a command to "clear all counters" on the given LID and port

       [ returns int  ] pmClrAllCountersMulti num lid_list port_select_list
           Send a batch of "clear all counters" commands to the given list of LIDs and ports.  num - defines the number of elements in each list.

IBSAC
       IBSAC stands for IB Subnet Administrator (SA) Client. It provide means to query the SA for information about the various objects it manages

       The following sections describe the concepts behind the SAC interface and then provides detailed description of each attribute that can be queried.

       IBSAC Objects

           IBSAC uses predefined global objects to facilitate SA Queries.  Such objects are named sac<Attribute>Query. Each such object exposes a standard set of methods:

       dump
           dump out all fields and values for the obejct

       cget -<field>:
           obtain the value of the given field

       configure -<field> <value>:
           set the field value

       get <comp mask>:
           query the SA for one record using the component mask and field values as set on the query object

       getTable <comp mask>:
           query the SA for all records matching component mask and field values as set on the query object

           Some SA maintained objects support the "set" and "delete" methods. In that case the following methods are made available on the corresponding query object:

       set <comp mask>:
           send a set method to the SA with the component mask and field values as set on the query object

       delete <comp mask>:
           send a delete method to the SA with the component mask and field values as set on the query object

       Returned Objects

       This section describes the values returned from the get/getTable/set/delete methods of the query objects:

       Each query returns a list (or one) identifiers (pointers) for objects. There identifiers are formatted according to the type of object they point to using the following prefixes:

       Queries embedding Subnet Management Attributes:

       ni:<idx>   = node info
       nr:<idx>   = node info record (SA RID + node info)
       pi:<idx>   = port info
       pir:<idx>  = port info record (SA RID + port info)
       smi:<idx>  = SM info
       smir:<idx> = SM info record (SA RID + SM info)
       swi:<idx>  = switch info
       swir:<idx> = switch info record (SA RID + switch info)
       slvt:<idx> = SL to VL table
       slvr:<idx> = SL to VL table Record (SA RID + SL to VL table)
       pkt:<idx>  = PKey table
       pkr:<idx>  = PKey table record (SA RID + PKey table)
           Queries of non embedded attributes:

       link:<idx> = link record
       path:<idx> = path record
       lft:<idx>  = Linear forwarding table
       mcm:<idx>  = Multicast Member Record
       cpi:<idx>  = SA Class Port Info
       info:<idx> = Inform info (registration of event forwarding)
       svc:<idx>  = Service Record
       vlarb:<idx>= VL Arbitration table record

       NODE INFO RECORD

           Component mask bits:

       [ Constant : int  ] $IB_NR_COMPMASK_LID = 0x1
       [ Constant : int  ] $IB_NR_COMPMASK_RESERVED1 = 0x2
       [ Constant : int  ] $IB_NR_COMPMASK_BASEVERSION = 0x4
       [ Constant : int  ] $IB_NR_COMPMASK_CLASSVERSION = 0x8
       [ Constant : int  ] $IB_NR_COMPMASK_NODETYPE = 0x10
       [ Constant : int  ] $IB_NR_COMPMASK_NUMPORTS = 0x20
       [ Constant : int  ] $IB_NR_COMPMASK_SYSIMAGEGUID = 0x40
       [ Constant : int  ] $IB_NR_COMPMASK_NODEGUID = 0x80
       [ Constant : int  ] $IB_NR_COMPMASK_PORTGUID = 0x100
       [ Constant : int  ] $IB_NR_COMPMASK_PARTCAP = 0x200
       [ Constant : int  ] $IB_NR_COMPMASK_DEVID = 0x400
       [ Constant : int  ] $IB_NR_COMPMASK_REV = 0x800
       [ Constant : int  ] $IB_NR_COMPMASK_PORTNUM = 0x1000
       [ Constant : int  ] $IB_NR_COMPMASK_VENDID = 0x2000
       [ Constant : int  ] $IB_NR_COMPMASK_NODEDESC = 0x4000
           ----

           class sacNodeInfo

           Fields:

       [ Member data: returns uint8_t * ] -base_version
       [ Member data: returns uint8_t * ] -class_version
       [ Member data: returns uint8_t * ] -node_type
       [ Member data: returns uint8_t * ] -num_ports
       [ Member data: returns ib_net64_t * ] -sys_guid
       [ Member data: returns ib_net64_t * ] -node_guid
       [ Member data: returns ib_net64_t * ] -port_guid
       [ Member data: returns ib_net16_t * ] -partition_cap
       [ Member data: returns ib_net16_t * ] -device_id
       [ Member data: returns ib_net32_t * ] -revision
       [ Member data: returns ib_net32_t * ] -port_num_vendor_id
       [ Member : returns void  ] delete
           ----

           class sacNodeRec

           RID Fields:

       [ Member data: returns ib_net16_t * ] -lid
       [ Member data: returns sacNodeInfo * ] -node_info
       [ Member data: returns ib_node_desc_t * ] -node_desc
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       PORT INFO RECORD

           Component mask bits:

       [ Constant : char * ] $IB_PIR_COMPMASK_LID = 0x1
       [ Constant : char * ] $IB_PIR_COMPMASK_PORTNUM = 0x2
       [ Constant : char * ] $IB_PIR_COMPMASK_RESV1 = 0x4
       [ Constant : char * ] $IB_PIR_COMPMASK_MKEY = 0x8
       [ Constant : int  ] $IB_PIR_COMPMASK_GIDPRE = 0x10
       [ Constant : int  ] $IB_PIR_COMPMASK_BASELID = 0x20
       [ Constant : int  ] $IB_PIR_COMPMASK_SMLID = 0x40
       [ Constant : int  ] $IB_PIR_COMPMASK_CAPMASK = 0x80
       [ Constant : int  ] $IB_PIR_COMPMASK_DIAGCODE = 0x100
       [ Constant : int  ] $IB_PIR_COMPMASK_MKEYLEASEPRD = 0x200
       [ Constant : int  ] $IB_PIR_COMPMASK_LOCALPORTNUM = 0x400
       [ Constant : int  ] $IB_PIR_COMPMASK_LNKWIDTHSUPPORT = 0x800
       [ Constant : int  ] $IB_PIR_COMPMASK_LNKWIDTHACTIVE = 0x1000
       [ Constant : int  ] $IB_PIR_COMPMASK_LINKWIDTHENABLED = 0x2000
       [ Constant : int  ] $IB_PIR_COMPMASK_LNKSPEEDSUPPORT = 0x4000
       [ Constant : int  ] $IB_PIR_COMPMASK_PORTSTATE = 0x10000
       [ Constant : int  ] $IB_PIR_COMPMASK_PORTPHYSTATE = 0x20000
       [ Constant : int  ] $IB_PIR_COMPMASK_LINKDWNDFLTSTATE = 0x40000
       [ Constant : int  ] $IB_PIR_COMPMASK_MKEYPROTBITS = 0x80000
       [ Constant : int  ] $IB_PIR_COMPMASK_LMC = 0x100000
       [ Constant : int  ] $IB_PIR_COMPMASK_LINKSPEEDACTIVE = 0x200000
       [ Constant : int  ] $IB_PIR_COMPMASK_LINKSPEEDENABLE = 0x400000
       [ Constant : int  ] $IB_PIR_COMPMASK_NEIGHBORMTU = 0x800000
       [ Constant : int  ] $IB_PIR_COMPMASK_MASTERSMSL = 0x1000000
       [ Constant : int  ] $IB_PIR_COMPMASK_VLCAP = 0x2000000
       [ Constant : int  ] $IB_PIR_COMPMASK_INITTYPE = 0x4000000
       [ Constant : int  ] $IB_PIR_COMPMASK_VLHIGHLIMIT = 0x8000000
       [ Constant : int  ] $IB_PIR_COMPMASK_VLARBHIGHCAP = 0x10000000
       [ Constant : int  ] $IB_PIR_COMPMASK_VLARBLOWCAP = 0x20000000
       [ Constant : int  ] $IB_PIR_COMPMASK_INITTYPEREPLY = 0x40000000
       [ Constant : int  ] $IB_PIR_COMPMASK_MTUCAP = 0x80000000
       [ Constant : char * ] $IB_PIR_COMPMASK_VLSTALLCNT = 0x100000000
       [ Constant : char * ] $IB_PIR_COMPMASK_HOQLIFE = 0x200000000
       [ Constant : char * ] $IB_PIR_COMPMASK_OPVLS = 0x400000000
       [ Constant : char * ] $IB_PIR_COMPMASK_PARENFIN = 0x800000000
       [ Constant : char * ] $IB_PIR_COMPMASK_PARENFOUT = 0x1000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_FILTERRAWIN = 0x2000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_FILTERRAWOUT = 0x4000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_MKEYVIO = 0x8000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_PKEYVIO = 0x10000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_QKEYVIO = 0x20000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_GUIDCAP = 0x40000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_RESV2 = 0x80000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_SUBNTO = 0x100000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_RESV3 = 0x200000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_RESPTIME = 0x400000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_LOCALPHYERR = 0x800000000000
       [ Constant : char * ] $IB_PIR_COMPMASK_OVERRUNERR = 0x1000000000000
           ----

           class sacPortInfo

           Fields:

       [ Member data: returns ib_net64_t * ] -m_key
       [ Member data: returns ib_net64_t * ] -subnet_prefix
       [ Member data: returns ib_net16_t * ] -base_lid
       [ Member data: returns ib_net16_t * ] -master_sm_base_lid
       [ Member data: returns ib_net32_t * ] -capability_mask
       [ Member data: returns ib_net16_t * ] -diag_code
       [ Member data: returns ib_net16_t * ] -m_key_lease_period
       [ Member data: returns uint8_t * ] -local_port_num
       [ Member data: returns uint8_t * ] -link_width_enabled
       [ Member data: returns uint8_t * ] -link_width_supported
       [ Member data: returns uint8_t * ] -link_width_active
       [ Member data: returns uint8_t * ] -state_info1
           LinkSpeedSupported and PortState

       [ Member data: returns uint8_t * ] -state_info2
           PortPhysState and LinkDownDefaultState

       [ Member data: returns uint8_t * ] -mkey_lmc
       [ Member data: returns uint8_t * ] -link_speed
           LinkSpeedEnabled and LinkSpeedActive

       [ Member data: returns uint8_t * ] -mtu_smsl
       [ Member data: returns uint8_t * ] -vl_cap
           VlCap and InitType

       [ Member data: returns uint8_t * ] -vl_high_limit
       [ Member data: returns uint8_t * ] -vl_arb_high_cap
       [ Member data: returns uint8_t * ] -vl_arb_low_cap
       [ Member data: returns uint8_t * ] -mtu_cap
       [ Member data: returns uint8_t * ] -vl_stall_life
       [ Member data: returns uint8_t * ] -vl_enforce
       [ Member data: returns ib_net16_t * ] -m_key_violations
       [ Member data: returns ib_net16_t * ] -p_key_violations
       [ Member data: returns ib_net16_t * ] -q_key_violations
       [ Member data: returns uint8_t * ] -guid_cap
       [ Member data: returns uint8_t * ] -subnet_timeout
       [ Member data: returns uint8_t * ] -resp_time_value
       [ Member data: returns uint8_t * ] -error_threshold
       [ Member : returns void  ] delete
           ----

           class sacPortRec

           RID Fields:

       [ Member data: returns ib_net16_t * ] -lid
       [ Member data: returns uint8_t * ] -port_num
       [ Member data: returns sacPortInfo * ] -port_info
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       SM INFO RECORD

           Component mask bits:

       [ Constant : char * ] $IB_SMR_COMPMASK_LID = 0x1
       [ Constant : char * ] $IB_SMR_COMPMASK_GUID = 0x2
       [ Constant : char * ] $IB_SMR_COMPMASK_SM_KEY = 0x4
       [ Constant : char * ] $IB_SMR_COMPMASK_ACT_COUNT = 0x8
       [ Constant : int  ] $IB_SMR_COMPMASK_STATE = 0x10
       [ Constant : int  ] $IB_SMR_COMPMASK_PRI = 0x20
           ----

           class sacSmInfo

           Fields:

       [ Member data: returns ib_net64_t * ] -guid
       [ Member data: returns ib_net64_t * ] -sm_key
       [ Member data: returns ib_net32_t * ] -act_count
       [ Member data: returns uint8_t * ] -pri_state
       [ Member : returns void  ] delete
           ----

           class sacSmRec

           RID Fields:

       [ Member data: returns ib_net16_t * ] -lid
       [ Member data: returns sacSmInfo * ] -sm_info
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       SWITCH INFO RECORD

           Component mask bits:

       [ Constant : char * ] $IB_SWR_COMPMASK_LID = 0x1
       [ Constant : char * ] $IB_SWR_COMPMASK_LIN_CAP = 0x2
       [ Constant : char * ] $IB_SWR_COMPMASK_RAND_CAP = 0x4
       [ Constant : char * ] $IB_SWR_COMPMASK_MCAST_CAP = 0x8
       [ Constant : char * ] $IB_SWR_COMPMASK_LIN_TOP = 0x10
       [ Constant : char * ] $IB_SWR_COMPMASK_DEF_PORT = 0x20
       [ Constant : char * ] $IB_SWR_COMPMASK_DEF_MCAST_PRI = 0x40
       [ Constant : char * ] $IB_SWR_COMPMASK_DEF_MCAST_NOT = 0x80
       [ Constant : char * ] $IB_SWR_COMPMASK_STATE = 0x100
       [ Constant : char * ] $IB_SWR_COMPMASK_LIFE = 0x200
       [ Constant : char * ] $IB_SWR_COMPMASK_LMC = 0x400
       [ Constant : char * ] $IB_SWR_COMPMASK_ENFORCE_CAP = 0x800
       [ Constant : char * ] $IB_SWR_COMPMASK_FLAGS = 0x1000
           ----

           class sacSwInfo

           Fields:

       [ Member data: returns ib_net16_t * ] -lin_cap
       [ Member data: returns ib_net16_t * ] -rand_cap
       [ Member data: returns ib_net16_t * ] -mcast_cap
       [ Member data: returns ib_net16_t * ] -lin_top
       [ Member data: returns uint8_t * ] -def_port
       [ Member data: returns uint8_t * ] -def_mcast_pri_port
       [ Member data: returns uint8_t * ] -def_mcast_not_port
       [ Member data: returns uint8_t * ] -life_state
       [ Member data: returns ib_net16_t * ] -lids_per_port
       [ Member data: returns ib_net16_t * ] -enforce_cap
       [ Member data: returns uint8_t * ] -flags
       [ Member : returns void  ] delete
           ----

           class sacSwRec

           RID Fields:

       [ Member data: returns ib_net16_t * ] -lid
       [ Member data: returns sacSwInfo * ] -switch_info
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       LINK RECORD

           Component mask bits:

       [ Constant : int  ] $IB_LR_COMPMASK_FROM_LID = 0x1
       [ Constant : int  ] $IB_LR_COMPMASK_FROM_PORT = 0x2
       [ Constant : int  ] $IB_LR_COMPMASK_TO_PORT = 0x4
       [ Constant : int  ] $IB_LR_COMPMASK_TO_LID = 0x8
           ----

           class sacLinkRec

           Fields:

       [ Member data: returns ib_net16_t * ] -from_lid
       [ Member data: returns uint8_t * ] -from_port_num
       [ Member data: returns uint8_t * ] -to_port_num
       [ Member data: returns ib_net16_t * ] -to_lid
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       PATH RECORD

           Component mask bits:

       [ Constant : int  ] $IB_PR_COMPMASK_DGID = 0x4
       [ Constant : int  ] $IB_PR_COMPMASK_SGID = 0x8
       [ Constant : int  ] $IB_PR_COMPMASK_DLID = 0x10
       [ Constant : int  ] $IB_PR_COMPMASK_SLID = 0x20
       [ Constant : int  ] $IB_PR_COMPMASK_RAWTRAFIC = 0x40
       [ Constant : int  ] $IB_PR_COMPMASK_RESV0 = 0x80
       [ Constant : int  ] $IB_PR_COMPMASK_FLOWLABEL = 0x100
       [ Constant : int  ] $IB_PR_COMPMASK_HOPLIMIT = 0x200
       [ Constant : int  ] $IB_PR_COMPMASK_TCLASS = 0x400
       [ Constant : int  ] $IB_PR_COMPMASK_REVERSIBLE = 0x800
       [ Constant : int  ] $IB_PR_COMPMASK_NUMBPATH = 0x1000
       [ Constant : int  ] $IB_PR_COMPMASK_PKEY = 0x2000
       [ Constant : int  ] $IB_PR_COMPMASK_RESV1 = 0x4000
       [ Constant : int  ] $IB_PR_COMPMASK_SL = 0x8000
       [ Constant : int  ] $IB_PR_COMPMASK_MTUSELEC = 0x10000
       [ Constant : int  ] $IB_PR_COMPMASK_MTU = 0x20000
       [ Constant : int  ] $IB_PR_COMPMASK_RATESELEC = 0x40000
       [ Constant : int  ] $IB_PR_COMPMASK_RATE = 0x80000
       [ Constant : int  ] $IB_PR_COMPMASK_PKTLIFETIMESELEC = 0x100000
       [ Constant : int  ] $IB_PR_COMPMASK_PFTLIFETIME = 0x200000
           ----

           class sacPathRec

           Fields:

       [ Member data: returns ib_gid_t * ] -dgid
       [ Member data: returns ib_gid_t * ] -sgid
       [ Member data: returns ib_net16_t * ] -dlid
       [ Member data: returns ib_net16_t * ] -slid
       [ Member data: returns ib_net32_t * ] -hop_flow_raw
       [ Member data: returns uint8_t * ] -tclass
       [ Member data: returns uint8_t * ] -num_path
       [ Member data: returns ib_net16_t * ] -pkey
       [ Member data: returns ib_net16_t * ] -sl
       [ Member data: returns uint8_t * ] -mtu
       [ Member data: returns uint8_t * ] -rate
       [ Member data: returns uint8_t * ] -pkt_life
       [ Member data: returns uint8_t * ] -preference
           Methds:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       LINEAR FORWARDING TABLE

           Component mask bits:

       [ Constant : char * ] $IB_LFT_COMPMASK_LID = 0x1
       [ Constant : char * ] $IB_LFT_COMPMASK_BLOCK = 0x2
           ----

           class sacLFTRec

           Fields:

       [ Member data: returns ib_net16_t * ] -lid
       [ Member data: returns ib_net16_t * ] -block_num
       [ Member data: returns ib_lft_t * ] -lft
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       MULTICAST MEMBER RECORD

           Component mask bits:

       [ Constant : char * ] $IB_MCR_COMPMASK_GID = 0x1
       [ Constant : char * ] $IB_MCR_COMPMASK_MGID = 0x1
       [ Constant : char * ] $IB_MCR_COMPMASK_PORT_GID = 0x2
       [ Constant : char * ] $IB_MCR_COMPMASK_QKEY = 0x4
       [ Constant : char * ] $IB_MCR_COMPMASK_MLID = 0x8
       [ Constant : char * ] $IB_MCR_COMPMASK_MTU_SEL = 0x10
       [ Constant : char * ] $IB_MCR_COMPMASK_MTU = 0x20
       [ Constant : char * ] $IB_MCR_COMPMASK_TCLASS = 0x40
       [ Constant : char * ] $IB_MCR_COMPMASK_PKEY = 0x80
       [ Constant : char * ] $IB_MCR_COMPMASK_RATE_SEL = 0x100
       [ Constant : char * ] $IB_MCR_COMPMASK_RATE = 0x200
       [ Constant : char * ] $IB_MCR_COMPMASK_LIFE_SEL = 0x400
       [ Constant : char * ] $IB_MCR_COMPMASK_LIFE = 0x800
       [ Constant : char * ] $IB_MCR_COMPMASK_SL = 0x1000
       [ Constant : char * ] $IB_MCR_COMPMASK_FLOW = 0x2000
       [ Constant : char * ] $IB_MCR_COMPMASK_HOP = 0x4000
       [ Constant : char * ] $IB_MCR_COMPMASK_SCOPE = 0x8000
       [ Constant : char * ] $IB_MCR_COMPMASK_JOIN_STATE = 0x10000
       [ Constant : char * ] $IB_MCR_COMPMASK_PROXY = 0x20000
           ----

           class sacMCMRec

           Fields:

       [ Member data: returns ib_gid_t * ] -mgid
       [ Member data: returns ib_gid_t * ] -port_gid
       [ Member data: returns ib_net32_t * ] -qkey
       [ Member data: returns ib_net16_t * ] -mlid
       [ Member data: returns uint8_t * ] -mtu
       [ Member data: returns uint8_t * ] -tclass
       [ Member data: returns ib_net16_t * ] -pkey
       [ Member data: returns uint8_t * ] -rate
       [ Member data: returns uint8_t * ] -pkt_life
       [ Member data: returns ib_net32_t * ] -sl_flow_hop
       [ Member data: returns uint8_t * ] -scope_state
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns char * ] set comp_mask
       [ Member : returns char * ] del comp_mask
       [ Member : returns int  ] proxy_join_get
           Instead of simple field cget

       [ Member : returns void  ] proxy_join_set proxy_join
           Instead of simple field configure

       [ Member : returns void  ] obj_delete
           Delete the object

       SA CLASS PORT INFO

           ----

           class sacClassPortInfo

           Fields:

       [ Member data: returns uint8_t * ] -base_ver
       [ Member data: returns uint8_t * ] -class_ver
       [ Member data: returns ib_net16_t * ] -cap_mask
       [ Member data: returns ib_net32_t * ] -resp_time_val
       [ Member data: returns ib_gid_t * ] -redir_gid
       [ Member data: returns ib_net32_t * ] -redir_tc_sl_fl
       [ Member data: returns ib_net16_t * ] -redir_lid
       [ Member data: returns ib_net16_t * ] -redir_pkey
       [ Member data: returns ib_net32_t * ] -redir_qp
       [ Member data: returns ib_net32_t * ] -redir_qkey
       [ Member data: returns ib_gid_t * ] -trap_gid
       [ Member data: returns ib_net32_t * ] -trap_tc_sl_fl
       [ Member data: returns ib_net16_t * ] -trap_lid
       [ Member data: returns ib_net16_t * ] -trap_pkey
       [ Member data: returns ib_net32_t * ] -trap_hop_qp
       [ Member data: returns ib_net32_t * ] -trap_qkey
           Methods:

       [ Member : returns char * ] get
       [ Member : returns void  ] delete

       INFORM INFO RECORD

           The inform Info is built with heirarchy of objects. So several classes are defined.

           ----

           class sacInformInfo

           Fields:

       [ Member data: returns ib_gid_t * ] -gid
       [ Member data: returns ib_net16_t * ] -lid_range_begin
       [ Member data: returns ib_net16_t * ] -lid_range_end
       [ Member data: returns ib_net16_t * ] -reserved1
       [ Member data: returns uint8_t * ] -is_generic
       [ Member data: returns uint8_t * ] -subscribe
       [ Member data: returns ib_net16_t * ] -trap_type
       [ Member data: returns sacInformInfo_g_or_v * ] -g_or_v
           Methods:

       [ Member : returns char * ] set
       [ Member : returns void  ] delete
           ----

           class sacInformInfo_g_or_v

           Fields:

       [ Member data: returns sacInformInfo_g_or_v_generic * ] -generic
       [ Member data: returns sacInformInfo_g_or_v_vend * ] -vend
           ----

           class sacInformInfo_g_or_v_generic

           Fields:

       [ Member data: returns ib_net16_t * ] -trap_num
       [ Member data: returns ib_net32_t * ] -qpn_resp_time_val
       [ Member data: returns uint8_t * ] -reserved2
       [ Member data: returns uint8_t * ] -node_type_msb
       [ Member data: returns ib_net16_t * ] -node_type_lsb
           ----

           class sacInformInfo_g_or_v_vend

           Fields:

       [ Member data: returns ib_net16_t * ] -dev_id
       [ Member data: returns ib_net32_t * ] -qpn_resp_time_val
       [ Member data: returns uint8_t * ] -reserved2
       [ Member data: returns uint8_t * ] -vendor_id_msb
       [ Member data: returns ib_net16_t * ] -vendor_id_lsb

       SERVICE RECORD

           Component mask bits:

       [ Constant : char * ] $IB_SR_COMPMASK_SID = 0x1
       [ Constant : char * ] $IB_SR_COMPMASK_SGID = 0x1
       [ Constant : char * ] $IB_SR_COMPMASK_SPKEY = 0x2
       [ Constant : char * ] $IB_SR_COMPMASK_RES1 = 0x4
       [ Constant : char * ] $IB_SR_COMPMASK_SLEASE = 0x8
       [ Constant : char * ] $IB_SR_COMPMASK_SKEY = 0x10
       [ Constant : char * ] $IB_SR_COMPMASK_SNAME = 0x20
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_0 = 0x40
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_1 = 0x80
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_2 = 0x100
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_3 = 0x200
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_4 = 0x400
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_5 = 0x800
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_6 = 0x1000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_7 = 0x2000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_8 = 0x4000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_9 = 0x8000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_10 = 0x10000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_11 = 0x20000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_12 = 0x40000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_13 = 0x80000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_14 = 0x100000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA8_15 = 0x200000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA16_0 = 0x400000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA16_1 = 0x800000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA16_2 = 0x1000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA16_3 = 0x2000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA16_4 = 0x4000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA16_5 = 0x8000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA16_6 = 0x10000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA16_7 = 0x20000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA32_0 = 0x40000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA32_1 = 0x80000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA32_2 = 0x100000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA32_3 = 0x200000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA64_0 = 0x400000000
       [ Constant : char * ] $IB_SR_COMPMASK_SDATA64_1 = 0x800000000
           ----

           class sacServiceRec

           Fields:

       [ Member data: returns ib_net64_t * ] -service_id
       [ Member data: returns ib_gid_t * ] -service_gid
       [ Member data: returns ib_net16_t * ] -service_pkey
       [ Member data: returns ib_net16_t * ] -resv
       [ Member data: returns ib_net32_t * ] -service_lease
       [ Member data: returns uint8_array_t * ] -service_key
       [ Member data: returns ib_svc_name_t * ] -service_name
       [ Member data: returns uint8_array_t * ] -service_data8
       [ Member data: returns ib_net16_array_t * ] -service_data16
       [ Member data: returns ib_net32_array_t * ] -service_data32
       [ Member data: returns ib_net64_array_t * ] -service_data64
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] set comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns char * ] delete comp_mask
       [ Member : returns void  ] obj_delete

       SL to VL TABLE RECORD

           Component mask bits:

       [ Constant : char * ] $IB_SLVL_COMPMASK_LID = 0x1
       [ Constant : char * ] $IB_SLVL_COMPMASK_IN_PORT = 0x2
       [ Constant : char * ] $IB_SLVL_COMPMASK_OUT_PORT = 0x4
           ----

           class sacSlVlTbl

       [ Member data: returns uint8_array_t * ] -raw_vl_by_sl
           ----

           class sacSlVlRec

           RID Fields:

       [ Member data: returns ib_net16_t * ] -lid
           for CA: lid of port, for switch lid of port 0

       [ Member data: returns uint8_t * ] -in_port_num
           reserved for CA's

       [ Member data: returns uint8_t * ] -out_port_num
           reserved for CA's

       [ Member data: returns uint32_t * ] -resv
       [ Member data: returns sacSlVlTbl * ] -slvl_tbl
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       VL ARBITRATION TABLE RECORD

           Component mask bits:

       [ Constant : char * ] $IB_VLA_COMPMASK_LID = 0x1
       [ Constant : char * ] $IB_VLA_COMPMASK_OUT_PORT = 0x2
       [ Constant : char * ] $IB_VLA_COMPMASK_BLOCK = 0x4
           ----

           class sacVlArbRec

           Fields:

       [ Member data: returns ib_net16_t * ] -lid
           for CA: lid of port, for switch lid of port 0

       [ Member data: returns uint8_t * ] -port_num
       [ Member data: returns uint8_t * ] -block_num
       [ Member data: returns uint32_t * ] -reserved
       [ Member data: returns sac_vl_arb_tbl_t * ] -vl_arb_tbl
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

       PKEY TABLE RECORD

           Component mask bits:

       [ Constant : char * ] $IB_PKEY_COMPMASK_LID = 0x1
       [ Constant : char * ] $IB_PKEY_COMPMASK_BLOCK = 0x2
       [ Constant : char * ] $IB_PKEY_COMPMASK_PORT = 0x4
           ----

           class sacPKeyTbl

           Fields:

       [ Member data: returns ib_net16_array_t * ] -pkey_entry
           ----

           class sacPKeyRec

           RID Fields:

       [ Member data: returns ib_net16_t * ] -lid
           for CA: lid of port, for switch lid of port 0

       [ Member data: returns uint16_t * ] -block_num
       [ Member data: returns uint8_t * ] -port_num
           for switch: port number, for CA: reserved

       [ Member data: returns uint8_t * ] -reserved1
       [ Member data: returns uint16_t * ] -reserved2
       [ Member data: returns sacPKeyTbl * ] -pkey_tbl
           Methods:

       [ Member : returns char * ] get comp_mask
       [ Member : returns char * ] getTable comp_mask
       [ Member : returns void  ] delete

Subnet Management MADs (SMPs)
       The SM interface supports sending Subnet Management Packets to the fabric devices. The specific attributes that can be access is provided in detail in each sub section below.

       A set of object types is defined. The user can allocate a new attribute object. Then the object can be set using configure or the direct manipulation methods.  Extra methods are provided for each
       object: =item setByDr <dr> <attrMod>

       Set the attribute on the object accessible by the given directed route. A directed route is a list of port numbers to go out from.

       getByDr <dr> <attrMod>
           Get the attribute value by traversing a directed route.

           setByLid <lid> <attrMod>

           Set the attribute on the object accessible by the given LID

           getByLid <lid> <attrMod>

           get the attribute on the object accessible by the given LID

       class smNodeInfo

           Fields:

       [ Member data: returns uint8_t * ] -base_version
       [ Member data: returns uint8_t * ] -class_version
       [ Member data: returns uint8_t * ] -node_type
       [ Member data: returns uint8_t * ] -num_ports
       [ Member data: returns ib_net64_t * ] -sys_guid
       [ Member data: returns ib_net64_t * ] -node_guid
       [ Member data: returns ib_net64_t * ] -port_guid
       [ Member data: returns ib_net16_t * ] -partition_cap
       [ Member data: returns ib_net16_t * ] -device_id
       [ Member data: returns ib_net32_t * ] -revision
       [ Member data: returns ib_net32_t * ] -port_num_vendor_id
           Methods:

       [ Member : returns int  ] getByDr dr
       [ Member : returns int  ] setByDr dr
       [ Member : returns int  ] getByLid lid
       [ Member : returns int  ] setByLid lid

class smPortInfo
       Fields:

       [ Member data: returns ib_net64_t * ] -m_key
       [ Member data: returns ib_net64_t * ] -subnet_prefix
       [ Member data: returns ib_net16_t * ] -base_lid
       [ Member data: returns ib_net16_t * ] -master_sm_base_lid
       [ Member data: returns ib_net32_t * ] -capability_mask
       [ Member data: returns ib_net16_t * ] -diag_code
       [ Member data: returns ib_net16_t * ] -m_key_lease_period
       [ Member data: returns uint8_t * ] -local_port_num
       [ Member data: returns uint8_t * ] -link_width_enabled
       [ Member data: returns uint8_t * ] -link_width_supported
       [ Member data: returns uint8_t * ] -link_width_active
       [ Member data: returns uint8_t * ] -state_info1
           LinkSpeedSupported and PortState

       [ Member data: returns uint8_t * ] -state_info2
           PortPhysState and LinkDownDefaultState

       [ Member data: returns uint8_t * ] -mkey_lmc
       [ Member data: returns uint8_t * ] -link_speed
           LinkSpeedEnabled and LinkSpeedActive

       [ Member data: returns uint8_t * ] -mtu_smsl
       [ Member data: returns uint8_t * ] -vl_cap
           VlCap and InitType

       [ Member data: returns uint8_t * ] -vl_high_limit
       [ Member data: returns uint8_t * ] -vl_arb_high_cap
       [ Member data: returns uint8_t * ] -vl_arb_low_cap
       [ Member data: returns uint8_t * ] -mtu_cap
       [ Member data: returns uint8_t * ] -vl_stall_life
       [ Member data: returns uint8_t * ] -vl_enforce
       [ Member data: returns ib_net16_t * ] -m_key_violations
       [ Member data: returns ib_net16_t * ] -p_key_violations
       [ Member data: returns ib_net16_t * ] -q_key_violations
       [ Member data: returns uint8_t * ] -guid_cap
       [ Member data: returns uint8_t * ] -subnet_timeout
       [ Member data: returns uint8_t * ] -resp_time_value
       [ Member data: returns uint8_t * ] -error_threshold
           Methods:

       [ Member : returns int  ] getByDr dr portNum
       [ Member : returns int  ] setByDr dr portNum
       [ Member : returns int  ] getByLid lid portNum
       [ Member : returns int  ] setByLid lid portNum

       class smSwInfo

       [ Member data: returns ib_net16_t * ] -lin_cap
       [ Member data: returns ib_net16_t * ] -rand_cap
       [ Member data: returns ib_net16_t * ] -mcast_cap
       [ Member data: returns ib_net16_t * ] -lin_top
       [ Member data: returns uint8_t * ] -def_port
       [ Member data: returns uint8_t * ] -def_mcast_pri_port
       [ Member data: returns uint8_t * ] -def_mcast_not_port
       [ Member data: returns uint8_t * ] -life_state
       [ Member data: returns ib_net16_t * ] -lids_per_port
       [ Member data: returns ib_net16_t * ] -enforce_cap
       [ Member data: returns uint8_t * ] -flags
       [ Member : returns int  ] getByDr dr
       [ Member : returns int  ] setByDr dr
       [ Member : returns int  ] getByLid lid
       [ Member : returns int  ] setByLid lid

       class smLftBlock

       [ Member data: returns uint8_array_t * ] -lft
       [ Member : returns int  ] getByDr dr blockNum
       [ Member : returns int  ] setByDr dr blockNum
       [ Member : returns int  ] getByLid lid blockNum
       [ Member : returns int  ] setByLid lid blockNum

       class smMftBlock

       [ Member data: returns ib_net16_array_t * ] -mft
       [ Member : returns int  ] getByDr dr startLid startPort
       [ Member : returns int  ] setByDr dr startLid startPort
       [ Member : returns int  ] getByLid lid startLid startPort
       [ Member : returns int  ] setByLid lid startLid startPort

       class smGuidInfo

       [ Member data: returns ib_net64_array_t * ] -guid
       [ Member : returns int  ] getByDr dr blockNum
       [ Member : returns int  ] setByDr dr blockNum
       [ Member : returns int  ] getByLid lid blockNum
       [ Member : returns int  ] setByLid lid blockNum

       class smPkeyTable

       [ Member data: returns ib_net16_array_t * ] -pkey_entry
       [ Member : returns int  ] getByDr dr portNum blockNum
       [ Member : returns int  ] setByDr dr portNum blockNum
       [ Member : returns int  ] getByLid lid portNum blockNum
       [ Member : returns int  ] setByLid lid portNum blockNum

       class smSlVlTable

       [ Member data: returns uint8_array_t * ] -raw_vl_by_sl
       [ Member : returns int  ] getByDr dr inPortNum outPortNum
       [ Member : returns int  ] setByDr dr inPortNum outPortNum
       [ Member : returns int  ] getByLid lid inPortNum outPortNum
       [ Member : returns int  ] setByLid lid inPortNum outPortNum

       class smVlArbTable

       [ Member data: returns ib_vl_arb_element_t * ] -vl_entry
       [ Member : returns int  ] getByDr dr portNum block
       [ Member : returns int  ] setByDr dr portNum block
       [ Member : returns int  ] getByLid lid portNum block
       [ Member : returns int  ] setByLid lid portNum block

       class smNodeDesc

       [ Member data: returns ibsm_node_desc_str_t * ] -description
       [ Member : returns int  ] getByDr dr
       [ Member : returns int  ] setByDr dr
       [ Member : returns int  ] getByLid lid
       [ Member : returns int  ] setByLid lid

       class smSMInfo

       [ Member data: returns ib_net64_t * ] -guid
       [ Member data: returns ib_net64_t * ] -sm_key
       [ Member data: returns ib_net32_t * ] -act_count
       [ Member data: returns uint8_t * ] -pri_state
       [ Member : returns int  ] getByDr dr
       [ Member : returns int  ] setByDr dr
       [ Member : returns int  ] getByLid lid
       [ Member : returns int  ] setByLid lid

       class smNotice

           The NOTICE attribute is built out of several sub objects

       [ Member data: returns uint8_t * ] -generic_type
       [ Member data: returns ib_net16_t * ] -issuer_lid
       [ Member data: returns ib_net16_t * ] -toggle_count
       [ Member data: returns ib_gid_t * ] -issuer_gid
       [ Member data: returns smNotice_g_or_v * ] -g_or_v
       [ Member data: returns smNotice_data_details * ] -data_details
       [ Member : returns int  ] trapByDr dr
       [ Member : returns int  ] trapByLid lid
           ----

           class smNotice_g_or_v

       [ Member data: returns smNotice_g_or_v_generic * ] -generic
       [ Member data: returns smNotice_g_or_v_vend * ] -vend
           ----

           class smNotice_data_details

       [ Member data: returns smNotice_data_details_raw_data * ] -raw_data
       [ Member data: returns smNotice_data_details_ntc_64_67 * ] -ntc_64_67
       [ Member data: returns smNotice_data_details_ntc_128 * ] -ntc_128
       [ Member data: returns smNotice_data_details_ntc_129_131 * ] -ntc_129_131
       [ Member data: returns smNotice_data_details_ntc_144 * ] -ntc_144
       [ Member data: returns smNotice_data_details_ntc_145 * ] -ntc_145
       [ Member data: returns smNotice_data_details_ntc_256 * ] -ntc_256
       [ Member data: returns smNotice_data_details_ntc_257_258 * ] -ntc_257_258
       [ Member data: returns smNotice_data_details_ntc_259 * ] -ntc_259
           ----

           class smNotice_g_or_v_generic

       [ Member data: returns uint8_t * ] -prod_type_msb
       [ Member data: returns ib_net16_t * ] -prod_type_lsb
       [ Member data: returns ib_net16_t * ] -trap_num
           ----

           class smNotice_g_or_v_vend

       [ Member data: returns uint8_t * ] -vend_id_msb
       [ Member data: returns ib_net16_t * ] -vend_id_lsb
       [ Member data: returns ib_net16_t * ] -dev_id
           ----

           class smNotice_data_details_raw_data

       [ Member data: returns uint8_array_t * ] -details
           ----

           class smNotice_data_details_ntc_64_67

       [ Member data: returns uint8_array_t * ] -res
       [ Member data: returns ib_gid_t * ] -gid
           the Node or Multicast Group that came in/out

           ----

           class smNotice_data_details_ntc_128

       [ Member data: returns ib_net16_t * ] -sw_lid
           the sw lid of which link state changed

           ----

           class smNotice_data_details_ntc_129_131

       [ Member data: returns ib_net16_t * ] -pad
       [ Member data: returns ib_net16_t * ] -lid
           lid and port number of the violation

       [ Member data: returns uint8_t * ] -port_num
           ----

           class smNotice_data_details_ntc_144

       [ Member data: returns ib_net16_t * ] -pad1
       [ Member data: returns ib_net16_t * ] -lid
           lid where capability mask changed

       [ Member data: returns ib_net16_t * ] -pad2
       [ Member data: returns ib_net32_t * ] -new_cap_mask
           new capability mask

           ----

           class smNotice_data_details_ntc_145

       [ Member data: returns ib_net16_t * ] -pad1
       [ Member data: returns ib_net16_t * ] -lid
           lid where sys guid changed

       [ Member data: returns ib_net16_t * ] -pad2
       [ Member data: returns ib_net64_t * ] -new_sys_guid
           new system image guid

           ----

           class smNotice_data_details_ntc_256

       [ Member data: returns ib_net16_t * ] -pad1
       [ Member data: returns ib_net16_t * ] -lid
       [ Member data: returns ib_net16_t * ] -pad2
       [ Member data: returns uint8_t * ] -method
       [ Member data: returns uint8_t * ] -pad3
       [ Member data: returns ib_net16_t * ] -attr_id
       [ Member data: returns ib_net32_t * ] -attr_mod
       [ Member data: returns ib_net64_t * ] -mkey
       [ Member data: returns uint8_t * ] -dr_slid
       [ Member data: returns uint8_t * ] -dr_trunc_hop
       [ Member data: returns uint8_array_t * ] -dr_rtn_path
           ----

           class smNotice_data_details_ntc_257_258

       [ Member data: returns ib_net16_t * ] -pad1
       [ Member data: returns ib_net16_t * ] -lid1
       [ Member data: returns ib_net16_t * ] -lid2
       [ Member data: returns ib_net32_t * ] -key
       [ Member data: returns uint8_t * ] -sl
       [ Member data: returns ib_net32_t * ] -qp1
       [ Member data: returns ib_net32_t * ] -qp2
       [ Member data: returns ib_gid_t * ] -gid1
       [ Member data: returns ib_gid_t * ] -gid2
           ----

           class smNotice_data_details_ntc_259

       [ Member data: returns ib_net16_t * ] -data_valid
       [ Member data: returns ib_net16_t * ] -lid1
       [ Member data: returns ib_net16_t * ] -lid2
       [ Member data: returns ib_net32_t * ] -key
       [ Member data: returns uint8_t * ] -sl
       [ Member data: returns ib_net32_t * ] -qp1
       [ Member data: returns uint8_t * ] -qp2_msb
       [ Member data: returns ib_net16_t * ] -qp2_lsb
       [ Member data: returns ib_gid_t * ] -gid1
       [ Member data: returns ib_gid_t * ] -gid2
       [ Member data: returns ib_net16_t * ] -sw_lid
       [ Member data: returns uint8_t * ] -port_no

IBCR Functions
       Provides vendor specific access to the device internal coniguration space

       This section provide the details about the functions IBCR exposes.  They all return 0 on succes.

       [ returns int  ] crMultiMaxGet
       [ returns int  ] crRead lid address
       [ returns int  ] crWrite lid data address
       [ returns int  ] crReadMulti num lid_list address
       [ returns int  ] crWriteMulti num lid_list data address

IB Vendor Specific Functions
       IBVS stands for Vendor Specific MADs.

       This section provide the details about the functions IBVS exposes.  They all return 0 on succes.

       [ returns int  ] vsMultiMaxGet
       [ returns int  ] vsCpuRead lid size cpu_traget_size address
       [ returns int  ] vsCpuWrite lid size cpu_traget_size data address
       [ returns int  ] vsI2cRead lid port_num device_id size address
       [ returns int  ] vsI2cWrite lid port_num device_id size address data
       [ returns int  ] vsI2cReadMulti num lid_list port_num device_id size address
       [ returns int  ] vsI2cWriteMulti num lid_list port_num device_id size address data
       [ returns int  ] vsGpioRead lid
       [ returns int  ] vsGpioWrite lid gpio_mask gpio_data
       [ returns int  ] vsSWReset num lid_list
       [ returns int  ] vsFlashStartMulti num lid_list last size address data
       [ returns int  ] vsFlashStopMulti num lid_list force
       [ returns int  ] vsFlashSetBankMulti num lid_list address
       [ returns int  ] vsFlashEraseSectorMulti num lid_list address
       [ returns int  ] vsFlashReadSectorMulti num lid_list size address
       [ returns int  ] vsFlashWriteSectorMulti num lid_list size address data
       [ returns int  ] vsMirrorRead lid
       [ returns int  ] vsMirrorWrite lid rx_mirror tx_mirror

IBBBM Functions
       This section provide the details about the functions IBBBM exposes.  They all return 0 on succes.

       [ returns int  ] bbmVpdRead lid vpd_device_selector bytes_num offset
       [ returns int  ] bbmVpdWrite lid vpd_device_selector bytes_num offset p_data
       [ returns int  ] bbmVSDRead lid
       [ returns int  ] bbmBSNRead lid
       [ returns int  ] bbmModRead lid
       [ returns int  ] bbmChaRead lid
       [ returns int  ] bbmFWVerRead lid

AUTHOR
       Eitan Zahavi, Mellanox Technologies LTD, eitan@mellanox.co.il



IBIS 1.0                                                                                          2008-06-16                                                                                          IBIS(1)
