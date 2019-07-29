BUILD-SIMPLE-CDD(1)                                                User Commands                                               BUILD-SIMPLE-CDD(1)

NAME
       build-simple-cdd - create custom debian-installer images

DESCRIPTION
       usage: build-simple-cdd [-h] [--logfile LOGFILE] [--quiet] [--verbose]

       [--debug] [--conf CONF] [--do-mirror] [--dvd]
              [--no-do-mirror]  [--qemu]  [--mirror-only]  [--build-only] [--qemu-only] [--force-root] [--dist CODENAME] [--locale LOCALE] [--key‐
              board    KEYBOARD]    [--proposed-updates]    [--kernel-packages    KERNEL_PACKAGES]    [--profiles-udeb-dist    PROFILES_UDEB_DIST]
              [--extra-udeb-dist  EXTRA_UDEB_DIST]  [--security-mirror  SECURITY_MIRROR]  [--profiles  PROFILES] [--local-packages LOCAL_PACKAGES]
              [--build-profiles  BUILD_PROFILES]  [--mirror-tools  MIRROR_TOOLS]  [--build-tools  BUILD_TOOLS]   [--auto-profiles   AUTO_PROFILES]
              [--updates-mirror  UPDATES_MIRROR]  [--debian-mirror  DEBIAN_MIRROR] [--keyring KEYRING] [--require-optional-packages] [--force-pre‐
              seed] [--serial-console]

       create custom debian-installer CDs

   optional arguments:
       -h, --help
              show this help message and exit

       --logfile LOGFILE
              specify a file where the full execution log will be written

       --quiet
              quiet output on the terminal

       --verbose
              verbose output on the terminal

       --debug
              debugging output on the terminal

       --conf CONF
              specify a configuration file

       --do-mirror
              generate mirror

       --dvd  generate dvd

       --no-do-mirror
              do not generate mirror

       --qemu, -q
              use qemu to test the image

       --mirror-only
              only generate/update the mirror

       --build-only
              only build the ISO image

       --qemu-only
              only test a previously built the image

       --force-root
              allow running as root

       --dist CODENAME
              distribution name (etch, lenny, wheezy, jessie, ..., sid) (default: $(lsb_release --short --codename))

       --locale LOCALE
              preselect this default locale for the distribution (default: None)

       --keyboard KEYBOARD
              preselect this keyboard in debian-installer (consolekeymaps-at/keymap debconf question) (default: None)

       --proposed-updates
              specify if proposed updates should be used (default: false)

       --kernel-packages KERNEL_PACKAGES
              list of kernel packages to include on the CD (default: None)

       --profiles-udeb-dist PROFILES_UDEB_DIST
              pull simple-cdd-profiles udeb from specified distribution (default: None)

       --extra-udeb-dist EXTRA_UDEB_DIST
              pull in udebs from specified distribution (default: None)

       --security-mirror SECURITY_MIRROR
              security mirror URL (default: None)

       --profiles PROFILES, -p PROFILES
              select profiles (examples in profiles/ dir) (default: None)

       --local-packages LOCAL_PACKAGES
              list of files included on CD's local package repository (default: None)

       --build-profiles BUILD_PROFILES, -b BUILD_PROFILES
              profiles only used while building the CD (default: None)

       --mirror-tools MIRROR_TOOLS
              list the mirror tools to be used (default: wget reprepro)

       --build-tools BUILD_TOOLS
              list the build tools to be used (default: debian-cd)

       --auto-profiles AUTO_PROFILES, -a AUTO_PROFILES
              automatically install these profiles (default: None)

       --updates-mirror UPDATES_MIRROR
              specify mirror for $DIST-updates (default: None)

       --debian-mirror DEBIAN_MIRROR
              official Debian mirror to use to get Debian packages (default: ftp://{server}/debian/)

       --keyring KEYRING
              use specified keyrings (comma-separated) for verifying packages (default: /usr/share/keyrings/debian-archivekeyring.gpg)

       --require-optional-packages
              fail if missing optional packages (*.downloads) (default: None)

       --force-preseed
              only issue a warning if a preseeding file is invalid (default: None)

       --serial-console, -s
              enable serial console when booting the ISO image (default: None)

build-simple-cdd 0.6.1                                             November 2015                                               BUILD-SIMPLE-CDD(1)
