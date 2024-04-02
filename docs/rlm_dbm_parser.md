RLM_DBM_PARSER(8)                                             System Manager's Manual                                            RLM_DBM_PARSER(8)

NAME
       rlm_dbm_parser - transforms simple syntax into rlm_dbm format

SYNOPSIS
       rlm_dbm_parser [-c] [-d raddb] [-i inputfile] [-o outputfile] [-x] [-v] [-q] [username ...]

DESCRIPTION
       rlm_dbm_parser reads a file of the syntax defined below, and writes a database file usable by rlm_dbm or edits current database.

INPUT FORMAT
       rlm_dbm_parser reads a format similar to the one used by the files module. In incomplete RFC2234 ABNF, it looks like this:

       entries     = *entry
       entry       = identifier TAB definition
       identifier  = username / group-name
       username    = +PCHAR
       groupname   = +PCHAR
       definition  = (check-item ",")* LF ( *( reply-item ",") / ";" ) LF
       check-item  = AS IN FILES
       reply-item  = AS IN FILES
       * need definition of username and groupname

       As an example, these are the standard files definitions (files module).

       DEFAULT   Service-Type == Framed-User
                 Framed-IP-Address = 255.255.255.254,
                 Framed-MTU = 576,
                 Service-Type = Framed-User,
                 Fall-Through = Yes

       #except who call from number 555-666
       DEFAULT   Auth-Type := Reject,Service-Type ==Framed-User,
                 Calling-Station-ID == "555-666"

       #or call number 555-667
       DEFAULT   Auth-Type := Reject,Service-Type ==Framed-User,
                 Calling-Station-ID == "555-667"

       To be a valid rlm_dbm input file, it should look like this:

       DEFAULT   Service-Type == Framed-User                     # (1)
                 Framed-IP-Address = 255.255.255.254,            # comma, list cont'd
                 Framed-MTU = 576,
                 Service-Type = Framed-User,
                 Fall-Through =  Yes                             # \n, end of list
                 Auth-Type := Reject,Service-Type ==Framed-User, # (2)
                 Calling-Station-ID == "555-666"
                 ;                                               # ;, no reply items
                 Auth-Type := Reject,Service-Type ==Framed-User, # (3)
                 Calling-Station-ID == "555-667"
                 ;                                               # ditto

       This  user  (the  DEFAULT  user)  contains three entries, 1, 2 and 3. The first entry has a list of reply items, terminated by a reply item
       without a trailing comma. Entries 2 and 3 has empty reply lists, as indicated by the semicolon. This is necessary to separate an empty line
       (which  is  ignored) from the empty list.  Definition Fall-Through = Yes used in order to say module to check next record. By default Fall-
       Through = Yes.

OPTIONS
       -d raddb
              Use raddb as the radiusd configuration directory.

       -i inputfile
              Use file as the input file. If not defined then use standard input.

       -o outputfile
              Use file as the output file.

       -c     Create a new database (empty output file before writing)

       -x     Enable debug mode. Multiple x flags increase debug level.

       -q     Do not print statistics (quiet).

       -v     Print the version and exit.

       -r     Remove a username or group name from the database.

SEE ALSO
       radiusd(8)

AUTHORS
       Author:
              Andrei Koulik <rlm_dbm@agk.nnov.ru>

       Documentation:
              Bjørn Nordbø  <bn@nextra.com>

                                                                                                                                 RLM_DBM_PARSER(8)
