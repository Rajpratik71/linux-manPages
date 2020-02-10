VGRENAME(8)                                                                              System Manager's Manual                                                                              VGRENAME(8)

NAME
       vgrename — rename a volume group

SYNOPSIS
       vgrename [-A|--autobackup {y|n}] [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [-t|--test] [-v|--verbose] OldVolumeGroup{Path|Name|UUID} NewVolumeGroup{Path|Name}

DESCRIPTION
       vgrename renames an existing (see vgcreate(8)) volume group from OldVolumeGroup{Name|Path|UUID} to NewVolumeGroup{Name|Path}.

       All the Volume Groups visible to a system need to have different names.  Otherwise many LVM2 commands will refuse to run or give warning messages.

       This  situation  could  arise when disks are moved between machines.  If a disk is connected and it contains a Volume Group with the same name as the Volume Group containing your root filesystem
       the machine might not even boot correctly.  However, the two Volume Groups should have different UUIDs (unless the disk was cloned) so you can rename one of the conflicting  Volume  Groups  with
       vgrename.

OPTIONS
       See lvm(8) for common options.

Examples
       Renames existing volume group vg02 to my_volume_group:

       vgrename /dev/vg02 /dev/my_volume_group

       or

       vgrename vg02 my_volume_group

       Changes the name of the Volume Group with UUID
       Zvlifi-Ep3t-e0Ng-U42h-o0ye-KHu1-nl7Ns4 to VolGroup00_tmp:

       vgrename Zvlifi-Ep3t-e0Ng-U42h-o0ye-KHu1-nl7Ns4 VolGroup00_tmp

SEE ALSO
       lvm(8), vgchange(8), vgcreate(8), lvrename(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                        VGRENAME(8)
