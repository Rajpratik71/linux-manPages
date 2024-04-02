
opa_osd_exercise(1)                                                                         IFSFFCLIRG (Man Page)                                                                         opa_osd_exercise(1)



NAME
       opa_osd_exercise



       Performs stress test on SM and distributed SA query system.

Syntax
       opa_osd_exercise [-d | -s | -r | -x | -X | -D | -p | -S | -t | -e] guidlist

Options
       --help    Produces full help text.


       -d debug level
                 Sets debugging level.


       -s seconds
                 Specifies running for at least seconds seconds.

       -r remote Specifies the host running the fabric simulator.

       -x count  Number of destinations to toggle up or down after each pass.
                 Maximum = MAX_TOGGLES.

       -X count  Specifies how often to toggle a source port up or down
                 (in seconds).

       -D seconds
                 Specifies how long to sleep after each pass. This value gives the Subnet Manager time to process port events.

       -p pkey   Specifies to include pkey in the searches. Can be specified up to 8 times.

       -S sid    Specifies to include SID in the searches.

       -t error threshold
                 Cancels  the  test  if  the  number  of path errors to a single destination exceeds error threshold. The count is reset to zero when a correct result is retrieved. Can be specified up to 8
                 times. Note that providing both SIDs and pkeys may cause problems.

       -e        Instructs simulator to enable all ports before starting.

       guidlist  Text file that lists the source and destination GUIDs and LIDs. guidlist format is:



                 ·      lid_0;guid_0;node_desc_0

                 ·      lid_1;guid_1;node_desc_1

                 ·      and so on.



Example
       opa_osd_exercise -p 0x9001 guidtable



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                           opa_osd_exercise(1)
