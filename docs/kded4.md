KDED4(8)                                                                                      KDE User's Manual                                                                                      KDED4(8)



NAME
       kded4 - KDE daemon - triggers Sycoca database updates when needed.

SYNOPSIS
       kded4 [--help] [Generic options] [Qt-options] [KDE-options] [--check]

DESCRIPTION
       kded4 is responsible for creating the sycoca file, i.e. the binary cache of servicetypes, mimetypes, and services for a particular user.

       It monitors the directories containing .desktop files. When a file is added/removed, it waits 5 seconds (in case of a series of updates), and then launches kbuildsycoca4 to update the sycoca.

       It checks newly installed update files, i.e. the *.upd files used to update configuration files of users when the configuration file formats changes.  kconf_update is launched to do the updates.

       When the hostname changes, it will make the necessary changes to the KDE environment and X-server to allow continued proper operation, launching kdontchangethehostname to do the changes.

       Those tasks are also performed always at kded4 start to ensure that the user configuration is up to date.

       It is also responsible for launching the on-demand kded4 modules and init enabled kded4 modules like:

       Konqueror Browser Preloader
           Reduces Konqueror startup time.

       Directory Watcher
           Monitors directories for changes.

       Hardware Detection
           Provides a user interface for hardware events.

       SSL Certificate Policy
           Provides the user configured SSL certificate policy to applications.

       Network Proxy Configuration
           Automatic proxy configuration.

       Password Caching
           Temporary password caching, for example: so that a webpage with HTTP authentication doesn't ask for your password for every link and every image in the page. These passwords are forgotten when
           exiting KDE (unlike KWallet)

       Sound Policy
           Provides the sound system policy to applications.

       Favicons
           Stores website icons.

       Display Management
           Manages displays and video outputs.

       Cookie jar
           Stores network cookies.

       Network Watcher
           Keeps track of the network and updates directory listings of the network:/ KIO slave.

       Subversion Module
           Provides various subversion actions to filemanager and other software.

       Network Status
           Tracks status of network interfaces and provides notifications for applications using the network.

       Write Daemon
           Watches the messages from local users sent with write(1) or wall(1).

       Notification area watcher
           Keeps track of applications that want to use the D-Bus based notification area.

       KMixD
           KMixD Mixer Service

       Systemtray daemon
           Keeps track of applications that want to use the D-Bus based system tray.

       Keyboard Daemon
           Keeps track of keyboard changes (new keyboard, changed layout)

       Remote URL Change Notifier
           Provides change notifications for network folders

       Activity Manager
           The Nepomuk activities manager backend

       Display Management change monitor
           Notifies how the display has been rotated (where available)

       Free Space Notifier
           Warns when running out of space in your home folder.

       Removable Device Automounter
           Automatically mounts devices as needed.

       Nepomuk Search Module
           Helper module for KIO to ensure automatic updates of Nepomuk search listings.

       Power Management
           Battery, Display and CPU power management and notifications.

       K Remote Control Daemon
           Manages the Remote Control commands received

       Status Notifier Manager
           Manages services that provide status notifier user interfaces.

       DNS-SD Service Discovery Monitor
           Monitors the network for DNS-SD services.

       Drive Ejector
           Automatically unmounts and releases drives when their eject button is pushed.

       Time zone
           Provides access to the system's time zones for applications.

       Input Actions
           Input Actions service performing configured actions on key presses.

       The init modules can be enabled/disabled using systemsettings, in System Administration > Startup and Shutdown > Service Manager.

GENERIC OPTIONS
       --author
           Show author information.

       --help
           Show help about options.

       --help-all
           Show all options.

       --help-kde
           Show KDE specific options.

       --help-qt
           Show Qt specific options.

       --license
           Show license information.

       -v --version
           Show version information

APPLICATION OPTIONS
       --check
           Check Sycoca database only once.

USAGE
       If kded4 is called without parameters and is already running, it shows the message:

           KDE Daemon (kded) already running.

       If kded4 is called with kded4 --check, then it updates the KDE sycoca using kbuildsycoca4.

SEE ALSO
       kdeoptions(7), qtoptions(7), kbuildsycoca4(8)

BUGS
       There are probably tons of bugs. Use bugs.kde.org[1] to report them.

AUTHORS
       David Faure <faure@kde.org>
           Author.

       Waldo Bastian <bastian@kde.org>
           Author.

NOTES
        1. bugs.kde.org
           http://bugs.kde.org



KDE 4.5                                                                                           2010-10-28                                                                                         KDED4(8)
