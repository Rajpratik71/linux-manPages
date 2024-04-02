vinetto(1)                                extract thumbnails and associated metadata from Thumbs.db files                               vinetto(1)

NAME
       vinetto - extract thumbnails and associated metadata from Thumbs.db files

SYNOPSIS
            vinetto [OPTION] [-o DIR] file

DESCRIPTION
       vinetto extracts the thumbnails and associated metadata from the Thumbs.db files.

       The  MS Windows systems (98, ME, 2000, XP and 2003 Server) can store thumbnails and metadata of the picture files contained in directories.
       The thumbnails and associated metadata are stored in Thumbs.db files (that are undocumented OLE structured files). Once a picture file  has
       been deleted from the filesystem, the related thumbnail and associated metadata remain stored in the Thumbs.db file. So, the data contained
       in Thumbs.db files are a helpful source of information for the forensics investigators.

       vinetto will help *nix-based forensics investigators to:

              ·  easily preview thumbnails of deleted pictures on Windows systems;

              ·  obtain information (dates, path, ...) about these deleted pictures.

OPTIONS
       --version
              Show program's version number and exit.

       -h, --help
              Show help message and exit.

       -o DIR Write thumbnails to DIR

       -H     Write html report to DIR

       -U     Use utf8 encodings.

       -s     Create symlink of the picture realname to the numbered name in DIR/.thumbs.

EXAMPLES
       Display metadata contained within a Thumbs.db file:

           $ vinetto /path/to/Thumbs.db

       Extract the related thumbnails to a directory:

           $ vinetto -o /tmp/vinetto_output /path/to/Thumbs.db

       Extract the related thumbnails to a directory and produce a HTML report to preview these thumbnails through your favorite browser:

           $ vinetto -Ho /tmp/vinetto_output /path/to/Thumbs.db

       Get a metadata report on all non deleted Thumbs.db files contained within a partition:

           $ find /mnt/sda2 -iname thumbs.db -printf "\n==\n %p \n\n" -exec vinetto {} \; 2>/tmp/vinetto_err.log >/tmp/vinetto_sda2.txt

TIP
       vinetto can generate its results in hidden directories, as .thumbs.

BUGS
       MS Windows stores thumbnails in its Thumbs.db files, according to various formats. At present, vinetto does not produce an excellent recon‐
       struction of Type 1a thumbnails. See more details and examples here[1].

       [1] http://vinetto.sf.net/docs.html

       In 0.07 version, vinetto can crash when used without '-o' option. If this command crashes:

           $ vinetto /path/to/Thumbs.db

       Please, try this:

           $ vinetto -o . /path/to/Thumbs.db

       It will show metadata and extract the thumbs (maybe an undesirable result). But it won't crash.

AUTHOR
       vinetto was written by Michel Roukine <rukin@users.sf.net>.

       This  manual  page was written by Danny van der Meeren <danny@illogic.nl> and updated by Joao Eriberto Mota Filho <eriberto@debian.org> for
       Debian project (but may be used by others).

VINETTO 0.07                                                         Dec 2014                                                           vinetto(1)
