XAPIAN-CHECK(1)                             User Commands                             XAPIAN-CHECK(1)

NAME
       xapian-check - Check the consistency of a database or table

SYNOPSIS
       xapian-check DATABASE_DIRECTORY|PATH_TO_BTREE [[F][t][f][b][v][+]]

DESCRIPTION
       xapian-check - Check the consistency of a database or table

       If a whole database is checked, then additional cross-checks between the tables are performed.

   The btree(s) is/are always checked - control the output verbosity with:
              F  =  attempt to fix a broken database (implemented for chert currently) t = short tree
              printing f = full tree printing b = show free  blocks  v  =  show  stats  about  B-tree
              (default) + = same as tbv e.g. xapian-check /var/lib/xapian/data/default

              xapian-check /var/lib/xapian/data/default/postlist fbv

xapian-core 1.4.5                            October 2017                             XAPIAN-CHECK(1)
