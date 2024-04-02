IASECC-TOOL(1)                                                                                   OpenSC Tools                                                                                  IASECC-TOOL(1)



NAME
       iasecc-tool - displays information about IAS/ECC card

SYNOPSIS
       iasecc-tool [OPTIONS]

DESCRIPTION
       The iasecc-tool utility is used to display information about IAS/ECC v1.0.1 smart cards.

OPTIONS
       --reader number,
           Specify the reader number number to use. The default is reader 0.

       --list-applications,
           Get list of the on-card applications.

       --aid hex-aid,
           Select hex-aid before processing.

       --list-sdos sdo-type,
           List SDOs of the given sdo-type, present in default or selected application.

       --verbose, -v
           Causes cardos-tool to be more verbose. Specify this flag several times to enable debug output in the opensc library.

       --wait, -w
           Causes iasecc-tool to wait for the token to be inserted into reader.



opensc                                                                                            10/08/2014                                                                                   IASECC-TOOL(1)
