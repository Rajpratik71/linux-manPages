POSTGRESQL-SETUP(1)                                                                       Postgresql RPM-dist manual                                                                      POSTGRESQL-SETUP(1)



NAME
       postgresql-setup - manual page for postgresql-setup 9.2.24

SYNOPSIS
       postgresql-setup {initdb|upgrade} [SERVICE_NAME]

DESCRIPTION
       Script is aimed to help sysadmin with basic database cluster administration.

       The  SERVICE_NAME is used for selection of proper unit configuration file; For more info and howto/when use this script please look at the docu file /usr/share/doc/postgresql-9.2.24/README.rpm-dist.
       The 'postgresql' string is used when no SERVICE_NAME is explicitly passed.

   Available operation mode:
       initdb Create a new PostgreSQL database cluster.  This is usually the first action you perform after PostgreSQL server installation.

       upgrade
              Upgrade PostgreSQL database cluster to be usable with new server.  Use this if you upgraded your PostgreSQL server to newer major version (currently from 8.4 to 9.2).

ENVIRONMENT
       PGSETUP_INITDB_OPTIONS
              Options carried by this variable are passed to subsequent call of `initdb` binary (see man initdb(1)).  This variable is used also during 'upgrade' mode because the new  cluster  is  actually
              re-initialized from the old one.

       PGSETUP_PGUPGRADE_OPTIONS
              Options in this variable are passed next to the subsequent call of `pg_upgrade`.  For more info about possible options please look at man pg_upgrade(1).

       PGSETUP_DEBUG
              Set to '1' if you want to see debugging output.



postgresql-setup 9.2.24                                                                          August 2018                                                                              POSTGRESQL-SETUP(1)
