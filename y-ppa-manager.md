Y PPA Manager(1)                                                    User Manual                                                   Y PPA Manager(1)

NAME
       Y PPA Manager - Easily manage PPAs

SYNOPSIS
       y-ppa-cmd [OPTION]

DESCRIPTION
       Add,  remove,  purge  and  search all Launchpad PPAs using a graphical interface. The search feature allows you to add the found PPAs, just
       list the packages and their versions in a found PPA or download some packages in the PPA.

       If you run y-ppa-cmd, one of the commands below must be present.

       add    open the Add PPA dialog

       manage open the manage PPAs dialog

       advanced
              launch the advanced options dialog

       search search all Launchpad PPAs dialog

       install
              opens the quick package installation GUI

       settings
              open the settings dialog

       help   open the Help dialog

OPTIONS
   Add PPA
       Add a PPA (in the "ppa:webupd8/gthumb" form). It will add the PPA and update package lists for the PPA.

   Manage PPAs
       Manage the PPAs enabled on your computer. From this dialog you can remove a PPA, purge it, update it, edit the PPA source or list the pack‐
       ages  available  in a PPA for your Ubuntu version. Purge PPA uses the "ppa-purge" tool to downgrade the packages in the selected PPA to the
       version in the official Ubuntu repositories and disables that PPA. The "list packages" feature lists all the packages  that  are  available
       for your Ubuntu version in the selected PPA (only PPAs that you have added to your system and are enabled will show up here).

   Search in all Launchpad PPAs
       Performs  a search in all the Launchpad PPAs for the package you enter in the search form. The regular search uses the Launchpad PPA search
       so it may return empty PPAs if the PPAs have a description that matches your search, or a PPA with packages for a different Ubuntu  version
       then  your  current  Ubuntu version (or the Ubuntu version you've set Y PPA Manager to search for - see info regarding the settings below).
       The advanced search (this is the default search starting with Y PPA Manager 0.9.9.1) will only return the exact matches for your search and
       will display the PPAs and package versions at a glance.

       You  will  be  able to perform the following operations on a PPA: add it, list all the packages in that PPA for your Ubuntu version (or the
       Ubuntu version you've set Y PPA Manager to search for) - including the package versions, download selected packages from a  PPA,  copy  PPA
       link (so you can then paste it in a web browser).

   Install Packages:
       a simple GUI to quickly install one or more packages (separated by a space)

   Advanced
       Advanced  >  Scan  and remove duplicate PPAs: just like the name says, it will automatically remove all duplicate PPAs. This only works for
       PPAs that have their own .list file.

       Advanced > Try to import all missing GPG keys: will attempt to fix all missing GPG keys for all the PPAs added to your system. This  proba‐
       bly doesn't work behind a proxy.

       Advanced  >  Try to fix GPG BADSIG errors: will try to fix all GPG BADSIG errors which are sometimes displayed when running a "sudo apt-get
       update".

       Advanced  >  Backup  repositories:  backs  up  all  the  PPAs  on  your  computer  (all  under  /etc/apt/sources.list.d  and  the  PPAs  in
       /etc/apt/sources.list  -  but  only Launchpad PPAs). This feature does not back up the GPG keys, however, the restore feature automatically
       imports all missing GPG keys so basically, a GPG keys backup is not required.

       Advanced > Restore repositories backup: restores a repositories backup which you've previously performed  using  Y  PPA  Manager.  It  also
       imports all missing GPG keys.

       Advanced  >  Re-enable working PPAs after Ubuntu upgrade: when you upgrade to a new Ubuntu version, all the PPAs are disabled. This feature
       checks if the old PPAs have been updated to work with your current Ubuntu version and if they do work, it re-enables them.

       Advanced > Update release name in working PPAs: using this feature, you can replace the Ubuntu version for all the PPAs  on  your  computer
       with  another Ubuntu version. Y PPA Manager automatically checks if the PPAs support the Ubuntu version you want to replace it with, so the
       PPAs that won't work with the new version are not updated.

   Settings
       PPA Purge behavior: auto - don't require any user input; manual - opens a terminal window asking the user how to solve the issue  (this  is
       the default and highly recommended behavior).

       Ubuntu  indicator: disabled (default); enabled - each time you start Y PPA Manager, an AppIndicator will be displayed. Once you close Y PPA
       Manager, the indicator will be closed too; stand-alone - setting it to "stand-alone", the indicator will automatically start each time  you
       log in without opening the main Y PPA Manager window and also, quitting Y PPA Manager doesn't quit the indicator (feature useful to quickly
       launch one of the Y PPA Manager action without having to open the main user interface).

       Ubuntu version: this only affects the search. So if you want the Y PPA Manager search to display packages for some  other  Ubuntu  version,
       simply  change  the  Ubuntu version here. Supported versions: karmic, lucid, maverick or natty (use the Ubuntu version names for Linux Mint
       too!).

SEE ALSO
       add-apt-repository(1), apt-get(8), ppa-purge(1)

COPYRIGHT
       Alin Andrei <webupd8@gmail.com>

Ubuntu                                                             27 June 2012                                                   Y PPA Manager(1)
