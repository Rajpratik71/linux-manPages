CACERTDIR_REHASH(8)                                                                        System Manager's Manual                                                                        CACERTDIR_REHASH(8)



NAME
       cacertdir_rehash - simple script to create or update hash links to certificate files in a directory

SYNOPSIS
       cacertdir_rehash <directory>

DESCRIPTION
       cacertdir_rehash  is  a  simple shell script that is called by authconfig and authconfig-gtk. It uses openssl command line utility to create hash symbolic links of certificate files in the specified
       directory.


NOTES
       The script is internal to authconfig and its functionality and command line options might be changed in future.


RETURN CODES
       cacertdir_rehash returns 0 on success, non-zero on error.


SEE ALSO
       authconfig(8), authconfig-gtk(8), openssl(1)


AUTHORS
       Tomas Mraz <tmraz@redhat.com>



Red Hat, Inc.                                                                                   31 March 2010                                                                             CACERTDIR_REHASH(8)
