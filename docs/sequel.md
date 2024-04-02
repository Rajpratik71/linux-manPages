sequel(1)                               General Commands Manual                              sequel(1)

NAME
       sequel - The Database Toolkit for Ruby

SYNOPSIS
       sequel <uri|path> [options]

DESCRIPTION
       Sequel is a lightweight database access toolkit for Ruby.

OPTIONS
       -C, --copy-databases
               Copy one database to another

       -d, --dump-migration
               Print database migration to STDOUT

       -D, --dump-migration-same-db
               Print database migration to STDOUT without type translation

       -e, --env ENV
               Use environment config for database

       -l, --log logfile
               Log SQL statements to log file

       -L, --load-dir DIR
               Loads all *.rb under specified directory

       -m, --migrate-directory DIR
               Run the migrations in directory

       -M, --migrate-version VER
               Migrate the database to version given

       -N, --no-test-connection
               Do not test the connection

       -t, --trace
               Output the full backtrace if an exception is raised

       -?, -h, --help
               Show this message

       -v, --version
               Show version

SEE ALSO
       This program is shipped as part of the lisequel-ruby1.8 library package, you can check its cor‐
       responding documentation can be found in the libsquel-ruby-doc package.

AUTHOR
       This manual page was written by Deepak Tripathi <apenguinlinux@gmail.com>, based  on  the  com‐
       mand-line  output  of  this program, for the Debian GNU/Linux system (but may be freely used by
       others).

                                             May 25, 2010                                    sequel(1)
