VGS(8)                                                                                   System Manager's Manual                                                                                   VGS(8)

NAME
       vgs — report information about volume groups

SYNOPSIS
       vgs  [-a|--all]  [--aligned]  [--binary] [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [--ignorelockingfailure] [--ignoreskippedcluster] [--nameprefixes] [--noheadings] [--nosuffix]
       [-o|--options [+|-|#]Field1[,Field2...]]  [-O|--sort [+|-]Key1[,[+|-]Key2...]]  [-P|--partial] [--rows] [-S|--select  Selection]  [--separator  Separator]  [--unbuffered]  [--units  hHbBsSkKmMg‐
       GtTpPeE] [--unquoted] [-v|--verbose] [--version] [VolumeGroupName [VolumeGroupName...]]

DESCRIPTION
       vgs produces formatted output about volume groups.

OPTIONS
       See lvm(8) for common options.

       --all  List all volume groups.  Equivalent to not specifying any volume groups.

       --aligned
              Use with --separator to align the output columns.

       --binary
              Use  binary values "0" or "1" instead of descriptive literal values for columns that have exactly two valid values to report (not counting the "unknown" value which denotes that the value
              could not be determined).

       --nameprefixes
              Add an "LVM2_" prefix plus the field name to the output.  Useful with --noheadings to produce a list of field=value pairs that can be used to set environment variables  (for  example,  in
              udev(7) rules).

       --noheadings
              Suppress the headings line that is normally the first line of output.  Useful if grepping the output.

       --nosuffix
              Suppress the suffix on output sizes.  Use with --units (except h and H) if processing the output.

       -o, --options
              Comma-separated ordered list of columns.

              Precede  the list with '+' to append to the current list of columns, '-' to remove from the current list of columns or '#' to compact given columns. The -o option can be repeated, provid‐
              ing several lists. These lists are evaluated from left to right.

              Use -o vg_all to select all volume group columns.

              Use -o help to view the full list of columns available.

              Column names include: vg_fmt, vg_uuid, vg_name, vg_attr, vg_size, vg_free, vg_sysid, vg_extent_size,  vg_extent_count,  vg_free_count,  vg_profile,  max_lv,  max_pv,  pv_count,  lv_count,
              snap_count, vg_seqno, vg_tags, vg_mda_count, vg_mda_free, and vg_mda_size, vg_mda_used_count.

              Any "vg_" prefixes are optional.  Columns mentioned in either pvs(8) or lvs(8) can also be chosen, but columns cannot be taken from both at the same time.

              The vg_attr bits are:

              1  Permissions: (w)riteable, (r)ead-only

              2  Resi(z)eable

              3  E(x)ported

              4  (p)artial: one or more physical volumes belonging to the volume group are missing from the system

              5  Allocation policy: (c)ontiguous, c(l)ing, (n)ormal, (a)nywhere

              6  (c)lustered, (s)hared

       -O, --sort
              Comma-separated ordered list of columns to sort by.  Replaces the default selection. Precede any column with '-' for a reverse sort on that column.

       --rows Output columns as rows.

       -S, --select Selection
              Display only rows that match Selection criteria. All rows are displayed with the additional "selected" column (-o selected) showing 1 if the row matches the Selection and 0 otherwise. The
              Selection criteria are defined by specifying column names and their valid values (that can include reserved values) while making use of supported comparison operators. See lvm(8) and  -S,
              --select  description for more detailed information about constructing the Selection criteria. As a quick help and to see full list of column names that can be used in Selection including
              the list of reserved values and the set of supported selection operators, check the output of vgs -S help command.

       --separator Separator
              String to use to separate each column.  Useful if grepping the output.

       --unbuffered
              Produce output immediately without sorting or aligning the columns properly.

       --units hHbBsSkKmMgGtTpPeE
              All sizes are output in these units: (h)uman-readable, (b)ytes, (s)ectors, (k)ilobytes, (m)egabytes, (g)igabytes, (t)erabytes, (p)etabytes, (e)xabytes.  Capitalise  to  use  multiples  of
              1000 (S.I.) instead of 1024.  Can also specify custom units e.g. --units 3M

       --unquoted
              When used with --nameprefixes, output values in the field=value pairs are not quoted.

SEE ALSO
       lvm(8), vgdisplay(8), pvs(8), lvs(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                             VGS(8)
