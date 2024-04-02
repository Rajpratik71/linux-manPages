redland-db-upgrade(1)                                                                      General Commands Manual                                                                      redland-db-upgrade(1)



NAME
       redland-db-upgrade - upgrade older Redland databases to 0.9.12 format

SYNOPSIS
       redland-db-upgrade old BDB Name new BDB name

DESCRIPTION
       redland-db-upgrade converts Redland databases from the format in 0.9.11 and earlier into the new format.  It must be run on each Redland database.  For example if database a created files a-sp2o.db,
       a-so2p.db and  a-po2s.db it could be converted to a new database b with:

              redland-db-upgrade a b

SEE ALSO
       redland(3),

AUTHOR
       Dave Beckett - http://purl.org/net/dajobe/ ⟨http://purl.org/net/dajobe/⟩



                                                                                                  2003-08-19                                                                            redland-db-upgrade(1)
