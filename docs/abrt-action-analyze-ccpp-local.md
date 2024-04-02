ABRT-ACTION-ANALYZ(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-ANALYZ(1)



NAME
       abrt-action-analyze-ccpp-local - Generates backtrace and search for duplicates

SYNOPSIS
       abrt-action-analyze-ccpp-local [--without-di][--without-bz][--without-bodhi]

DESCRIPTION
       This tool downloads debuginfo and generates a backtrace for coredump in the problem directory, also checks for existing duplicates in bugzilla and possible updates related to the detected crash

   Integration with ABRT events
       abrt-action-analyze-ccpp-local is used in the analyze step when processing C/C++ crashes

           EVENT=analyze_LocalGDB analyzer=CCpp
               abrt-action-analyze-ccpp-local

OPTIONS
       --without-di
           Don’t install debuginfo packages

       --without-bz
           Don’t search bugzilla for existing duplicates

       --without-bodhi
           Don’t search bodhi for existing updates

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-ANALYZ(1)
