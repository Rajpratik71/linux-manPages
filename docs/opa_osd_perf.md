
opa_osd_perf(1)                                                                             IFSFFCLIRG (Man Page)                                                                             opa_osd_perf(1)



NAME
       opa_osd_perf



       Tests the performance of the distributed SA shared memory database.

Syntax
       opa_osd_perf [-q | -p | -S] guidtable

Options
       --help    Produces full help text.


       -q queries
                 Runs at least the specified number of queries.


       -p pkey   Specifies to include pkey in the searches. Can be specified up to 8 times.

       -S sid    Specifies to include SID in the searches. Can be specified up to 8 times. Note that providing both SIDs and pkeys may cause problems.

       guidtable Text file that lists the destination GUIDs and LIDs. For example, from a build_table.pl file.


Example
       opa_osd_perf -q 100000 -p 0x8001 guidtable



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opa_osd_perf(1)
