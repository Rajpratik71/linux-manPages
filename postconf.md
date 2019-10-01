POSTCONF(1)                                                                                General Commands Manual                                                                                POSTCONF(1)



NAME
       postconf - Postfix configuration utility

SYNOPSIS
       Managing main.cf:

       postconf [-dfhnovx] [-c config_dir] [-C class,...] [parameter ...]

       postconf [-ev] [-c config_dir] [parameter=value ...]

       postconf [-#vX] [-c config_dir] [parameter ...]

       Managing master.cf:

       postconf [-fMovx] [-c config_dir] [service ...]

       Managing bounce message templates:

       postconf [-btv] [-c config_dir] [template_file]

       Managing other configuration:

       postconf [-aAlmv] [-c config_dir]

DESCRIPTION
       By  default,  the postconf(1) command displays the values of main.cf configuration parameters, and warns about possible mis-typed parameter names (Postfix 2.9 and later).  It can also change main.cf
       configuration parameter values, or display other configuration information about the Postfix mail system.

       Options:

       -a     List the available SASL server plug-in types.  The SASL plug-in type is selected with the smtpd_sasl_type configuration parameter by specifying one of the names listed below.

              cyrus  This server plug-in is available when Postfix is built with Cyrus SASL support.

              dovecot
                     This server plug-in uses the Dovecot authentication server, and is available when Postfix is built with any form of SASL support.

              This feature is available with Postfix 2.3 and later.

       -A     List the available SASL client plug-in types.  The SASL plug-in type is selected with the smtp_sasl_type or lmtp_sasl_type configuration parameters by  specifying  one  of  the  names  listed
              below.

              cyrus  This client plug-in is available when Postfix is built with Cyrus SASL support.

              This feature is available with Postfix 2.3 and later.

       -b [template_file]
              Display the message text that appears at the beginning of delivery status notification (DSN) messages, replacing $name expressions with actual values as described in bounce(5).

              To override the built-in templates, specify a template file name at the end of the postconf(1) command line, or specify a file name in main.cf with the bounce_template_file parameter.

              To force selection of the built-in templates, specify an empty template file name on the postconf(1) command line (in shell language: "").

              This feature is available with Postfix 2.3 and later.

       -c config_dir
              The main.cf configuration file is in the named directory instead of the default configuration directory.

       -C class,...
              When displaying main.cf parameters, select only parameters from the specified class(es):

              builtin
                     Parameters with built-in names.

              service
                     Parameters with service-defined names (the first field of a master.cf entry plus a Postfix-defined suffix).

              user   Parameters with user-defined names.

              all    All the above classes.

              The default is as if "-C all" is specified.

       -d     Print main.cf default parameter settings instead of actual settings.  Specify -df to fold long lines for human readability (Postfix 2.9 and later).

       -e     Edit the main.cf configuration file, and update parameter settings with the "name=value" pairs on the postconf(1) command line. The file is copied to a temporary file then renamed into place.
              Specify quotes to protect special characters and whitespace on the postconf(1) command line.

              The -e is no longer needed with Postfix version 2.8 and later.

       -f     Fold long lines when printing main.cf or master.cf configuration file entries, for human readability.

              This feature is available with Postfix 2.9 and later.

       -h     Show main.cf parameter values without the "name = " label that normally precedes the value.

       -l     List the names of all supported mailbox locking methods.  Postfix supports the following methods:

              flock  A kernel-based advisory locking method for local files only.  This locking method is available on systems with a BSD compatible library.

              fcntl  A kernel-based advisory locking method for local and remote files.

              dotlock
                     An application-level locking method. An application locks a file named filename by creating a file named filename.lock.  The application is expected to remove its  own  lock  file,  as
                     well as stale lock files that were left behind after abnormal program termination.

       -m     List  the names of all supported lookup table types. In Postfix configuration files, lookup tables are specified as type:name, where type is one of the types listed below. The table name syn‐
              tax depends on the lookup table type as described in the DATABASE_README document.

              btree  A sorted, balanced tree structure.  This is available on systems with support for Berkeley DB databases.

              cdb    A read-optimized structure with no support for incremental updates.  This is available on systems with support for CDB databases.

              cidr   A table that associates values with Classless Inter-Domain Routing (CIDR) patterns. This is described in cidr_table(5).

              dbm    An indexed file type based on hashing.  This is available on systems with support for DBM databases.

              environ
                     The UNIX process environment array. The lookup key is the variable name. Originally implemented for testing, someone may find this useful someday.

              fail   A table that reliably fails all requests. The lookup table name is used for logging. This table exists to simplify Postfix error tests.

              hash   An indexed file type based on hashing.  This is available on systems with support for Berkeley DB databases.

              internal
                     A non-shared, in-memory hash table. Its content are lost when a process terminates.

              ldap (read-only)
                     Perform lookups using the LDAP protocol. This is described in ldap_table(5).

              memcache
                     Perform lookups using the memcache protocol. This is described in memcache_table(5).

              mysql (read-only)
                     Perform lookups using the MYSQL protocol. This is described in mysql_table(5).

              pcre (read-only)
                     A lookup table based on Perl Compatible Regular Expressions. The file format is described in pcre_table(5).

              pgsql (read-only)
                     Perform lookups using the PostgreSQL protocol. This is described in pgsql_table(5).

              proxy  A lookup table that is implemented via the Postfix proxymap(8) service. The table name syntax is type:name.

              regexp (read-only)
                     A lookup table based on regular expressions. The file format is described in regexp_table(5).

              sdbm   An indexed file type based on hashing.  This is available on systems with support for SDBM databases.

              socketmap (read-only)
                     Query a Sendmail-style socketmap server. The name of the table specifies inet:host:port:socketmap-name for a TCP-based server, or unix:pathname:socketmap-name for a UNIX-domain server.
                     In both cases, socketmap-name is the name of the socketmap.

              sqlite (read-only)
                     Perform lookups from SQLite database files. This is described in sqlite_table(5).

              static (read-only)
                     A table that always returns its name as lookup result. For example, static:foobar always returns the string foobar as lookup result.

              tcp (read-only)
                     Perform lookups using a simple request-reply protocol that is described in tcp_table(5).

              texthash (read-only)
                     Produces  similar  results  as  hash: files, except that you don't need to run the postmap(1) command before you can use the file, and that it does not detect changes after the file is
                     read.

              unix (read-only)
                     A limited way to query the UNIX authentication database. The following tables are implemented:

                     unix:passwd.byname
                            The table is the UNIX password database. The key is a login name.  The result is a password file entry in passwd(5) format.

                     unix:group.byname
                            The table is the UNIX group database. The key is a group name.  The result is a group file entry in group(5) format.

              Other table types may exist depending on how Postfix was built.

       -M     Show master.cf file contents instead of main.cf file contents.  Specify -Mf to fold long lines for human readability.

              If service ... is specified, only the matching services will be output. For example, "postconf -Mf inet" will output all services that listen on the network.

              Specify zero or more arguments, each with a service-type name (inet, unix, fifo, or pass) or with a service-name.service-type pair, where service-name is the first field of a master.cf entry.

              This feature is available with Postfix 2.9 and later.

       -n     Show only configuration parameters that have explicit name=value settings in main.cf.  Specify -nf to fold long lines for human readability (Postfix 2.9 and later).

       -o name=value
              Override main.cf parameter settings.

              This feature is available with Postfix 2.10 and later.

       -t [template_file]
              Display the templates for text that appears at the beginning of delivery status notification (DSN) messages, without expanding $name expressions.

              To override the built-in templates, specify a template file name at the end of the postconf(1) command line, or specify a file name in main.cf with the bounce_template_file parameter.

              To force selection of the built-in templates, specify an empty template file name on the postconf(1) command line (in shell language: "").

              This feature is available with Postfix 2.3 and later.

       -v     Enable verbose logging for debugging purposes. Multiple -v options make the software increasingly verbose.

       -x     Expand $name in main.cf or master.cf parameter values. The expansion is recursive.

              This feature is available with Postfix 2.10 and later.

       -X     Edit the main.cf configuration file, and remove the parameters named on the postconf(1) command line.  The file is copied to a temporary file then renamed  into  place.   Specify  a  list  of
              parameter names, not "name=value" pairs.  There is no postconf(1) command to perform the reverse operation.

              This feature is available with Postfix 2.10 and later.

       -#     Edit  the  main.cf  configuration file, and comment out the parameters named on the postconf(1) command line, so that those parameters revert to their default values.  The file is copied to a
              temporary file then renamed into place.  Specify a list of parameter names, not "name=value" pairs.  There is no postconf(1) command to perform the reverse operation.

              This feature is available with Postfix 2.6 and later.

DIAGNOSTICS
       Problems are reported to the standard error stream.

ENVIRONMENT
       MAIL_CONFIG
              Directory with Postfix configuration files.

CONFIGURATION PARAMETERS
       The following main.cf parameters are especially relevant to this program.

       The text below provides only a parameter summary. See postconf(5) for more details including examples.

       config_directory (see 'postconf -d' output)
              The default location of the Postfix main.cf and master.cf configuration files.

       bounce_template_file (empty)
              Pathname of a configuration file with bounce message templates.

FILES
       /etc/postfix/main.cf, Postfix configuration parameters
       /etc/postfix/master.cf, Postfix master daemon configuraton

SEE ALSO
       bounce(5), bounce template file format
       master(5), master.cf configuration file syntax
       postconf(5), main.cf configuration file syntax

README FILES
       Use "postconf readme_directory" or "postconf html_directory" to locate this information.
       DATABASE_README, Postfix lookup table overview

LICENSE
       The Secure Mailer license must be distributed with this software.

AUTHOR(S)
       Wietse Venema
       IBM T.J. Watson Research
       P.O. Box 704
       Yorktown Heights, NY 10598, USA



                                                                                                                                                                                                  POSTCONF(1)
