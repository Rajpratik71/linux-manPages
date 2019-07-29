VGEXTEND(8)                                                   System Manager's Manual                                                  VGEXTEND(8)

NAME
       vgextend — add physical volumes to a volume group

SYNOPSIS
       vgextend  [-A|--autobackup  {y|n}] [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [--reportformat {basic|json}] [--restoremiss‐
       ing] [-f|--force] [-t|--test] [-v|--verbose] [PHYSICAL DEVICE OPTIONS] VolumeGroupName PhysicalDevicePath [PhysicalDevicePath...]

DESCRIPTION
       vgextend allows you to add one or more initialized physical volumes (see pvcreate(8)) to an existing volume group to  extend  it  in  size.
       Moreover,  it  allows  you to re-add a physical volume that has gone missing previously, due to a transient device failure, without re-ini‐
       tialising it. Use vgextend --restoremissing to that effect.

       If PhysicalDevicePath was not previously configured for LVM with pvcreate(8), the device will be initialized with the same  default  values
       used with pvcreate(8).  If non-default pvcreate(8) values are desired, they may be given on the commandline with the same options as pvcre‐
       ate(8).  See PHYSICAL DEVICE OPTIONS for available options.  Note that the  restore-related  options  such  as  --restorefile,  --uuid  and
       --physicalvolumesize are not available.  If a restore operation is needed, use pvcreate(8) and vgcfgrestore(8).

OPTIONS
       See lvm(8) for common options.

PHYSICAL DEVICE OPTIONS
       The  following  options  are  available  for initializing physical devices in the volume group.  These options are further described in the
       pvcreate(8) man page.

       -f, --force

       -y, --yes

       -Z, --zero {y|n}

       --labelsector sector

       --metadatasize size

       --metadataignore {y|n}

       --pvmetadatacopies copies

       --dataalignment alignment

       --dataalignmentoffset alignment_offset

Examples
       Extends the existing volume group "vg00" by the new physical volumes (see pvcreate(8)) "/dev/sda4" and "/dev/sdn1".

       vgextend vg00 /dev/sda4 /dev/sdn1

SEE ALSO
       lvm(8), vgcreate(8), vgreduce(8), pvcreate(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             VGEXTEND(8)
