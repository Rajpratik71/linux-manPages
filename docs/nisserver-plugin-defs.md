nisserver-plugin-defs(1)                                                                System Administrator's Manual                                                                nisserver-plugin-defs(1)



NAME
       nisserver-plugin-defs - print default settings for the NIS server plugin


SYNOPSIS
       nisserver-plugin-defs [-d domain ] [-m map ] [-s suffix ]


DESCRIPTION
       The nisserver-plugin-defs command produces example configuration entries containing the default settings which the NIS server plugin will use for all maps for which it has built-in defaults, or if a
       particular map name is specified, for one map.


ARGUMENTS
       -d DOMAIN
              By default, nisserver-plugin-defs uses a placeholder for the NIS domain name when it prints example configuration entries.  This option allows a particular domain name to be specified.

       -m MAP By default, nisserver-plugin-defs prints example configuration entries for all of the maps for which it has built-in defaults.  This option can be used to examine the defaults associated with
              a particular map name.

       -s SUFFIX
              By  default, nisserver-plugin-defs uses a placeholder for the base DN under which it expects to find entries which are relevant for the map.  This option allows a particular search base to be
              specified.


BUGS
       Probably, but let's hope not.  If you find any, please file them in the bug database at http://slapi-nis.fedorahosted.org/.


AUTHOR
       Nalin Dahyabhai <nalin@redhat.com>



slapi-nis                                                                                         2011/04/19                                                                         nisserver-plugin-defs(1)
