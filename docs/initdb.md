INITDB(1)                                                                              PostgreSQL 9.2.24 Documentation                                                                              INITDB(1)



NAME
       initdb - create a new PostgreSQL database cluster

SYNOPSIS
       initdb [option...] [--pgdata | -D] directory

DESCRIPTION
       initdb creates a new PostgreSQL database cluster. A database cluster is a collection of databases that are managed by a single server instance.

       Creating a database cluster consists of creating the directories in which the database data will live, generating the shared catalog tables (tables that belong to the whole cluster rather than to
       any particular database), and creating the template1 and postgres databases. When you later create a new database, everything in the template1 database is copied. (Therefore, anything installed in
       template1 is automatically copied into each database created later.) The postgres database is a default database meant for use by users, utilities and third party applications.

       Although initdb will attempt to create the specified data directory, it might not have permission if the parent directory of the desired data directory is root-owned. To initialize in such a setup,
       create an empty data directory as root, then use chown to assign ownership of that directory to the database user account, then su to become the database user to run initdb.

       initdb must be run as the user that will own the server process, because the server needs to have access to the files and directories that initdb creates. Since the server cannot be run as root, you
       must not run initdb as root either. (It will in fact refuse to do so.)

       initdb initializes the database cluster's default locale and character set encoding. The character set encoding, collation order (LC_COLLATE) and character set classes (LC_CTYPE, e.g. upper, lower,
       digit) can be set separately for a database when it is created.  initdb determines those settings for the template1 database, which will serve as the default for all other databases.

       To alter the default collation order or character set classes, use the --lc-collate and --lc-ctype options. Collation orders other than C or POSIX also have a performance penalty. For these reasons
       it is important to choose the right locale when running initdb.

       The remaining locale categories can be changed later when the server is started. You can also use --locale to set the default for all locale categories, including collation order and character set
       classes. All server locale values (lc_*) can be displayed via SHOW ALL. More details can be found in Section 22.1, “Locale Support”, in the documentation.

       To alter the default encoding, use the --encoding. More details can be found in Section 22.3, “Character Set Support”, in the documentation.

OPTIONS
       -A authmethod, --auth=authmethod
           This option specifies the authentication method for local users used in pg_hba.conf (host and local lines). Do not use trust unless you trust all local users on your system.  trust is the
           default for ease of installation.

       --auth-host=authmethod
           This option specifies the authentication method for local users via TCP/IP connections used in pg_hba.conf (host lines).

       --auth-local=authmethod
           This option specifies the authentication method for local users via Unix-domain socket connections used in pg_hba.conf (local lines).

       -D directory, --pgdata=directory
           This option specifies the directory where the database cluster should be stored. This is the only information required by initdb, but you can avoid writing it by setting the PGDATA environment
           variable, which can be convenient since the database server (postgres) can find the database directory later by the same variable.

       -E encoding, --encoding=encoding
           Selects the encoding of the template database. This will also be the default encoding of any database you create later, unless you override it there. The default is derived from the locale, or
           SQL_ASCII if that does not work. The character sets supported by the PostgreSQL server are described in Section 22.3.1, “Supported Character Sets”, in the documentation.

       --locale=locale
           Sets the default locale for the database cluster. If this option is not specified, the locale is inherited from the environment that initdb runs in. Locale support is described in Section 22.1,
           “Locale Support”, in the documentation.

       --lc-collate=locale, --lc-ctype=locale, --lc-messages=locale, --lc-monetary=locale, --lc-numeric=locale, --lc-time=locale
           Like --locale, but only sets the locale in the specified category.

       --no-locale
           Equivalent to --locale=C.

       --pwfile=filename
           Makes initdb read the database superuser's password from a file. The first line of the file is taken as the password.

       -T CFG, --text-search-config=CFG
           Sets the default text search configuration. See default_text_search_config for further information.

       -U username, --username=username
           Selects the user name of the database superuser. This defaults to the name of the effective user running initdb. It is really not important what the superuser's name is, but one might choose to
           keep the customary name postgres, even if the operating system user's name is different.

       -W, --pwprompt
           Makes initdb prompt for a password to give the database superuser. If you don't plan on using password authentication, this is not important. Otherwise you won't be able to use password
           authentication until you have a password set up.

       -X directory, --xlogdir=directory
           This option specifies the directory where the transaction log should be stored.

       Other, less commonly used, options are also available:

       -d, --debug
           Print debugging output from the bootstrap backend and a few other messages of lesser interest for the general public. The bootstrap backend is the program initdb uses to create the catalog
           tables. This option generates a tremendous amount of extremely boring output.

       -L directory
           Specifies where initdb should find its input files to initialize the database cluster. This is normally not necessary. You will be told if you need to specify their location explicitly.

       -n, --noclean
           By default, when initdb determines that an error prevented it from completely creating the database cluster, it removes any files it might have created before discovering that it cannot finish
           the job. This option inhibits tidying-up and is thus useful for debugging.

       Other options:

       -s, --show
           Print the internal settings, then exit.

       -V, --version
           Print the initdb version and exit.

       -?, --help
           Show help about initdb command line arguments, and exit.

ENVIRONMENT
       PGDATA
           Specifies the directory where the database cluster is to be stored; can be overridden using the -D option.

       TZ
           Specifies the time zone, using full time zone names, which the created database cluster should use.

       This utility, like most other PostgreSQL utilities, also uses the environment variables supported by libpq (see Section 31.14, “Environment Variables”, in the documentation).

NOTES
       initdb can also be invoked via pg_ctl initdb.

SEE ALSO
       pg_ctl(1), postgres(1)



PostgreSQL 9.2.24                                                                                 2017-11-06                                                                                        INITDB(1)
