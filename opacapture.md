
opacapture(1)                                                                               IFSFFCLIRG (Man Page)                                                                               opacapture(1)



NAME
       opacapture



       (Host)  Captures  critical system information into a zipped tar file. The resulting tar file should be sent to Customer Support along with any Intel(R) Omni-Path Fabric problem report regarding this
       system.

       NOTE: The resulting host capture file can require significant amounts of space on the host. The actual size varies, but sizes can be multiple megabytes. Intel recommends ensuring that adequate  disk
       space is available on the host system.



Syntax
       opacapture [-d detail] output_tgz_file

Options
       --help    Produces full help text.


       -d detail Captures level of detail:



                 1 (Local) Obtains local information from host. This is the default if no options are entered.





                 2 (Fabric)
                           In addition to Local, also obtains basic fabric information by queries to the SM and fabric error analysis using opareport.





                 3 (Fabric+FDB)
                           In addition to Fabric, also obtains the Forwarding Database (FDB), which includes the switch forwarding tables from the SM and the server multicast membership.





                 4 (Analysis)
                           In addition to Fabric+FDB, also obtains opaallanalysis results. If opaallanalysis has not yet been run, it is run as part of the capture.







       NOTE:  Detail levels 2 - 4 can be used when fabric operational problems occur. If the problem is node-specific, detail level 1 should be sufficient. Detail levels 2 - 4 require an operational Fabric
       Manager. Typically your support representative requests a given detail level. If a given detail level takes excessively long or fails to be gathered, try a lower detail level.


       For detail levels 2 - 4, the additional information is only available on a node with Intel(R) Omni-Path Fabric Suite FastFabric Toolset installed. The information is gathered for every fabric speci‐
       fied in the /etc/opa/ports file.


       output_tgz_file
                 Specifies  the name of a file to be created by opacapture. The file name specified is overwritten if it already exists. Intel recommends using the .tgz suffix in the file name supplied. If
                 the filename given does not have a .tgz suffix, the .tgz suffix is added.


Examples
       opacapture mycapture.tgz
       opacapture -d 3 030127capture.tgz



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                 opacapture(1)
