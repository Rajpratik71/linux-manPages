ADDGNUPGHOME(8)                          GNU Privacy Guard 2.2                         ADDGNUPGHOME(8)

NAME
       addgnupghome - Create .gnupg home directories

SYNOPSIS
       addgnupghome account_1 account_2...account_n

DESCRIPTION
       If GnuPG is installed on a system with existing user accounts, it is sometimes required to pop‐
       ulate the GnuPG home directory with existing files.  Especially a ‘trustlist.txt’ and a  keybox
       with  some initial certificates are often desired.  This script helps to do this by copying all
       files from ‘/etc/skel/.gnupg’ to the home directories of the  accounts  given  on  the  command
       line.  It takes care not to overwrite existing GnuPG home directories.

       addgnupghome is invoked by root as:

         addgnupghome account1 account2 ... accountn

GnuPG 2.2.12                                  2018-12-11                               ADDGNUPGHOME(8)
