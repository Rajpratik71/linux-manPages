odbcinst(1)                                                                                 unixODBC manual pages                                                                                 odbcinst(1)



NAME
       odbcinst - An unixODBC tool for manipulating configuration files


SYNOPSIS
       odbcinst ACTION OBJECT OPTIONS


DESCRIPTION
       odbcinst  is  a  command  line  tool  which  has  been  created for allowing people who are developing the install scripts/RPMs for Drivers to be able to easily create/remove entries in odbc.ini and
       odbcinst.ini. This command line tool is a complement to the shared library of the same name (libodbcinst.so). This tool is a part of the odbcinst component of unixODBC.


OPTIONS
   ACTIONS
       -i     Install (add section to config file) new OBJECT.


       -u     Uninstall (remove section from config file) existing OBJECT.


       -q     Query the config files and print the options for specified OBJECT.


       -j     Prints current configuration of unixODBC, listing (among others) the paths to the configuration files.


       -c     Calls SQLCreateDataSource


       -m     Calls SQLManageDataSources


       --version
              Prints program version and exits.


   OBJECTS
       -d     The ACTION affect drivers (and thus the odbcinst.ini configuration file).


       -s     The ACTION affect data sources (and thus the user or system odbc.ini configuration file).


   OPTIONS
       -f FILE
              The FILE is template file, describing the configuration of installed OBJECT (only valid for the -i ACTION).


       -r     Same as the -f OPTION, only take the standard input as the template file.


       -n NAME
              Specifies the NAME of the OBJECT.


       -v     Turn off verbose mode. This turns off all information, warning and error messages.


       -l     The specified data source is system-wide. Has any effect only with the -s OBJECT.


       -h     The specified data source is user-specific. Has any effect only with the -s OBJECT.


RETURN VALUES
       This command returns zero on success and non-zero value on failure.


FILES
       /etc/odbinst.ini
              Configuration file containing all the database drivers specifications. See odbcinst.ini(5) for more details.

       /etc/odbc.ini
              System-wide data sources specifications. See odbc.ini(5) for more details.

       $HOME/.odbc.ini
              User-specific data sources specifications. See odbc.ini(5) for more details.


SEE ALSO
       odbcinst.ini(5), odbc.ini(5)


AUTHORS
       The authors of unixODBC are Peter Harvey <pharvey@codebydesign.com> and Nick Gorham <nick@easysoft.com>. For the full list of contributors see the AUTHORS file.


COPYRIGHT
       unixODBC is licensed under the GNU Lesser General Public License. For details about the license, see the COPYING file.



version 2.3.1                                                                                  Wed 26 Jun 2013                                                                                    odbcinst(1)
