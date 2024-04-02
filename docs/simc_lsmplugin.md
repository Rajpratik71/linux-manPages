simc_lsmplugin(1)                                                                               libStorageMgmt                                                                              simc_lsmplugin(1)



NAME
       simc_lsmplugin -- LibstorageMgmt Simulator C Plugin


DESCRIPTION
       LibStorageMgmt  simulator  C plugin is for development use. The plugin simulates an array which supports most features of the library. The simulator is memory based, state will be discarded once the
       plugin exits. The 'simc_lsmplugin' executable file is for the libStorageMgmt daemon to execute when client user specifies simc plugin in the URI.

       Since every command of lsmcli is a standalone libStorageMgmt session, this plugin is essentially useless for this purpose. In this use case, the libStorageMgmt simulator plugin  sim_lsmplugin(1)  is
       suggested.

       This plugin is written in pure C and is intended to be an example of a C plugin for the library.


URI
       To use this plugin, users should set their URI to this format:

           simc://

       No password is required for this plugin.  No URI parameters are supported by this plugin.


FIREWALL RULES
       This plugin requires not network access.


SEE ALSO
       lsmcli(1), lsmd(1), sim_lsmplugin(1)


BUGS
       Please report bugs to <libstoragemgmt-devel@lists.sourceforge.net>


AUTHOR
       Gris Ge <fge@redhat.com>
       Tony Asleson <tasleson@redhat.com>



simc_lsmplugin 1.7.3                                                                              June 2015                                                                                 simc_lsmplugin(1)
