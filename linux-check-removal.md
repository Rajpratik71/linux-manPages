LINUX-CHECK-REMOVAL(1)                  General Commands Manual                 LINUX-CHECK-REMOVAL(1)

NAME
       linux-check-removal - check whether removal of a kernel is safe

SYNOPSIS
       linux-check-removal VERSION

DESCRIPTION
       linux-check-removal  is intended to be called from the prerm maintainer scripts of Linux kernel
       packages.

       The VERSION argument must be the kernel version string as shown by uname -r and used  in  file‐
       names.

       If  the currently running kernel matches VERSION, linux-check-removal normally prompts the user
       to confirm this potentially dangerous action and fails if the user chooses to abort.  There are
       two exceptions to this behaviour:

       • If the current environment is a chroot or container, it is assumed that the running kernel is
         independent of any installed kernel package and the command always quietly succeeds

       • If debconf prompts are disabled, the command warns if removing the running kernel but  always
         succeeds

ENVIRONMENT VARIABLES
       DEBIAN_FRONTEND
              Name  of the preferred debconf front-end.  If set to noninteractive, debconf prompts are
              disabled and linux-check-removal always quietly succeeds.
       DPKG_MAINTSCRIPT_PACKAGE
              Name of the package to be removed, automatically set by dpkg.

AUTHOR
       linux-check-removal and this manual page were written by Ben Hutchings as part  of  the  Debian
       linux-base package.

                                              6 June 2016                       LINUX-CHECK-REMOVAL(1)
