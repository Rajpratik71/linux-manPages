
opafmconfigcheck(8)                                                                         IFSFFCLIRG (Man Page)                                                                         opafmconfigcheck(8)



NAME
       opafmconfigcheck



       Parses and verifies the configuration file of a Fabric Manager (FM). Displays debugging and status information.

Syntax
       opafmconfigcheck [-s] [-c config_file] [-v] [-d] [-r reconfig_file]

Options
       --help    Produces full help text.


       -s        Enables strict check mode; validates multicast and VF settings. This option points out inconsistencies or invalid settings in VF and multicast configurations.


       -c config_file
                 Specifies configuration file.
                 Default is /etc/opa-fm/opafm.xml.


       -v        Displays debugging and status information.


       -d        Displays configuration checksum information.


       -r reconfig_file
                 Verifies that the reconfig_file is valid for dynamical reconfiguration.


Example
       opafmconfigcheck
       opafmconfigcheck -v
       opafmconfigcheck -sv



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                           opafmconfigcheck(8)
