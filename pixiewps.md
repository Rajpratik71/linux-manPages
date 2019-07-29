PIXIEWPS(1)                                                 Offline WPS bruteforce tool                                                PIXIEWPS(1)

NAME
       pixiewps - Offline Wi-Fi Protected Setup bruteforce tool

DESCRIPTION
              Pixiewps  is  a  tool  written in C used to bruteforce offline the WPS PIN method exploiting the low or non-existing entropy of some
              Access Points, the so-called "pixie-dust attack".

              It is meant for educational purposes only.

SYNOPSIS
       pixiewps <arguments>

ARGUMENTS
   REQUIRED ARGUMENTS
       -e, --pke

              Enrollee's DH public key, found in M1.

       -r, --pkr

              Registrar's DH public key, found in M2. It can be avoided by specifying --dh-small in both Reaver and pixiewps.

              pixiewps -e <pke> -s <e-hash1> -z <e-hash2> -a <authkey> -n <e-nonce> -S

       -s, --e-hash1

              Enrollee's hash 1, found in M3. It's the hash of the first half of the PIN.

       -z, --e-hash2

              Enrollee's hash 2, found in M3. It's the hash of the second half of the PIN.

       -a, --authkey

              Authentication session key. Although for this parameter a modified version of Reaver or Bully is needed, it can be avoided by speci‐
              fying small Diffie-Hellman keys in both Reaver and pixiewps and supplying --e-nonce, --r-nonce and --e-bssid.

              pixiewps -e <pke> -s <e-hash1> -z <e-hash2> -S -n <e-nonce> -m <r-nonce> -b <e-bssid>

       -n, --e-nonce

              Enrollee's nonce, found in M1.

   OPTIONAL ARGUMENTS
       -m, --r-nonce

              Registrar's nonce, found in M2. Used with other parameters to compute the session keys.

       -b, --e-bssid

              Enrollee's BSSID. Used with other parameters to compute the session keys.

       -S, --dh-small (deprecated)

              Small  Diffie-Hellman  keys.  The  same option must be specified in Reaver too. Some Access Points seem to be buggy and don't behave
              correctly with this option. Avoid using it with Reaver when possible.

       -v, --verbosity

              Verbosity level 1-3, 1 is quietest, default is 3.

       -h

              Display a simple help usage screen.

       --help

              Display verbose help.

       -V, --version

              Display version and other information.

       --mode N[,... N]

              Select modes, comma separated (experimental modes are not used unless specified):

              1 - RT/MT/CL

              2 - eCos simple

              3 - RTL819x

              4 - eCos simplest [Experimental]

              5 - eCos Knuth    [Experimental]

       --start [mm/]yyyy

       --end [mm/]yyyy

              Starting and ending dates for mode 3, they are interchangeable.

              If only one is specified, the current time will be used for the other. The earliest possible date is  01/1970,  corresponding  to  0
              (Unix epoch time), the latest is 02/2038, corresponding to 0x7FFFFFFF.  If --force is used then pixiewps will start from the current
              time and go back all the way to 0.

   MISCELLANEOUS ARGUMENTS
       -7, --m7-enc

              Encrypted settings, found in M7. Recover Enrollee's WPA-PSK and secret nonce 2. This feature only works on some Access  Points  vul‐
              nerable to mode 3.

              pixiewps -e <pke> -r <pkr> -n <e-nonce> -m <r-nonce> -b <e-bssid> -7 <enc7> --mode 3

       -5, --m5-enc

              Encrypted  settings,  found  in  M5.  Recover  Enrollee's  secret nonce 1. This option must be used in conjunction with --m7-enc. If
              --e-hash1 and --e-hash2 are also specified, pixiewps will also recover the WPS PIN.

              pixiewps -e <pke> -r <pkr> -n <e-nonce> -m <r-nonce> -b <e-bssid> -7 <enc7> -5 <enc5> --mode 3

              pixiewps -e <pke> -r <pkr> -n <e-nonce> -m <r-nonce> -b <e-bssid> -7 <enc7> -5 <enc5> --mode 3 -s <e-hash1> -z <e-hash2>

EXAMPLES
       pixiewps --pke <pke> --pkr <pkr> --e-hash1 <e-hash1> --e-hash2 <e-hash2> --authkey <authkey> --e-nonce <e-nonce>

       pixiewps -e <pke> -r <pkr> -s <e-hash1> -z <e-hash2> -a <authkey> -n <e-nonce>

AUTHOR
       Pixiewps was developed by wiire.

       This manual page was written by Daniel Echeverry <epsilon77@gmail.com> and Samuel Henrique <samueloph@gmail.com> for  the  Debian  project,
       but can be used by other projects as well.

pixiewps                                                           November 2017                                                       PIXIEWPS(1)
