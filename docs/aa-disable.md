AA-DISABLE(8)                                                                                      AppArmor                                                                                     AA-DISABLE(8)



NAME
       aa-disable - disable an AppArmor security profile

SYNOPSIS
       aa-disable <executable> [<executable> ...]

DESCRIPTION
       aa-disable is used to disable the enforcement mode for one or more profiles. This command will unload the profile from the kernel and prevent the profile from being loaded on AppArmor startup. The
       aa-enforce and aa-complain utilities may be used to to change this behavior.

BUGS
       If you find any bugs, please report them at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa-enforce(1), aa-complain(1), aa_change_hat(2), and <http://wiki.apparmor.net>.



AppArmor 2.8.2                                                                                    2017-07-04                                                                                    AA-DISABLE(8)
