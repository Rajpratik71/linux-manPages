PVMOVE(8)                                                                                System Manager's Manual                                                                                PVMOVE(8)

NAME
       pvmove — move physical extents

SYNOPSIS
       pvmove  [--abort] [--alloc AllocationPolicy] [--atomic] [-b|--background] [--commandprofile ProfileName] [-d|--debug] [-h|--help] [-i|--interval Seconds] [--noudevsync] [-v|--verbose] [-n|--name
       LogicalVolume] [SourcePhysicalVolume[:PE[-PE]...]  [DestinationPhysicalVolume[:PE[-PE]...]...]]

DESCRIPTION
       pvmove allows you to move the allocated physical extents (PEs) on SourcePhysicalVolume to one or more other physical volumes (PVs).  You can optionally specify a source  LogicalVolume  in  which
       case only extents used by that LV will be moved to free (or specified) extents on DestinationPhysicalVolume(s).  If no DestinationPhysicalVolume is specified, the normal allocation rules for the
       Volume Group are used.

       If pvmove gets interrupted for any reason (e.g. the machine crashes) then run pvmove again without any PhysicalVolume arguments to restart any moves that were in progress from  the  last  check‐
       point.   Alternatively  use pvmove --abort at any time to abort.  The resulting location of logical volumes after an abort is issued depends on whether the --atomic option was used when starting
       the pvmove process.

       You can run more than one pvmove at once provided they are moving data off different SourcePhysicalVolumes, but additional pvmoves will ignore any Logical Volumes already in the process of being
       changed, so some data might not get moved.

       pvmove works as follows:

       1. A temporary 'pvmove' Logical Volume is created to store details of all the data movements required.

       2. Every Logical Volume in the Volume Group is searched for contiguous data that need moving according to the command line arguments.  For each piece of data found, a new segment is added to the
       end of the pvmove LV.  This segment takes the form of a temporary mirror to copy the data from the original location to a newly-allocated location.  The original LV is updated  to  use  the  new
       temporary mirror segment in the pvmove LV instead of accessing the data directly.

       3. The Volume Group metadata is updated on disk.

       4. The first segment of the pvmove Logical Volume is activated and starts to mirror the first part of the data.  Only one segment is mirrored at once as this is usually more efficient.

       5.  A  daemon repeatedly checks progress at the specified time interval.  When it detects that the first temporary mirror is in-sync, it breaks that mirror so that only the new location for that
       data gets used and writes a checkpoint into the Volume Group metadata on disk.  Then it activates the mirror for the next segment of the pvmove LV.

       6. When there are no more segments left to be mirrored, the temporary Logical Volume is removed and the Volume Group metadata is updated so that the Logical Volumes reflect the  new  data  loca‐
       tions.

       Note that this new process cannot support the original LVM1 type of on-disk metadata.  Metadata can be converted using vgconvert(8).

       If  the  --atomic  option  is  used,  a  slightly  different  approach is used for the move.  Again, a temporary 'pvmove' logical volume is created to store the details of all the data movements
       required.  This temporary LV contains all the segments of the various LVs that need to be moved.  However this time, an identical logical volume is allocated that contains  the  same  number  of
       segments  and a mirror is created to copy the contents from the first temporary LV to the second.  When a complete copy is accomplished, the temporary logical volumes are removed, leaving behind
       the segments on the destination physical volume.  If an abort is issued during the move, all logical volumes being moved will remain on the source physical volume.

OPTIONS
       See lvm(8) for common options.

       --abort
              Abort any moves in progress.  If the --atomic option was used to start the pvmove, all logical volumes will remain on the source physical volume.  Otherwise, those segments that have com‐
              pleted the move will stay on the destination physical volume, while those that have not will remain on the source physical volume.

       --atomic
              Make  the entire operation atomic.  That is, ensure that all affected logical volumes are moved to the destination physical volume together; unless the move has been aborted.  If the move
              has been aborted, all logical volumes will remain on the source physical volume.

       --noudevsync
              Disable udev synchronisation. The process will not wait for notification from udev.  It will continue irrespective of any possible udev processing in the background.  You should only  use
              this if udev is not running or has rules that ignore the devices LVM2 creates.

       -b, --background
              Run the daemon in the background.

       -i, --interval Seconds
              Report progress as a percentage at regular intervals.

       -n, --name LogicalVolume
              Move only the extents belonging to LogicalVolume from SourcePhysicalVolume instead of all allocated extents to the destination physical volume(s).

Examples
       To move all Physical Extents that are used by simple Logical Volumes on /dev/sdb1 to free Physical Extents elsewhere in the Volume Group use:

       pvmove /dev/sdb1

       Additionally, a specific destination device /dev/sdc1 can be specified like this:

       pvmove /dev/sdb1 /dev/sdc1

       To perform the action only on extents belonging to the single Logical Volume lvol1 do this:

       pvmove -n lvol1 /dev/sdb1 /dev/sdc1

       Rather than moving the contents of the entire device, it is possible to move a range of Physical Extents - for example numbers 1000 to 1999 inclusive on /dev/sdb1 - like this:

       pvmove /dev/sdb1:1000-1999

       A range can also be specified as start+length, so

       pvmove /dev/sdb1:1000+1000

       also refers to 1000 Physical Extents starting from Physical Extent number 1000.  (Counting starts from 0, so this refers to the 1001st to the 2000th inclusive.)

       To move a range of Physical Extents to a specific location (which must have sufficient free extents) use the form:

       pvmove /dev/sdb1:1000-1999 /dev/sdc1

       or

       pvmove /dev/sdb1:1000-1999 /dev/sdc1:0-999

       If the source and destination are on the same disk, the anywhere allocation policy would be needed, like this:

       pvmove --alloc anywhere /dev/sdb1:1000-1999 /dev/sdb1:0-999

       The part of a specific Logical Volume present within in a range of Physical Extents can also be picked out and moved, like this:

       pvmove -n lvol1 /dev/sdb1:1000-1999 /dev/sdc1

SEE ALSO
       lvm(8), vgconvert(8) pvs(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                          PVMOVE(8)
