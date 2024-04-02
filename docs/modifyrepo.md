modifyrepo(1)                                                                                                                                                                                   modifyrepo(1)



NAME
       modifyrepo - Modify a repomd (xml-rpm-metadata) repository


SYNOPSIS
       modifyrepo [options] <input metadata> <output repodata>

DESCRIPTION
       modifyrepo is a program that allows you to insert arbitrary metadata into a repomd (xml-based rpm metadata) repository.


OPTIONS
       --mdtype <mdtype>
              Specify datatype of the metadata. If not specified, datatype will be derived from the filename.


       --remove
              Remove specified file from repodata.


       --compress
              Compress the new repodata before adding it to the repo. This is used by default.


       --no-compress
              Do not compress the new repodata before adding it to the repo.


       --compress-type <compress-type>
              Specify which compression type to use: gz (default), xz (may not be available), bz2.


       -s, --checksum <sumtype>
              Specify the checksum type to use.


       --unique-md-filenames
              Include the file's checksum in the metadata filename, helps with HTTP caching (default).


       --simple-md-filenames
              Do not include the file's checksum in the metadata filename.


       --version
              Output version.


       -h --help
              Show help menu.


EXAMPLES
       $ modifyrepo --mdtype=newmd metadata.xml /repository/repodata
       Wrote: /repository/repodata/metadata.xml.gz
                  type = newmd
              location = repodata/metadata.xml.gz
              checksum = 1d7ee93db2964e7f85e07ec19b3204591da1050c
             timestamp = 1196716296.0
         open-checksum = 824d936dc7dfff029379797b311af0cc66af4115
       Wrote: /repository/repodata/repomd.xml


SEE ALSO
       createrepo (8)


AUTHORS
       Luke Macken <lmacken@redhat.com>
       Seth Vidal <skvidal@fedoraproject.org>


BUGS
       Any bugs which are found should be emailed to the mailing list: rpm-metadata@lists.baseurl.org



Luke Macken                                                                                       2007 Dec 3                                                                                    modifyrepo(1)
