DWWW-CACHE(8)                    Debian                    DWWW-CACHE(8)

NAME
       dwww-cache - manage the dwww cache of converted documents

SYNOPSIS
       dwww-cache --lookup type location
       dwww-cache --store type location
       dwww-cache --list type location
       dwww-cache --list-all
       dwww-cache --clean

DESCRIPTION
       dwww-cache  manages  the cache of converted documents; it is part
       of dwww(7).  An option (the first argument) specifies the  opera‐
       tion.   Some  operations  operate on the whole cache, and need no
       other arguments.  Others need the second and  third  argument  to
       specify  the  type  and  pathname of the original document.  (See
       dwww-convert(8) for more information about the arguments.)

       The operations are:

       --lookup
              If the document is in the cache, output it to the standard
              output.   Otherwise,  output nothing and return a non-zero
              status.

       --store
              Read the document from the standard input,  output  it  to
              the standard output and store it into the cache.  If there
              was an older version already in the cache, remove it.

       --list Output information about one document in the cache to  the
              standard  output.   The information is one line, with five
              space delimited fields: type, pathname of  original  file,
              pathname of cached file, size (actually the last two bytes
              of size) of the cached file,  and  cache   entry  validity
              indicator (which can be either "valid" or "outdated").

       --list-all
              Like --list, but for all documents.

       --clean
              Forget all cached documents that are already outdated.

       dwww-cache  maintains  a  database with information of the cached
       documents.  The documents themselves are stored in separate files
       in  the cache directory.  When old documents are removed from the
       cache by a suitable crontab entry, they will still exist  in  the
       database.   The  --clean  operation  removes all entries from the
       database where either the original or the converted file is miss‐
       ing or where the converted file is outdated.

       To  stop  the  cache  from  growing too large, there should be an
       entry for  dwww-refresh-cache(8)  in  system  crontab  to  remove
       cached  files  that  have  not  been  accessed  for a while.  The
       dwww-refresh-cache(8) program internally uses commands similar to
              find /var/cache/dwww -atime +$DWWW_KEEPDAYS | xargs rm -f
              dwww-cache --clean
       to remove all documents that have not been accessed for a  number
       of days specified in the $DWWW_KEEPDAYS configuration variable.

       The  idea  is to first delete the old cached files and then clean
       up the database.  The policy of cleaning the cache has been  kept
       outside  of  dwww-cache  to keep the program simple, and to allow
       maximum flexibility.  The default  dwww  installation  creates  a
       /etc/cron.daily/dwww,  which  automatically cleans the cache each
       day.

FILES
       /var/cache/dwww/db
              The cache directory.

       /var/cache/dwww/db/.cache_db
              The database with information about all cached  documents.
              This  is  a  binary file, specially encoded for small size
              and high speed, and should not be touched  by  anyone  but
              dwww-cache.

SEE ALSO
       dwww(7), dwww-convert(8).  dwww-refresh-cache(8).

AUTHOR
       Lars   Wirzenius   <liw@iki.fi>.    Modified  by  Robert  Luberda
       <robert@debian.org>.
       See dwww(7) for copyrights and stuff.

dwww 1.13.0                February 7th, 2016              DWWW-CACHE(8)
