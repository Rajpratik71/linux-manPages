QSHAPE(1)                                                     General Commands Manual                                                    QSHAPE(1)

NAME
       qshape - Print Postfix queue domain and age distribution

SYNOPSIS
       qshape [-s] [-p] [-m min_subdomains]
               [-b bucket_count] [-t bucket_time]
               [-l] [-w terminal_width]
               [-N batch_msg_count] [-n batch_top_domains]
               [-c config_directory] [queue_name ...]

DESCRIPTION
       The  qshape  program  helps  the  administrator understand the Postfix queue message distribution in time and by sender domain or recipient
       domain. The program needs read access to the queue directories and queue files, so it must run as the superuser or the mail_owner specified
       in main.cf (typically postfix).

       Options:

       -s     Display  the sender domain distribution instead of the recipient domain distribution.  By default the recipient distribution is dis‐
              played. There can be more recipients than messages, but as each message has only one sender, the sender distribution  is  a  message
              distribution.

       -p     Generate  aggregate  statistics  for parent domains. Top level domains are not shown, nor are domains with fewer than min_subdomains
              subdomains. The names of parent domains are shown with a leading dot, (e.g. .example.com).

       -m min_subdomains
              When used with the -p option, sets the minimum subdomain count needed to show a separate line for a parent domain. The default is 5.

       -b bucket_count
              The age distribution is broken up into a sequence of geometrically increasing intervals. This option sets the number of intervals or
              "buckets".  Each  bucket  has  a maximum queue age that is twice as large as that of the previous bucket. The last bucket has no age
              limit.

       -t bucket_time
              The age limit in minutes for the first time bucket. The default value is 5, meaning that the first bucket counts messages between  0
              and 5 minutes old.

       -l     Instead of using a geometric age sequence, use a linear age sequence, in other words simple multiples of bucket_time.

              This feature is available in Postfix 2.2 and later.

       -w terminal_width
              The  output is right justified, with the counts for the last bucket shown on the 80th column, the terminal_width can be adjusted for
              wider screens allowing more buckets to be displayed without truncating the domain names on the left. When a row for  a  full  domain
              name  and its counters does not fit in the specified number of columns, only the last 17 bytes of the domain name are shown with the
              prefix replaced by a '+' character. Truncated parent domain rows are shown as '.+' followed by the last 16 bytes of the domain name.
              If this is still too narrow to show the domain name and all the counters, the terminal_width limit is violated.

       -N batch_msg_count
              When  the  output device is a terminal, intermediate results are shown each "batch_msg_count" messages. This produces usable results
              in a reasonable time even when the deferred queue is large. The default is to show intermediate results every 1000 messages.

       -n batch_top_domains
              When reporting intermediate or final results to a termainal, report only the top "batch_top_domains" domains. The default  limit  is
              20 domains.

       -c config_directory
              The main.cf configuration file is in the named directory instead of the default configuration directory.

       Arguments:

       queue_name
              By  default  qshape displays the combined distribution of the incoming and active queues. To display a different set of queues, just
              list their directory names on the command line.  Absolute paths are used as is, other  paths  are  taken  relative  to  the  main.cf
              queue_directory  parameter  setting.  While main.cf supports the use of $variable expansion in the definition of the queue_directory
              parameter, the qshape program does not. If you must use variable expansions in the queue_directory  setting,  you  must  specify  an
              explicit absolute path for each queue subdirectory even if you want the default incoming and active queue distribution.

SEE ALSO
       mailq(1), List all messages in the queue.
       QSHAPE_README Examples and background material.

FILES
       $config_directory/main.cf, Postfix installation parameters.
       $queue_directory/maildrop/, local submission directory.
       $queue_directory/incoming/, new message queue.
       $queue_directory/hold/, messages waiting for tech support.
       $queue_directory/active/, messages scheduled for delivery.
       $queue_directory/deferred/, messages postponed for later delivery.

LICENSE
       The Secure Mailer license must be distributed with this software.

AUTHOR(S)
       Victor Duchovni
       Morgan Stanley

                                                                                                                                         QSHAPE(1)
