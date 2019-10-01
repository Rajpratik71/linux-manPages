CHCAT(8)                                                                                        User Commands                                                                                        CHCAT(8)



NAME
       chcat - change file SELinux security category

SYNOPSIS
       chcat category file...
       chcat -l category user...
       chcat [[+|-]category...]  file...
       chcat -l [[+|-]category...]  user...
       chcat [-d] file...
       chcat -l [-d] user...
       chcat -L [ -l ] [ user ... ]

DESCRIPTION
       Change/Remove the security category for each file or user.

       Use +/- to add/remove categories from a file or user.

       Note:  When  removing a category you must specify '--' on the command line before using the -Category syntax.  This tells the command that you have finished entering options and are now specifying a
       category name instead.


       -d     delete the category from each FILE/USER.

       -L     list available categories.

       -l     Tells chcat to operate on users instead of files.

SEE ALSO
       chcon(1), selinux(8), semanage(8)

       When operating on files this script wraps the chcon command.

FILES
       /etc/selinux/{SELINUXTYPE}/setrans.conf
       /etc/selinux/{SELINUXTYPE}/seusers




chcat                                                                                           September 2005                                                                                       CHCAT(8)
