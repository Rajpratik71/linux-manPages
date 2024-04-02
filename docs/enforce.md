AA-ENFORCE(8)                                                                                      AppArmor                                                                                     AA-ENFORCE(8)



NAME
       aa-enforce - set an AppArmor security profile to enforce mode from being disabled or complain mode.

SYNOPSIS
       aa-enforce <executable> [<executable> ...]

DESCRIPTION
       aa-enforce is used to set the enforcement mode for one or more profiles to enforce.  This command is only relevant in conjunction with the aa-complain utility which sets a profile to complain mode
       and the aa-disable utility which unloads and disables a profile. The default mode for a security policy is enforce and the aa-complain utility must be run to change this behavior.

BUGS
       If you find any bugs, please report them at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa-complain(1), aa-disable(1), aa_change_hat(2), and <http://wiki.apparmor.net>.



AppArmor 2.8.2                                                                                    2017-07-04                                                                                    AA-ENFORCE(8)
