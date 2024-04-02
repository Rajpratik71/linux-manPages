PAM-AUTH-UPDATE(8)                                                                      System Manager's Manual                                                                     PAM-AUTH-UPDATE(8)

NAME
       pam-auth-update - manage PAM configuration using packaged profiles

SYNOPSIS
       pam-auth-update [--package [--remove profile [profile...]]]  [--force]

DESCRIPTION
       pam-auth-update  is a utility that permits configuring the central authentication policy for the system using pre-defined profiles as supplied by PAM module packages.  Profiles shipped in the
       /usr/share/pam-configs/ directory specify the modules, with options, to enable; the preferred ordering with respect to other profiles; and whether a profile  should  be  enabled  by  default.
       Packages  providing PAM modules register their profiles at install time by calling pam-auth-update --package.  Selection of profiles is done using the standard debconf interface.  The profile
       selection question will be asked at `medium' priority when packages are added or removed, so no user interaction is required by default.  Users may invoke pam-auth-update directly  to  change
       their authentication configuration.

       The  script  makes every effort to respect local changes to /etc/pam.d/common-*.  Local modifications to the list of module options will be preserved, and additions of modules within the man‐
       aged portion of the stack will cause pam-auth-update to treat the config files as locally modified and not make further changes to the config files unless given the --force option.

       If the user specifies that pam-auth-update should override local configuration changes, the locally-modified files will be saved in /etc/pam.d/ with a suffix of .pam-old.

OPTIONS
       --package
              Indicate that the caller is a package maintainer script; lowers the priority of debconf questions to `medium' so that the user is not prompted by default.

       --enable profile [profile...]
              Enable the specified profiles in system configuration. This is used to enable profiles that are not on by default.

       --remove profile [profile...]
              Remove the specified profiles from the system configuration.  pam-auth-update --remove should be used to remove profiles from the configuration before the modules  they  reference  are
              removed from disk, to ensure that PAM is in a consistent and usable state at all times during package upgrades or removals.

       --force
              Overwrite the current PAM configuration, without prompting.  This option must not be used by package maintainer scripts; it is intended for use by administrators only.

FILES
       /etc/pam.d/common-*
           Global configuration of PAM, affecting all installed services.

       /usr/share/pam-configs/
           Package-supplied authentication profiles.

AUTHOR
       Steve Langasek <steve.langasek@canonical.com>

COPYRIGHT
       Copyright (C) 2008 Canonical Ltd.

SEE ALSO
       PAM(7), pam.d(5), debconf(7)

Debian                                                                                        08/23/2008                                                                            PAM-AUTH-UPDATE(8)
