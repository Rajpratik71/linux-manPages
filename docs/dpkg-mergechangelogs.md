dpkg-mergechangelogs(1)                                                                       dpkg suite                                                                       dpkg-mergechangelogs(1)

NAME
       dpkg-mergechangelogs - 3-way merge of debian/changelog files

SYNOPSIS
       dpkg-mergechangelogs [option...] old new-a new-b [out]

DESCRIPTION
       This  program  will use the 3 provided versions of the Debian changelog to generate a merged changelog file. The resulting changelog is stored in the file out or output to the standard output
       if that parameter is not given.

       Each entry is identified by its version number and they are assumed to be not conflicting, they are simply merged in the right order (by decreasing version number).  When  --merge-prereleases
       is used, the part of the version number after the last tilde is dropped so that 1.0-1~exp1 and 1.0-1~exp5 are considered to be the same entry. When the same version is available in both new-a
       and new-b, a standard line-based 3-way merge is attempted (provided that the module Algorithm::Merge is available — it's part of the package libalgorithm-merge-perl  —  otherwise  you  get  a
       global conflict on the content of the entry).

OPTIONS
       -m, --merge-prereleases
              Drop the part after the last tilde in the version number when doing version comparison to identify if two entries are supposed to be the same or not.

              This  is  useful when you keep using the same changelog entry but you increase its version number regularly. For instance, you might have 2.3-1~exp1, 2.3-1~exp2, ... until the official
              release 2.3-1 and they are all the same changelog entry that has evolved over time.

       --help Show the usage message and exit.

       --version
              Show the version and exit.

LIMITATIONS
       Anything that is not parsed by Dpkg::Changelog is lost during the merge.  This might include stuff like Vim modelines, Emacs variables, comments which were not supposed to be there, etc.

INTEGRATION WITH GIT
       If you want to use this program to merge Debian changelog files in a git repository, you have first to register a new merge driver in .git/config or ~/.gitconfig:

        [merge "dpkg-mergechangelogs"]
            name = debian/changelog merge driver
            driver = dpkg-mergechangelogs -m %O %A %B %A

       Then you have to setup the merge attribute for the debian/changelog file either in .gitattributes in the repository itself, or in .git/info/attributes:

        debian/changelog merge=dpkg-mergechangelogs

1.19.0.5                                                                                      2018-10-04                                                                       dpkg-mergechangelogs(1)
