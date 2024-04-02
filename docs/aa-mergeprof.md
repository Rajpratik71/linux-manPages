AA-MERGEPROF(8)                                AppArmor                               AA-MERGEPROF(8)

NAME
       aa-mergeprof - merge AppArmor security profiles.

SYNOPSIS
       aa-mergeprof file [file ...] [-d /path/to/profiles]

OPTIONS
       file

          One or more files containing profiles to merge into the profile directory (see -d).

       -d --dir  /path/to/profiles

          Specifies the target directory for the merged AppArmor security profile set.
          Defaults to /etc/apparmor.d.

DESCRIPTION
       aa-mergeprof

BUGS
       If you find any bugs, please report them at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7), apparmor.d(5), aa_change_hat(2), aa-genprof(1), aa-logprof(1), aa-enforce(1),
       aa-audit(1), aa-complain(1), aa-disable(1), and <http://wiki.apparmor.net>.

AppArmor 2.12                                 2018-09-27                              AA-MERGEPROF(8)
