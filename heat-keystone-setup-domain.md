HEAT-KEYSTONE-SETUP-DOMAIN(1)                                                                   openstack-heat                                                                  HEAT-KEYSTONE-SETUP-DOMAIN(1)



NAME
       heat-keystone-setup-domain - Script which sets up a keystone domain for heat users and projects

SYNOPSIS
       heat-keystone-setup-domain [OPTIONS]

DESCRIPTION
       The heat-keystone-setup-domain tool configures keystone by creating a 'stack user domain' and the user credential used to manage this domain.  A 'stack user domain' can be treated as a namespace for
       projects, groups and users created by heat.  The domain will have an admin user that manages other users, groups and projects in the domain.

       This script requires admin keystone credentials to be available in the shell environment by setting OS_USERNAME and OS_PASSWORD.

       After running this script, a user needs to take actions to check or modify the heat configuration file (e.g. /etc/heat/heat.conf).  The tool is NOT performing these updates on behalf of the user.

       Distributions may provide other tools to setup 'stack user domain' for use with heat, so check the distro documentation first.  Other tools are available to set up the 'stack user domain', for exam‐
       ple python-openstackclient, which is preferred to this tool where it is available.

OPTIONS
       -h, --help
              Print usage information.

       --config-dir <DIR>
              Path  to  a  config  directory from which to read the heat.conf file(s).  This file set is sorted, so as to provide a predictable parse order if individual options are over-ridden. The set is
              parsed after the file(s) specified via previous --config-file, arguments hence over-ridden options in the directory take precedence.

       --config-file <PATH>
              Path to a config file to use. Multiple config files can be specified, with values in later files taking precedence. The default files used is /etc/heat/heat.conf.

       --stack-domain-admin <USERNAME>
              Name of a user for Keystone to create, which has roles sufficient to manage users (i.e. stack domain users) and projects (i.e. stack domain projects) in the 'stack user domain'.

              Another way to specify the admin user name is by setting an environment variable STACK_DOMAIN_ADMIN before running this tool.  If both command line  arguments  and  environment  variable  are
              specified, the command line arguments take precedence.

       --stack-domain-admin-password <PASSWORD>
              Password for the 'stack-domain-admin' user.

              The  password can be instead specified using an environment variable STACK_DOMAIN_ADMIN_PASSWORD before invoking this tool.  If both command line arguments and environment variable are speci‐
              fied, the command line arguments take precedence.

       --stack-user-domain-name <DOMAIN>
              Name of domain to create for stack users.

              The domain name can be instead specified using an environment variable STACK_USER_DOMAIN_NAME before invoking this tool.  If both command line arguments and environment  variable  are  speci‐
              fied, the command line argument take precedence.

       --version
              Show program's version number and exit. The output could be empty if the distribution didn't specify any version information.

EXAMPLES
          heat-keystone-setup-domain

          heat-keystone-setup-domain --stack-user-domain-name heat_user_domain
                 --stack-domain-admin heat_domain_admin --stack-domain-admin-password verysecrete

BUGS
       Heat bugs are managed through StoryBoard OpenStack Heat Stories

AUTHOR
       Heat Developers

COPYRIGHT
       (c) 2012- Heat Developers




                                                                                                 Apr 10, 2019                                                                   HEAT-KEYSTONE-SETUP-DOMAIN(1)
