targetcli(8)                                                                               System Manager's Manual                                                                               targetcli(8)



NAME
       targetcli - administration shell for storage targets

DESCRIPTION
       targetcli  is a shell for viewing, editing, and saving the configuration of the kernel's target subsystem, also known as LIO. It enables the administrator to assign local storage resources backed by
       either files, volumes, local SCSI devices, or ramdisk, and export them to remote systems via network fabrics, such as iSCSI or FCoE.

       The configuration layout is tree-based, similar to a filesystem, and is navigated in a similar manner.

USAGE
       targetcli

       targetcli [cmd]

       Invoke targetcli as root to enter the configuration shell, or follow with a command to execute but do not enter the shell.  Use ls to list nodes below the current path.  Moving around  the  tree  is
       accomplished  by the cd command, or by entering the new location directly. Objects are created using create, removed using delete.  Use help <cmd> for additional usage information. Tab-completion is
       available for commands and command arguments.

       Configuration changes in targetcli are made immediately to the underlying kernel target configuration. Settings will not be retained across reboot unless saveconfig is either explicitly  called,  or
       implicitly by exiting the shell with the global preference auto_save_on_exit set to true, the default.

QUICKSTART
       To create an iSCSI target and share a file-backed LUN without any auth checks:

       $ sudo targetcli
       /> backstores/fileio create test /tmp/test.img 100m
       /> iscsi/ create iqn.2006-04.com.example:test-target
       /> cd iscsi/iqn.2006-04.com.example:test-target/tpg1/
       tpg1/> luns/ create /backstores/fileio/test
       tpg1/> set attribute generate_node_acls=1
       tpg1/> exit

       Although  by default targetcli saves the running configuration upon exit, a distribution-specific service must be enabled to restore the saved configuration on reboot. See distribution documentation
       for specifics, but for example:

       $ sudo systemctl enable target.service

       See EXAMPLES below for more detailed information on commands and using the shell.

BACKSTORES
       Backstores are different kinds of local storage resources that the kernel target uses to "back" the SCSI devices it exports. The mappings to local storage resources that each backstore  creates  are
       called storage objects.

   FILEIO
       Allows  files  to  be treated as disk images. When storage objects of this type are created, they can support either write-back or write-thru operation. Using write-back enables the local filesystem
       cache, which will improve performance but increase the risk of data loss. It is also possible to use fileio with local block device files, if buffered operation is needed.

       Fileio also supports using an existing file, or creating a new file. New files are sparsely allocated by default.

   BLOCK
       Allows a local disk block device to be shared.

   PSCSI
       Allows a local SCSI device of any type to be shared. It is generally advised to prefer the block backstore if sharing a block SCSI device is desired.

   RAMDISK
       Allows kernel memory to be shared as a block SCSI device. Since memory is volatile, the contents of the ramdisk will be lost if the system restarts, and this backstore is best used for testing only.

       It also supports "nullio" mode, which is not backed by any storage. It discards all writes, and returns all-zeroes for reads.

   USERSPACE-BACKED
       Backstores starting with "user:" are not supported in the kernel, but rely on a userspace process to handle requests. See tcmu-runner(8) for more information on creating backstores of this type.

TARGETS
       Targets are instances of a fabric, which adapts the kernel target to a specific transport protocol such as iSCSI, Fibre Channel, or SBP-2. Creating a target in targetcli enables that  target  to  be
       configured. The name of the target, its WWN (world wide name), may link the configuration to a specific hardware endpoint, like SRP for example, or it may not, like iSCSI.

       Aside  from  "backstores",  all  other top-level configuration nodes in targetcli are fabrics that may have targets created for them. Fabrics that require hardware are only listed if the hardware is
       present and configured properly.

   CREATING A TARGET
       Use the create command within a fabric's node to create a target. If the fabric's targets are tied to hardware then targetcli will constrain the WWN to available hardware WWNs. These  can  be  shown
       via  tab-completion.  If  the  fabric is not tied to hardware, such as iSCSI, then targetcli will either auto-generate a WWN if none is given, or check that the given WWN has the correct format. All
       WWNs are prefaced by their type, such as "iqn", "naa", or "ib", and may be given with or without colons.

       iSCSI supports multiple WWN formats: iqn, naa, and eui. Other fabrics support single formats only.

CONFIGURING A TARGET
       Not all fabrics have the same capabilities. Targets on different fabrics will have different configuration node layouts. iSCSI has the most to configure; other fabrics  present  subsets  of  iSCSI's
       feature set.

CONFIGURING ISCSI
       iSCSI has the most options for configuration.

   TPGS
       TPGs  (Target Portal Groups) allow the iSCSI to support multiple complete configurations within one target. This is useful for complex quality-of-service configurations. targetcli will automatically
       create one TPG when the target is created, and almost all setups only need one.

   PORTALS
       An iSCSI target may be reached via multiple IP addresses and ports. These addr:port pairs are called portals.  Both IPv4 and IPv6 addresses are supported.

       When a target is created, targetcli automatically creates a default portal listening on all IPv4 addresses (shown as 0.0.0.0) on port 3260.  If a different configuration is needed, the default  por‐
       tal can be removed and portals configured as desired.

       If  the hardware supports it, iSER (iSCSI Extensions for RDMA) may be enabled via the enable_iser command within each portal's node.  Or, if the hardware supports it, hardware offload may be enabled
       via the enable_offload command within each portal's node.

   LUNS
       The kernel target exports SCSI Logical Units, also called LUNs.  This section links the previously-defined storage objects with the target, and defines which number (the  Logical  Unit  Number)  the
       device will use. Note that if ACLs are being used, a lun mapping must be created under the ACL that refers back to the TPG LUN.

   ACLS
       ACLs  (Access  Control Lists) allow different configuration, depending on the initiator that is connecting to the target. This includes both per-initiator authentication settings as well as per-ini‐
       tiator LUN mappings.

       create <wwn> in the acls node creates an ACL for an initiator, and create within the ACL creates a LUN mapping. (This can either refer to the TPG LUN, or to the storage object, in which case the TPG
       LUN will be configured as well.) Global setting auto_add_mapped_luns affects this, see below.

   AUTHENTICATION
       iSCSI  supports authentication via the CHAP protocol, which uses a username and password. The initiator may be required to supply valid credentials to the target, and the target may also be required
       to supply credentials back to the initiator. The latter is referred to as mutual authentication.

       Furthermore, authentication credentials may be different for each session phase (Discovery or Normal), and authentication in a Normal session may be set at the TPG level, or per-ACL.

       Discovery Authentication
       iSCSI Discovery sessions allow the initiator to connect to a portal and discover targets with the SendTargets command, but not access them. The four parameters userid, password,  mutual_userid,  and
       mutual_password are configured via set discovery_auth command within the top-level iscsi configuration node. 1-way authentication is enabled if userid and password are both set, and mutual authenti‐
       cation is enabled if all four are set. Authentication is disabled by unsetting the parameters.

       Normal Authentication
       Similarly, the four parameters userid, password, mutual_userid, and mutual_password are configured via set auth command within the TPG node and ACL nodes. However, LIO only uses one  or  the  other,
       depending  on the TPG's generate_node_acls attribute setting. If generate_node_acls is 1, the TPG-wide settings will be used. If generate_node_acls is 0, then the user-created ACLs' settings will be
       used.

       Enable generate_node_acls with set attribute generate_node_acls=1 within the TPG node. This can be thought of as "ignore ACLs mode" -- both authentication and LUN mapping will then use the TPG  set‐
       tings.

       No Authentication
       Authentication  is  disabled by clearing the TPG "authentication" attribute: set attribute authentication=0.  Although initiator names are trivially forgeable, generate_node_acls still works here to
       either ignore user-defined ACLs and allow all, or check that an ACL exists for the connecting initiator.

CONFIGURING FIBRE CHANNEL (QLA2XXX)
       Operation as a target requires that /sys/module/qla2xxx/parameters/qlini_mode report "disabled". This may require passing the qlini_mode=disabled parameter to the qla2xxx module when it loads.

CONFIGURING FIBRE CHANNEL OVER ETHERNET (TCM_FC)
       Ensure fcoeadm -i shows a working endpoint.

CONFIGURING SRP
       SRP (SCSI RDMA Protocol) requires that RDMA-capable hardware is present. It uses "ib" WWNs.

CONFIGURING LOOPBACK
       Storage objects may be re-exported as local SCSI devices with this fabric.

CONFIGURING OTHER FABRICS
       Other fabrics may be present. They are for specialized uses. Use at your own risk.

EXAMPLES
   DEFINING A STORAGE OBJECT WITHIN A BACKSTORE
       backstores/fileio create disk1 /disks/disk1.img 140M
       Creates a storage object named disk1 with the given path and size.  targetcli supports common size abbreviations like 'M', 'G', and 'T'.

   EXPORTING A STORAGE OBJECT VIA ISCSI
       iscsi/ create
       Creates an iSCSI target with a default WWN. It will also create an initial target portal group called tpg1.

       iqn.2003-01.org.linux-iscsi.test2.x8664:sn123456789012/tpg1/
       An example of changing to the configuration node for the given target's first target portal group (TPG). This is equivalent to giving the command prefixed by "cd". (Although more can be  useful  for
       certain setups, most configurations have a single TPG per target. In this case, configuring the TPG is equivalent to configuring the overall target.)

       portals/ create
       Add a portal, i.e. an IP address and TCP port via which the target can be contacted by initiators. Only required if the default 0.0.0.0:3260 portal is not present.

       luns/ create /backstores/fileio/disk1
       Create a new LUN in the TPG, attached to the storage object that has previously been defined. The storage object now shows up under the /backstores configuration node as activated.

       acls/ create iqn.1994-05.com.redhat:4321576890
       Creates an ACL (access control list) entry for the given iSCSI initiator.

       acls/iqn.1994-05.com.redhat:4321576890 create 2 0
       Gives  the  initiator access to the first exported LUN (lun0), which the initiator will see as lun2. The default is to give the initiator read/write access; if read-only access was desired, an addi‐
       tional "1" argument would be added to enable write-protect. (Note: if global setting auto_add_mapped_luns is true, this step is not necessary.)

   EXPORTING A STORAGE OBJECT VIA FCOE
       tcm_fc/ create 20:00:00:19:99:a8:34:bc
       Create an FCoE target with the given WWN.  targetcli can tab-complete the WWN based on registered FCoE interfaces. If none are found, verify that they are properly configured and are  shown  in  the
       output of fcoeadm -i.

       tcm_fc/20:00:00:19:99:a8:34:bc/
       If auto_cd_after_create is set to false, change to the configuration node for the given target, equivalent to giving the command prefixed by cd.

       luns/ create /backstores/fileio/disk1
       Create a new LUN for the interface, attached to a previously defined storage object. The storage object now shows up under the /backstores configuration node as activated.

       acls/ create 00:99:88:77:66:55:44:33
       Create an ACL (access control list), for defining the resources each initiator may access. The default behavior is to auto-map existing LUNs to the ACL; see help for more information.

       The LUN should now be accessible via FCoE.

OTHER COMMANDS
       saveconfig
       Save the current configuration settings to a file, from which settings will be restored if the system is rebooted. By default, this will save the configuration to /etc/target/saveconfig.json.

       This command is executed from the configuration root node.

       restoreconfig
       Restore target configuration from a file, the default is the file listed under saveconfig.  This will fail if there is already an established config, unless the clear_existing option is set to true.

       This command is executed from the configuration root node.

       clearconfig
       Clears the entire current local configuration. The parameter confirm=true must also be given, as a precaution.

       This command is executed from the configuration root node.

       sessions [ list | detail ] [sid]
       Lists the current open sessions or a specific session, with or without details.

       This command is executed from the configuration root node.

       exit
       Leave the configuration shell.

SETTINGS GROUPS
       Settings  are  broken  into  groups. Individual settings are accessed by get <group> <setting> and set <group> <setting>=<value>, and the settings of an entire group may be displayed by get <group>.
       All except for global are associated with a particular configuration node.

   GLOBAL
       Shell-related user-specific settings are in global, and are visible from all configuration nodes. They are mostly shell display options, but some starting with auto_ affect shell  behavior  and  may
       merit  customization. These include auto_save_on_exit, which controls if exiting targetcli saves the configuration; auto_add_mapped_luns, to automatically add existing LUNs to new ACLs, and new LUNS
       to existing ACLs; and auto_cd_after_create, to change working path to newly-created nodes.  Global settings are user-specific and are saved to ~/.targetcli/ upon exit, unlike other groups, which are
       system-wide and kept in /etc/target/saveconfig.json.

   BACKSTORE-SPECIFIC
       attribute
       /backstore/<type>/<name> configuration node. Contains values relating to the backstore and storage object.

   ISCSI-SPECIFIC
       discovery_auth
       /iscsi configuration node. Set the normal and mutual authentication userid and password for discovery sessions, as well as enabling or disabling it. By default it is disabled -- no authentication is
       required for discovery.

       parameter
       /iscsi/<target_iqn>/tpgX configuration node. ISCSI-specific parameters such as AuthMethod, MaxBurstLength, IFMarker, DataDigest, and similar.

       attribute
       /iscsi/<target_iqn>/tpgX configuration node. Contains implementation-specific settings for the TPG, such as authentication, to enforce or disable authentication for the full-feature phase (i.e. non-
       discovery).

       auth
       /iscsi/<target_iqn>/tpgX/acls/<initiator_iqn> configuration node. Set the userid and password for full-feature phase for this ACL.

FILES
       /etc/target/saveconfig.json
       /etc/target/backup/*

ENVIRONMENT
   TARGETCLI_HOME
       If set, this variable points to a directory that should be used instead of ~/.targetctl

SEE ALSO
       targetctl(8), tcmu-runner(8)

AUTHOR
       Written by Jerome Martin <jxm@risingtidesystems.com>.
       Man page written by Andy Grover <agrover@redhat.com>.

REPORTING BUGS
       Report bugs via <targetcli-fb-devel@lists.fedorahosted.org>
       or <https://github.com/open-iscsi/targetcli-fb/issues>



                                                                                                                                                                                                 targetcli(8)
