VMWARE(1)                             BSD General Commands Manual                            VMWARE(1)

NAME
     vmware — Intel(TM) x86(TM)-compatible virtual machine

SYNOPSIS
     vmware [-s name=value] [-n] [-t] [-x] [-X] [-q] [-v] [-W] [configfile]
            [-- <X toolkit options> <application loader options>]

COPYRIGHT
     Copyright (C) 1998-2012 VMware, Inc.  All rights reserved.

DESCRIPTION
     The vmware command starts an Intel or AMD X86-compatible or x86-64-compatible virtual machine.
     Depending upon your hardware configuration, you can run a number of virtual machines simultane‐
     ously.

     This page describes options for starting virtual machines from the command line using vmware.
     For more information, see the product documentation, available from the in-product Help menu and
     the VMware Web site at http://www.vmware.com/support.

     You can specify a virtual machine's configuration by setting parameters in a configuration file
     using the syntax name=value.  Parameters are set one-per-line.  Lines that begin with a number
     sign (#) are comments and are ignored.  To use a configuration file, specify it on the vmware
     command line.

     You can also change configuration variables on the command line using the -s option with the fol‐
     lowing syntax:

           name=value

     After a double-dash separator (--), X toolkit options may be passed as arguments, although some
     of them (in particular size and title) are ignored.  Application loader arguments may also be
     passed.

OPTIONS
     -s name=value
           Set the configuration variable name to value, overriding other definitions of name.

     -n    Open a new window.

     -t    Open a virtual machine or team in a new tab in an existing window.  Requires that you spec‐
           ify a configuration file on the command line.

     -x    Power on the virtual machine on startup. Equivalent to clicking the Power-On button after
           the program starts.  Requires that you specify a configuration file on the command line.

     -X    Power on and switch to full screen mode.  Same as -x, but switch to full screen mode after
           powering on.  Requires that you specify a configuration file on the command line.

     -q    Attempt to exit the virtual machine after powering off.  This is particularly useful when
           the guest operating system is capable of powering off the virtual machine.  Requires that
           you specify a configuration file on the command line.

     -v    Display the program version and exit without starting a virtual machine.

     -W    Starts a second instance of Workstation in a different X server.

     -- -h, --help
           Displays the help for the application loader.

     -- -l, --libdir
           Sets the library installation directory to load the application from.

ENVIRONMENT VARIABLES
     TMPDIR  Location of temporary files.  Defaults to /tmp.

FILES
     /etc/vmware  Record of where files are installed.
     /etc/vmware/config
                  Configuration default settings for the machine.
     ~/.vmware/config
                  User-specific configuration default settings.
     ~/.vmware/preferences
                  User-specific preferences.
     /etc/vmware  User license.
     /usr/lib/vmware (by default)
                  Library directory, possibly shared by several hosts.

SEE ALSO
     Most of the documentation for VMware products is available in the User's manual for that product,
     available from the in-product Help menu (run vmware and choose Help Topics or Online Documenta‐
     tion from the Help menu) and at http://www.vmware.com/support.

Linux                                       August 27, 2012                                      Linux
