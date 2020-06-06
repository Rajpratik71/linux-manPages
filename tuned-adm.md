TUNED_ADM(8)                                                                                        tuned                                                                                        TUNED_ADM(8)



NAME
       tuned-adm - command line tool for switching between different tuning profiles

SYNOPSIS
       tuned-adm [list | active | profile [profile] | off | verify | recommend]


DESCRIPTION
       This  command line utility allows you to switch between user definable tuning profiles. Several predefined profiles are already included. You can even create your own profile, either based on one of
       the existing ones by copying it or make a completely new one. The distribution provided profiles are stored in subdirectories below /usr/lib/tuned and the user  defined  profiles  in  subdirectories
       below /etc/tuned. If there are profiles with the same name in both places, user defined profiles have precedence.


OPTIONS
       list   List all available profiles.


              profiles List all available profiles.


              plugins List all available plugins.


                     -v, --verbose List plugin's configuration options and their hints.


       active Show current active profile.


       profile [PROFILE_NAME]
              Switches to the given profile. If none is given then all available profiles are listed. If the profile given is not valid the command gracefully exits without performing any operation.


       verify Verifies  current  profile  against  system  settings. Outputs information whether system settings match current profile or not (e.g. somebody modified a sysfs/sysctl value by hand). Detailed
              information about what is checked, what value is set and what value is expected can be found in the log.


       recommend
              Recommend a profile suitable for your system. Currently only static detection is implemented - it decides according to data in /etc/system-release-cpe and  virt-what  output.  The  rules  for
              autodetection are defined in the file /usr/lib/tuned/recommend.d/50-tuned.conf. The default rules recommend profiles targeted to the best performance, or the balanced profile if unsure.

              The default rules can be overridden by the user by putting a file named recommend.conf into /etc/tuned, or by creating a file in the /etc/tuned/recommend.d directory. The file /etc/tuned/rec‐
              ommend.conf is evaluated first. If no match is found, the files in the /etc/tuned/recommend.d directory are merged with the files in the /usr/lib/tuned/recommend.d directory (if  there  is  a
              file with the same name in both directories, the one from /etc/tuned/recommend.d is used) and the files are evaluated in alphabetical order. The first matching entry is used.


       off    Unload tunings.


FILES
       /etc/tuned/*
       /usr/lib/tuned/*


SEE ALSO
       tuned(8)  tuned-conf(5)  tuned-profiles(7)  tuned-profiles-atomic(7)  tuned-profiles-sap(7)  tuned-profiles-sap-hana(7) tuned-profiles-oracle(7) tuned-profiles-realtime(7) tuned-profiles-nfv-host(7)
       tuned-profiles-nfv-guest(7) tuned-profiles-compat(7)

AUTHOR
       Jaroslav Škarvada <jskarvad@redhat.com>
       Jan Kaluža <jkaluza@redhat.com>
       Jan Včelák <jvcelak@redhat.com>
       Marcela Mašláňová <mmaslano@redhat.com>
       Phil Knirsch <pknirsch@redhat.com>



Fedora Power Management SIG                                                                      30 Mar 2017                                                                                     TUNED_ADM(8)
