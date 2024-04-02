MARIADB-SERVICE-CONVERT(1)             MariaDB Database System             MARIADB-SERVICE-CONVERT(1)

NAME
       mariadb-service-convert - generate a mariadb.service file based on the current mysql/mariadb
       settings

DESCRIPTION
       Use: Generate a mariadb.service file based on the current mysql/mariadb settings.  This is to
       assist distro maintainers in migrating to systemd service definations from a user mysqld_safe
       settings in the my.cnf files.

       Redirect output to user directory like /etc/systemd/system/mariadb.service.d/migrated-from-
       my.cnf-settings.conf

       For more information, please refer to the MariaDB Knowledge Base, available online at
       https://mariadb.com/kb/

MariaDB 10.5                                 27 June 2019                  MARIADB-SERVICE-CONVERT(1)
