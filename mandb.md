MANDB(8)                                  Manual pager utils                                  MANDB(8)

NAME
       mandb - create or update the manual page index caches

SYNOPSIS
       mandb [-dqsucpt?V] [-C file] [manpath]
       mandb [-dqsut] [-C file] -f filename ...

DESCRIPTION
       mandb  is  used  to  initialise or manually update index database caches that are usually main‐
       tained by man.  The caches contain information relevant to the current state of the manual page
       system  and the information stored within them is used by the man-db utilities to enhance their
       speed and functionality.

       When creating or updating an index, mandb will warn of bad ROFF .so requests, bogus manual page
       filenames and manual pages from which the whatis cannot be parsed.

       Supplying  mandb with an optional colon-delimited path will override the internal system manual
       page hierarchy search path, determined from information found within the  man-db  configuration
       file.

DATABASE CACHES
       mandb can be compiled with support for any one of the following database types.

       Name          Type                   Async   Filename
       ─────────────────────────────────────────────────────────────
       Berkeley db   Binary tree            Yes     index.bt
       GNU gdbm      Hashed                 Yes     index.db
       UNIX ndbm     Hashed                 No      index.(dir|pag)

       Those  database  types  that support asynchronous updates provide enhanced speed at the cost of
       possible corruption in the event of unusual termination.  In an unusual case where this has oc‐
       curred,  it  may be necessary to rerun mandb with the -c option to re-create the databases from
       scratch.

OPTIONS
       -d, --debug
              Print debugging information.

       -q, --quiet
              Produce no warnings.

       -s, --no-straycats
              Do not spend time looking for or adding information to  the  databases  regarding  stray
              cats.

       -p, --no-purge
              Do not spend time checking for deleted manual pages and purging them from the databases.

       -c, --create
              By  default,  mandb  will try to update any previously created databases.  If a database
              does not exist, it will create it.  This option forces mandb to  delete  previous  data‐
              bases and re-create them from scratch, and implies --no-purge.  This may be necessary if
              a database becomes corrupt or if a new database storage scheme is introduced in the  fu‐
              ture.

       -u, --user-db
              Create user databases only, even with write permissions necessary to create system data‐
              bases.

       -t, --test
              Perform correctness checks on manual pages in the hierarchy search path.  With this  op‐
              tion, mandb will not alter existing databases.

       -f, --filename
              Update  only the entries for the given filename.  This option is not for general use; it
              is used internally by man when it has been compiled with the MAN_DB_UPDATES  option  and
              finds that a page is out of date.  It implies -p and disables -c and -s.

       -C file, --config-file=file
              Use this user configuration file rather than the default of ~/.manpath.

       -?, --help
              Show the usage message, then exit.

       --usage
              Print a short usage message and exit.

       -V, --version
              Show the version, then exit.

EXIT STATUS
       0      Successful program execution.

       1      Usage, syntax, or configuration file error.

       2      Operational error.

       3      A child process failed.

DIAGNOSTICS
       The following warning messages can be emitted during database building.

       <filename>: whatis parse for page(sec) failed
              An  attempt to extract whatis line(s) from the given <filename> failed.  This is usually
              due to a poorly written manual page, but if many such messages are emitted it is  likely
              that  the system contains non-standard manual pages which are incompatible with the man-
              db whatis parser.  See the WHATIS PARSING section in lexgrog(1) for more information.

       <filename>: is a dangling symlink
              <filename> does not exist but is referenced by a symbolic link.  Further diagnostics are
              usually emitted to identify the <filename> of the offending link.

       <filename>: bad symlink or ROFF `.so' request
              <filename>  is  either  a symbolic link to, or contains a ROFF include request to, a non
              existent file.

       <filename>: ignoring bogus filename
              The <filename> may or may not be a valid manual page but its name is invalid.   This  is
              usually  due to a manual page with sectional extension <x> being put in manual page sec‐
              tion <y>.

       <filename_mask>: competing extensions
              The wildcard <filename_mask> is not unique.  This is usually caused by the existence  of
              both  a  compressed  and uncompressed version of the same manual page.  All but the most
              recent are ignored.

FILES
       /etc/manpath.config
              man-db configuration file.

       /var/cache/man/index.(bt|db|dir|pag)
              An FHS compliant global index database cache.

       Older locations for the database cache included:

       /usr/man/index.(bt|db|dir|pag)
              A traditional global index database cache.

       /var/catman/index.(bt|db|dir|pag)
              An alternate or FSSTND compliant global index database cache.

SEE ALSO
       lexgrog(1), man(1), manpath(5), catman(8)

       The WHATIS PARSING section formerly in this manual page is now part of lexgrog(1).

AUTHOR
       Wilf. (G.Wilford@ee.surrey.ac.uk).
       Fabrizio Polacco (fpolacco@debian.org).
       Colin Watson (cjwatson@debian.org).

2.8.7                                         2019-08-26                                      MANDB(8)
