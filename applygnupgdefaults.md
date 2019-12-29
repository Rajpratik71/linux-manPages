APPLYGNUPGDEFAULTS(8)                    GNU Privacy Guard 2.2                   APPLYGNUPGDEFAULTS(8)

NAME
       applygnupgdefaults - Run gpgconf --apply-defaults for all users.

SYNOPSIS
       applygnupgdefaults

DESCRIPTION
       This  script  is  a  wrapper around gpgconf to run it with the command --apply-defaults for all
       real users with an existing GnuPG home directory.  Admins might want to use this script to  up‐
       date  he  GnuPG  configuration  files  for  all  users after ‘/etc/gnupg/gpgconf.conf’ has been
       changed.  This allows enforcing certain policies for all users.  Note, that this is not a  bul‐
       letproof  way to force a user to use certain options.  A user may always directly edit the con‐
       figuration files and bypass gpgconf.

       applygnupgdefaults is invoked by root as:

         applygnupgdefaults

GnuPG 2.2.12                                  2018-12-11                         APPLYGNUPGDEFAULTS(8)
