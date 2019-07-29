LOCALEPURGE(8)                                                System Manager's Manual                                               LOCALEPURGE(8)

NAME
       localepurge - reclaim disk space removing unneeded localizations

SYNOPSIS
       localepurge

DESCRIPTION
       localepurge  is  a  small  script  to recover disk space wasted for unneeded locale files and localized man pages. It will be automagically
       invoked by dpkg upon completion of any apt installation run.   You have to define the locale directory names you want to keep from  removal
       after each apt installation run in the /etc/locale.nopurge configuration file.  Unless localepurge has been adequately configured, the sys‐
       tem's localization files won't be touched at all.
       The contents of following directories will be affected from removals:
       - /usr/share/doc/kde/HTML
       - /usr/share/gnome/help
       - /usr/share/locale
       - /usr/share/man
       - /usr/share/omf
       The localization files you actually need and which you want to be preserved on your system can be easily configured by running the  follow‐
       ing command:
       dpkg-reconfigure localepurge

OPTIONS
       The  configurable options consist of toggling verbose output, reporting a summary of freed space, and deletion of localized manual pages in
       addition to locale files.  All actions are specified in the /etc/locale.nopurge configuration file.
       For detailed debugging the commandline switch -debug or just a short -d instead are available for usage.  For verbose output  the  command‐
       line switch -verbose or just a short -v can be added.

A Word of CAUTION
       Please  note,  that  this tool is a hack which is not integrated with Debian's package management system and therefore is not meant for the
       faint of heart.  Responsibility for its usage and possible breakage of your system therefore lies in the sysadmin's (your) hands.
       Please definitely do abstain from reporting any bugs blaming localepurge if you break your system by using it. If you don't know  what  you
       are doing and can't handle any resulting breakage on your own then please simply don't use it.
       All  locale  directories  containing  a  subdirectory  named  LC_MESSAGES  which  are  either  commented  out  or not even listed at all in
       /etc/locale.nopurge will be irreversibly deleted.  The only way to reinstall any lost locales is  a  complete  reinstallation  of  all  the
       Debian  packages containing them. See /usr/share/doc/localepurge/reinstall_debs.sh for a recipe.  Alternatively you can reconfigure it with
       dpkg-reconfigure(8) to prevent locale files from being purged during subsequent runs of apt.

SOLVING PROBLEMS caused by localepurge
       This program does interfere with the Debian package management and does provoke  strange,  but  usually  harmless,  behaviour  of  programs
       related  with  apt/dpkg  like dpkg-repack(1), debsums(1), reportbug(1), etc.  If you need to have any package in its full integrity so that
       e.g. the formerly mentioned programs work as designed by its author and as expected by you, simply deinstall localepurge temporarily  with‐
       out purging its configuration and reinstall the packages you need in their fully integral state. When you are done with what you needed the
       integral packages for simply reinstall localepurge again.

FILES
       /etc/locale.nopurge

SEE ALSO
       Administrators of systems with short disk space should have a look at both the deborphan and debfoster packages. Especially  debfoster  can
       work wonders for your scarce disk space!

       deborphan(1)
       debfoster(8)
       dpkg-reconfigure(8)
       debconf(8)
       /usr/share/doc/localepurge/README.debian
       /usr/share/doc/localepurge/reinstall_debs.sh

AUTHOR
       localepurge  and  its  accompanying  manual page was written for the Debian GNU/Linux system by Paul Seelig <pseelig@debian.org> with major
       contributions from Gustavo Noronha Silva <kov@debian.org> and Francesco Potortì.  The author sincerely hopes that some day further develop‐
       ment of Debian's great package management system will make localepurge fully obsolete.

                                                                                                                                    LOCALEPURGE(8)
