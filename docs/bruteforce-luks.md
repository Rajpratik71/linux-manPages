BRUTEFORCE-LUKS(1)                                       Bruteforce LUKS encrypted volume                                       BRUTEFORCE-LUKS(1)

NAME
       bruteforce-luks - try to find the password of a LUKS volume

SYNOPSIS
       bruteforce-luks [options] <path to LUKS volume>

DESCRIPTION
       The  program tries to decrypt at least one of the key slots by trying all the possible passwords. It is especially useful if you know some‐
       thing about the password (i.e. you forgot a part of your password but still remember most of it). Finding the password of a volume  without
       knowing anything about it would take way too much time (unless the password is really short and/or weak).

       There are command line options to specify:

              · the minimum password length to try

              · the maximum password length to try

              · the beginning of the password

              · the end of the password

              · the character set to use (among the characters of the current locale)

OPTIONS
       -b <string>
              Beginning of the password.
              Default: ""

       -e <string>
              End of the password.
              Default: ""

       -f <file>
              Read the passwords from a file instead of generating them.

       -h
              Show help and quit.

       -l <length>
              Minimum password length (beginning and end included).
              Default: 1

       -m <length>
              Maximum password length (beginning and end included).
              Default: 8

       -s <string>
              Password character set.
              Default: "0123456789ABCDEFGHIJKLMNOPQRSTU
                        VWXYZabcdefghijklmnopqrstuvwxyz"

       -t <n>
              Number of threads to use.
              Default: 1

       Sending a USR1 signal to a running bruteforce-luks process
       makes it print progress info to standard error and continue.

EXAMPLES
       Try to find the password of a LUKS encrypted volume using 4 threads, trying only passwords with 5 characters:

           bruteforce-luks -t 4 -l 5 -m 5 /dev/sdb1

       Try to find the password of a LUKS encrypted volume using 8 threads, trying only passwords with 5 to 10 characters beginning with "W4l" and
       ending with "z":

           bruteforce-luks -t 8 -l 5 -m 10 -b "W4l" -e "z" /dev/sda2

       Try to find the password of a LUKS encrypted volume using 8 threads, trying only passwords with  10  characters  using  the  character  set
       "P情8ŭ":

           bruteforce-luks -t 8 -l 10 -m 10 -s "P情8ŭ" /dev/sdc3

       Try to find the password of a LUKS encrypted volume using 6 threads, trying the passwords contained in a dictionary file:

           bruteforce-luks -t 6 -f dictionary.txt /dev/sdd1

       Print progress info:

           pkill -USR1 -f bruteforce-luks

BRUTEFORCE-LUKS 1.1                                                  Nov 2015                                                   BRUTEFORCE-LUKS(1)
