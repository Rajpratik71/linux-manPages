GRUB-SETPASSWORD(3)                                                                        Library Functions Manual                                                                       GRUB-SETPASSWORD(3)



NAME
       grub-setpassword — Generate the user.cfg file containing the hashed grub bootloader password.


SYNOPSIS
       grub-setpassword [OPTION]


DESCRIPTION
       grub-setpassword outputs the user.cfg file which contains the hashed GRUB bootloader password. This utility only supports configurations where there is a single root user.

       The file has the format: GRUB2_PASSWORD=<hashed password>.


OPTIONS
       -h, --help
              Display program usage and exit.

       -v, --version
              Display the current version.

       -o, --output=<DIRECTORY>
              Choose the file path to which user.cfg will be written.


SEE ALSO
       info grub

       info grub2-mkpasswd-pbkdf2



                                                                                               Thu Jun 25 2015                                                                            GRUB-SETPASSWORD(3)
