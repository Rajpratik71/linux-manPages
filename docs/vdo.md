VDO(8)                                                                                     System Manager's Manual                                                                                     VDO(8)



NAME
       vdo - manage kernel VDO devices and related configuration information

SYNOPSIS
       vdo  {  activate  |  changeWritePolicy  |  create  |  deactivate  | disableCompression | disableDeduplication | enableCompression | enableDeduplication | growLogical | growPhysical | list | modify |
             printConfigFile | remove | start | status | stop } [ options... ]

DESCRIPTION
       The commands available are:

       activate
              Activates one or more VDO volumes. Activated volumes can be started using the start command. This command must be run with root privileges. Applicable options include:
                      { --all | --name=volume } (required)
                      --confFile=file
                      --logfile=file
                      --verbose

       changeWritePolicy
              Modifies the write policy of one or all running VDO volumes. This command must be run with root privileges.  Applicable options include:
                      { --all | --name=volume } (required)
                      --writePolicy={  sync  |  async  |  auto }  (required)
                      --confFile=file
                      --logfile=file
                      --verbose

       create Creates a VDO volume and its associated index and makes it available. If --activate=disabled is specified the VDO volume is created but not made available.

              If the specified device is already in use by a VDO volume (as determined from the configuration file) the create will always be rejected, even if --force is specified.  If the device  is  not
              so in use but is formatted as a VDO volume or contains an existing file system the create will be rejected unless --force is given.

              This command must be run with root privileges.

              Applicable options include:
                      --name=volume (required)
                      --device=device (required)
                      --activate={  enabled  |  disabled  }
                      --blockMapCacheSize=size
                      --blockMapPeriod=period
                      --compression={  enabled  |  disabled  }
                      --deduplication={  enabled  |  disabled  }
                      --emulate512={  enabled  |  disabled  }
                      --indexMem=size
                      --readCache={  enabled  |  disabled  }
                      --readCacheSize=size
                      --sparseIndex={  enabled  |  disabled  }
                      --vdoAckThreads=thread count
                      --vdoBioRotationInterval=I/O count
                      --vdoBioThreads=thread count
                      --vdoCpuThreads=thread count
                      --vdoHashZoneThreads=thread count
                      --vdoLogicalThreads=thread count
                      --vdoLogLevel=level
                      --vdoLogicalSize=size
                      --vdoPhysicalThreads=thread count
                      --vdoSlabSize=size
                      --writePolicy={  sync  |  async  |  auto }
                      --confFile=file
                      --logfile=file
                      --verbose

       deactivate
              Deactivates  one or more VDO volumes. Deactivated volumes cannot be started by the start command. Deactivating a currently running volume does not stop it. Once stopped a deactivated VDO vol‐
              ume must be activated before it can be started again. This command must be run with root privileges.  Applicable options include:
                      { --all | --name=volume } (required)
                      --confFile=file
                      --logfile=file
                      --verbose

       disableCompression
              Disables compression on one or more VDO volumes. If the VDO volume is running, takes effect immediately.  If the VDO volume is not running compression will be disabled the next time  the  VDO
              volume is started. This command must be run with root privileges. Applicable options include:
                      { --all | --name=volume } (required)
                      --confFile=file
                      --logfile=file
                      --verbose

       disableDeduplication
              Disables  deduplication  on  one or more VDO volumes. If the VDO volume is running, takes effect immediately. If the VDO volume is not running deduplication will be disabled the next time the
              VDO volume is started. This command must be run with root privileges. Applicable options include:
                      { --all | --name=volume } (required)
                      --confFile=file
                      --logfile=file
                      --verbose

       enableCompression
              Enables compression on one or more VDO volumes. If the VDO volume is running, takes effect immediately. If the VDO volume is not running compression will be enabled the next time the VDO vol‐
              ume is started. This command must be run with root privileges.  Applicable options include:
                      { --all | --name=volume } (required)
                      --confFile=file
                      --logfile=file
                      --verbose

       enableDeduplication
              Enables  deduplication on one or more VDO volumes. If the VDO volume is running, takes effect immediately. If the VDO volume is not running deduplication will be enabled the next time the VDO
              volume is started. This command must be run with root privileges. Applicable options include:
                      { --all | --name=volume } (required)
                      --confFile=file
                      --logfile=file
                      --verbose

       growLogical
              Grows the logical size of a VDO volume. The volume must exist and must be running. This command must be run with root privileges. Applicable options include:
                      --name=volume (required)
                      --vdoLogicalSize=size (required)
                      --confFile=file
                      --logfile=file
                      --verbose

       growPhysical
              Grows the physical size of a VDO volume. The volume must exist and must be running. This command must be run with root privileges. Applicable options include:
                      --name=volume (required)
                      --confFile=file
                      --verbose
                      --logfile=file

       list   Displays a list of started VDO volumes. If --all is specified it displays both started and non-started volumes. This command must be run with root privileges. Applicable options include:
                      --all
                      --confFile=file
                      --logfile=file
                      --verbose

       modify Modifies configuration parameters of one or all VDO volumes. Changes take effect the next time the VDO device is started; already-running devices are not affected. Applicable options include:
                      { --all | --name=volume } (required)
                      --blockMapCacheSize=size
                      --blockMapPeriod=period
                      --readCache={  enabled  |  disabled  }
                      --readCacheSize=size
                      --vdoAckThreads=thread count
                      --vdoBioThreads=thread count
                      --vdoCpuThreads=thread count
                      --vdoHashZoneThreads=thread count
                      --vdoLogicalThreads=thread count
                      --vdoPhysicalThreads=thread count
                      --confFile=file
                      --logfile=file
                      --verbose

       printConfigFile
              Prints the configuration file to stdout. This command does not require root privileges. Applicable options include:
                      --confFile=file
                      --logfile=file
                      --verbose

       remove Removes one or more stopped VDO volumes and associated indexes. This command must be run with root privileges.  Applicable options include:
                      { --all | --name=volume } (required)
                      --force
                      --confFile=file
                      --logfile=file
                      --verbose

       start  Starts one or more stopped, activated VDO volumes and associated services. This command must be run with root privileges. Applicable options include:
                      { --all | --name=volume } (required)
                      --forceRebuild
                      --confFile=file
                      --logfile=file
                      --verbose

       status Reports VDO system and volume status in YAML format. This command does not require root privileges though information will be incomplete if run without.  Applicable options include:
                      { --all | --name=volume }
                      --confFile=file
                      --logfile=file
                      --verbose
              See below for the output provided.

       stop   Stops one or more running VDO volumes and associated services. This command must be run with root privileges. Applicable options include:
                      { --all | --name=volume } (required)
                      --force
                      --confFile=file
                      --logfile=file
                      --verbose

       The status command returns the following information in YAML format, divided into keys as follows:

       VDO Status
              Information in this key covers the name of the host and date and time at which the status inquiry is being made. Parameters reported in this area include:

              Node   The host name of the system on which VDO is running.

              Date   The date and time at which the vdo status command is run.

       Kernel Module
              Information in this key covers the configured kernel.

              Loaded Whether or not the kernel module is loaded (True or False).

              Version Information
                     Information on the version of kvdo that is configured.

       Configuration
              Information in this key covers the location and status of the VDO configuration file.

              File   Location of the VDO configuration file.

              Last modified
                     The last-modified date of the VDO configuration file.

       VDOs   Provides configuration information for all VDO volumes.  Parameters reported for each VDO volume include:

              Block size
                     The block size of the VDO volume, in bytes.

              Emulate 512 byte
                     Indicates whether the volume is running in 512-byte emulation mode.

              Deduplication
                     Whether deduplication is enabled for the volume.

              Logical size
                     The logical size of the VDO volume.

              Physical size
                     The size of a VDO volume's underlying physical storage.

              Configured write policy
                     The configured value of the write policy (sync, async or auto).

              VDO Statistics
                     Output of the vdostats utility.

OPTIONS
       The options supported by some or all of the commands listed above include:

       --activate={  enabled  |  disabled  }
              Indicates if the VDO volume should, in addition to being created, be activated and started. The default is enabled.

       --all
       -a
              Indicates that the command should be applied to all configured VDO volumes. May not be used with --name.

       --blockMapCacheSize=megabytes
              Specifies the amount of memory allocated for caching block map pages; the value must be a multiple of 4096.  Using a value with a B (bytes), K (kilobytes), M  (megabytes),  G  (gigabytes),  T
              (terabytes),  P  (petabytes)  or  E (exabytes) suffix is optional. If no suffix is supplied, the value will be interpreted as megabytes. The value must be at least 128M and less than 16T. The
              cache must be at least 16MB per logical thread. Note that there is a memory overhead of 15%. The default is 128M.

       --blockMapPeriod=period
              Tunes the quantity of block map updates that can accumulate before cache pages are flushed to disk. The value must at least 1 and less than or equal to 16380.  A  lower  value  means  shorter
              recovery time but lower performance. The default value is 16380.

       --compression={  enabled  |  disabled  }
              Enables  or  disables  compression  when creating a VDO volume. The default is enabled. Compression may be disabled if necessary to maximize performance or to speed processing of data that is
              unlikely to compress.

       --confFile=file
       -ffile
              Specifies an alternate configuration file; the default is /etc/vdoconf.yml.

       --deduplication={  enabled  |  disabled  }
              Enables or disables deduplication when creating a VDO volume. The default is enabled. Deduplication may be disabled in instances where data is not expected to have  good  deduplication  rates
              but compression is still desired.

       --device=absolute_path
              Specifies  an  absolute  path of the device to use for VDO storage.  This might not be the path that gets used to access the storage device by future command invocations; see the DEVICE NAMES
              section below.

       --emulate512={  enabled  |  disabled  }
              Specifies that the VDO volume is to emulate a 512 byte block device. The default is disabled.

       --force
              When creating a volume, ignores any existing file system or VDO signature already present in the storage device. When stopping or removing a VDO volume, first unmounts the file system  stored
              on the device if mounted.

       --forceRebuild
              Forces an offline rebuild of a read-only VDO's metadata before starting so that it may be brought back online and made available. This option may result in data loss or corruption.

       --indexMem=gigabytes
              Specifies  the amount of index memory in gigabytes; the default is currently 0.25 GB. The special decimal values 0.25, 0.5, 0.75 can be used, as can any integer value at least 1 and less than
              or equal to 1024. (The special decimal values are matched as exact strings; "0.5" works but "0.50" is not accepted.)

              Larger values will require more disk space. For a dense index, each gigabyte of index memory will use approximately 11 GB of storage. For a sparse index, each gigabyte of  index  memory  will
              use approximately 100 GB of storage.

       --help
       -h
              If specified with vdo only, displays documentation for the vdo utility.  If specified with a command, displays documentation for that command.

       --logfile=pathname
              Specify the path of the file to which log messages are directed. If unspecified, log messages will go to syslog. Warning and error messages are always logged to syslog.

       --name=volume
       -nvolume
              Operates on the specified VDO volume. May not be used with --all.

       --readCache={  enabled  |  disabled  }
              Enables  or disables the read cache within the VDO device. The cache should be enabled if write workloads are expected to have high levels of deduplication, or for read intensive workloads of
              highly compressible data. The default is disabled.

       --readCacheSize=megabytes
              Specifies the extra VDO device read cache size in megabytes. This space is in addition to a system-defined minimum. Using a value with a B (bytes), K  (kilobytes),  M  (megabytes),  G  (giga‐
              bytes),  T  (terabytes),  P (petabytes) or E (exabytes) suffix is optional.  The value must be at least 0 and less than 16T. 1.12 MB of memory will be used per MB of read cache specified, per
              bio thread. The default is 0.

       --sparseIndex={  enabled  |  disabled  }
              Enables sparse indexing. The default is disabled.

       --vdoAckThreads=thread count
              Specifies the number of threads to use for acknowledging completion of requested VDO I/O operations. The value must be at least 0 and less than or equal to 100. The default is 1.

       --vdoBioRotationInterval=I/O count
              Specifies the number of I/O operations to enqueue for each bio-submission thread before directing work to the next. The value must be at least 1 and less than or equal to 1024. The default is
              64.

       --vdoBioThreads=thread count
              Specifies  the number of threads to use for submitting I/O operations to the storage device. The value must be at least 1 and less than or equal to 100. Each additional thread after the first
              will use an additional 18 MB of RAM, plus 1.12 MB of RAM per megabyte of configured read cache size. The default is 4.

       --vdoCpuThreads=thread count
              Specifies the number of threads to use for CPU-intensive work such as hashing or compression. The value must be at least 1 and less than or equal to 100. The default is 2.

       --vdoHashZoneThreads=thread count
              Specifies the number of threads across which to subdivide parts of the VDO processing based on the hash value computed from the block data. The value must be at least 0 and less than or equal
              to 100. vdoHashZonesThreads, vdoLogicalThreads and vdoPhysicalThreads must be either all zero or all non-zero. The default is 1.

       --vdoLogicalThreads=thread count
              Specifies the number of threads across which to subdivide parts of the VDO processing based on the hash value computed from the block data. The value must be at least 0 and less than or equal
              to 100. A logical thread count of 9 or more will require explicitly specifying a sufficiently large block map cache  size,  as  well.   vdoHashZonesThreads,  vdoLogicalThreads  and  vdoPhysi‐
              calThreads must be either all zero or all non-zero. The default is 1.

       --vdoLogicalSize=megabytes
              Specifies  the  logical  VDO  volume size in megabytes.  Using a value with a S (sectors), B (bytes), K (kilobytes), M (megabytes), G (gigabytes), T (terabytes), P (petabytes) or E (exabytes)
              suffix is optional. Used for over-provisioning volumes. The maximum size supported is 4P. The default is the size of the storage device.

       --vdoLogLevel=level
              Specifies the VDO driver log level: critical, error, warning, notice, info, or debug. Levels are case sensitive; the default is info.

       --vdoPhysicalThreads=thread count
              Specifies the number of threads across which to subdivide parts of the VDO processing based on physical block addresses. The value must be at least 0 and less than or equal to 16. Each  addi‐
              tional thread after the first will use an additional 10 MB of RAM. vdoPhysicalThreads, vdoHashZonesThreads and vdoLogicalThreads must be either all zero or all non-zero. The default is 1.

       --vdoSlabSize=megabytes
              Specifies the size of the increment by which a VDO is grown. Using a smaller size constrains the total maximum physical size that can be accommodated.  Must be a power of two between 128M and
              32G.  Using a value with a S (sectors), B (bytes), K (kilobytes), M (megabytes), G (gigabytes), T (terabytes), P (petabytes) or E (exabytes) suffix is optional. If  no  suffix  is  used,  the
              value will be interpreted as megabytes. The default is 2G.

       --verbose
              Prints commands before executing them.

       --writePolicy={  sync  |  async  |  auto }
              Specifies the write policy:

              sync   Writes are acknowledged only after data is stably written. This policy is not supported if the underlying storage is not also synchronous.

              async  Writes are acknowledged after data has been cached for writing to stable storage. Data which has not been flushed is not guaranteed to persist in this mode.

              auto   VDO will check the storage device and determine whether it supports flushes. If it does, VDO will run in async mode, otherwise it will run in sync mode. This is the default.

DEVICE NAMES
       Device  recognition order can change at boot time, and devices can be added to or removed from a system, both possibly affecting device naming at boot time, so a device recognized as /dev/sda at one
       time may be /dev/sdb after a reboot.

       In the directory /dev/disk/by-id, udev normally creates symbolic links after booting when devices are identified, and are named based on device serial numbers, UUIDs, WWNs, etc., so they  should  be
       more stable names across reboots for referring to the device in question.

       When a VDO device is created, vdo will look for links in /dev/disk/by-id that refer to the same block device as the one supplied on the command line, and if some are found, use one of those instead.
       This name will be written into the config file for future use. If no such links are found, the device name as supplied is used.

       This may cause problems if a VDO storage volume needs to be copied from a failing device to a replacement, or from a small device to a larger one to allow for expansion. In  cases  like  these,  the
       config  file  may need to be edited to refer to the new device; there is currently no automated way to make this change with the administrative tools. (If a logical volume is used as the VDO storage
       volume, VDO will find the storage via the volume's UUID; the standard LVM tools can be used to manage the migration or growth of the volume.)

       If a multipath device is used, udev should be configured to either not create any /dev/disk/by-id symbolic links for any of the devices used, or to only  create  a  link  for  the  multipath  device
       itself.

FILES
       /etc/vdoconf.yml
              The default configuration file; used if the --confFile option is not provided.

EXAMPLES
       Creation of a VDO device named vdo0, with a 10 terabyte thinly-provisioned logical address size:

       # vdo create --name=vdo0 --device=/dev/sdb1 --vdoLogicalSize=10T
       Creating VDO vdo0
       Starting VDO vdo0
       Starting compression on VDO vdo0
       VDO instance 1 volume is ready at /dev/mapper/vdo0
       #

       Of  course, as with any thinly-provisioned device, it may not hold 10 terabytes of user data even after deduplication and compression unless the underlying storage has sufficient space available for
       the resulting compressed, unique data blocks plus metadata overhead.

EXIT STATUS
       The following are exit statuses that may be encountered during normal operation.  Any other exit status is an abnormal occurrence.

       0      Success.

       1      Non-specific failure.

       2      Pre-processing argument parsing failure.

       3      Non-specific processing failure.

       5      Incorrect state for requested action; e.g., attempting to perform a growPhysical on a stopped vdo.

       6      A requested operation from the system failed; e.g., error from dmsetup(8).

       7      User error; e.g., attempting to create a vdo with the same name as one already existing.

SEE ALSO
       udev(7), vdostats(8).



Red Hat                                                                                           2018-07-19                                                                                           VDO(8)
