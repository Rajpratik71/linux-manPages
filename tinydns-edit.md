tinydns-edit(8)                                               System Manager's Manual                                              tinydns-edit(8)

NAME
       tinydns-edit - edit the (source form of the) database served by tinydns/axfrdns

SYNOPSIS
       tinydns-edit data data.tmp add type name address

DESCRIPTION
       tinydns-edit  edits  the  data  file,  which  is  the source form of the database that is compiled by tinydns-data(8) and that is served by
       tinydns(8) and axfrdns(8).  The update to data is performed atomically, by first writing the updated database content to the file  data.tmp
       and then renaming data.tmp to data .  The two files must, of course, reside on the same volume in order that this can be achieved.

       On success, tinydns-edit returns zero.  If, for any reason, an error occurs it will exit with a non-zero code and data will not be changed.

       With  the  "add"  verb, tinydns-edit appends to the database a record whose type is determined by type , with the fully-qualified name name
       and the IP address address .  type can be one of:

       ns     A '.' record is created.  This record specifies that the domain name is published by a DNS content server that is listening  on  the
              IP address address .

              The  name of the DNS content server is not directly specifiable.  Names are automatically assigned by tinydns-edit itself, following
              the pattern [a-z].ns.name .  tinydns-edit will assign the first letter of the alphabet that is not already used in  another  '.'  or
              '&' record as the name of a DNS content server.  If no letters of the alphabet remain unused, tinydns-edit will fail.

              If  a  '.' or '&' record for the domain already exists, proxy DNS servers are allowed to cache the new record for the same length of
              time as they are allowed to cache the existing records.  Otherwise, proxy DNS servers are allowed to cache the record for  up  to  3
              days.

       childns
              A '&' record is created.  This record specifies that queries for names in the domain name should be referred to a ("child") DNS con‐
              tent server that is listening on the IP address address .

              The name of the DNS content server is not directly specifiable.  Names are automatically assigned by tinydns-edit itself,  following
              the  pattern  [a-z].ns.name  .  tinydns-edit will assign the first letter of the alphabet that is not already used in another '.' or
              '&' record as the name of a DNS content server.  If no letters of the alphabet remain unused, tinydns-edit will fail.

              If a '.' or '&' record for the domain already exists, proxy DNS servers are allowed to cache the new record for the same  length  of
              time  as  they  are allowed to cache the existing records.  Otherwise, proxy DNS servers are allowed to cache the record for up to 3
              days.

       mx     A '@' record is created.  This record specifies that mail to names in the domain name should be sent to an SMTP server that is  lis‐
              tening on the IP address address .

              The  name  of  the  SMTP server is not directly specifiable.  Names are automatically assigned by tinydns-edit itself, following the
              pattern [a-z].mx.name .  tinydns-edit will assign the first letter of the alphabet that is not already used in another '@' record as
              the name of an SMTP server.  If no letters of the alphabet remain unused, tinydns-edit will fail.

              It  is  not  possible  to  specify  the  distance value for the SMTP server.  tinydns-edit will leave that field blank, meaning that
              tinydns-data (8) will use whatever the default value is.

              If a '@' record for the domain already exists, proxy DNS servers are allowed to cache the new record for the same length of time  as
              they are allowed to cache the existing records.  Otherwise, proxy DNS servers are allowed to cache the record for up to 1 day.

       host   A '=' record is created, that proxy DNS servers are allowed to cache for up to 1 day.  This record specifies that the name name maps
              to the IP address address and vice versa.

              tinydns-edit will fail if a '=' record already exists that uses either name or address .

       alias  A '+' record is created, that proxy DNS servers are allowed to cache for up to 1 day.  This record specifies that the name name maps
              to the IP address address but that there is no reverse mapping.

              Because this is an alias record, tinydns-edit will not fail if there happen to already be existing records that use address .

SEE ALSO
       tinydns-data(8),

       http://cr.yp.to/djbdns.html

AUTHOR AND MODIFICATIONS
       This manual page was created by Jonathan de Boyne Pollard on 2001-04-06.

       2001-04-26: A new AUTHOR AND MODIFICATIONS section was added.  axfrdns(8) is now mentioned.  The description of how server names were auto-
       generated was clarified.  A cut-and-paste error in the description of the "mx" type was corrected.

                                                                                                                                   tinydns-edit(8)
