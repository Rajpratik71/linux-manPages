ABRT-ACTION-PERFOR(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-PERFOR(1)



NAME
       abrt-action-perform-ccpp-analysis - Allows users to select acceptable way of core dump analysis

SYNOPSIS
       abrt-action-perform-ccpp-analysis [-h] [-d PROBLEM_DIR]

DESCRIPTION
       This tool allows user to select between local and remote core dump analysis. The local analysis may require to download huge amount of data but is completely safe. On the contrary the remote
       analysis only needs to upload the core dump to retrace server but the core dump may contain security sensitive data.

   Integration with ABRT events
       abrt-action-perform-ccpp-analysis is used in the analyze step when processing C/C++ crashes

           EVENT=analyze_CCpp analyzer=CCpp
               abrt-action-perform-ccpp-analysis

OPTIONS
       -d, --problem-dir PROBLEM_DIR
           Problem directory [Default: current directory]

       -h, --help
           Show help message

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-PERFOR(1)
