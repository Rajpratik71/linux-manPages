papi_decode(1)                                                                                       PAPI                                                                                      papi_decode(1)



NAME
       papi_decode - papi_decode utility.

       file decode.c

NAME
       papi_decode - provides availability and detail information for PAPI preset events.

Synopsis
       papi_decode [-ah]

Description
       papi_decode is a PAPI utility program that converts the PAPI presets for the existing library into a comma separated value format that can then be viewed or modified in spreadsheet applications or
       text editors, and can be supplied to PAPI_encode_events (3) as a way of adding or modifying event definitions for specialized applications. The format for the csv output consists of a line of field
       names, followed by a blank line, followed by one line of comma separated values for each event contained in the preset table. A portion of this output (for Pentium 4) is shown below:

       *       name,derived,postfix,short_descr,long_descr,note,[native,...]
       *       PAPI_L1_ICM,NOT_DERIVED,,"L1I cache misses","Level 1 instruction cache misses",,BPU_fetch_request_TCMISS
       *       PAPI_L2_TCM,NOT_DERIVED,,"L2 cache misses","Level 2 cache misses",,BSQ_cache_reference_RD_2ndL_MISS_WR_2ndL_MISS
       *       PAPI_TLB_DM,NOT_DERIVED,,"Data TLB misses","Data translation lookaside buffer misses",,page_walk_type_DTMISS
       *


Options
       · -a Convert only the available PAPI preset events.
       · -h Display help information about this utility.
Bugs
       There are no known bugs in this utility. If you find a bug, it should be reported to the PAPI Mailing List at ptools-perfapi@ptools.org.



Version 5.2.0.0                                                                                Tue Oct 30 2018                                                                                 papi_decode(1)
