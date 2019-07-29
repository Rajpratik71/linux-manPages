REDIS-SERVER(1)                                               General Commands Manual                                              REDIS-SERVER(1)

NAME
       redis-server - Persistent key-value database

SYNOPSIS
       redis-server configfile

DESCRIPTION
       Redis  is a key-value database. It is similar to memcached but the dataset is not volatile and other datatypes (such as lists and sets) are
       natively supported.

OPTIONS
       configfile
              Read options from specified configuration file.

NOTES
       On Debian GNU/Linux systems, redis-server is typically started via the /etc/init.d/redis-server initscript, not manually. This defaults  to
       using /etc/redis/redis.conf as a configuration file.

AUTHOR
       redis-server was written by Salvatore Sanfilippo.

       This manual page was written by Chris Lamb <lamby@debian.org> for the Debian project (but may be used by others).

                                                                  March 20, 2009                                                   REDIS-SERVER(1)
