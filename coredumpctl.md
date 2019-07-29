COREDUMPCTL(1)                                                                                   coredumpctl                                                                                   COREDUMPCTL(1)



NAME
       coredumpctl - Retrieve coredumps from the journal

SYNOPSIS
       coredumpctl [OPTIONS...] {COMMAND} [PID|COMM|EXE|MATCH...]

DESCRIPTION
       coredumpctl may be used to retrieve coredumps from systemd-journald(8).

OPTIONS
       The following options are understood:

       --no-legend
           Do not print column headers.

       -1
           Show information of a single coredump only, instead of listing all known coredumps.

       -F FIELD, --field=FIELD
           Print all possible data values the specified field takes in matching coredump entries of the journal.

       -o FILE, --output=FILE
           Write the core to FILE.

       -D DIR, --directory=DIR
           Use the journal files in the specified DIR.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       --no-pager
           Do not pipe output into a pager.

       The following commands are understood:

       list
           List coredumps captured in the journal matching specified characteristics. If no command is specified, this is the implied default.

       info
           Show detailed information about coredumps captured in the journal.

       dump
           Extract the last coredump matching specified characteristics. The coredump will be written on standard output, unless an output file is specified with --output=.

       gdb
           Invoke the GNU debugger on the last coredump matching specified characteristics.

MATCHING
       A match can be:

       PID
           Process ID of the process that dumped core. An integer.

       COMM
           Name of the executable (matches COREDUMP_COMM=). Must not contain slashes.

       EXE
           Path to the executable (matches COREDUMP_EXE=). Must contain at least one slash.

       MATCH
           General journalctl predicates (see journalctl(1)). Must contain an equal sign.

EXIT STATUS
       On success, 0 is returned; otherwise, a non-zero failure code is returned. Not finding any matching coredumps is treated as failure.

EXAMPLES
       Example 1. List all the coredumps of a program named foo

           # coredumpctl list foo

       Example 2. Invoke gdb on the last coredump

           # coredumpctl gdb

       Example 3. Show information about a process that dumped core, matching by its PID 6654

           # coredumpctl info 6654

       Example 4. Extract the last coredump of /usr/bin/bar to a file named bar.coredump

           # coredumpctl -o bar.coredump dump /usr/bin/bar

SEE ALSO
       systemd-coredump(8), coredump.conf(5), systemd-journald.service(8), gdb(1)



systemd 228                                                                                                                                                                                    COREDUMPCTL(1)
