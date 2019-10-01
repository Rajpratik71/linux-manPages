GRUB-MKPASSWD-PBKDF2(3)                                                                    Library Functions Manual                                                                   GRUB-MKPASSWD-PBKDF2(3)



NAME
       grub-mkpasswd-pbkdf2 — Generate a PBKDF2 password hash.


SYNOPSIS
       grub-mkpasswd-pbkdf2 [-c | --iteration-count=NUM] [-l | --buflen=NUM]
                             [-s | --salt=NUM]


DESCRIPTION
       grub-mkpasswd-pbkdf2 generates a PBKDF2 password string suitable for use in a GRUB configuration file.


OPTIONS
       --iteration-count=NUM
              Number of PBKDF2 iterations.


       --buflen=NUM
              Length of generated hash.


       --salt=NUM
              Length of salt to use.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                        GRUB-MKPASSWD-PBKDF2(3)
