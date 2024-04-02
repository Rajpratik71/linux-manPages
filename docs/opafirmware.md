
opafirmware(8)                                                                              IFSFFCLIRG (Man Page)                                                                              opafirmware(8)



NAME
       opafirmware



       Returns firmware information.

Syntax
       opafirmware [--showVersion | --showType] [ firmwareFile]

Options
       --help    Produces full help text.


       --showVersion
                 Specifies the version of the firmware file.


       --showType
                 Specifies the type of the firmware file.


       firmwareFile
                 Specifies the firmware filename.


Examples
       # opafirmware --showVersion STL1.q7.10.0.0.0.spkg
       10.0.0.0
       # opafirmware --showType STL1.q7.10.0.0.0.spkg
       Omni_Path_Switch_Products.q7



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                opafirmware(8)
