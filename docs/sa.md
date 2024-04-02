SA(8)                                                                                      System Manager's Manual                                                                                      SA(8)



NAME
       sa -  summarizes accounting information

SYNOPSIS
       sa     [ -a | --list-all-names ]
              [ -b | --sort-sys-user-div-calls ]
              [ -c | --percentages ] [ -d | --sort-avio ]
              [ -D | --sort-tio ] [ -f | --not-interactive ]
              [ -i | --dont-read-summary-files ]
              [ -j | --print-seconds ] [ -k | --sort-cpu-avmem ]
              [ -K | --sort-ksec ] [ -l | --separate-times ]
              [ -m | --user-summary ] [ -n | --sort-num-calls ]
              [ -p | --show-paging ] [ -P | --show-paging-avg ]
              [ -r | --reverse-sort ] [ -s | --merge ]
              [ -t | --print-ratio ] [ -u | --print-users ]
              [ -v num | --threshold num ] [ --sort-real-time ]
              [ --debug ] [ -V | --version ] [ -h | --help ]
              [ --other-usracct-file filename ] [ --ahz hz ]
              [ --other-savacct-file filename ]
              [ [ --other-acct-file ] filename ]

DESCRIPTION
       sa summarizes information about previously executed commands as recorded in the acct file.  In addition, it condenses this data into a summary file named savacct which contains the number of times
       the command was called and the system resources used.  The information can also be summarized on a per-user basis; sa will save this information into a file named usracct.

       If no arguments are specified, sa will print information about all of the commands in the acct file.

       If called with a file name as the last argument, sa will use that file instead of the system's default acct file.

       By default, sa will sort the output by sum of user and system time.  If command names have unprintable characters, or are only called once, sa will sort them into a group called `***other'.  If more
       than one sorting option is specified, the list will be sorted by the one specified last on the command line.

       The output fields are labeled as follows:

       cpu
               sum of system and user time in cpu minutes

       re
               "elapsed time" in minutes

       k
               cpu-time averaged core usage, in 1k units

       avio
               average number of I/O operations per execution

       tio
               total number of I/O operations

       k*sec
               cpu storage integral (kilo-core seconds)

       u
               user cpu time in cpu seconds

       s
               system time in cpu seconds

       Note that these column titles do not appear in the first row of the table, but after each numeric entry (as units of measurement) in every row.  For example, you might see `79.29re', meaning 79.29
       cpu seconds of "real time".

       An asterisk will appear after the name of commands that forked but didn't call exec.

       GNU sa takes care to implement a number of features not found in other versions.  For example, most versions of sa don't pay attention to flags like `--print-seconds' and `--sort-num-calls' when
       printing out commands when combined with the `--user-summary' or `--print-users' flags.  GNU sa pays attention to these flags if they are applicable.  Also, MIPS' sa stores the average memory use as
       a short rather than a double, resulting in some round-off errors.  GNU sa uses double the whole way through.

OPTIONS
       The availability of these program options depends on your operating system.  In specific, the members that appear in the struct acct of your system's process accounting header file (usually acct.h )
       determine which flags will be present.  For example, if your system's struct acct doesn't have the `ac_mem' field, the installed version of sa will not support the `--sort-cpu-avmem', `--sort-ksec',
       `-k', or `-K' options.

       In short, all of these flags may not be available on your machine.

       -a, --list-all-names
              Force sa not to sort those command names with unprintable characters and those used only once into the ***other group.
       -b, --sort-sys-user-div-calls
              Sort the output by the sum of user and system time divided by the number of calls.
       -c, --percentages
              Print percentages of total time for the command's user, system, and real time values.
       -d, --sort-avio
              Sort the output by the average number of disk I/O operations.
       -D, --sort-tio
              Print and sort the output by the total number of disk I/O operations.
       -f, --not-interactive
              When using the `--threshold' option, assume that all answers to interactive queries will be affirmative.
       -i, --dont-read-summary-files
              Don't read the information in the system's default savacct file.
       -j, --print-seconds
              Instead of printing total minutes for each category, print seconds per call.
       -k, --sort-cpu-avmem
              Sort the output by cpu time average memory usage.
       -K, --sort-ksec
              Print and sort the output by the cpu-storage integral.
       -l, --separate-times
              Print separate columns for system and user time; usually the two are added together and listed as `cpu'.
       -m, --user-summary
              Print the number of processes and number of CPU minutes on a per-user basis.
       -n, --sort-num-calls
              Sort the output by the number of calls.  This is the default sorting method.
       -p, --show-paging
              Print the number of minor and major pagefaults and swaps.
       -P, --show-paging-avg
              Print the number of minor and major pagefaults and swaps divided by the number of calls.
       -r, --reverse-sort
              Sort output items in reverse order.
       -s, --merge
              Merge the summarized accounting data into the summary files savacct and usracct.
       -t, --print-ratio
              For each entry, print the ratio of real time to the sum of system and user times.  If the sum of system and user times is too small to report--the sum is zero--`*ignore*' will appear in this
              field.
       -u, --print-users
              For each command in the accounting file, print the userid and command name.  After printing all entries, quit.  *Note*: this flag supersedes all others.
       -v num --threshold num
              Print commands which were executed num times or fewer and await a reply from the terminal.  If the response begins with `y', add the command to the `**junk**' group.
       --separate-forks
              It really doesn't make any sense to me that the stock version of sa separates statistics for a particular executable depending on whether or not that command forked.  Therefore, GNU sa lumps
              this information together unless this option is specified.
       --ahz hz
              Use this flag to tell the program what AHZ should be (in hertz).  This option is useful if you are trying to view an acct file created on another machine which has the same byte order and
              file format as your current machine, but has a different value for AHZ.
       --debug
              Print verbose internal information.
       -V, --version
              Print the version number of sa.
       -h, --help
              Prints the usage string and default locations of system files to standard output and exits.
       --sort-real-time
              Sort the output by the "real time" field.
       --other-usracct-file filename
              Write summaries by user ID to filename rather than the system's default usracct file.
       --other-savacct-file filename
              Write summaries by command name to filename rather than the system's default SAVACCT file.
       --other-acct-file filename
              Read from the file filename instead of the system's default ACCT file.
FILES
       acct   The raw system wide process accounting file. See acct(5) for further details.
       savacct
              A summary of system process accounting sorted by command.
       usracct
              A summary of system process accounting sorted by user ID.
BUGS
       There is not yet a wide experience base for comparing the output of GNU sa with versions of sa in many other systems.  The problem is that the data files grow big in a short time and therefore
       require a lot of disk space.
AUTHOR
       The GNU accounting utilities were written by Noel Cragg <noel@gnu.ai.mit.edu>. The man page was adapted from the accounting texinfo page by Susan Kleinmann <sgk@sgk.tiac.net>.
SEE ALSO
       acct(5), ac(1)



                                                                                                1997 August 19                                                                                          SA(8)
