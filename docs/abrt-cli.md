ABRT-CLI(1)                                                                                      ABRT Manual                                                                                      ABRT-CLI(1)



NAME
       abrt-cli - List, remove, print, analyze, report problems

SYNOPSIS
       abrt-cli [--authenticate] COMMAND [COMMAND OPTIONS]

       abrt-cli list [-vn] [--detailed] [--since NUM] [--until NUM] [DIR]...

       abrt-cli remove [-v] DIR...

       abrt-cli report [-v] [--delete] [--unsafe] DIR...

       abrt-cli info [-v] [--detailed] [-s SIZE] DIR...

       abrt-cli status [-vb] [--since NUM]

       abrt-cli process [-v] [--since NUM] [--unsafe] DIR...

GLOBAL OPTIONS
       -a,--authenticate
           Enable PolicyKit authentication to be able to work with the system problems

COMMAND OPTIONS
       -v,--verbose
           Be more verbose. Can be given multiple times.

       -b, --bare
           Print only the problem count without any message

       --detailed
           Show detailed report

       --delete
           Remove PROBLEM_DIR after reporting

       -n,--not-reported
           List only not-reported problems

       --size SIZE
           Text larger than SIZE bytes will be shown abridged

       --since NUM
           Selects only problems detected after timestamp

       -u, --unsafe
           Ignore security checks to be able to report all problems

       --until NUM
           Selects only the problems older than specified timestamp

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                                      ABRT-CLI(1)
