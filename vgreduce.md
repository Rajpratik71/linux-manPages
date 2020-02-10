VGREDUCE(8)                                                                              System Manager's Manual                                                                              VGREDUCE(8)

NAME
       vgreduce — reduce a volume group

SYNOPSIS
       vgreduce [-a|--all] [-A|--autobackup {y|n}] [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [--removemissing] [-t|--test] [-v|--verbose] VolumeGroupName [PhysicalVolumePath...]

DESCRIPTION
       vgreduce allows you to remove one or more unused physical volumes from a volume group.

OPTIONS
       See lvm(8) for common options.

       -a, --all
              Removes all empty physical volumes if none are given on command line.

       --removemissing
              Removes  all missing physical volumes from the volume group, if there are no logical volumes allocated on those. This resumes normal operation of the volume group (new logical volumes may
              again be created, changed and so on).

              If this is not possible (there are logical volumes referencing the missing physical volumes) and you cannot or do not want to remove them manually, you can run this option with --force to
              have vgreduce remove any partial LVs.

              Any logical volumes and dependent snapshots that were partly on the missing disks get removed completely. This includes those parts that lie on disks that are still present.

              If  your logical volumes spanned several disks including the ones that are lost, you might want to try to salvage data first by activating your logical volumes with --partial as described
              in lvm(8).

SEE ALSO
       lvm(8), vgextend(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                        VGREDUCE(8)
