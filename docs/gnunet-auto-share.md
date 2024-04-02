GNUNET-AUTO-SHARE(1)                   General Commands Manual                   GNUNET-AUTO-SHARE(1)

NAME
       gnunet-auto-share  - a command line tool to automatically share an entire directory with other
       users

SYNOPSIS
       gnunet-auto-share [OPTIONS] DIRNAME

DESCRIPTION
       In order to share files with other GNUnet users, the files must first  be  made  available  to
       GNUnet.  This tool can be used to automatically share all files from a certain directory.  The
       program will periodically scan the directory for changes and publish files  that  are  new  or
       that changed on GNUnet.  Which files have already been shared is remembered in a ".auto-share"
       file in the shared directory.  You can run the tool by hand or  automatically  by  adding  the
       respective  options  to your configuration.  gnunet-auto-share has many options in common with
       gnunet-publish, but can only be used to index files.

       You can use automatic meta-data extraction (based on libextractor).

       -c FILENAME, --config=FILENAME Use alternate config file (if this option is not specified, the
       default is ~/.config/gnunet.conf).

       -D, --disable-extractor
              Disable use of GNU libextractor for finding additional keywords and metadata.

       -h, --help
              Print a brief help page with all the options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -p PRIORITY, --prio=PRIORITY
              Executive summary: You probably don't need it.

              Set  the  priority  of  the published content (default: 365).  If the local database is
              full, GNUnet will discard the content with the lowest ranking.  Note that ranks  change
              over  time  depending on popularity.  The default should be high enough to preserve the
              locally published content in favor of content that migrates from other peers.

       -r LEVEL, --replication=LEVEL
              Set the desired replication level.  If CONTENT_PUSHING is set to YES, GNUnet will  push
              each  block  (for  the  file)  LEVEL  times to other peers before doing normal "random"
              replication of all content.  This option can be used to push some content out into  the
              network harder. Note that pushing content LEVEL times into the network does not guaran‐
              tee that there will actually be LEVEL replicas.

       -v, --version
              Print the version number.

       -V, --verbose
              Be verbose.  Using this option causes gnunet-publish to print progress information  and
              at the end the file identification that can be used to download the file from GNUnet.

SETTING ANONYMITY LEVEL
       The  -a  option  can  be used to specify additional anonymity constraints. If set to 0, GNUnet
       will publish the file non-anonymously and in fact sign the advertisement for  the  file  using
       your  peer's  private key.  This will allow other users to download the file as fast as possi‐
       ble, including using non-anonymous methods (DHT,  direct  transfer).   If  you  set  it  to  1
       (default),  you  use  the standard anonymous routing algorithm (which does not explicitly leak
       your identity).  However, a powerful adversary may still be able to perform  traffic  analysis
       (statistics)  to  over  time  infer  data about your identity.  You can gain better privacy by
       specifying a higher level of anonymity, which increases the amount of cover traffic  your  own
       traffic  will get, at the expense of performance.  Note that regardless of the anonymity level
       you choose, peers that cache content in the network always use anonymity level 1.

       The definition of the ANONYMITY LEVEL is the following.  0 means  no  anonymity  is  required.
       Otherwise  a  value  of 'v' means that 1 out of v bytes of "anonymous" traffic can be from the
       local user, leaving 'v-1' bytes of cover traffic per byte on the wire.  Thus, if GNUnet routes
       n  bytes  of  messages  from foreign peers (using anonymous routing), it may originate n/(v-1)
       bytes of data in the same time-period. The time-period is twice the average delay that  GNUnet
       defers forwarded queries.

       The  default is 1 and this should be fine for most users.  Also notice that if you choose very
       large values, you may end up having no throughput at all, especially if many  of  your  fellow
       GNUnet-peers all do the same.

EXAMPLES
       Basic example

       Share a directory "$HOME/gnunet-share/":

        # gnunet-auto-share $HOME/gnunet-share/ &

       Basic configuration

       Share a directory "$HOME/gnunet-share/":

        [ARM]
        DEFAULTSERVICES = gnunet-auto-share # other default services here

        [gnunet-auto-share]
        OPTIONS = $HOME/gnunet-share

FILES
       ~/.config/gnunet.conf
              GNUnet configuration file

REPORTING BUGS
       Report  bugs  to  <https://gnunet.org/bugs/> or by sending electronic mail to <gnunet-develop‐
       ers@gnu.org>

SEE ALSO
       gnunet-fs-gtk(1),  gnunet-publish(1),  gnunet-search(1),  gnunet-download(1),  gnunet.conf(5),
       extract(1)

GNUnet                                       18 Jun 2012                         GNUNET-AUTO-SHARE(1)
