PG_UPDATEDICTS(8)                                        Debian PostgreSQL infrastructure                                        PG_UPDATEDICTS(8)

NAME
       pg_updatedicts - build PostgreSQL dictionaries from myspell/hunspell ones

SYNOPSIS
       pg_updatedicts

DESCRIPTION
       pg_updatedicts makes dictionaries and affix files from installed myspell and hunspell dictionary packages available to PostgreSQL for usage
       with tsearch and word stem support. In particular, it takes all *.dic and *.aff files from /usr/share/myspell/dicts/, converts them to
       UTF-8, puts them into /var/cache/postgresql/dicts/ with *.dict and *.affix suffixes, and symlinks them into
       /usr/share/postgresql/version/tsearch_data/, where PostgreSQL looks for them.

       Through postgresql-common's dpkg trigger, this program is automatically run whenever a myspell or hunspell dictionary package is installed
       or upgraded.

AUTHOR
       Martin Pitt <mpitt@debian.org>

Debian                                                              2016-08-09                                                   PG_UPDATEDICTS(8)
