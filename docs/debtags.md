DEBTAGS(1)                                                                            User Commands                                                                            DEBTAGS(1)

NAME
       debtags - Debian Package Tags support tools

DESCRIPTION
       usage: debtags [-h] [--version] [--verbose] [--debug]

              {tag,cat,grep,check,diff,mkpatch,search,dumpavail,show,submit,tagcat,tagshow,tagsearch,update,vocfilter} ...

       Command line interface to access and manipulate Debian Package Tags

   optional arguments:
       -h, --help
              show this help message and exit

       --version
              show program's version number and exit

       --verbose, -v
              enable verbose output

       --debug
              enable debugging output (including verbose output)

   subcommands:
              valid subcommands

       {tag,cat,grep,check,diff,mkpatch,search,dumpavail,show,submit,tagcat,tagshow,tagsearch,update,vocfilter}
              additional help

       tag    (not implemented anymore)

       cat (grep)
              output  the  lines  of  the  full  package tag database that match the given tag expression. A tag expression (given as a single argument) is an arbitrarily complex binary
              expression of tag names. For example: role::program && ((use::editing || use::viewing) && !works-with::text)

       check  Check that all the tags in the given tagged collection are present in the tag vocabulary. Checks the main database if no file is specified

       diff (mkpatch)
              Create a tag patch between the current tag database and the tag collection [filename]. Standard input is used if filename is not specified

       search (dumpavail)
              Output the packages matching the given tag expression

       show   (deprecated) mostly the same as apt-cache show <pkgnames>

       submit (no longer supported) see https://debtags.debian.org/api/patch for patch submit.

       tagcat Output the tag vocabulary

       tagshow
              Show the vocabulary information about a tag

       tagsearch
              Show a summary of all tags whose data contains the given strings

       update Updates the package tag database (requires root) Collect package tag data from apt cache, regenerate the debtags tag database and main index. It needs to be run as root

       vocfilter
              Filter out the tags that are not found in the given vocabulary file debtags manages package tag data in a debian system and performs basic queries on it.

       debtags can be used to perform basic queries on the Debtags system: the vocabulary can be queried with the tagshow and tagsearch commands; a package tag database can  be  checked
       against  the vocabulary with the check command; the whole collection can be copied to standard output to be processed with tagcoll or other tools by the cat command; packages can
       be searched by tags using the grep command. Finally, tags can be listed with tag ls, edited with the tag add and tag rm, and submitted to the Debtags database with submit.

       The update command can be used to download extra tags as listed in /etc/debtags/sources.list: see the contents of that file for more information.

FILES
       /var/lib/debtags/vocabulary
              The normative tag vocabulary

       /var/lib/debtags/package-tags
              The system package tags database, only kept as an easily parsable reference.  In the same directory there is a the binary index with the same content, used by applications
              for fast access.

       /etc/debtags/sources.list
              The list of sources to build the package tags database from

EXAMPLES
       Here are some example invocations of debtags:

         # Update the package tag database
         debtags update

         # Show apt-cache information about the mutt package,
         # adding tag information
         debtags show mutt

         # Search the tag vocabulary for mail-related tags
         debtags tagsearch mail

         # Output a list of all packages which can edit raster images, excluding
         # shared libraries and dummy packages
         debtags search "use::editing && works-with::image:raster && \
                       ! (role::shared-lib || role::dummy)"

         # Show all mail clients
         debtags search 'works-with::mail && network::client'

         # Output the collection of all mail clients, ready to be reprocessed via
         # tagcoll
         debtags grep 'works-with::mail && network::client'

         # Produce an easily navigable hierarchy with the collection data
         debtags cat | tagcoll hierarchy

         # Produce a local tag patch
         debtags cat > work-tags
         ...edit work-tags...
         debtags diff work-tags > my-tagpatch

         # Submit the patch
         debtags submit my-tagpatch

         # Edit the tags of a package (the patch will be stored in ~/.debtags/patch)
         # then send your changes
         debtags tag add debtags implemented-in::c++ interface::commandline
         debtags tag rm debtags devel::buildtools
         debtags submit

SEE ALSO
       tagcoll(1), axi-cache(1),
       http://wiki.debian.org/Debtags
       http://debtags.debian.net

debtags 2.1                                                                            January 2018                                                                            DEBTAGS(1)
