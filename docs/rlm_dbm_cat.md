RLM_DBM_CAT(8)                                                System Manager's Manual                                               RLM_DBM_CAT(8)

NAME
       rlm_dbm_cat - list contents of radius database

SYNOPSIS
       rlm_dbm_cat [-f file] [-w] [-i number] [-l number] [-v] [username ...]

DESCRIPTION
       rlm_dbm_cat simply lists the definition(s) of the username(s) or group name(s), or the entire database.

OPTIONS
       -f filename
              The file name of the database to list.

       -w     Long lines should be wrapped

       -i number
              Set the left margin then wrapped.

       -l number
              How long line should be to be wrapped (wrap threshold)

       -v     Print the version number and exit.

SEE ALSO
       radiusd(8)

AUTHORS
       Author:
              Andrei Koulik <rlm_dbm@agk.nnov.ru>

       Documentation:
              Bjørn Nordbø  <bn@nextra.com>

                                                                                                                                    RLM_DBM_CAT(8)
