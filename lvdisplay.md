LVDISPLAY(8)                                                  System Manager's Manual                                                 LVDISPLAY(8)

NAME
       lvdisplay — display attributes of a logical volume

SYNOPSIS
       lvdisplay [-a|--all] [-c|--colon] [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [--ignorelockingfailure] [--ignoreskippedclus‐
       ter] [--maps] [--nosuffix] [-P|--partial] [--reportformat {basic|json}] [-S|--select Selection] [--units hHbBsSkKmMgGtTpPeE] [-v|--verbose]
       [--version] [VolumeGroupName|LogicalVolume{Name|Path} ...]

       lvdisplay  -C|--columns  [--aligned]  [--binary]  [-a|--all]  [--commandprofile  ProfileName]  [[--configreport  ReportName]  [-o|--options
       [+|-|#]Field1[,Field2...]  [-O|--sort [+|-]Key1[,Key2...]]  [-S|--select Selection] ...]  [-d|--debug] [-h|-?|--help] [--ignorelockingfail‐
       ure]  [--ignoreskippedcluster] [--logonly] [--noheadings] [--nosuffix] [-P|--partial] [--reportformat {basic|json}] [--segments] [--separa‐
       tor Separator] [--unbuffered] [--units hHbBsSkKmMgGtTpPeE] [-v|--verbose] [--version] [VolumeGroupName|LogicalVolume{Name|Path} ...]

DESCRIPTION
       lvdisplay allows you to see the attributes of a logical volume like size, read/write status, snapshot information etc.

       lvs(8) is an alternative that provides the same information in the style of ps(1).  lvs(8) is recommended over lvdisplay.

OPTIONS
       See lvm(8) for common options and lvs for options given with --columns.

       --all  Include information in the output about internal Logical Volumes that are components of normally-accessible Logical Volumes, such as
              mirrors,  but  which are not independently accessible (e.g. not mountable).  For example, after creating a mirror using lvcreate -m1
              --mirrorlog disk, this option will reveal three internal Logical Volumes, with suffixes mimage_0, mimage_1, and mlog.

       -C, --columns
              Display output in columns, the equivalent of lvs(8).  Options listed are the same as options given in lvs(8).

       -c, --colon
              Generate colon separated output for easier parsing in scripts or programs.  N.B. lvs(8) provides considerably more control over  the
              output.

              The values are:

              · logical volume name
              · volume group name
              · logical volume access
              · logical volume status
              · internal logical volume number
              · open count of logical volume
              · logical volume size in sectors
              · current logical extents associated to logical volume
              · allocated logical extents of logical volume
              · allocation policy of logical volume
              · read ahead sectors of logical volume
              · major device number of logical volume
              · minor device number of logical volume

       -m, --maps
              Display  the  mapping  of logical extents to physical volumes and physical extents.  To map physical extents to logical extents use:
              pvs --segments -o+lv_name,seg_start_pe,segtype

Examples
       Shows attributes of that logical volume. If snapshot logical volumes have been created for this original logical volume, this command shows
       a list of all snapshot logical volumes and their status (active or inactive) as well:

       lvdisplay -v vg00/lvol2

       Shows the attributes of this snapshot logical volume and also which original logical volume it is associated with:

       lvdisplay vg00/snapshot

SEE ALSO
       lvm(8), lvcreate(8), lvs(8), lvscan(8), pvs(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                            LVDISPLAY(8)
