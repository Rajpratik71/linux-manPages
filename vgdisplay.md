VGDISPLAY(8)                                                  System Manager's Manual                                                 VGDISPLAY(8)

NAME
       vgdisplay — display attributes of volume groups

SYNOPSIS
       vgdisplay  [-A|--activevolumegroups]  [-c|--colon]  [--commandprofile  ProfileName] [--reportformat {basic|json}] [-s|--short] [-S|--select
       Selection] [-v|--verbose] [-d|--debug] [-h|--help] [--ignorelockingfailure] [--ignoreskippedcluster] [--nosuffix]  [-P|--partial]  [--units
       hHbBsSkKmMgGtTpPeE] [--version] [VolumeGroupName...]

       vgdisplay    -C|--columns    [--aligned]    [--binary]    [--commandprofile   ProfileName]   [[--configreport   ReportName]   [-o|--options
       [+|-|#]Field1[,Field2...]  [-O|--sort [+|-]Key1[,Key2...]]  [-S|--select Selection] ...]  [-d|--debug] [-h|-?|--help] [--ignorelockingfail‐
       ure]  [--ignoreskippedcluster] [--logonly] [--noheadings] [--nosuffix] [-P|--partial] [--reportformat {basic|json}] [--separator Separator]
       [--unbuffered] [--units hHbBsSkKmMgGtTpPeE] [-v|--verbose] [--version] [VolumeGroupName...]

DESCRIPTION
       vgdisplay allows you to see the attributes of VolumeGroupName (or all volume groups if none is given) with it's physical and  logical  vol‐
       umes and their sizes etc.

       vgs(8) is an alternative that provides the same information in the style of ps(1).

OPTIONS
       See lvm(8) for common options.

       -A, --activevolumegroups
              Only select the active volume groups. The volume group is considered active if at least one of its logical volumes is active.

       -C, --columns
              Display output in columns, the equivalent of vgs(8).  Options listed are the same as options given in vgs(8).

       -c, --colon
              Generate  colon separated output for easier parsing in scripts or programs.  N.B. vgs(8) provides considerably more control over the
              output.

              The values are:

              1  volume group name
              2  volume group access
              3  volume group status
              4  internal volume group number
              5  maximum number of logical volumes
              6  current number of logical volumes
              7  open count of all logical volumes in this volume group
              8  maximum logical volume size
              9  maximum number of physical volumes
              10 current number of physical volumes
              11 actual number of physical volumes
              12 size of volume group in kilobytes
              13 physical extent size
              14 total number of physical extents for this volume group
              15 allocated number of physical extents for this volume group
              16 free number of physical extents for this volume group
              17 uuid of volume group

       -s, --short
              Give a short listing showing the existence of volume groups.

       -v, --verbose
              Display verbose information containing long listings of physical and logical volumes.  If given twice, also display verbose  runtime
              information of vgdisplay's activities.

       --version
              Display version and exit successfully.

SEE ALSO
       lvm(8), vgs(8), pvcreate(8), vgcreate(8), lvcreate(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                            VGDISPLAY(8)
