
opaxlattopology(8)                                                                          IFSFFCLIRG (Man Page)                                                                          opaxlattopology(8)



NAME
       opaxlattopology



       Generates  a topology XML file of a cluster using your customized <topologyfile>.csv, linksum_swd06.csv, and linksum_swd24.csv as input. The output topology XML file can be used to bring up and ver‐
       ify the cluster.

       NOTE: The <topologyfile>.csv input file must be present in the same directory from which the script operates, but the linksum CSV files are read from the /usr/share/opa/samples directory.


Syntax
       opaxlattopology [-d level] [-v level] [-i level] [-K] [-s hfi_suffix]
       [source [dest]]

Options
       --help    Produces full help text.


       -d level  Specifies the output detail level. Default is 0. Levels are additive.


                 By default, the top level is always produced. Switch, rack, and rack group topology files can be added to the output by choosing the appropriate level. If the output at the group  or  rack
                 level  is  specified,  then  group or rack names must be provided in the spreadsheet. Detailed output can be specified in any combination. A directory for each topology XML file is created
                 hierarchically, with group directories (if specified) at the highest level, followed by rack and switch directories (if specified).



                 1         Intel(R) Omni-Path Edge Switch 100 Series topology files.





                 2         Rack topology files.





                 4         Rack group topology files.



       -v level  Specifies the verbose level. Range is 0 - 8. Default is 2.




                 0         No output.





                 1         Progress output.





                 2         Reserved.





                 4         Time stamps.





                 8         Reserved.



       -i level  Specifies the output indent level. Default is 4.


       -K        Specifies DO NOT clean temporary files.


                 Prevents temporary files in each topology directory from being removed. Temporary files contain CSV formatted lists of links, HFIs, and switches used to create a topology XML file.  Tempo‐
                 rary  files  are  not typically needed after a topology file is created, however they are used for creating linksum_swd06.csv and linksum_swd24.csv files, or can be retained for subsequent
                 inspection or processing.

       -s hfi_suffix
                 Used on Multi-Rail or Multi-Plane fabrics. Can be used to override the default hfi1_0.


                 For Multi-Plane fabric, use the tool multiple times with a different hfi-suffix.

                 For Multi-Rail fabric, specify HostName as "HostName HfiName" in the spreadsheet.

       -o report Specifies the report type for output. By default, all the sections are generated.


                 Report Types:



                 brnodes   Creates the <Node> section xml for the csv input.





                 links     Creates the <LinkSummary> section xml for the csv input.



       source    Specifies the source csv file. Default is topology.csv.


       dest      Specifies the output xml file. Default is topology.0:0.xml


                 The default output file name may vary if used with -s option. It can also be used to specify destination folder.

Description
       The opaxlattopology script reads your customized <topologyfile>.csv file from the local directory, and reads the other files  from  /usr/share/opa/samples/linksum_swd06.csv  and  /usr/share/opa/sam‐
       ples/linksum_swd24.csv.  Two  sample  topology  XLSX  files,  detailed_topology.xlsx  and minimal_topology.xlsx, are located in the /usr/share/opa/samples/ directory. You must create your <topology‐
       file>.csv file by editing one of the sample spreadsheets and saving the Fabric Links tab as a CSV file. Inspect your <topologyfile>.csv file to ensure that each row contains  the  correct  and  same
       number of comma separators. Any extraneous entries in the spreadsheet can cause the CSV output to have extra fields.

       The script outputs one or more topology files starting with topology.0:0.xml. Your <topologyfile>.csv input file must be present in the same directory from which the script operates, but the linksum
       CSV files are read from the /usr/share/opa/samples directory.

Example
       opaxlattopology
       # reads default input 'topology.csv' and creates default
       # output 'topology.0:0.xml'

       opaxlattopology fabric_2.csv
       # reads input 'fabric_2.csv' and creates default output

       Both sample files contain examples of links between HFI and Edge SW (rows 4-7), HFI and Core SW (rows 8-11), and Edge SW and Core SW (rows 12-15).

Environment Variables
       The following environment variables allow user-specified MTU.

       MTU_SW_SW If set, it overrides default MTU on switch-to-switch links. Default is 10240


       MTU_SW_HFI
                 If set, it overrides default MTU on switch-to-HFI links. Default is 10240


Creating linksum Files
       The linksum_swd06.csv and linksum_swd24.csv files are provided as stand-alone files in the /usr/share/opa/samples directory. However, they can be recreated (or modified)  from  the  spreadsheet,  if
       needed, by performing the following steps:


       1)  Save each of the following from your custom <topologyfile>.xlsx file as individual .csv files:

       ·   Internal SWD06 Links tab as linksum_swd06.csv

       ·   Internal SWD24 Links tab as linksum_swd24.csv

       ·   Fabric Links tab as <topologyfile>.csv


       2)  For each saved <topologyfile>.csv file, run the script with the -K option.


       3)  Upon completion of the script, save the top level linksum.csv file as linksum_swd06.csv or linksum_swd24.csv as appropriate.


Multi-Rail and Multi-Plane Fabrics
       By default, the opaxlattopology script considers all of the hosts to have a single HFI (hfi1_0).

       For Multi-Rail/Multi-Plane fabrics, you have the following options:

       ·      For  Multi-Rail  fabrics or for a Single Plane fabric with some multi-ported hosts, you can edit the Host Name in your customized <topologyfile>.csv file to include the HFI Name (for example:
              HostName HfiName) and then follow the standard procedure to generate <topologyfile>.xml.

       ·      For a Multi-Plane fabric with identical planes, the tool can be run multiple times on the same <topologyfile>.csv with different -s hfi_suffix options.  For example, if there are two  identi‐
              cal fabrics (fabric_1 and fabric_2) connected to a single host with two HFIs (hfi1_0 and hfi1_1), the tool can be run twice like this:


       ·      For fabric_1:

              opaxlattopology <topologyfile>.csv <topologyfile>.xml




       ·      For fabric_2:

              opaxlattopology -s hfi1_1 <topologyfile>.csv <topologyfile>.xml





       ·      For a fabric with both Multi-Rail and Multi-Plane segments, you can use a combination of the above techniques to generate the desired <topologyfile>.xml file.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                            opaxlattopology(8)
