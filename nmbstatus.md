NMBSTATUS(1)                                                                         User Contributed Perl Documentation                                                                         NMBSTATUS(1)



NAME
       nmbstatus - Lists NMB node status of a UDP network

SYNOPSIS
       nmbstatus [options]

       Options: --workgroup --pdc --bdc --lmb --dmb --members --quiet --allworkgroups --winsserver --print0 --debug --help --man

GENERAL OPTIONS
       --help  Print a brief help message and exits.Prints a help message.

       --man   Print the manual page and exit.

       --print0
               Use '\0' instead of a tab stop as seperator between the output.

       --debug Use an debuglevel. No debuglevel available yet.

GENERAL ARGUMENTS
       --workgroup
               Perform all actions on this workgroup name. If no workgroup is set the information off all available groups is shown.

       --pdc   If not called in conjunction with --quiet print a line starting with the acronym PDC followed by the seperator and the netbios name of the PDC if one is available. If not print nothing and
               return with 1.

       --bdc   If not called in conjunction with --quiet print a line starting with the acronym BDC followed by the seperator and the netbios name of the BDC if one is available. If not print nothing and
               return with 1.

       --dmb   If not called in conjunction with --quiet print a line starting with the acronym DMB followed by the seperator and the netbios name of the DMB if one is available. If not print nothing and
               return with 1.

       --lmb   If not called in conjunction with --quiet print a line starting with the acronym LMB followed by the seperator and the netbios name of the LMB if one is available. If not print nothing and
               return with 1.

       --members
               If not called in conjunction with --quiet print a line starting with the word MEMBERS followed by the seperator and the netbios names of the workgroup members. If not print nothing and
               return with 1.

       --quiet Don't print any information. Just return with 0 if a type - pdc, lmb, dmb, or members was found. Else return 1.

       --allworkgroups
               List all available workgroups.

       --winsserver
               Use this WINS server to gather the information.

DESCRIPTION
       nmbstatus will detect workgroups, PDCs, BDCs, DMBs, LMBs, and Members of workgroups in your network.

       If more than one type is specizied but only one result found, nmbstatus nevertheless returns 0.

AUTHOR
       Lars Mueller <lmuelle@suse.de>

       If you find any errors in the code please let me know.

COPYRIGHT
       Copyright (c) 2003-2004 SuSE Linux AG. All rights reserved.

       This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.



perl v5.18.2                                                                                      2017-05-22                                                                                     NMBSTATUS(1)
