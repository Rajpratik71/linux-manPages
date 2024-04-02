AA-COMPLAIN(8)                                                                                     AppArmor                                                                                    AA-COMPLAIN(8)



NAME
       aa-complain - set a AppArmor security profile to complain mode.

SYNOPSIS
       aa-complain <executable> [<executable> ...]

DESCRIPTION
       aa-complain is used to set the enforcement mode for one or more profiles to complain. In this mode security policy is not enforced but rather access violations are logged to the system log.

BUGS
       If you find any bugs, please report them at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa-enforce(1), aa-disable(1), aa_change_hat(2), and <http://wiki.apparmor.net>.



AppArmor 2.8.2                                                                                    2017-07-04                                                                                   AA-COMPLAIN(8)
