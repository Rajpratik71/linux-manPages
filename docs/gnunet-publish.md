GNUNET-PUBLISH(1)                      General Commands Manual                      GNUNET-PUBLISH(1)

NAME
       gnunet-publish - a command line interface for publishing new content into GNUnet

SYNOPSIS
       gnunet-publish [OPTIONS] FILENAME

DESCRIPTION
       In  order  to  share  files with other GNUnet users, the files must first be made available to
       GNUnet.  GNUnet does not automatically share all files from a certain directory (however,  you
       can do this with the gnunet-auto-share tool).  In fact, even files that are downloaded are not
       automatically shared.

       In order to start sharing files, the files must be added  either  using  gnunet-publish  or  a
       graphical  interface such as gnunet-fs-gtk.  The command line tool gnunet-publish is more use‐
       ful if many files are supposed to be added.  gnunet-publish can automatically publish  batches
       of  files,  recursively  publish  directories,  create  directories that can be browsed within
       GNUnet and publish file lists in a namespace.  When run on a  directory,  gnunet-publish  will
       always recursively publish all of the files in the directory.

       gnunet-publish  can automatically extract keywords from the files that are shared.  Users that
       want to download files from GNUnet use keywords to search for the  appropriate  content.   You
       can disable keyword extraction with the -D option.  You can manually add keywords using the -k
       option. The keywords are case-sensitive.

       In addition to searching for files by keyword, GNUnet allows organizing  files  into  directo‐
       ries.   With  directories,  the  user  only needs to find the directory in order to be able to
       download any of the files listed in the directory.  Directories can contain pointers to  other
       directories.

       With  gnunet-publish,  it  is  easy  to  create new directories simultaneously when adding the
       files.  Simply pass the name of a directory instead of a file.

       Since keywords can be spammed (any user can add any content under any  keyword),  GNUnet  sup‐
       ports  namespaces.  A namespace is a subset of the searchspace into which only the holder of a
       certain pseudonym can add content.  Any GNUnet user can create any number of pseudonyms  using
       gnunet-pseudonym.  Pseudonyms  are stored in the user's GNUnet directory. While pseudonyms are
       locally identified with an arbitrary string that the user selects when the pseudonym  is  cre‐
       ated,  the namespace is globally known only under the hash of the public key of the pseudonym.
       Since only the owner of the pseudonym can add content to the namespace, it is  impossible  for
       other users to pollute the namespace. gnunet-publish automatically publishes the top-directory
       (or the only file if only one file is specified) into the namespace if a pseudonym  is  speci‐
       fied.

       It is possible to update content in GNUnet if that content was placed and obtained from a par‐
       ticular namespace.  Updates are only possible for content in namespaces since this is the only
       way  to  assure  that  a  malicious  party can not supply counterfeited updates.  Note that an
       update with GNUnet does not make the old content unavailable, GNUnet merely  allows  the  pub‐
       lisher to point users to more recent versions. You can use the -N option to specify the future
       identifier of an update.  When using this option, a GNUnet client that finds the current  (-t)
       identifier  will  automatically  begin  a search for the update (-N) identifier.  If you later
       publish an update under the (-N) identifier, both results will be given to the user.

       You can use automatic meta-data extraction (based on libextractor) or the command-line  option
       -m  to specify meta-data.  For the -m option you need to use the form keyword-type:value.  For
       example, use "-m os:Linux" to specify that the operating system is  Linux.   Common  meta-data
       types are "author", "title" , "mimetype", "filename", "language", "subject" and "keywords".  A
       full list can be obtained from the extract tool using the option  --list.   The  meta-data  is
       used to help users in searching for files on the network.  The keywords are case-sensitive.

       GNUnet  supports two styles of publishing files on the network. Publishing a file means that a
       copy of the file is made in the local (!) database of the node.  Indexing a file means that an
       index  is  added to the local (!)  database with symbolic links to the file itself.  The links
       will use the SHA-512 hash of the entire file as the filename.  Indexing is generally  signifi‐
       cantly  more  efficient  and  the default choice.  However, indexing only works if the indexed
       file can be read (using the same absolute path) by gnunet-service-fs.   If  this  is  not  the
       case, indexing will fail (and gnunet-publish will automatically revert to publishing instead).
       Regardless of which method is used to publish the file, the file will be slowly (depending  on
       how  often it is requested and on how much bandwidth is available) dispersed into the network.
       If you publish or index a file and then leave the network, it will almost always NOT be avail‐
       able anymore.

       -c FILENAME, --config=FILENAME Use alternate config file (if this option is not specified, the
       default is ~/.config/gnunet.conf).

       -D, --disable-extractor
              Disable use of GNU libextractor for finding additional keywords and metadata.

       -e, --extract
              Print the list of keywords that will be used for each file given the  current  options.
              Do not perform any indexing or publishing.

       -h, --help
              Print a brief help page with all the options.

       -k KEYWORD, --key=KEYWORD
              additional  key  to  index  the  content  with  (to add multiple keys, specify multiple
              times). Each additional key is case-sensitive. Can be specified  multiple  times.   The
              keyword is only applied to the top-level file or directory.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Change the loglevel.  Possible values for LOGLEVEL are ERROR, WARNING, INFO and DEBUG.

       -m TYPE:VALUE, --meta=TYPE:VALUE
              For  the  main  file  (or  directory),  set the metadata of the given TYPE to the given
              VALUE.  Note that this will not add the respective VALUE to the set of  keywords  under
              which the file can be found.

       -n, --noindex
              Executive summary: You probably don't need it.

              Do not index, full publishing.  Note that directories, RBlocks, SBlocks and IBlocks are
              always published (even without this option).  With this  option,  every  block  of  the
              actual  files  is  stored  in  encrypted  form in the block database of the local peer.
              While this adds security if the local node is compromised  (the  adversary  snags  your
              machine),  it  is  significantly less efficient compared to on-demand encryption and is
              definitely not recommended for large files.

       -N ID, --next=ID
              Specifies the next ID of a future version of the SBlock.  This  option  is  only  valid
              together with the -P option.  This option can be used to specify what the identifier of
              an updated version will look like.  Note that specifying -i and -N without  -t  is  not
              allowed.

       -p PRIORITY, --prio=PRIORITY
              Executive summary: You probably don't need it.

              Set  the  priority  of  the published content (default: 365).  If the local database is
              full, GNUnet will discard the content with the lowest ranking.  Note that ranks  change
              over  time  depending on popularity.  The default should be high enough to preserve the
              locally published content in favor of content that migrates from other peers.

       -P NAME, --pseudonym=NAME
              For the top-level directory or file, create an SBlock that places  the  file  into  the
              namespace specified by the pseudonym NAME.

       -r LEVEL, --replication=LEVEL
              Set  the desired replication level.  If CONTENT_PUSHING is set to YES, GNUnet will push
              each block (for the file) LEVEL times to  other  peers  before  doing  normal  "random"
              replication  of all content.  This option can be used to push some content out into the
              network harder. Note that pushing content LEVEL times into the network does not guaran‐
              tee that there will actually be LEVEL replicas.

       -s, --simulate-only
              When  this  option  is used, gnunet-publish will not actually publish the file but just
              simulate what would be done.  This can be used to compute the GNUnet  URI  for  a  file
              without actually sharing it.

       -t ID, --this=ID
              Specifies the ID of the SBlock.  This option is only valid together with the -s option.

       -u URI, --uri=URI
              This option can be used to specify the URI of a file instead of a filename (this is the
              only case where the otherwise mandatory filename argument must be omitted).  Instead of
              publishing a file or directory and using the corresponding URI, gnunet-publish will use
              this URI and perform the selected namespace or keyword operations.  This can be used to
              add  additional  keywords  to  a file that has already been shared or to add files to a
              namespace for which the URI is known but the content is not locally available.

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
       Basic examples

       Index a file COPYING:

        # gnunet-publish COPYING

       Publish a file COPYING:

        # gnunet-publish -n COPYING

       Index a file COPYING with the keywords gpl and test:

        # gnunet-publish -k gpl -k test COPYING

       Index  a  file COPYING with description "GNU License", mime-type "text/plain" and keywords gpl
       and test:

        # gnunet-publish -m "description:GNU License" -k gpl -k test -m "mimetype:text/plain" COPYING

       Using directories

       Index the files COPYING and AUTHORS with keyword test and build a directory containing the two
       files.   Make  the directory itself available under keyword gnu and disable keyword extraction
       using libextractor:

        # mkdir gnu
        # mv COPYING AUTHORS gnu/
        # gnunet-publish -K test -k gnu -D gnu/

       Neatly publish an image gallery in kittendir/ and its subdirs with  keyword  kittens  for  the
       directory but no keywords for the individual files or subdirs (-n).  Force description for all
       files:

        # gnunet-publish -n -m "description:Kitten collection" -k kittens kittendir/

       Secure publishing with namespaces

       Publish file COPYING with pseudonym RIAA-2 (-P) and with identifier gpl (-t) and no updates:

        # gnunet-publish -P RIAA-2 -t gpl COPYING

       Recursively index /home/ogg and build a matching directory structure.  Publish  the  top-level
       directory into the namespace under the pseudonym RIAA-2 (-P) under identifier 'MUSIC' (-t) and
       promise to provide an update with identifier 'VIDEOS' (-N):

        # gnunet-publish -P RIAA-2 -t MUSIC -N VIDEOS /home/ogg

       Recursively publish (-n) /var/lib/mysql and build a matching directory structure, but  disable
       the use of libextractor to extract keywords (-n).  Print the file identifiers (-V) that can be
       used to retrieve the files.  This will store a copy of the MySQL database in GNUnet but  with‐
       out  adding  any  keywords  to search for it.  Thus only people that have been told the secret
       file identifiers printed with the -V option can retrieve the (secret?) files:

        # gnunet-publish -nV /var/lib/mysql

       Create a namespace entry 'root' in namespace MPAA-1 and announce that the next update will  be
       called 'next':

        # gnunet-publish -P MPAA-1 -t root -N next noise.mp3

       Update the previous entry, do not allow any future updates:

        # gnunet-publish -P MPAA-1 -t next noise_updated.mp3

FILES
       ~/.config/gnunet.conf
              GNUnet configuration file

REPORTING BUGS
       Report  bugs  to  <https://gnunet.org/bugs/> or by sending electronic mail to <gnunet-develop‐
       ers@gnu.org>

SEE ALSO
       gnunet-auto-share(1), gnunet-fs-gtk(1), gnunet-search(1), gnunet-download(1),  gnunet.conf(5),
       extract(1)

GNUnet                                       25 Feb 2012                            GNUNET-PUBLISH(1)
