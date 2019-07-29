#!/bin/sh  #  # alsa‐base control script # # Description: Used to
load and unload ALSA modules and #              restore and store
mixer  levels.  There is no #              longer any need to run
this script on bootup #              or  shutdown.  It  ships  as
/sbin/alsa.  ### END INIT INFO

set ‐e

# Exit if alsa‐utils package is not installed [ ‐x /usr/sbin/als‐
actl ] || exit 0

MYNAME=/sbin/alsa                   PATH=/usr/local/sbin:/usr/lo‐
cal/bin:/usr/sbin:/usr/bin:/sbin:/bin

#  Default  values  of  variables  in /etc/default/alsa force_un‐
load_modules_before_suspend=""

[ ‐f /etc/default/alsa ] && . /etc/default/alsa

# $* MESSAGE warn() { echo "${MYNAME}: Warning: $* " >&2 ; }

# # Attempt to create /var/run/alsa if it is  absent.   #  Return
true  if  /var/run/alsa  exists  after  this attempt, # otherwise
false.  # check_run_dir() {         [ ‐d /var/run/alsa ]  &&  re‐
turn  0          #  We  have  no business creating /var/run if it
doesn’t  exist          if   !   [   ‐d   /var/run   ]   ;   then
                warn  "Could  not  create  /var/run/alsa/ because
/var/run/ is not present."                  return  1          fi
        if    !    mkdir    ‐‐mode=755   /var/run/alsa   ;   then
                warn   "Failed   to    create    /var/run/alsa/."
                return  1         fi         [ ‐d /var/run/alsa ]
&& return 0         return 1 }

echo_procs_using_sound() {         for i in  /proc/[0‐9]*/fd/*  ;
do                  var="$(readlink  $i)"                 if test
x"$var"       !=       x"${var#/dev/snd/pcm}"       ;        then
                        IFS=/;  set  ‐‐  $i;  unset  IFS; echo $3
                fi         done }

# $* [PID]...  echo_with_command_names() {         [  "$1"  ]  ||
return  0          echo $(                 ps ‐‐no‐headers ‐o "%p
%c" "$@"                | sed ‐e ’s/‐9][0‐9]* /1(2)/’   ) }

kill_procs_using_sound()           {                    procs_us‐
ing_sound="$(echo_procs_using_sound)"          if  [  "$procs_us‐
ing_sound" ] ; then                 echo ‐n "Terminating process‐
es:"                   for   attempt   in   1   2   3   4   ;  do
                        echo    ‐n    "     ${procs_using_sound}"
                        kill      $procs_using_sound     ||     :
                        sleep 1                         procs_us‐
ing_sound="$(echo_procs_using_sound)"                           [
"$procs_using_sound"    ]    ||    break                     done
                #  Either  no  more procs using sound or attempts
ran  out                  if  [  "$procs_using_sound"  ]  ;  then
                        echo  ‐n  "  (with  SIGKILL:) ${procs_us‐
ing_sound}"                         kill ‐9 $procs_using_sound ||
:                              sleep     1                     fi
                procs_using_sound="$(echo_procs_using_sound)"
                if    [    "$procs_using_sound"    ]    ;    then
                        echo "  (failed:  processes  still  using
sound  devices:  $(echo_with_command_names $procs_using_sound))."
                        return        1                        fi
                echo "."          fi         return 0 }

#  $*  MODULE‐NAME  [MODULE‐NAME]...  |  "all" unload_modules() {
        procs_using_sound="$(echo_procs_using_sound)"          if
[  "$procs_using_sound"  ] ; then                 warn "Processes
using   sound   devices:   $(echo_with_command_names   $procs_us‐
ing_sound)."            fi           if   check_run_dir   ;  then
                :>   /var/run/alsa/modules‐removed           else
                warn "Not keeping list of removed modules because
/var/run/alsa is absent.  It will not be  possible  automatically
to  reload these modules."          fi         echo ‐n "Unloading
ALSA sound driver modules:"         [ ‐d /proc/asound ] || { echo
"  (none  loaded)." ; return 0 ; }         echo_snd_modules_load‐
ed()          {                  lsmod            |  sed  ‐n   ‐e
’s/^d[‐_][^[:space:]]*[[:space:]].*/1/p’               |  sed  ‐e
’s/_/‐/g’           }           for   FSMBS   in    $*    ;    do
                MODULES_TO_REMOVE=""                     SND_MOD‐
ULES_LOADED="$(echo_snd_modules_loaded)"                     case
"$FSMBS"  in                    all)                         MOD‐
ULES_TO_REMOVE="$SND_MODULES_LOADED"                           ;;
                                                     snd_*|snd‐*)
                        FSMBS="$(echo   "$FSMBS"   |    sed    ‐e
’s/_/‐/g’)"                          for M in $SND_MODULES_LOADED
; do                                 if [ "$FSMBS"  =  "$M"  ]  ;
then                                               MODULES_TO_RE‐
MOVE="$FSMBS"                                               break
                                fi                           done
                        ;;                 esac                 [
"$MODULES_TO_REMOVE"  ]  ||  continue                 echo "$MOD‐
ULES_TO_REMOVE"         >>          /var/run/alsa/modules‐removed
                for     M     in    $MODULES_TO_REMOVE    ;    do
                        echo         ‐n          "          ${M}"
                        modprobe  ‐r  "$M"  >/dev/null  2>&1 || :
                done         done         if  [  ‐f  /var/run/al‐
sa/modules‐removed  ]  ; then                 MODULES_STILL_LOAD‐
ED="$(echo_snd_modules_loaded | grep ‐F ‐f /var/run/alsa/modules‐
removed)"                    MODULES_STILL_LOADED="$(echo   $MOD‐
ULES_STILL_LOADED)"               else                       MOD‐
ULES_STILL_LOADED=""             fi             if    [    "$MOD‐
ULES_STILL_LOADED" ] ; then                 echo " (failed:  mod‐
ules        still        loaded:       ${MODULES_STILL_LOADED})."
                return 1          else                  echo  "."
                return 0         fi }

#  $* MODULE‐NAME [MODULE‐NAME]... | "all" force_unload_modules()
{         kill_procs_using_sound || :         unload_modules "$@"
|| return 1         return 0 }

load_unloaded_modules() {         LUM_RETURNSTATUS=0         MOD‐
ULES_TO_LOAD=""          [  ‐d  /var/run/alsa  ]  ||   mkdir   ‐p
/var/run/alsa          echo  ‐n  "Loading  ALSA sound driver mod‐
ules:"          [  ‐f  /var/run/alsa/modules‐removed  ]  &&  MOD‐
ULES_TO_LOAD="$(echo    $(cat    /var/run/alsa/modules‐removed))"
        [ "$MODULES_TO_LOAD" ] || { echo " (none to  reload)."  ;
return  $LUM_RETURNSTATUS ; }         echo ‐n " $MODULES_TO_LOAD"
        for MDL in $MODULES_TO_LOAD ; do                 modprobe
$MDL  ||  LUM_RETURNSTATUS=1          done         case "$LUM_RE‐
TURNSTATUS" in           0) echo  "."  ;;             *)  echo  "
(failed)." ;;         esac         return $LUM_RETURNSTATUS }

case "$1" in
  unload)         unload_modules all || exit $?          ;;
  reload)          EXITSTATUS=0         unload_modules all || EX‐
ITSTATUS=1            load_unloaded_modules    ||    EXITSTATUS=1
        exit $EXITSTATUS         ;;
  force‐unload)           force_unload_modules  all  ||  exit  $?
        ;;
  force‐reload)         EXITSTATUS=0         force_unload_modules
all || EXITSTATUS=1         load_unloaded_modules || EXITSTATUS=1
        exit $EXITSTATUS         ;;
  suspend)         case "$force_unload_modules_before_suspend" in
           ""|false)  :  ;;           all|true) /usr/sbin/alsactl
store && force_unload_modules all ||  exit  $?  ;;             *)
/usr/sbin/alsactl   store   &&   force_unload_modules  $force_un‐
load_modules_before_suspend || exit $? ;;         esac         ;;
  resume)         case "$force_unload_modules_before_suspend"  in
           ""|false)  :  ;;           *) load_unloaded_modules &&
/usr/sbin/alsactl restore || exit $? ;;         esac         ;;
  *)          echo   "Usage:   $MYNAME   {unload|reload|force‐un‐
load|force‐reload|suspend|resume}"  >&2         exit 3         ;;
esac

