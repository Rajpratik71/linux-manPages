UPDATE-RCCONF-GUIDE(8)                                           Debian GNU/Linux                                           UPDATE-RCCONF-GUIDE(8)

NAME
       update-rcconf-guide - Create default guide file for rcconf

SYNOPSIS
       update-rcconf-guide

DESCRIPTION
       Update-rcconf-guide creates the default guide file which rcconf uses.

       Update-rcconf-guide searches the package names corresponding to each service file in /etc/init.d directory from dpkg info
       files(/var/lib/dpkg/info/*.list) and get the description of these packages using apt-cache. Update-rcconf-guide uses Short-Description in
       priority to the description if service files has Short-Description field.  Update-rcconf-guide writes those results to
       /var/lib/rcconf/guide.default file.

       You can write your own guide in user guide file(/var/lib/rcconf/guide) by hand.  Rcconf refers Guides in /var/lib/rcconf/guide before those
       in /var/lib/rcconf/guide.default.

       If you install some packages after executed update-rcconf-guide, you need to re-create this file using update-rcconf-guide so as to refresh
       guide.default that includes new guides for installed new services.

       Notice: update-rcconf-guide was not executed when you installed rcconf
               package.

FILE
       /var/lib/rcconf/guide.default
               Guide File update-rcconf-guide generates.

       /var/lib/rcconf/guide
               Guide File user(Administrator) can define.

SEE ALSO
       rcconf(8)

AUTHOR
       Atsushi KAMOSHIDA <kamop@debian.org>

perl v5.18.1                                                        2013-11-11                                              UPDATE-RCCONF-GUIDE(8)
