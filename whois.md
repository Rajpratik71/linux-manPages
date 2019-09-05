WHOIS(1)                                                         Debian GNU/Linux                                                         WHOIS(1)

NAME
       whois - client for the whois directory service

SYNOPSIS
       whois  [  {  -h  |  --host  }  HOST  ]  [  {  -p  |  --port  }  PORT  ] [ -abBcdGHKlLmMrRx ] [ -g SOURCE:FIRST-LAST ] [ -i ATTR[,ATTR]... ]
       [ -s SOURCE[,SOURCE]... ] [ -T TYPE[,TYPE]... ] [ --verbose ] OBJECT

       whois -q KEYWORD

       whois -t TYPE

       whois -v TYPE

       whois --help

       whois --version

DESCRIPTION
       whois searches for an object in a RFC 3912 database.

       This version of the whois client tries to guess the right server to ask for the specified object. If no guess can be made it  will  connect
       to whois.networksolutions.com for NIC handles or whois.arin.net for IPv4 addresses and network names.

OPTIONS
       -h HOST, --host HOST
               Connect to HOST.

       -H      Do not display the legal disclaimers some registries like to show you.

       -p, --port PORT
               Connect to PORT.

       --verbose
               Be verbose.

       --help  Display online help.

       --version
               Display client version information.

       Other options are flags understood by whois.ripe.net and some other RIPE-like servers:

       -a      Also search all the mirrored databases.

       -b      Return brief IP address ranges with abuse contact.

       -B      Disable object filtering. (Show the e-mail addresses.)

       -c      Return the smallest IP address range with a reference to an irt object.

       -d      Return the reverse DNS delegation object too.

       -g SOURCE:FIRST-LAST
               Search  updates  from  SOURCE  database between FIRST and LAST update serial number. It's useful to obtain Near Real Time Mirroring
               stream.

       -G      Disable grouping of associated objects.

       -i ATTR[,ATTR]...
               Search objects having associated attributes. ATTR is attribute name.  Attribute value is positional OBJECT argument.

       -K      Return primary key attributes only. Exception is members attribute of set object which is always returned. Another  exceptions  are
               all attributes of objects organisation, person, and role that are never returned.

       -l      Return the one level less specific object.

       -L      Return all levels of less specific objects.

       -m      Return all one level more specific objects.

       -M      Return all levels of more specific objects.

       -q KEYWORD
               Return  list  of  keywords supported by server. KEYWORD can be version for server version, sources for list of source databases, or
               types for object types.

       -r      Disable recursive look-up for contact information.

       -R      Disable following referrals and force showing the object from the local copy in the server.

       -s SOURCE[,SOURCE]...
               Request the server to search for objects mirrored from SOURCES.  Sources are delimited by comma and the order is significant.   Use
               -q sources option to obtain list of valid sources.

       -t TYPE Return the template for a object of TYPE.

       -T TYPE[,TYPE]...
               Restrict the search to objects of TYPE. Multiple types are separated by a comma.

       -v TYPE Return the verbose template for a object of TYPE.

       -x      Search for only exact match on network address prefix.

NOTES
       Please  remember that whois.networksolutions.com by default will only search in the domains database. If you want to search for NIC handles
       you have to prepend a ! character. When you do this, the default server becomes whois.networksolutions.com.

       When querying whois.arin.net for IPv4 or IPv6 networks, the CIDR netmask length will be automatically removed from the query string.

       When querying whois.nic.ad.jp for AS numbers, the program will automatically convert the request in the  appropriate  format,  inserting  a
       space after the string AS.

       When querying whois.denic.de for domain names and no other flags have been specified, the program will automatically add the flag -T dn.

       When  querying  whois.dk-hostmaster.dk for domain names and no other flags have been specified, the program will automatically add the flag
       --show-handles.

       RIPE-specific command line options are ignored when querying non-RIPE servers. This may or may not be the behaviour intended by  the  user.
       When querying a non-standard server, command line options which are not to be interpreted by the client should always follow the -- separa‐
       tor (which marks the beginning of the query string).

       If the /etc/whois.conf configuration file exists, it will be consulted to find a server before applying the normal rules. Each line of  the
       file  should  contain a regular expression to be matched against the query text and the whois server to use, separated by white space.  IDN
       domains must use the ACE format.

       The whois protocol does not specify an encoding for characters which cannot be represented by ASCII and implementations  vary  wildly.   If
       the  program  knows that a specific server uses a certain encoding, if needed it will transcode the server output to the encoding specified
       by the current system locale.

       Command line arguments will always be interpreted accordingly to the current system locale and converted to the IDN ASCII Compatible Encod‐
       ing.

FILES
       /etc/whois.conf

ENVIRONMENT
       LANG   When querying whois.nic.ad.jp and whois.jprs.jp English text is requested unless the LANG or LC_MESSAGES environment variables spec‐
              ify a Japanese locale.

       WHOIS_OPTIONS
              A list of options which will be evaluated before the ones specified on the command line.

       WHOIS_SERVER
              This server will be queried if the program cannot guess where some kind of objects are located. If the variable does not exist  then
              whois.arin.net will be queried.

SEE ALSO
       whois.conf(5)

       RFC 3912: WHOIS Protocol Specification

       RIPE Database Query Reference Manual: <http://www.ripe.net/data-tools/support/documentation/ripe-database-query-reference-manual>

BUGS
       The  program may have buffer overflows in the command line parser: be sure to not pass untrusted data to it.  It should be rewritten to use
       a dynamics strings library.

HISTORY
       This program closely tracks the user interface of the whois client developed at RIPE by Ambrose Magee and others on the base of the  origi‐
       nal BSD client.  I also added support for the protocol extensions developed by David Kessens of QWest for the 6bone server.

AUTHOR
       Whois and this man page were written by Marco d'Itri <md@linux.it> and are licensed under the terms of the GNU General Public License, ver‐
       sion 2 or higher.

Marco d'Itri                                                     20 December 2009                                                         WHOIS(1)
