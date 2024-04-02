PWMAKE(1)                                                                                  General Commands Manual                                                                                  PWMAKE(1)



NAME
       pwmake - simple tool for generating random relatively easily pronounceable passwords

SYNOPSIS
       pwmake <entropy-bits>

DESCRIPTION
       pwmake  is  a  simple  configurable  tool for generating random and relatively easily pronounceable passwords. The tool allows you to specify the number of entropy bits that are used to generate the
       password.

       The entropy is pulled from /dev/urandom.

       The minimum number of bits is 56 which is usable for passwords on systems/services where brute force attacks are of very limited rate of tries.  The 64 bits should be adequate for applications where
       the attacker does not have direct access to the password hash file. For situations where the attacker might obtain the direct access to the password hash or the password is used as an encryption key
       80 to 128 bits should be used depending on your level of paranoia.


OPTIONS
       The first and only argument is the number of bits of entropy used to generate the password.


FILES
       /etc/security/pwquality.conf - The configuration file for the libpwquality library.


RETURN CODES
       pwmake returns 0 on success, non zero on error.


SEE ALSO
       pwscore(1), pam_pwquality(8)


AUTHORS
       Tomas Mraz <tmraz@redhat.com>



Red Hat, Inc.                                                                                    10 Nov 2011                                                                                        PWMAKE(1)
