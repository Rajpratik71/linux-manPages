ABRT-INSTALL-CCPPH(1)                                                                            ABRT Manual                                                                            ABRT-INSTALL-CCPPH(1)



NAME
       abrt-install-ccpp-hook - Install coredump handler.

SYNOPSIS
       abrt-install-ccpp-hook install | uninstall | is-installed

DESCRIPTION
       abrt-install-ccpp-hook registers ABRT coredump handler (which saves segfault data) into kernel.

OPTIONS
       install
           Install coredump handler.

       uninstall
           Uninstall coredump handler.

       is-installed
           Returns 0 if handler is installed, otherwise 1.

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-INSTALL-CCPPH(1)
