PVS(8)                                                                                   System Manager's Manual                                                                                   PVS(8)

NAME
       pvs — report information about physical volumes

SYNOPSIS
       pvs  [-a|--all]  [--aligned]  [--binary] [--commandprofile ProfileName] [-d|--debug] [-h|-?|--help] [--ignorelockingfailure] [--ignoreskippedcluster] [--nameprefixes] [--noheadings] [--nosuffix]
       [-o|--options [+|-|#]Field[,Field...]]  [-O|--sort [+|-]Key1[,[+|-]Key2...]]  [-P|--partial] [--rows] [--segments] [-S|--select Selection] [--separator Separator] [--unbuffered]  [--units  hHbB‐
       sSkKmMgGtTpPeE] [--unquoted] [-v|--verbose] [--version] [PhysicalVolume [PhysicalVolume...]]

DESCRIPTION
       pvs produces formatted output about physical volumes.

OPTIONS
       See lvm(8) for common options.

       --all  Include information in the output about devices that have not been initialized with pvcreate(8).

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

              Use -o pv_all to select all physical volume columns, and -o pvseg_all to select all Physical Volume segment columns.

              Use -o help to view the full list of columns available.

              Column names include: pv_fmt, pv_uuid, dev_size, pv_name, pv_mda_free, pv_mda_size, pv_ba_start, pv_ba_size, pe_start, pv_size, pv_free, pv_used, pv_attr, pv_pe_count,  pv_pe_alloc_count,
              pv_tags, pv_mda_count, pv_mda_used_count, pvseg_start, and pvseg_size

              With  --segments,  any  "pvseg_"  prefixes  are  optional; otherwise any "pv_" prefixes are optional.  Columns mentioned in vgs(8) can also be chosen. The pv_attr bits are: (a)llocatable,
              e(x)ported and (m)issing.

       --segments
              Produces one line of output for each contiguous allocation of space on each Physical Volume, showing the start (pvseg_start) and length (pvseg_size) in units of physical extents.

       -S, --select Selection
              Display only rows that match Selection criteria. All rows are displayed with the additional "selected" column (-o selected) showing 1 if the row matches the Selection and 0 otherwise. The
              Selection  criteria are defined by specifying column names and their valid values (that can include reserved values) while making use of supported comparison operators. See lvm(8) and -S,
              --select description for more detailed information about constructing the Selection criteria. As a quick help and to see full list of column names that can be used in Selection  including
              the list of reserved values and the set of supported selection operators, check the output of pvs -S help command.

       -O, --sort
              Comma-separated ordered list of columns to sort by.  Replaces the default selection. Precede any column with '-' for a reverse sort on that column.

       --rows Output columns as rows.

       --separator Separator
              String to use to separate each column.  Useful if grepping the output.

       --unbuffered
              Produce output immediately without sorting or aligning the columns properly.

       --units hHbBsSkKmMgGtTpPeE
              All  sizes  are  output  in these units: (h)uman-readable, (b)ytes, (s)ectors, (k)ilobytes, (m)egabytes, (g)igabytes, (t)erabytes, (p)etabytes, (e)xabytes.  Capitalise to use multiples of
              1000 (S.I.) instead of 1024.  Can also specify custom units e.g. --units 3M

       --unquoted
              When used with --nameprefixes, output values in the field=value pairs are not quoted.

SEE ALSO
       lvm(8), pvdisplay(8), lvs(8), vgs(8)

Sistina Software UK                                                                 LVM TOOLS 2.02.133(2) (2015-10-30)                                                                             PVS(8)
