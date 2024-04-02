UBIQUITY(8)                                               Ubuntu System Manager's Manual                                               UBIQUITY(8)

NAME
     ubiquity — install Ubuntu from a live CD

SYNOPSIS
     ubiquity [--desktop file] [--debug] [--pdb] [--cdebconf] [--automatic] [--only] [--query] [frontend]

DESCRIPTION
     ubiquity is a graphical installer for Ubuntu, written largely in Python, using debian-installer (d-i) as a backend for many of its functions.
     It is normally invoked from a desktop icon, and presents a "wizard"-style graphical user interface.  ubiquity must be run as root, and will
     escalate privileges for itself using gksudo, kdesu, kdesudo, or sudo as appropriate.

     ubiquity has multiple frontends, including one written using GTK+ (gtk_ui) and one written for KDE (kde_ui).  The first non-option argument,
     if any, is interpreted as the name of the frontend to use.

     The following options are available:

     --desktop file
           This option is passed through to gksudo to provide a better description for its privilege-escalation message.  It is only relevant when
           using the gtk_ui frontend.

     -d, --debug
           Run in debugging mode, sending verbose information to /var/log/installer/debug that may be useful to developers.  (The /var/log/syslog
           file is usually required in any case, along with /var/log/partman in the case of problems related to partitioning.)  Note that
           passwords will be logged in debugging mode!

     --pdb
           Drop into the Python debugger in the event of a crash.  Only effective if ubiquity is being run from a terminal.

     --cdebconf
           Use cdebconf instead of the traditional Perl debconf implementation.  In future this may provide enough memory efficiency benefits to
           be made the default, but for now it is not really worthwhile and is therefore for experimental use only.

     --automatic
           Skip over questions that have been pre-answered by use of a preseed file.  This is useful for unattended installations.

     --only
           Tell ubiquity that it is the only desktop program running so that it can customize its user interface to better suit a minimal environ‐
           ment.  This allows the installer to be run standalone, reducing memory requirements.

     --query
           Print the frontend that would be used and then exit.

AUTHORS
     Ubiquity was formerly known as "Espresso", and originally as "Ubuntu Express", which is written and maintained by Javier Carranza
     <javier.carranza@interactors.coop> and Juanje Ojeda Croissier <juanje@interactors.coop>.  This version draws on the work done on Ubuntu
     Express, but was renamed to avoid confusion, to reduce awkward branding considerations, and because Ubiquity concentrates on reusing
     debian-installer code and reducing duplicated translation and branding work as much as possible.  Ubiquity has now substantially diverged
     from Ubuntu Express and is an independent project.

     ubiquity was mainly developed by Colin Watson <cjwatson@ubuntu.com> and Evan Dandrea <ev@ubuntu.com>, with contributions from many others.

     The mythbuntu_ui frontend was developed by Mario Limonciello <superm1@ubuntu.com>.

Ubuntu                                                            August 9, 2007                                                            Ubuntu
