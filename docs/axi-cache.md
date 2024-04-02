AXI-CACHE(1)                                                       User Commands                                                      AXI-CACHE(1)

NAME
       axi-cache - query the Apt Xapian Index

SYNOPSIS
       axi-cache [options] command [args]

DESCRIPTION
       Query the Apt Xapian index.

   Commands:
              search commands:

       axi-cache again [query]
              repeat the last search, possibly adding query terms

       axi-cache help
              show a summary of commands

       axi-cache info
              print information about the apt-xapian-index environment

       axi-cache last [count]
              show the last results again

       axi-cache more [count]
              show more terms from the last search

       axi-cache rdetails pkgname[s]
              show details of reverse relationships for the given packages

       axi-cache search [terms]
              start a new search

              apt-cache front-ends:

       axi-cache depends pkgname[s]
              run apt-cache depends pkgname[s]

       axi-cache madison pkgname[s]
              run apt-cache madison pkgname[s]

       axi-cache policy pkgname[s]
              run apt-cache policy pkgname[s]

       axi-cache rdepends pkgname[s]
              run apt-cache rdepends pkgname[s]

       axi-cache show pkgname[s]
              run apt-cache show pkgname[s]

       axi-cache showpkg pkgname[s]
              run apt-cache showpkg pkgname[s]

       axi-cache showsrc pkgname[s]
              run apt-cache showsrc pkgname[s]

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       -s SORT, --sort=SORT
              sort by the given value, as listed in /var/lib/apt-xapian-index/values. Add a '-' to reverse sort order

       --tags show matching tags, rather than packages

       --tabcomplete=TYPE
              suggest words for tab completion of the current command line (type is 'plain' or 'partial')

       --last use 'show --last' to limit tab completion to only the packages from the last search results

       --all  disable  pagination and always show all results. Note that search results are normally sorted by relevance, so you may find meaning‐
              less results at the end of the output

axi-cache 0.47                                                     February 2018                                                      AXI-CACHE(1)
