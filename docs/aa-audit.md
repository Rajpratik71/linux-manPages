AA-AUDIT(8)                                                                                        AppArmor                                                                                       AA-AUDIT(8)



NAME
       aa-audit - set a AppArmor security profile to audit mode.

SYNOPSIS
       aa-audit <executable> [<executable> ...]

DESCRIPTION
       aa-audit is used to set the audit mode for one or more profiles to audit.  In this mode security policy is enforced and all access (successes and failures) are logged to the system log.

BUGS
       If you find any bugs, please report them at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa-enforce(1), aa-complain(1), aa-disable(1), aa_change_hat(2), and <http://wiki.apparmor.net>.



AppArmor 2.8.2                                                                                    2017-07-04                                                                                      AA-AUDIT(8)
