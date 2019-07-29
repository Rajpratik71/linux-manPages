PVCHANGE(8)                                                   System Manager's Manual                                                  PVCHANGE(8)

NAME
       pvchange — change attributes of a physical volume

SYNOPSIS
       pvchange  [--addtag  Tag] [-A|--autobackup {y|n}] [--commandprofile ProfileName] [-d|--debug] [-f|--force] [--deltag Tag] [--metadataignore
       {y|n}] [-h|-?|--help] [--reportformat {basic|json}] [-S|--select Selection] [-t|--test] [-v|--verbose] [-a|--all] [-x|--allocatable  {y|n}]
       [-u|--uuid] [PhysicalVolumePath...]

DESCRIPTION
       pvchange allows you to change the allocation permissions of one or more physical volumes.

OPTIONS
       See lvm(8) for common options.

       -a, --all
              If PhysicalVolumePath is not specified on the command line all physical volumes are searched for and used.

       --metadataignore {y|n}
              Ignore  or  un-ignore  metadata areas on this physical volume.  If metadata areas on a physical volume are ignored, LVM will not not
              store metadata in the metadata areas present on this Physical Volume.

       -u, --uuid
              Generate new random UUID for specified physical volumes.

       -x, --allocatable {y|n}
              Enable or disable allocation of physical extents on this physical volume.

Example
       Disallows the allocation of physical extents on this physical volume (possibly because of disk errors, or because it will be removed  after
       freeing it:

       pvchange -x n /dev/sdk1

SEE ALSO
       lvm(8), pvcreate(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                             PVCHANGE(8)
