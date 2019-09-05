pipebench(1)                                                                                                                          pipebench(1)

NAME
       pipebench - Shows speed of stdin/stdout communication

SYNOPSIS
       pipebench [ -ehqQIoru ] [ -s file | -S file ] [ -b bufsize ]

DESCRIPTION
       Measures the speed of stdin/stdout communication.

OPTIONS
       -h     Displays a help message and exits.

       -e     If  an error occurs, exit (breaking the pipe between stdin and stdout. By default an error message is printed to stderr and the pro‐
              gram continues.

       -q     Only show summary stats.

       -Q     Don't show running speed or summary stats. Same as -q -o. Can be used to play with buffer size.

       -o     Don't show summary.

       -b bufsize
              Use this buffer size, in bytes.

       -r     Just show raw speed, no fancy stuff. And no summary.

       -s file
              Write status to file instead of stderr.

       -S file
              Write status to file instead of stderr.

       -I     Use 1kB = 1000B, instead of the default 1024B.

       -u     Don't convet to units (kilo, Mega, etc...)

EXAMPLES
       Benchmark and show progress of backup
       # (cd /home/; tar cf - .) | pipebench | (cd /mnt/backup/; tar xf -)

       A number to brag to your friends about
       $ dd if=/dev/zero bs=80k count=60k 2> /dev/null | ./pipebench -q > /dev/null

BUGS
       No known bugs... yet.

SEE ALSO
       dd(1), cat(1)

AUTHOR
       Pipebench was written by Thomas Habets <thomas@habets.pp.se>

pipebench                                                         18th Apr, 2003                                                      pipebench(1)
