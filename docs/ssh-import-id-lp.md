ssh-import-id(1)                                                    ssh-import                                                    ssh-import-id(1)

NAME
       ssh-import-id  -  retrieve  one  or more public keys from a public keyserver and append them to the current user's authorized_keys file (or
       some other specified file)

SYNOPSIS
       ssh-import-id [options] USER_ID_1 [gh:USER_ID_2] ... [lp:USER_ID_n]

       ssh-import-id-lp USER_ID_1 [USER_ID_2] ... [USER_ID_n]

       ssh-import-id-gh USER_ID_1 [USER_ID_2] ... [USER_ID_n]

OPTIONS
        -h | --help        usage
        -o | --output F    write output to file 'F' (default ~/.ssh/authorized_keys, use "-" for standard out)
        -r | --remove      remove keys from authorized keys file 'F'
        -u | --useragent U append U to the user agent string
        PROTO:USER_ID      Protocol can be 'lp' for Launchpad.net, or 'gh' for Github.com

DESCRIPTION
       This utility will securely contact a public keyserver and retrieve one or more user's public keys, and append these to the  current  user's
       ~/.ssh/authorized_keys file, standard output or any other specified output file.

       User IDs can be prepended by a protocol:

        - lp: to use https://launchpad.net/~%s/+sshkeys
        - gh: to use https://api.github.com/users/%s/keys

       If the protocol is not explicitly specified, then ssh-import-id will read a URL variable string from /etc/ssh/ssh_import_id as installed by
       your package manager and configured by your system administrator.  You can override this locally by exporting the string you want in a  URL
       environment variable.  If all of these are empty, then the protocol is assumed to be "lp:", which was the original target implementation of
       this tool.

       Any keys added will be "labled" with a trailing comment, "# ssh-import-id PROTO:USER_ID".  Revoking keys will first look for lines  in  the
       authorized keys file ending with that label.

SEE ALSO
       ssh(1)

FILES
       /etc/ssh/ssh_import_id

AUTHOR
       This  manpage  and  the  utility was written by Dustin Kirkland <dustin.kirkland@gmail.com> for Ubuntu systems (but may be used by others).
       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public  License,  Version  3  pub‐
       lished by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

ssh-import                                                          4 Feb 2013                                                    ssh-import-id(1)
