HEAT-ENGINE(1)                                                                                  openstack-heat                                                                                 HEAT-ENGINE(1)



NAME
       heat-engine - Service which performs the actions from the API calls made by the user

SYNOPSIS
       heat-engine [options]

DESCRIPTION
       heat-engine is the heat project server with an internal RPC api called by the heat-api server.

INVENTORY
       The heat-engine does all the orchestration work and is the layer in which the resource integration is implemented.

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




                                                                                                 Apr 10, 2019                                                                                  HEAT-ENGINE(1)
