COPYDATABASE(1)                             User Commands                             COPYDATABASE(1)

NAME
       copydatabase - Perform a document-by-document copy of one or more Xapian databases

SYNOPSIS
       copydatabase SOURCE_DATABASE... DESTINATION_DATABASE

DESCRIPTION
       copydatabase - Perform a document-by-document copy of one or more Xapian databases

OPTIONS
       --no-renumber
              Preserve the numbering of document ids (useful if you have external references to them,
              or have set them to match unique ids from an  external  source).   If  multiple  source
              databases are specified and the same docid occurs in more one, the last occurrence will
              be the one which ends up in the destination database.

       --help display this help and exit

       --version
              output version information and exit

xapian-core 1.4.5                            October 2017                             COPYDATABASE(1)
