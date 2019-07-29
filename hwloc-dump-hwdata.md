HWLOC-DUMP-HWDATA(1)                                                   hwloc                                                  HWLOC-DUMP-HWDATA(1)

NAME
       hwloc-dump-hwdata - Dump topology and locality information from hardware tables

SYNOPSIS
       hwloc-dump-hwdata [options]

OPTIONS
       -o <dir>  save output files to directory <dir> instead of the default /var/run/hwloc/.

DESCRIPTION
       hwloc  may  benefit  from  some  locality and topology information from SMBIOS or ACPI tables.  They are accessible from raw hardware files
       under directories such /sys/firmware/dmi/ or /sys/firmware/acpi/ on Linux.  These files are usually only accessible to root.

       The hwloc-dump-hwdata tool dumps the useful contents of such files into human-readable and world-accessible files. The intent is to run the
       tool once during boot and have the main (non-privileged) hwloc library gather information from these human-readable files.

       hwloc-dump-hwdata is currently only useful on Intel Knights Landing Xeon Phi platforms.

       The current list of dumped information is:

       Intel Knights Landing memory-side cache characteristics
            gathered  from  specific  SMBIOS entries such as /sys/firmware/dmi/entries/14-* and /sys/firmware/dmi/entries/160-*, and saved in file
            knl_memoryside_cache.

       If the output directory is changed, you may want to set the HWLOC_DUMPED_HWDATA_DIR environment variable  accordingly  so  that  the  hwloc
       library finds the dumped files.

SEE ALSO
       hwloc(7), lstopo(1)

1.11.2                                                             Dec 17, 2015                                               HWLOC-DUMP-HWDATA(1)
