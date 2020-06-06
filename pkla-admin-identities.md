PKLA-ADMIN-IDENTIT(8)                                                                       pkla-admin-identities                                                                       PKLA-ADMIN-IDENTIT(8)



NAME
       pkla-admin-identities - List pklocalauthority-configured polkit administrators

SYNOPSIS
       pkla-admin-identities [--help]

       pkla-admin-identities [--config-path config-path]

DESCRIPTION
       pkla-admin-identities interprets configuration files described below to determine which users polkit(8) considers administrators, using a non-JavaScript configuration file format described below.

       Note: Determining which users are considered administrators is driven by JavaScript rules as described in polkit(8).  pkla-admin-identities is called by a JavaScript rule file named
       49-polkit-pkla-compat.rules; other JavaScript rules with a higher priority may exist, so the pkla-admin-identities configuration may not necessarily govern the final decision by polkit(8).

       The ordering of the JavaScript rule files and the ordering of pkla-admin-identities configuration files is not integrated and uses different rules; the pkla-admin-identities configuration evaluation
       is happens at a single point within the JavaScript rule evaluation order.

       pkla-admin-identities is an internal helper program of pkla-polkit-compat. You shouldn't need to run it directly, except for debugging purposes.

       Configuration is read from files with a .conf extension in the /etc/polkit-1/localauthority.conf.d directory. All files are read in lexicographical order (using the C locale), meaning that later
       files can override earlier ones. The file 50-localauthority.conf contains the settings provided by the OS vendor. Users and 3rd party packages can drop configuration files with a priority higher
       than 60 to change the defaults. The configuration file format is simple. Each configuration file is a key file (also commonly known as a ini file) with a single group called [Configuration]. Only a
       single key, AdminIdentities is read. The value of this key is a semi-colon separated list of identities that can be used when administrator authentication is required. Users are specified by
       prefixing the user name with unix-user:, groups of users are specified by prefixing with unix-group:, and netgroups of users are specified with unix-netgroup:. See the section called “EXAMPLE” for
       an example of a configuration file.

       pkla-admin-identities outputs the resulting configuration of administrator identities, one identity per line, using the same format (including e.g. the unix-user: prefix). If no administrator
       identities are configured in the above-described configuration files, the output will be empty.

OPTIONS
       -h, --help
           Write a summary of the available options to standard output and exit successfully.

       -c, --config-path=config-path
           Search for configuration files in config-path instead of the default /etc/polkit-1/localauthority.conf.d.

EXIT STATUS
       pkla-admin-identities exits with 0 on success (even if there are no administrator identities), and a non-zero status on error.

FILES
       /etc/polkit-1/localauthority.conf.d
           Default directory containing configuration files.

EXAMPLE
       The following .conf file

           [Configuration]
           AdminIdentities=unix-group:staff


       specifies that any user in the staff UNIX group can be used for authentication when administrator authentication is needed. This file would typically be installed in the
       /etc/polkit-1/localauthority.conf.d directory and given the name 60-desktop-policy.conf to ensure that it is evaluated after the 50-localauthority.conf file shipped with pkla-polkit-compat. If the
       local administrator wants to override this (suppose 60-desktop-policy.conf was shipped as part of the OS) he can simply create a file 99-my-admin-configuration.conf with the following content

           [Configuration]
           AdminIdentities=unix-user:lisa;unix-user:marge


       to specify that only the users lisa and marge can authenticate when administrator authentication is needed.

AUTHOR
       Written by David Zeuthen <davidz@redhat.com> with a lot of help from many others. Adapted by Miloslav Trmač <mitr@redhat.com>.

SEE ALSO
       polkit(8)



polkit-pkla-compat                                                                                 May 2013                                                                             PKLA-ADMIN-IDENTIT(8)
