RPMQPACK(8)                                                                                System Manager's Manual                                                                                RPMQPACK(8)



NAME
       rpmqpack - check for installed rpm packages


SYNOPSIS
       rpmqpack [pack1] [pack2]...


DESCRIPTION
       rpmqpack checks if packages given as arguments are installed in the system. It prints each installed package to stdout.  If no arguments are given all installed packages are printed.


EXIT STATUS
       rpmqpack returns 0 if all given packages are installed, otherwise 1.


SEE ALSO
       rpm(1)


COPYRIGHT
       2002 SUSE Linux AG Nuernberg, Germany.


AUTHOR
       Michael Schroeder <mls@suse.de>



                                                                                                   Mar 2002                                                                                       RPMQPACK(8)
