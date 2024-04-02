PWSCORE(1)                                                                                 General Commands Manual                                                                                 PWSCORE(1)



NAME
       pwscore - simple configurable tool for checking quality of a password

SYNOPSIS
       pwscore [user]

DESCRIPTION
       pwscore is a simple tool for checking quality of a password. The password is read from stdin.

       The tool uses the libpwquality library to perform configurable checks for minimum length, dictionary checking against cracklib dictionaries, and other checks.

       It either reports an error if the password fails any of the checks, or it prints out the password quality score as an integer value between 0 and 100.

       The  password  quality  score  is  relative to the minlen setting in the configuration file. But in general values below 50 can be treated as moderate quality and above it fairly strong quality. Any
       password that passes the quality checks (especially the mandatory cracklib check) should withstand dictionary attacks and scores above 50 with the  default  minlen  setting  even  fast  brute  force
       attacks.


OPTIONS
       The first and only optional argument is the user name that is used to check the similarity of the password to the username.


FILES
       /etc/security/pwquality.conf - The configuration file for the libpwquality library.


RETURN CODES
       pwscore returns 0 on success, non zero on error.


SEE ALSO
       pwscore(1), pwquality.conf(5), pam_pwquality(8)


AUTHORS
       Tomas Mraz <tmraz@redhat.com>



Red Hat, Inc.                                                                                    10 Nov 2011                                                                                       PWSCORE(1)
