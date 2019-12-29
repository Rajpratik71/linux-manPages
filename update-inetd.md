UPDATE-INETD(1)                   User Contributed Perl Documentation                  UPDATE-INETD(1)

NAME
       update-inetd - create, remove, enable or disable entry /etc/inetd.conf

SYNOPSIS
       update-inetd [option...] command argument

DESCRIPTION
       update-inetd can be used to add, remove, enable or disable entries in the /etc/inetd.conf file
       (you can specify a different file by using the --file option). After the /etc/inetd.conf file
       has been changed, update-inetd will send a SIGHUP signal to the inetd process to make sure that
       inetd will use the new /etc/inetd.conf file. For Perl scripts you can also use the Perl module
       DebianNet. See DebianNet(3pm) for further information. update-inetd can also be used to add
       entries that are commented out by default. They will be treated like normal entries.  That also
       means that if you already have an entry that is commented out you cannot add an entry for the
       same service without removing the old one first.

       In accordance with the Debian Policy, update-inetd treats entries that are prefixed with a
       single '#' character as commented out by a user. This means that for a user to disable a
       service using update-inetd, and for the service to remain disabled after upgrades, the user
       must run update-inetd with --comment-chars '#' (see relevant option below). Conversely, package
       maintainer scripts should not override the default comment chars (and when they do, they must
       not use '#').

       Also note that --enable and --remove will not be acted upon for service entries that are
       commented out using anything but the value specified with --comment-chars (or the default value
       if none is specified).

COMMANDS
       --add entry-line
           Add an entry to /etc/inetd.conf. A description of the entry-line format can be found in the
           inetd(8) or inetd.conf(5) manual pages (or just look at /etc/inetd.conf). In order to
           prevent the shell from changing your entry-line definition you have to quote the entry-line
           using single or double quotes. You can use tabs (tab character or \t) and spaces to
           separate the fields of the entry-line. To add the entry-line to a specific section in the
           /etc/inetd.conf file please use the --group option.

           If you are trying to add an entry which already exists, update-inetd will not add the
           entry. For uncommented entries it will do nothing and for entries that are commented out by
           the comment-chars (see option --comment-chars) it will enable the existing entry. If you
           want to completely replace an entry just remove the entry with the --remove command first.

       --remove entry-regex
           Remove an entry-line matching entry-regex (e.g. "telnet") from /etc/inetd.conf. The entry-
           regex will be anchored at the beginning of the entry line.

       --enable service[,...]
           Enable service (e.g. "ftp") in /etc/inetd.conf. If you want to enable more than one service
           you can use a comma-separated list of services (no whitespace characters allowed).

       --disable service[,...]
           Disable service (e.g. "ftp") in /etc/inetd.conf. If you want to disable more than one
           service you can use a comma-separated list of services (no whitespace characters allowed).

OPTIONS
       --group groupname
           Specify that the new entry should be placed in group groupname (e.g. "MAIL"). If the group
           does not exist the entry will be placed at the end of the file. The default group is
           "OTHER".

           This option is only relevant with the --add command.

       --pattern pattern
           This option can be used to select a service. You only need this option if you have two (or
           more) services of the same name.

           This option is not relevant with the --add command.

       --comment-chars characters
           update-inetd uses "#<off># " as the default comment characters.  You can use this option to
           specify different comment characters. This is only necessary if you have to deal with two
           (or more) services of the same name.  If you do use this option, it is your responsibility
           to eventually remove the commented out entry.

       --multi
           If you want to disable/remove more than one entry at a time you should use this option. If
           you try to remove more than one entry at a time without using this option the program will
           show a warning and prompt the user for an explicit confirmation.

       --file filename
           Use filename instead of /etc/inetd.conf.

       --verbose
           Explain what is being done.

       --debug
           Enables debugging mode.

       --help
           Print a usage message on standard output and exit successfully.

       --version
           Print version information on standard output and exit successfully.

EXAMPLES
       You have installed ssh (secure encrypting remote shell) and wish to disable its unencrypted
       cousins:

         update-inetd --comment-chars '#' --disable login,shell,exec,telnet

       Using a single '#' character as a comment-char prevents update-inetd to re-enable the services
       on package upgrades.

       You think the clock on your computer is often inaccurate and wish to make sure other computers
       cannot read it:

         update-inetd --comment-chars '#' --disable time,daytime

       You get the clock fixed:

         update-inetd --enable time,daytime

       You hear a rumor that inetd is easily crashed via a SYN attack against the time and daytime
       services, you want to turn off only their TCP versions, while leaving the analogous UDP
       services enabled:

         update-inetd --comment-chars '#' --pattern tcp --disable time,daytime

       You just finished writing a POP3 server and want to install the /etc/inetd.conf entry from the
       Makefile:

         update-inetd --group MAIL --add \
           'pop-3\t\tstream\ttcp\tnowait\troot\t/usr/sbin/tcpd\t/usr/sbin/in.pop3d'

FILES
       /etc/inetd.conf /var/run/inetd.pid

SEE ALSO
       inetd(8), DebianNet(3pm)

perl v5.28.1                                  2019-03-05                               UPDATE-INETD(1)
