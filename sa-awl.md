SA-AWL(1)                                                                            User Contributed Perl Documentation                                                                            SA-AWL(1)



NAME
       sa-awl - examine and manipulate SpamAssassin's auto-whitelist db

SYNOPSIS
       sa-awl [--clean] [--min n] [dbfile]

DESCRIPTION
       Check or clean a SpamAssassin auto-whitelist (AWL) database file.

       The name of the file is specified after any options, as "dbfile".  The default is "$HOME/.spamassassin/auto-whitelist".

OPTIONS
       --clean
           Clean out infrequently-used AWL entries.  The "--min" switch can be used to select the threshold at which entries are kept or deleted.

       --min n
           Select the threshold at which entries are kept or deleted when "--clean" is used.  The default is 2, so entries that have only been seen once are deleted.

OUTPUT
       The output looks like this:

            AVG  (TOTSCORE/COUNT)  --  EMAIL|ip=IPBASE

       For example:

            0.0         (0.0/7)  --  dawson@example.com|ip=208.192
           21.8        (43.7/2)  --  mcdaniel_2s2000@example.com|ip=200.106

       "AVG" is the average score;  "TOTSCORE" is the total score of all mails seen so far;  "COUNT" is the number of messages seen from that sender;  "EMAIL" is the sender's email address, and "IPBASE" is
       the AWL base IP address.

       AWL base IP address is a way to identify the sender's IP address they frequently send from, in an approximate way, but remaining hard for spammers to spoof.  The algorithm is as follows:

         - take the last Received header that contains a public IP address -- namely
           one which is not in private, unrouted IP space.

         - chop off the last two octets, assuming that the user may be in an ISP's
           dynamic address pool.



perl v5.16.3                                                                                      2018-10-15                                                                                        SA-AWL(1)
