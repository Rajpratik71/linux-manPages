KMODSIGN(1)                                                                                   User Commands                                                                                   KMODSIGN(1)

NAME
       kmodsign - Kernel module signing tool

SYNOPSIS
       kmodsign [-dpkD] <hash algo> <key> <x509> <module> [<dest>]

DESCRIPTION
       Sign a kernel module image for use with an enforcing kernel.

OPTIONS
       -p     save a copy of the p7s signature (.p7s)

       -d     produce a detached signature file (.p7s) only

       -D     produce a full detached signature block (may be cat'd onto the end of a module)

       -k     switch to using keyid for identification

kmodsign 4.4                                                                                     May 2016                                                                                     KMODSIGN(1)
