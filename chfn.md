CHFN(1)                                                                                         User Commands                                                                                         CHFN(1)



NAME
       chfn - change your finger information

SYNOPSIS
       chfn [-f full-name] [-o office] ,RB [ -p office-phone] [-h home-phone] -u] [-v] [username]

DESCRIPTION
       chfn  is  used  to  change your finger information.  This information is stored in the /etc/passwd file, and is displayed by the finger program.  The Linux finger command will display four pieces of
       information that can be changed by chfn: your real name, your work room and phone, and your home phone.

       chfn is used to change local entries only. Use ypchfn, lchfn or any other implementation for non-local entries.

   COMMAND LINE
       Any of the four pieces of information can be specified on the command line.  If no information is given on the command line, chfn enters interactive mode.

   INTERACTIVE MODE
       In interactive mode, chfn will prompt for each field.  At a prompt, you can enter the new information, or just press return to leave the field unchanged.  Enter the keyword "none" to make the  field
       blank.

OPTIONS
       -f, --full-name full-name
              Specify your real name.

       -o, --office office
              Specify your office room number.

       -p, --office-phone office-phone
              Specify your office phone number.

       -h, --home-phone home-phone
              Specify your home phone number.

       -u, --help
              Print a usage message and exit.

       -v, --version
              Print version information and exit.

EXIT STATUS
       Returns 0 if operation was successful, 1 if operation failed or command syntax was not valid.

SEE ALSO
       finger(1), passwd(5)

AUTHOR
       Salvatore Valente <svalente@mit.edu>

AVAILABILITY
       The chfn command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        July 2009                                                                                           CHFN(1)
