GNUNET-SEARCH(1)                                GNUnet                               GNUNET-SEARCH(1)

NAME
       gnunet-search - a command line interface to search for content on GNUnet

SYNOPSIS
       gnunet-search [OPTIONS] [+]KEYWORD [[+]KEYWORD]*

       gnunet-search [OPTIONS] [+]URI

DESCRIPTION
       Search for content on GNUnet. The keywords are case-sensitive.  gnunet-search can be used both
       for a search in the global namespace as well as for searching a private subspace.

       -a LEVEL, --anonymity=LEVEL

              The -a option can be used to specify additional anonymity constraints.  If  set  to  0,
              GNUnet will try to download the file as fast as possible, including using non-anonymous
              methods.  If you set it to 1 (default), you use the standard  anonymous  routing  algo‐
              rithm  (which  does  not explicitly leak your identity).  However, a powerful adversary
              may still be able to perform traffic analysis (statistics)  to  over  time  infer  data
              about  your  identity.   You  can  gain  better privacy by specifying a higher level of
              anonymity, which increases the amount of cover traffic your own traffic  will  get,  at
              the expense of performance.  Note that your download performance is not only determined
              by your own anonymity level, but also by the anonymity level of  the  peers  publishing
              the  file.   So  even  if you download with anonymity level 0, the peers publishing the
              data might be sharing with a higher anonymity level, which in this case will  determine
              performance.   Also, peers that cache content in the network always use anonymity level
              1.

              This option can be used to limit requests further than that.  In  particular,  you  can
              require  GNUnet  to  receive certain amounts of traffic from other peers before sending
              your queries. This way, you can gain very high levels of anonymity - at the expense  of
              much  more  traffic  and  much higher latency. So set it only if you really believe you
              need it.

              The definition of  ANONYMITY-RECEIVE  is  the  following.   0  means  no  anonymity  is
              required.   Otherwise a value of 'v' means that 1 out of v bytes of "anonymous" traffic
              can be from the local user, leaving 'v-1' bytes of cover traffic per byte on the  wire.
              Thus,  if  GNUnet  routes n bytes of messages from foreign peers (using anonymous rout‐
              ing), it  may  originate  n/(v-1)  bytes  of  queries  in  the  same  time-period.  The
              time-period is twice the average delay that GNUnet defers forwarded queries.

              The  default  is  1  and  this  should be fine for most users.  Also notice that if you
              choose very large values, you may end up having no throughput  at  all,  especially  if
              many of your fellow GNUnet-peers all do the same.

       -c FILENAME, --config=FILENAME
              use config file (defaults: ~/.config/gnunet.conf)

       -h, --help
              print help page

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -o FILENAME, --output=FILENAME
              Writes a GNUnet directory containing all of the search results to FILENAME.

       -n, --no-network
              Only search locally, do not forward requests to other peers.

       -N VALUE, --results=VALUE
              automatically terminate the search after receiving VALUE results.

       -t DELAY, --timeout=DELAY
              Automatically timeout search after DELAY.  The value given must be a number followed by
              a space and a time unit, for example "500 ms".  Note that the quotes  are  required  on
              the shell.  Otherwise the search runs until gnunet-search is aborted with CTRL-C.

       -v, --version
              print the version number

       -V, --verbose
              print meta data from search results as well

NOTES
       You can run gnunet-search with an URI instead of a keyword.  The URI can have the format for a
       namespace  search  or  for  a  keyword  search.   For  a  namespace  search,  the  format   is
       gnunet://fs/sks/NAMESPACE/IDENTIFIER.  For a keyword search, use gnunet://fs/ksk/KEYWORD[+KEY‐
       WORD]*.  If the format does not correspond to a GNUnet URI, GNUnet will  automatically  assume
       that keywords are supplied directly.

       If  multiple keywords are passed, gnunet-search will look for content matching any of the key‐
       words.  The prefix "+" makes a keyword mandatory.

       # gnunet-search "Das Kapital"

       searches for content matching the keyword "Das Kapital".  Whereas

       # gnunet-search +Das +Kapital

       Searches for content matching both mandatory keywords "Das" and "Kapital".

       Search results are printed by gnunet-search like this:

            gnunet-download -o "COPYING" gnunet://fs/chk/HASH1.HASH2.SIZE

                 Description: The GNU General Public License

                 Mime-type: text/plain

       The first line contains the command to run to download the file.  The  suggested  filename  in
       the  example  is  COPYING.   The GNUnet URI consists of the key and query hash of the file and
       finally the size of the file.  After the command  to  download  the  file  GNUnet  will  print
       meta-data  about  the  file  as  advertised in the search result, here "The GNU General Public
       License" and the mime-type (see the options for gnunet-publish on how to supply  meta-data  by
       hand).

FILES
       ~/.config/gnunet.conf
              GNUnet configuration file; specifies the default value for the timeout

REPORTING BUGS
       Report  bugs  to  <https://gnunet.org/bugs/> or by sending electronic mail to <gnunet-develop‐
       ers@gnu.org>

SEE ALSO
       gnunet-fs-gtk(1), gnunet-publish(1), gnunet-download(1), gnunet.conf(5),

0.9.6                                        25 Feb 2012                             GNUNET-SEARCH(1)
