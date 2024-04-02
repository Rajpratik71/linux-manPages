sim_lsmplugin(1)                                                                                libStorageMgmt                                                                               sim_lsmplugin(1)



NAME
       sim_lsmplugin -- LibStorageMgmt simulator python plugin


DESCRIPTION
       LibstorageMgmt  simulator  plugin  is  for  development  or  test  use  only.   The  plugin  simulates  an  array  which supports most features of the library.  State is stored in a file, default is
       '/tmp/lsm_sim_data'.  The 'sim_lsmplugin' executable file is for libStorageMgmt daemon to execute when client user specifies sim plugin in the URI.

       This plugin is written in pure Python and is intended to be an example of a python plugin for the library.


URI
       To use this plugin, users should set their URI to this format:

           # All that is required
           sim://

           # Optional statefile
           sim://?statefile=<file path and name>

       No password is required for this plugin.


       URI parameters


              statefile

                     Use specified file to store simulator state data. Example URI:
                         sim://?statefile=/tmp/other_lsm_sim_data

                     The statefile is a sqlite3 data base file.


FIREWALL RULES
       This plugin requires not network access.


SEE ALSO
       lsmcli(1), lsmd(1)


BUGS
       Please report bugs to <libstoragemgmt-devel@lists.sourceforge.net>


AUTHOR
       Gris Ge <fge@redhat.com>
       Tony Asleson <tasleson@redhat.com>



sim_lsmplugin 1.7.3                                                                               June 2015                                                                                  sim_lsmplugin(1)
