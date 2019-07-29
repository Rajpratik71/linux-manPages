LSMEM(1)                        User Commands                        LSMEM(1)

NAME
       lsmem - list the ranges of available memory with their online status

SYNOPSIS
       lsmem [options]

DESCRIPTION
       The  lsmem  command  lists  the  ranges of available memory with their
       online status. The listed memory blocks correspond to the memory block
       representation  in sysfs. The command also shows the memory block size
       and the amount of memory in online and offline state.

       The  default  output  compatible  with  original  implementaion   from
       s390-tools,  but it's strongly recommended to avoid using default out‐
       puts in your scripts.  Always explicitly define  expected  columns  by
       using the --output option together with a columns list in environments
       where a stable output is required.

       Not all columns are supported on all systems.  If an unsupported  col‐
       umn  is  specified,  lsmem  prints the column but does not provide any
       data for it.

       Use the --help option to see the columns description.

OPTIONS
       -a, --all
              List each individual memory block, instead of combining  memory
              blocks with similar attributes.

       -b, --bytes
              Print  the SIZE column in bytes rather than in a human-readable
              format.

       -h, --help
              Display help text and exit.

       -J, --json
              Use JSON output format.

       -n, --noheadings
              Do not print a header line.

       -o, --output list
              Specify which output columns to print.  Use  --help  to  get  a
              list of all supported columns.  The default list of columns may
              be extended if list is specified  in  the  format  +list  (e.g.
              lsmem -o +NODE).

       -P, --pairs
              Produce  output  in  the form of key="value" pairs.  All poten‐
              tially unsafe characters are hex-escaped (\x<code>).

       -r, --raw
              Produce output in raw format.  All potentially  unsafe  charac‐
              ters are hex-escaped (\x<code>).

       -s, --sysroot directory
              Gather memory data for a Linux instance other than the instance
              from which the lsmem command is issued.  The  specified  direc‐
              tory is the system root of the Linux instance to be inspected.

       -V, --version
              Display version information and exit.

       --summary[=when]
              This  option controls summary lines output.  The optional argu‐
              ment when can be never, always or only.  If the  when  argument
              is  omitted, it defaults to "only". The summary output is supp‐
              resed for --raw, --pairs and --json.

AUTHOR
       lsmem was originally written by  Gerald  Schaefer  for  s390-tools  in
       Perl.  The  C  version for util-linux was written by Clemens von Mann,
       Heiko Carstens and Karel Zak.

SEE ALSO
       chmem(8)

AVAILABILITY
       The lsmem command is part of the util-linux package and  is  available
       from   Linux  Kernel  Archive  ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                       October 2016                        LSMEM(1)
