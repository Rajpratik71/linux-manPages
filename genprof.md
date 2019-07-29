AA-GENPROF(8)                                                                                      AppArmor                                                                                     AA-GENPROF(8)



NAME
       aa-genprof - profile generation utility for AppArmor

SYNOPSIS
       aa-genprof <executable> [-d /path/to/profiles]

OPTIONS
       -d --dir /path/to/profiles

          Specifies where to look for the AppArmor security profile set.
          Defaults to /etc/apparmor.d.

DESCRIPTION
       When running aa-genprof, you must specify a program to profile.  If the specified program is not a fully-qualified path, aa-genprof will search $PATH in order to find the program.

       If a profile does not exist for the program, aa-genprof will create one using aa-autodep(1).

       Genprof will then:

          - set the profile to complain mode

          - write a mark to the system log

          - instruct the user to start the application to
            be profiled in another window and exercise its functionality

       It then presents the user with two options, (S)can system log for entries to add to profile and (F)inish.

       If the user selects (S)can or hits return, aa-genprof will parse the complain mode logs and iterate through generated violations using aa-logprof(1).

       After the user finishes selecting profile entries based on violations that were detected during the program execution, aa-genprof will reload the updated profiles in complain mode and again prompt
       the user for (S)can and (D)one. This cycle can then be repeated as necessary until all application functionality has been exercised without generating access violations.

       When the user eventually hits (F)inish, aa-genprof will set the main profile, and any other profiles that were generated, into enforce mode and exit.

BUGS
       If you find any bugs, please report them at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa-enforce(1), aa-complain(1), aa-disable(1), aa_change_hat(2), aa-logprof(1), logprof.conf(5), and <http://wiki.apparmor.net>.



AppArmor 2.8.2                                                                                    2017-07-04                                                                                    AA-GENPROF(8)
