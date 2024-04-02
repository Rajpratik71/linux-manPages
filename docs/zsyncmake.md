zsyncmake(1)                                                       File Transfer                                                      zsyncmake(1)

NAME
       zsyncmake - Build control file for zsync(1)

SYNTAX
       zsyncmake [ { -z | -Z } ] [ -e ] [ -C ] [ -u url ] [ -U url ] [ -b blocksize ] [ -o outfile ] [ -f targetfilename ] [ -v ] filename

       zsync -V

DESCRIPTION
       Constructs  a metafile for the zsync client program to use to perform partial file downloads. filename is the file that users wish to down‐
       loads; zsyncmake constructs the appropriate metafile and writes filename.zsync in the current directory.

       zsync will need at least one URL from which to download the file content. If the .zsync will be in the same directory as the file to  down‐
       load,  you  can  accept  the default - zsync includes a relative URL in the control file. If not, use the -u option to specify the URL. You
       should also specify a URL for the uncompressed content with -U if available, as zsync can make use of this  for  more  efficient  downloads
       sometimes.  (You  can  edit  the .zsync file and add these afterwards - it has a simple key: value format in the header - but I suggest you
       only do this once you are familiar with the tool.)

       Note that zsyncmake itself does not (currently) verify the URLs or download any data, you must provide the file data locally and check  the
       URLs yourself.

OPTIONS
       -b blocksize
              Specify  the blocksize to the underlying rsync algorithm. A smaller blocksize may be more efficient for files where there are likely
              to be lots of small, scattered changes between downloads; a larger blocksize is more efficient for files with fewer  or  less  scat‐
              tered  changes. This blocksize must be a power of two. If not specified, zsyncmake chooses one which it thinks is best for this file
              (currently either 2048 or 4096 depending on file size) - so normally tyou should not need to override the default.

       -C     Tells zsyncmake not to generate any instructions in the .zsync telling the client to compress the data it receives. This is  implied
              by  -z,  but  this option is here in case you compress a file yourself only for the transfer, but want the client to end up with the
              uncompressed file (e.g. you are transferring an ISO, which is held compressed on the server, but which the client cannot use  unless
              it  is  uncompressed). Without -C, zsyncmake will produce directions for the client to compress the file it receives where appropri‐
              ate; -C is here so you can stop it telling the client to do that.

       -e     Tells zsyncmake that the client must be able to receive the exact file that was supplied. Without this option, zsyncmake only  gives
              a  weaker guarantee - that the client will receive the data it contains (e.g. it might transfer the uncompressed version of a .gz to
              the client). Note that this still doesn't guarantee that the client will get it - the client could  ignore  the  directives  in  the
              zsync  file, or might be incapable of exactly reproducing the compression used. But with -e you know that zsyncmake has made it pos‐
              sible to get the exact data - it will exit with an error if it cannot.

       -f filename
              Set the filename to include in the output file (this is what the file will be called when a user finished downloading it).

       -o outputfile
              Override the default output file name.

       -u url Specifies the URL from which users can download the content of the supplied file. Users need the control file in order to  find  out
              what parts of the file they already have, and they need the URLs to retrieve the parts of the file that they don't already have. You
              can specify multiple URLs by specifying -u multiple times. If not specified, zsync assumes that the file and the .zsync will  reside
              in the same public directory, and includes a single relative URL.

       -U url Specifies  a  URL  corresponding to the decompressed content of the file (only applicable if it is a gzip file). zsync can sometimes
              download more efficiently from the uncompressed data than from the compressed data - it will take advantage of this if available. If
              no  URLs are specifies, zsync looks for a file without the .gz extension and assumes that this will be in the same public dir as the
              .zsync, and includes a relative URL to it.

       -v     Enable verbose messages.

       -V     Prints the version of zsync.

       -z     Compress the file to transfer. Note that this overwrites any file called filename.gz without warning (if you don't give a  filename,
              e.g. because you are reading from stdin, then zsync will use the name supplied with -f, or as a last fallback, zsync-target.gz).

       zsync  can  work  with  compressed  data,  and, in most cases where the data is not already compressed, it is more efficient to compress it
       first. While you can just compress the file to transfer with gzip, if you use this option then zsyncmake will compress the  file  for  you,
       producing  a .gz file which is optimised for zsync. This can be 30% more efficient at download time than compressing with gzip --best - but
       the compressed file will not be as small at that produced by gzip.

       -Z     zsyncmake automatically looks inside gzip compressed files and exports the underlying, uncompressed data to the zsyncmake  file.  In
              testing  this  has  proved  to provide greater download efficiency. -Z overrides the default behaviour and treats gzip files as just
              binary data. Use this if it is essential that the user receives the compressed data (for instance because a cryptographic  signature
              is  available  only  for the compressed data). zsync is typically no use if you specify -Z, unless the gzip file was compressed with
              the special --rsync option to make it friendly to differential transfers.

EXAMPLES
       zsyncmake -C -u http://ftp.uk.debian.org/debian/dists/sarge/main/binary-i386/Packages.gz Packages.gz

       Note use of -C to save the client compressing the file on receipt; the Debian package system uses the file uncompressed.

       zsyncmake -z my-subversion-dump

       In this case there is a large, compressible file to transfer. This creates a gzipped version of the  file  (optimised  for  zsync),  and  a
       .zsync file. A URL is automatically added assuming that the two files will be served from the same directory on the web server.

       zsyncmake -e -u http://www.mirrorservice.org/sites/ftp.freebsd.org/pub/FreeBSD/ports/distfiles/zsync-0.2.2.tar.gz zsync-0.2.2.tar.gz

       This  creates a zsync referring to the named source tarball, which the client should download from the given URL. This example is for down‐
       loading a source tarball for a FreeBSD port, hence -e is specified so the client will be able to match its md5sum.

AUTHORS
       Colin Phipps <cph@moria.org.uk>

SEE ALSO
       zsync(1)

Colin Phipps                                                           0.6.2                                                          zsyncmake(1)
