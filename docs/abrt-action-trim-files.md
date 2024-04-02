ABRT-ACTION-TRIM-(1)                                                                             ABRT Manual                                                                             ABRT-ACTION-TRIM-(1)



NAME
       abrt-action-trim-files - Deletes old problem directories or files in specified directories until they are smaller than specified size.

SYNOPSIS
       abrt-action-trim-files [-v] [-d SIZE:DIR]... [-f SIZE:DIR]... [-p DIR] [FILE]...

OPTIONS
       -v
           Be more verbose. Can be given multiple times.

       -d SIZE:DIR
           Delete problem directories in DIR. SIZE can be suffixed by k,m,g,t to specify kilo,mega,giga,terabytes.

       -f SIZE:DIR
           Delete files in DIR

       -p DIR
           Preserve DIR (never consider it for deletion)

       FILE
           Preserve FILE (never consider it for deletion)

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                             ABRT-ACTION-TRIM-(1)
