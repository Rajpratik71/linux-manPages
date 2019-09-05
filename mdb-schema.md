mdb-schema(1)                                          Executable programs or shell commands                                         mdb-schema(1)

NAME
       mdb-schema - Generate schema creation DDL

SYNOPSIS
       mdb-schema [options] database [backend]

DESCRIPTION
       mdb-schema is a utility program distributed with MDB Tools.

       It produces DDL (data definition language) output for the given database. This can be passed to another database to create a replica of the
       original access table format.

OPTIONS
       -T <table>, --table <table>
              Single table option.  Create schema for this table only. Default is to export all tables.

       -N namespace
              Prefix identifiers with namespace.

       --drop-table
              Issue DROP TABLE statement.

       --no-drop-table
              Don't issue DROP TABLE statement. This is the default.

       --not-null
              Issue NOT NULL constraints. This is the default.

       --no-not-null
              Don't issue NOT NULL constraints.

       --default-values
              Issue DEFAULT values.

       --no-default-values
              Don't issue DEFAULT values. This is the default.

       --not-empty
              Issue CHECK <> '' constraints.

       --no-not-empty
              Don't issue CHECK <> '' constraints. This is the default.

       --indexes
              Export INDEXes. This is the default.

       --no-indexes
              Don't export INDEXes.

       --relations
              Export foreign keys constraints. This is the default.

       --no-relations
              Don't export foreign keys constraints.

       backend
              Specifies target DDL dialect. Supported values are access, sybase, oracle, postgres, mysql and sqlite. If not specified  the  gener‐
              ated DDL will be in access format.

ENVIRONMENT
       MDB_JET3_CHARSET
              Defines the charset of the input JET3 (access 97) file. Default is CP1252. See iconv(1).

       MDBICONV
              Defines the output charset to use for the SQL file. Default is UTF-8. mdbtools must have been compiled with iconv.

       MDBOPTS
              semi-column separated list of options:

              ·  use_index

              ·  no_memo

              ·  debug_like

              ·  debug_write

              ·  debug_usage

              ·  debug_ole

              ·  debug_row

              ·  debug_props

              ·  debug_all is a shortcut for all debug_* options

NOTES
HISTORY
       mdb-schema first appeared in MDB Tools 0.1.

SEE ALSO
       gmdb2(1) mdb-export(1) mdb-hexdump(1) mdb-prop(1) mdb-sql(1) mdb-ver(1) mdb-array(1) mdb-header(1) mdb-parsecsv(1) mdb-tables(1)

AUTHORS
       The mdb-schema utility was written by Brian Bruns and others.

BUGS
       Relationships  and  other features may not be supported by all databases.  Access datatypes are mapped to their closest counterparts in the
       target backend. This may not always yield an exact fit.

MDBTools 0.7.1                                                    09 August 2016                                                     mdb-schema(1)
