SG_RESET(8)                                                                                       SG3_UTILS                                                                                       SG_RESET(8)



NAME
       sg_reset - sends SCSI device, target, bus or host reset; or checks reset state

SYNOPSIS
       sg_reset [--bus] [--device] [--help] [--host] [--no-esc] [--target] [--verbose] [--version] DEVICE

DESCRIPTION
       The  sg_reset  utility  with  no options (just a DEVICE) reports on the reset state (e.g. if a reset is underway) of the DEVICE. When given a --device, --target, --bus or --host option it requests a
       device, target, bus or host reset respectively.

       A device reset is applied to the Logical Unit (LU) corresponding to DEVICE. It is most likely implemented by a Low level Driver (LLD) in Linux as a LOGICAL UNIT RESET task management function.

       The ability to reset a SCSI target was added in Linux kernel 2.6.27 . A LLD may send Low level Drivers (LLDs) the I_T NEXUS RESET task management function. Alternatively it may use a transport mech-
       anism to do the same thing (e.g. a hard reset on the link containing a SAS target).

       In the Linux kernel 2.6 and 3 series this utility can be called on sd, sr (cd/dvd), st or sg device nodes; if the user has appropriate permissions.

       Users  of this utility can check whether a reset recovery is already underway before trying to send a new reset with this utility. Calling this utility with no options, just the DEVICE, will do such
       a check.

OPTIONS
       -b, --bus
              attempt a SCSI bus reset. A bus reset is a SCSI Parallel Interface (SPI) concept not found in modern transports. A recent LLD may implement it as a series of resets on targets that  might  be
              considered as siblings to the target on the DEVICE path.

       -d, --device
              attempt a SCSI device reset. This would typically involve sending a LOGICAL UNIT RESET task management function to DEVICE.

       -h, --help
              print the usage message then exit.

       -H, --host
              attempt a host reset. The "host" in this context is often called a Host Bus Adapter (HBA) and contains one or more SCSI initiators.

       -N, --no-esc
              without  this  option,  if  a  device reset (--device) fails then it will escalate to a target reset. And if a target reset (--target) fails then it will escalate to a bus reset. And if a bus
              reset (--bus) fails then it will escalate to a host reset. With this option only the requested reset is attempted. An alternate option name of --no-escalate is also accepted.

       -t, --target
              attempt a SCSI target reset. A SCSI target contains one or more LUs. This would typically involve sending a I_T NEXUS RESET task management function to DEVICE There may be a transport  action
              that is equivalent (e.g.  in SAS a hard reset on the link that contains the target).

       -v, --verbose
              increase the degree of verbosity (debug messages).

       -V, --version
              prints the version string then exits.

NOTES
       The  error recovery code within the Linux kernel (SCSI mid-level) when faced with a SCSI command timing out and no response from the device (LU) does the following. First it tries a device reset and
       if that is not successful tries a target reset. If that is not successful it tries a bus reset. If that is not successful it tries a host reset. The "device,target,bus,host" order is the reset esca-
       lation that the --no-esc option attempts to stop. In large storage configurations the escalation may be (very) undesirable.

       This utility calls the SG_SCSI_RESET ioctl and as of lk 3.10.7 the --no-esc option is not supported. Patches to implement this functionality may be accepted in lk 3.18 or 3.19 .

       SAM-4 and 5 define a hard reset, a LOGICAL UNIT RESET and a I_T NEXUS RESET. A hard reset is defined to be a power on condition, a microcode change or a transport reset event. LOGICAL UNIT RESET and
       I_T NEXUS RESET can be requested via task management functions (and support for LOGICAL UNIT RESET is mandatory). In Linux the SCSI subsystem leaves it up to the LLDs as to  exactly  what  type  (if
       any)  of  reset  is  performed.   The  "bus reset" is SCSI Parallel Interface (SPI) concept that may not map well to recent SCSI transports so it may be a dummy operation. A "host reset" attempts to
       re-initialize the HBA that the request passes through en route to the DEVICE. Note that a "host reset" and a "bus reset" may cause collateral damage.

       This utility does not allow individual SCSI commands to be aborted. SAM-4 defines ABORT TASK and ABORT TASK SET task management functions for that.

       Prior to SAM-3 there was a TARGET RESET task management function. And in SAM-4 I_T NEXUS RESET appeared which seems closely related: the "I_T" stands for Initiator-Target.

       Transports may have their own types of resets not supported by this utility.  For example SAS has a link reset in which both ends of a physical link (e.g.  between a SAS  expander  and  a  SAS  tape
       drive) renegotiate their connection.

       Prior  to  version  0.57  of this utility the command line had short options only (e.g. -d but not --device). Also -h invoked a host reset while in the current version -h is equivalent to --help and
       both -H and --host invoke a host reset. For backward compatibility define the environment variable SG3_UTILS_OLD_OPTS or SG_RESET_OLD_OPTS . In this case -h will invoke a host reset and  the  output
       will be verbose as it was previously (equivalent to using the --verbose option now).  For example:

           SG_RESET_OLD_OPTS=1 sg_reset -h /dev/sg1
       sg_reset: starting host reset
       sg_reset: completed host reset

AUTHORS
       Written by Douglas Gilbert.

COPYRIGHT
       Copyright © 1999-2014 Douglas Gilbert
       This software is distributed under the GPL version 2. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



sg3_utils-1.40                                                                                   October 2014                                                                                     SG_RESET(8)
