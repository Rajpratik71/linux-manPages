PVDISPLAY(8)                                                                             System Manager's Manual                                                                             PVDISPLAY(8)

NAME
       pvdisplay - display attributes of a physical volume

SYNOPSIS
       pvdisplay  [-c|--colon]  [--commandprofile  ProfileName]  [-d|--debug] [-h|-?|--help] [--ignorelockingfailure] [--ignoreskippedcluster] [--maps] [--nosuffix] [-s|--short] [-S|--select Selection]
       [--units hsbkmgtHKMGT] [-v[v]|--verbose [--verbose]] [--version] [PhysicalVolumePath...]

       pvdisplay  -C|--columns  [--aligned]  [--binary]  [-a|--all]  [--commandprofile  ProfileName]  [-d|--debug]  [-h|-?|--help]  [--ignorelockingfailure]  [--noheadings]  [--nosuffix]  [-o|--options
       [+|-|#]Field[,Field...]]  [-O|--sort [+|-]Key1[,[+|-]Key2...  ]] [-S|--select Selection] [--separator Separator] [--unbuffered] [--units hHbBsSkKmMgGtTpPeE] [-v[v]|--verbose [--verbose]] [--ver‐
       sion] [PhysicalVolumePath...]

DESCRIPTION
       pvdisplay allows you to see the attributes of one or more physical volumes like size, physical extent size, space used for the volume group descriptor area and so on.

       pvs(8) is an alternative that provides the same information in the style of ps(1).

OPTIONS
       See lvm(8) for common options.

       -C, --columns
              Display output in columns, the equivalent of pvs(8).  See pvs(8) for a description of other options with this form of pvdisplay.

       -c, --colon
              Generate colon separated output for easier parsing in scripts or programs.  N.B. pvs(8) provides considerably more control over the output.

              The values are:

              · physical volume device name
              · volume group name
              · physical volume size in sectors
              · internal physical volume number (obsolete)
              · physical volume status
              · physical volume (not) allocatable
              · current number of logical volumes on this physical volume
              · physical extent size in kilobytes
              · total number of physical extents
              · free number of physical extents
              · allocated number of physical extents

       -s, --short
              Only display the size of the given physical volumes.

       -m, --maps
              Display the mapping of physical extents to logical volumes and logical extents.

SEE ALSO
       lvm(8), pvs(8), pvcreate(8), lvcreate(8), vgcreate(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                       PVDISPLAY(8)
