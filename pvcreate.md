PVCREATE(8)                                                   System Manager's Manual                                                  PVCREATE(8)

NAME
       pvcreate — initialize a disk or partition for use by LVM

SYNOPSIS
       pvcreate   [--commandprofile  ProfileName]  [-d|--debug]  [-h|--help]  [-t|--test]  [-v|--verbose]  [--version]  [-f[f]|--force  [--force]]
       [-y|--yes] [--labelsector] [--bootloaderareasize size] [-M|--metadatatype type] [--[pv]metadatacopies NumberOfCopies] [--metadatasize size]
       [--metadataignore  {y|n}]  [--dataalignment  alignment]  [--dataalignmentoffset  alignment_offset]  [--restorefile  file] [--norestorefile]
       [--reportformat {basic|json}] [--setphysicalvolumesize size] [-u|--uuid uuid] [-Z|--zero {y|n}] PhysicalVolume [PhysicalVolume...]

DESCRIPTION
       pvcreate initializes PhysicalVolume for later use by the Logical Volume Manager (LVM).  Each PhysicalVolume can be a disk partition,  whole
       disk,  meta  device,  or  loopback  file.   For DOS disk partitions, the partition id should be set to 0x8e using fdisk(8), cfdisk(8), or a
       equivalent. For GUID Partition Table (GPT), the id is E6D6D379-F507-44C2-A23C-238F2A3DF928. For whole disk devices only the partition table
       must be erased, which will effectively destroy all data on that disk.  This can be done by zeroing the first sector with:

       dd if=/dev/zero of=PhysicalVolume bs=512 count=1

       Continue with vgcreate(8) to create a new volume group on PhysicalVolume, or vgextend(8) to add PhysicalVolume to an existing volume group.

OPTIONS
       See lvm(8) for common options.

       -f, --force
              Force  the creation without any confirmation.  You can not recreate (reinitialize) a physical volume belonging to an existing volume
              group.  In an emergency you can override this behaviour with -ff.

       -u, --uuid uuid
              Specify the uuid for the device.  Without this option, pvcreate(8) generates a random uuid.  All of your physical volumes must  have
              unique  uuids.   You  need  to  use  this  option before restoring a backup of LVM metadata onto a replacement device - see vgcfgre‐
              store(8).  As such, use of --restorefile is compulsory unless the --norestorefile is used.

       -y, --yes
              Answer yes to all questions.

       -Z, --zero {y|n}
              Whether or not the first 4 sectors (2048 bytes) of the device should be wiped.  If this option is not given, the default is to  wipe
              these sectors unless either or both of the --restorefile or --uuid options were specified.

NEW METADATA OPTIONS
       LVM2  introduces  a  new format for storing metadata on disk.  This new format is more efficient and resilient than the format the original
       version of LVM used and offers the advanced user greater flexibility and control.

       The new format may be selected on the command line with -M2 or by setting format = "lvm2" in the global section of lvm.conf(5).  Each phys‐
       ical  volume in the same volume group must use the same format, but different volume groups on a machine may use different formats simulta‐
       neously: the tools can handle both formats.  Additional formats can be added as shared libraries.

       Additional tools for manipulating the locations and sizes of metadata areas will be written in due course.  Use the  verbose/debug  options
       on the tools to see where the metadata areas are placed.

       --metadatasize size
              The approximate amount of space to be set aside for each metadata area.  (The size you specify may get rounded.)

       --dataalignment alignment
              Align  the  start of the data to a multiple of this number.  You should also specify an appropriate PhysicalExtentSize when creating
              the Volume Group with vgcreate.

              To see the location of the first Physical Extent of an existing Physical Volume use pvs -o +pe_start .  It will be a multiple of the
              requested  alignment.   In  addition  it  may  be  shifted  by  alignment_offset from data_alignment_offset_detection (if enabled in
              lvm.conf(5)) or --dataalignmentoffset.

       --dataalignmentoffset alignment_offset
              Shift the start of the data area by this additional alignment_offset.

       --[pv]metadatacopies NumberOfCopies
              The number of metadata areas to set aside on each PV.  Currently this can be 0, 1 or 2.  If set to 2, two copies of the volume group
              metadata  are  held  on  the  PV, one at the front of the PV and one at the end.  If set to 1 (the default), one copy is kept at the
              front of the PV (starting in the 5th sector).  If set to 0, no copies are kept on this PV - you might wish to use this with VGs con‐
              taining  large numbers of PVs.  But if you do this and then later use vgsplit(8) you must ensure that each VG is still going to have
              a suitable number of copies of the metadata after the split!

       --metadataignore {y|n}
              Ignore or un-ignore metadata areas on this physical volume.  The default is "n".  This setting can be  changed  with  pvchange.   If
              metadata  areas on a physical volume are ignored, LVM will not store metadata in the metadata areas present on this Physical Volume.
              Metadata areas cannot be created or extended after Logical Volumes have been allocated on the device. If you do not  want  to  store
              metadata  on  this  device,  it  is  still wise always to allocate a metadata area in case you need it in the future and to use this
              option to instruct LVM2 to ignore it.

       --restorefile file
              In conjunction with --uuid, this extracts the location and size of the data on the PV from the file (produced  by  vgcfgbackup)  and
              ensures that the metadata that the program produces is consistent with the contents of the file i.e. the physical extents will be in
              the same place and not get overwritten by new metadata.  This provides a mechanism to upgrade the metadata format or  to  add/remove
              metadata areas. Use with care. See also vgconvert(8).

       --norestorefile
              In conjunction with --uuid, this allows a uuid to be specified without also requiring that a backup of the metadata be provided.

       --labelsector sector
              By  default  the  PV is labelled with an LVM2 identifier in its second sector (sector 1).  This lets you use a different sector near
              the start of the disk (between 0 and 3 inclusive - see LABEL_SCAN_SECTORS in the source).  Use with care.

       --bootloaderareasize size
              Create a separate bootloader area of specified size besides PV's data area. The bootloader area is an area of reserved space on  the
              PV  from which LVM2 will not allocate any extents and it's kept untouched. This is primarily aimed for use with bootloaders to embed
              their own data or metadata.  The start of the bootloader area is always aligned, see also --dataalignment and --dataalignmentoffset.
              The  bootloader area size may eventually end up increased due to the alignment, but it's never less than the size that is requested.
              To see the bootloader area start and size of an existing Physical Volume use pvs -o +pv_ba_start,pv_ba_size.

       --setphysicalvolumesize size
              Overrides the automatically-detected size of the PV.  Use with care.

Examples
       Initialize partition #4 on the third SCSI disk and the entire fifth SCSI disk for later use by LVM:

       pvcreate /dev/sdc4 /dev/sde

       If the 2nd SCSI disk is a 4KiB sector drive that compensates for windows partitioning (sector 7 is the lowest aligned  logical  block,  the
       4KiB sectors start at LBA -1, and consequently sector 63 is aligned on a 4KiB boundary) manually account for this when initializing for use
       by LVM:

       pvcreate --dataalignmentoffset 7s /dev/sdb

SEE ALSO
       lvm.conf(5), lvm(8), vgcreate(8), vgextend(8), lvcreate(8), cfdisk(8), fdisk(8), losetup(8), mdadm(8), vgcfgrestore(8), vgconvert(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             PVCREATE(8)
