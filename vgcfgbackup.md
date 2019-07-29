VGCFGBACKUP(8)                                                System Manager's Manual                                               VGCFGBACKUP(8)

NAME
       vgcfgbackup — backup volume group descriptor area

SYNOPSIS
       vgcfgbackup [--commandprofile ProfileName] [-d|--debug] [-f|--file Filename] [-h|--help] [--ignorelockingfailure] [-P|--partial] [--report‐
       format {basic|json}] [-v|--verbose] [VolumeGroupName...]

DESCRIPTION
       vgcfgbackup allows you to backup the metadata of your volume groups.  If you don't name any volume groups on the command line, all of  them
       will be backed up.

       In  a  default  installation,  each  volume group gets backed up into a separate file bearing the name of the volume group in the directory
       /etc/lvm/backup.  You can write the backup to an alternative file using -f.  In this case if you are backing up more than one volume  group
       the filename is treated as a template, and %s gets replaced by the volume group name.

       NB. This DOESN'T backup user/system data in logical volume(s)!  Backup /etc/lvm regularly too.

OPTIONS
       See lvm(8) for common options.

SEE ALSO
       lvm(8), vgcfgrestore(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                          VGCFGBACKUP(8)
