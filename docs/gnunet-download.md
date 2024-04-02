GNUNET-DOWNLOAD(1)                     General Commands Manual                     GNUNET-DOWNLOAD(1)

NAME
       gnunet-download - a command line interface for downloading files from GNUnet

SYNOPSIS
       gnunet-download [OPTIONS] -- GNUNET_URI

DESCRIPTION
       Download files from GNUnet.

       -a LEVEL, --anonymity=LEVEL
              set desired level of receiver anonymity.  Default is 1.

       -c FILENAME, --config=FILENAME
              use config file (defaults: ~/.config/gnunet.conf)

       -D, --delete-incomplete
              causes  gnunet-download  to delete incomplete downloads when aborted with CTRL-C.  Note
              that complete files that are part of an  incomplete  recursive  download  will  not  be
              deleted even with this option.  Without this option, terminating gnunet-download with a
              signal will cause incomplete downloads to stay on disk.   If  gnunet-download  runs  to
              (normal) completion finishing the download, this option has no effect.

       -h, --help
              print help page

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -n, --no-network
              Only search locally, do not forward requests to other peers.

       -o FILENAME, --output=FILENAME
              write  the  file to FILENAME.  Hint: when recursively downloading a directory, append a
              '/' to the end of the FILENAME to create a directory of that name.  If no  FILENAME  is
              specified,  gnunet-download  constructs  a  temporary ID from the URI of the file.  The
              final filename is constructed based  on  meta-data  extracted  using  libextractor  (if
              available).

       -p DOWNLOADS, --parallelism=DOWNLOADS
              set  the maximum number of parallel downloads that is allowed.  More parallel downloads
              can, to some extent, improve the overall time to download content.   However,  parallel
              downloads  also  take more memory (see also option -r which can be used to limit memory
              utilization) and more sockets.  This option is used to limit the number of  files  that
              are  downloaded in parallel (-r can be used to limit the number of blocks that are con‐
              currently requested).  As a result, the value only  matters  for  recursive  downloads.
              The default value is 32.

       -r REQUESTS, --request-parallelism=REQUESTS
              set  the  maximum  number  of parallel requests that is allowed.  If multiple files are
              downloaded, gnunet-download will not run them in parallel if this would cause the  num‐
              ber  of pending requests to possibly exceed the given value.  This is useful since, for
              example, downloading dozens of multi-gigabyte files in parallel  could  exhaust  memory
              resources  and  would hardly improve performance.   Note that the limit only applies to
              this specific process and that other download activities by  other  processes  are  not
              included in this limit.  Consider raising this limit for large recursive downloads with
              many large files if memory and network bandwidth are not fully utilized and if the par‐
              allelism limit (-p option) is not reached.  This option also only matters for recursive
              downloads.  The default value is 4092.

       -R, --recursive
              download directories recursively (and in parallel); note that the URI must belong to  a
              GNUnet directory and that the filename given must end with a '/' -- otherwise, only the
              file corresponding to the URI will be downloaded.  Note that in addition to using '-R',
              you  must  also  specify a filename ending in '.gnd' so that the code realizes that the
              top-level file is a directory (since we have no meta data).

       -v, --version
              print the version number

       -V, --verbose
              print progress information

NOTES
       The GNUNET_URI is typically obtained  from  gnunet-search.  gnunet-fs-gtk  can  also  be  used
       instead  of  gnunet-download.   If you ever have to abort a download, you can at any time con‐
       tinue it by re-issuing gnunet-download with the same filename. In that case  GNUnet  will  not
       download  blocks  again  that  are  already  present.  GNUnet's file-encoding will ensure file
       integrity, even if the existing file was not downloaded from GNUnet in the first place. Tempo‐
       rary information will be appended to the target file until the download is completed.

SETTING ANONYMITY LEVEL
       The  -a  option  can  be used to specify additional anonymity constraints. If set to 0, GNUnet
       will try to download the file as fast as possible, including using non-anonymous methods.   If
       you  set  it  to 1 (default), you use the standard anonymous routing algorithm (which does not
       explicitly leak your identity).  However, a powerful adversary may still be  able  to  perform
       traffic  analysis (statistics) to over time infer data about your identity.  You can gain bet‐
       ter privacy by specifying a higher level of anonymity, which increases  the  amount  of  cover
       traffic  your  own  traffic  will get, at the expense of performance.  Note that your download
       performance is not only determined by your own anonymity level,  but  also  by  the  anonymity
       level  of  the peers publishing the file.  So even if you download with anonymity level 0, the
       peers publishing the data might be sharing with a higher anonymity level, which in  this  case
       will  determine  performance.   Also,  peers  that  cache  content  in  the network always use
       anonymity level 1.

       This option can be used to limit requests further than that. In particular,  you  can  require
       GNUnet  to  receive  certain  amounts of traffic from other peers before sending your queries.
       This way, you can gain very high levels of anonymity - at the expense of much more traffic and
       much higher latency. So set it only if you really believe you need it.

       The definition of ANONYMITY-RECEIVE is the following.  0 means no anonymity is required.  Oth‐
       erwise a value of 'v' means that 1 out of v bytes of "anonymous" traffic can be from the local
       user,  leaving  'v-1'  bytes  of cover traffic per byte on the wire.  Thus, if GNUnet routes n
       bytes of messages from foreign peers (using anonymous routing), it may originate n/(v-1) bytes
       of  queries  in  the  same time-period. The time-period is twice the average delay that GNUnet
       defers forwarded queries.

       The default is 1 and this should be fine for most users.  Also notice that if you choose  very
       large  values,  you  may end up having no throughput at all, especially if many of your fellow
       GNUnet-peers all do the same.

FILES
       ~/.config/gnunet.conf
              GNUnet configuration file

REPORTING BUGS
       Report bugs to <https://gnunet.org/bugs/> or by sending electronic  mail  to  <gnunet-develop‐
       ers@gnu.org>

SEE ALSO
       gnunet-fs-gtk(1), gnunet-publish(1), gnunet-search(1), gnunet.conf(5), gnunet-service-fs(1)

GNUnet                                       25 Feb 2012                           GNUNET-DOWNLOAD(1)
