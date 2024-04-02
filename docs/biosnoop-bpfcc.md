biosnoop(8)                                                   System Manager's Manual                                                  biosnoop(8)

NAME
       biosnoop - Trace block device I/O and print details incl. issuing PID.

SYNOPSIS
       biosnoop [-hQ]

DESCRIPTION
       This  tools  traces  block device I/O (disk I/O), and prints a one-line summary for each I/O showing various details. These include the la‐
       tency from the time of issue to the device to its completion, and the PID and process name from when the I/O was first created (which  usu‐
       ally identifies the responsible process).

       This  uses  in-kernel eBPF maps to cache process details (PID and comm) by I/O request, as well as a starting timestamp for calculating I/O
       latency.

       This works by tracing various kernel blk_*() functions using dynamic tracing, and will need updating to match any changes  to  these  func‐
       tions.

       This makes use of a Linux 4.5 feature (bpf_perf_event_output()); for kernels older than 4.5, see the version under tools/old, which uses an
       older mechanism

       Since this uses BPF, only the root user can use this tool.

REQUIREMENTS
       CONFIG_BPF and bcc.

OPTIONS
       -h     Print usage message.

       -Q     Include a column showing the time spent quueued in the OS.

EXAMPLES
       Trace all block device I/O and print a summary line per I/O:
              # biosnoop

FIELDS
       TIME(s)
              Time of the I/O completion, in seconds since the first I/O was seen.

       COMM   Cached process name, if present. This usually (but isn't guaranteed) to identify the responsible process for the I/O.

       PID    Cached process ID, if present. This usually (but isn't guaranteed) to identify the responsible process for the I/O.

       DISK   Disk device name.

       T      Type of I/O: R = read, W = write. This is a simplification.

       SECTOR Device sector for the I/O.

       BYTES  Size of the I/O, in bytes.

       QUE(ms)
              Time the I/O was queued in the OS before being issued to the device, in milliseconds.

       LAT(ms)
              Time for the I/O (latency) from the issue to the device, to its completion, in milliseconds.

OVERHEAD
       Since block device I/O usually has a relatively low frequency (< 10,000/s), the overhead for this tool is expected to  be  negligible.  For
       high IOPS storage systems, test and quantify before use.

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

SEE ALSO
       disksnoop(8), iostat(1)

USER COMMANDS                                                       2015-09-16                                                         biosnoop(8)
