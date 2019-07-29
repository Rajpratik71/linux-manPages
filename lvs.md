LVS(8)                                                        System Manager's Manual                                                       LVS(8)

NAME
       lvs — report information about logical volumes

SYNOPSIS
       lvs  [--aligned]  [--binary] [-a|--all] [--commandprofile ProfileName] [[--configreport ReportName] [-o|--options [+|-|#]Field1[,Field2...]
       [-O|--sort  [+|-]Key1[,Key2...]]   [-S|--select  Selection]  ...]   [-d|--debug]  [-h|-?|--help]  [-H|--history]   [--ignorelockingfailure]
       [--ignoreskippedcluster]  [--logonly]  [--nameprefixes] [--noheadings] [--nosuffix] [+|-]Key1[,[+|-]Key2[,...]]]  [-P|--partial] [--report‐
       format {basic|json}] [--rows] [--separator Separator] [--segments] [--unbuffered] [--units hHbBsSkKmMgGtTpPeE] [--unquoted]  [-v|--verbose]
       [--version] [VolumeGroupName|LogicalVolume{Name|Path} [VolumeGroupName|LogicalVolume{Name|Path} ...]]

DESCRIPTION
       lvs produces formatted output about logical volumes.

OPTIONS
       See lvm(8) for common options.

       --aligned
              Use with --separator to align the output columns.

       --all  Include information in the output about internal Logical Volumes that are components of normally-accessible Logical Volumes, such as
              mirrors, but which are not independently accessible (e.g. not mountable).  The names of such Logical  Volumes  are  enclosed  within
              square  brackets  in the output.  For example, after creating a mirror using lvcreate -m1 --mirrorlog disk , this option will reveal
              three internal Logical Volumes, with suffixes mimage_0, mimage_1, and mlog.

       --binary
              Use binary values "0" or "1" instead of descriptive literal values for columns that have exactly two valid  values  to  report  (not
              counting the "unknown" value which denotes that the value could not be determined).

       --configreport  ReportName
              Make  any subsequent -o, --options, -O, --sort or -S, --select to apply for ReportName where ReportName is either 'lv' for command's
              main report or 'log' for log report.  If --configreport option is not used to identify a  report,  then  command's  main  report  is
              assumed. The log report is available only if enabled by log/report_command_log lvm.conf(5) setting or if --logonly option is used.

       -H ,  --history
              Include  historical  logical volumes in the output.  (This has no effect unless logical volumes were removed while the configuration
              setting metadata/record_lvs_history was enabled.)

       --logonly
              Suppress the lvs report itself and display only log report on output.

       --nameprefixes
              Add an "LVM2_" prefix plus the field name to the output.  Useful with --noheadings to produce a list of field=value pairs  that  can
              be used to set environment variables (for example, in udev(7) rules).

       --noheadings
              Suppress the headings line that is normally the first line of output.  Useful if grepping the output.

       --nosuffix
              Suppress the suffix on output sizes.  Use with --units (except h and H) if processing the output.

       -o, --options
              Comma-separated ordered list of columns.

              Precede the list with '+' to append to the current list of columns, '-' to remove from the current list of columns or '#' to compact
              given columns. The -o option can be repeated, providing several lists. These lists are evaluated from left to right.

              Use -o lv_all to select all logical volume columns, and -o seg_all to select all logical volume segment columns.

              Use -o help to view the full list of columns available.

              Column names include: chunk_size, convert_lv, copy_percent, data_lv, devices, discards, lv_attr, lv_host,  lv_kernel_major,  lv_ker‐
              nel_minor,  lv_kernel_read_ahead,  lv_major,  lv_minor,  lv_name,  lv_path,  lv_profile,  lv_read_ahead,  lv_size, lv_tags, lv_time,
              lv_uuid, metadata_lv, mirror_log, modules, move_pv, origin, origin_size,  pool_lv,  raid_max_recovery_rate,  raid_min_recovery_rate,
              raid_mismatch_count,  raid_sync_action,  raid_write_behind,  region_size,  segtype, seg_count, seg_pe_ranges, seg_size, seg_size_pe,
              seg_start, seg_start_pe, seg_tags, snap_percent, stripes, stripe_size, sync_percent, thin_count, transaction_id, zero.

              With --segments, any "seg_" prefixes are optional; otherwise any "lv_" prefixes are optional. Columns mentioned in vgs(8)  can  also
              be chosen.

              The lv_attr bits are:

              1  Volume type: (C)ache, (m)irrored, (M)irrored without initial sync, (o)rigin, (O)rigin with merging snapshot, (r)aid, (R)aid with‐
                 out initial sync, (s)napshot, merging (S)napshot, (p)vmove, (v)irtual, mirror or raid (i)mage, mirror  or  raid  (I)mage  out-of-
                 sync,  mirror  (l)og  device,  under  (c)onversion, thin (V)olume, (t)hin pool, (T)hin pool data, raid or pool m(e)tadata or pool
                 metadata spare.

              2  Permissions: (w)riteable, (r)ead-only, (R)ead-only activation of non-read-only volume

              3  Allocation policy:  (a)nywhere, (c)ontiguous, (i)nherited, c(l)ing, (n)ormal This is  capitalised  if  the  volume  is  currently
                 locked against allocation changes, for example during pvmove(8).

              4  fixed (m)inor

              5  State:  (a)ctive, (h)istorical, (s)uspended, (I)nvalid snapshot, invalid (S)uspended snapshot, snapshot (m)erge failed, suspended
                 snapshot (M)erge failed, mapped (d)evice present without tables, mapped device present with (i)nactive table,  thin-pool  (c)heck
                 needed, suspended thin-pool (C)heck needed, (X) unknown

              6  device (o)pen, (X) unknown

              7  Target  type:  (C)ache,  (m)irror,  (r)aid, (s)napshot, (t)hin, (u)nknown, (v)irtual.  This groups logical volumes related to the
                 same kernel target together.  So, for example, mirror images, mirror logs as well as mirrors themselves appear as (m) if they use
                 the  original device-mapper mirror kernel driver; whereas the raid equivalents using the md raid kernel driver all appear as (r).
                 Snapshots using the original device-mapper driver appear as (s); whereas snapshots of thin volumes using the new thin  provision‐
                 ing driver appear as (t).

              8  Newly-allocated data blocks are overwritten with blocks of (z)eroes before use.

              9  Volume Health, where there are currently three groups of attributes identified:

                 Common ones for all Logical Volumes: (p)artial, (X) unknown.
                 (p)artial  signifies  that  one  or more of the Physical Volumes this Logical Volume uses is missing from the system. (X) unknown
                 signifies the status is unknown.

                 Related to RAID Logical Volumes: (r)efresh needed, (m)ismatches exist, (w)ritemostly.
                 (r)efresh signifies that one or more of the Physical Volumes this RAID Logical Volume uses had suffered a write error. The  write
                 error  could  be  due  to  a temporary failure of that Physical Volume or an indication that it is failing.  The device should be
                 refreshed or replaced. (m)ismatches signifies that the RAID logical volume has portions of  the  array  that  are  not  coherent.
                 Inconsistencies  are detected by initiating a "check" on a RAID logical volume.  (The scrubbing operations, "check" and "repair",
                 can be performed on a RAID logical volume via the 'lvchange' command.)  (w)ritemostly signifies the devices in a RAID  1  logical
                 volume that have been marked write-mostly.

                 Related to Thin pool Logical Volumes: (F)ailed, out of (D)ata space, (M)etadata read only.
                 (F)ailed is set if thin pool encounters serious failures and hence no further I/O is permitted at all. The out of (D)ata space is
                 set if thin pool has run out of data space. (M)etadata read only signifies that thin pool encounters certain  types  of  failures
                 but it's still possible to do reads at least, but no metadata changes are allowed.

                 Related to Thin Logical Volumes: (F)ailed.
                 (F)ailed is set when related thin pool enters Failed state and no further I/O is permitted at all.

              10 s(k)ip activation: this volume is flagged to be skipped during activation.

       -O, --sort
              Comma-separated  ordered list of columns to sort by.  Replaces the default selection. Precede any column with '-' for a reverse sort
              on that column.

       --rows Output columns as rows.

       -S, --select Selection
              Display only rows that match Selection criteria. All rows are displayed with the additional "selected" column (-o selected)  showing
              1  if  the  row matches the Selection and 0 otherwise. The Selection criteria are defined by specifying column names and their valid
              values (that can include reserved values) while making use of supported comparison operators. See lvm(8) and -S,  --select  descrip‐
              tion  for  more detailed information about constructing the Selection criteria. As a quick help and to see full list of column names
              that can be used in Selection including the list of reserved values and the set of supported selection operators, check  the  output
              of lvs -S help command.

       --segments
              Use default columns that emphasize segment information.

       --separator Separator
              String to use to separate each column.  Useful if grepping the output.

       --unbuffered
              Produce output immediately without sorting or aligning the columns properly.

       --units hHbBsSkKmMgGtTpPeE
              All  sizes  are  output  in  these  units: (h)uman-readable, (b)ytes, (s)ectors, (k)ilobytes, (m)egabytes, (g)igabytes, (t)erabytes,
              (p)etabytes, (e)xabytes.  Capitalise to use multiples of 1000 (S.I.) instead of 1024.  Can also specify custom units e.g. --units 3M

       --unquoted
              When used with --nameprefixes, output values in the field=value pairs are not quoted.

SEE ALSO
       lvm(8), lvdisplay(8), pvs(8), vgs(8)

Sistina Software UK                                     LVM TOOLS 2.02.168(2) (2016-11-30)                                                  LVS(8)
