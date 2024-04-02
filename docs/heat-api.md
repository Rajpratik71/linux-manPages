HEAT-API(1)                                                                                     openstack-heat                                                                                    HEAT-API(1)



NAME
       heat-api - REST API service to the heat project.

SYNOPSIS
       heat-api [options]

DESCRIPTION
       heat-api provides an external REST API to the heat project.

INVENTORY
       heat-api is a service that exposes an external REST based api to the heat-engine service. The communication between the heat-api and heat-engine uses message queue based RPC.

OPTIONS
       --config-file
              Path to a config file to use. Multiple config files can be specified, with values in later files taking precedence.

       --config-dir
              Path  to  a  config  directory to pull .conf files from. This file set is sorted, so as to provide a predictable parse order if individual options are over-ridden. The set is parsed after the
              file(s), if any, specified via --config-file, hence over-ridden options in the directory take precedence.

       --version
              Show program's version number and exit. The output could be empty if the distribution didn't specify any version information.

FILES
       · /etc/heat/heat.conf

AUTHOR
       Heat Developers

COPYRIGHT
       (c) 2012- Heat Developers




                                                                                                 Apr 10, 2019                                                                                     HEAT-API(1)
