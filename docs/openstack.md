OPENSTACK(1)                                                                                python-openstackclient                                                                               OPENSTACK(1)



NAME
       openstack - OpenStack Command Line Client

       OpenStack Command Line

SYNOPSIS
       openstack [<global-options>] <command> [<command-arguments>]

       openstack help <command>

       openstack --help

DESCRIPTION
       openstack  provides  a common command-line interface to OpenStack APIs.  It is generally equivalent to the CLIs provided by the OpenStack project client libraries, but with a distinct and consistent
       command structure.

AUTHENTICATION METHODS
       openstack uses a similar authentication scheme as the OpenStack project CLIs, with the credential information supplied either as environment variables or as options on the command line.  The primary
       difference is the use of 'project' in the name of the options OS_PROJECT_NAME/OS_PROJECT_ID over the old tenant-based names.

          export OS_AUTH_URL=<url-to-openstack-identity>
          export OS_PROJECT_NAME=<project-name>
          export OS_USERNAME=<user-name>
          export OS_PASSWORD=<password>  # (optional)

       openstack can use different types of authentication plugins provided by the keystoneclient library. The following default plugins are available:

       · token: Authentication with a token

       · password: Authentication with a username and a password

       Refer  to  the keystoneclient library documentation for more details about these plugins and their options, and for a complete list of available plugins.  Please bear in mind that some plugins might
       not support all of the functionalities of openstack; for example the v3unscopedsaml plugin can deliver only unscoped tokens, some commands might not be available through this authentication method.

       Additionally, it is possible to use Keystone's service token to authenticate, by setting the options --os-token and --os-url (or the environment variables OS_TOKEN  and  OS_URL  respectively).  This
       method takes precedence over authentication plugins.

       NOTE:
          To use the v3unscopedsaml method, the lxml package will need to be installed.

OPTIONS
       openstack takes global options that control overall behaviour and command-specific options that control the command operation.  Most global options have a corresponding environment variable that may
       also be used to set the value. If both are present, the command-line option takes priority. The environment variable names are derived from the option name by dropping  the  leading  dashes  ('--'),
       converting each embedded dash ('-') to an underscore ('_'), and converting to upper case.

       openstack recognizes the following global options:

       --os-cloud <cloud-name>
              openstack will look for a clouds.yaml file that contains a cloud configuration to use for authentication.  See CLOUD CONFIGURATION below for more information.

       --os-auth-type <auth-type>
              The authentication plugin type to use when connecting to the Identity service.

              If this option is not set, openstack will attempt to guess the authentication method to use based on the other options.

              If this option is set, its version must match --os-identity-api-version

       --os-auth-url <auth-url>
              Authentication URL

       --os-url <service-url>
              Service URL, when using a service token for authentication

       --os-domain-name <auth-domain-name>
              Domain-level authorization scope (by name)

       --os-domain-id <auth-domain-id>
              Domain-level authorization scope (by ID)

       --os-project-name <auth-project-name>
              Project-level authentication scope (by name)

       --os-project-id <auth-project-id>
              Project-level authentication scope (by ID)

       --os-project-domain-name <auth-project-domain-name>
              Domain name containing project

       --os-project-domain-id <auth-project-domain-id>
              Domain ID containing project

       --os-username <auth-username>
              Authentication username

       --os-password <auth-password>
              Authentication password

       --os-token <token>
              Authenticated token or service token

       --os-user-domain-name <auth-user-domain-name>
              Domain name containing user

       --os-user-domain-id <auth-user-domain-id>
              Domain ID containing user

       --os-trust-id <trust-id>
              ID of the trust to use as a trustee user

       --os-default-domain <auth-domain>
              Default domain ID (Default: 'default')

       --os-region-name <auth-region-name>
              Authentication region name

       --os-cacert <ca-bundle-file>
              CA certificate bundle file

       --verify` | :option:`--insecure
              Verify or ignore server certificate (default: verify)

       --os-cert <certificate-file>
              Client certificate bundle file

       --os-key <key-file>
              Client certificate key file

       --os-identity-api-version <identity-api-version>
              Identity API version (Default: 2.0)

       --os-XXXX-api-version <XXXX-api-version>
              Additional API version options will be available depending on the installed API libraries.

       --os-interface <interface>
              Interface type. Valid options are public, admin and internal.

       NOTE:
          If you switch to openstackclient from project specified clients, like: novaclient, neutronclient and so on, please use --os-interface instead of --os-endpoint-type.

       --os-profile <hmac-key>
              Performance profiling HMAC key for encrypting context data

              This key should be the value of one of the HMAC keys defined in the configuration files of OpenStack services to be traced.

       --os-beta-command
              Enable beta commands which are subject to change

       --log-file <LOGFILE>
              Specify a file to log output. Disabled by default.

       -v, --verbose
              Increase verbosity of output. Can be repeated.

       -q, --quiet
              Suppress output except warnings and errors

       --debug
              Show tracebacks on errors and set verbosity to debug

       --help Show help message and exit

COMMANDS
       To get a list of the available commands:

          openstack --help

       To get a description of a specific command:

          openstack help <command>

       Note that the set of commands shown will vary depending on the API versions that are in effect at that time.  For example, to force the display of the Identity v3 commands:

          openstack --os-identity-api-version 3 --help

       complete
              Print the bash completion functions for the current command set.

       help <command>
              Print help for an individual command

       Additional information on the OpenStackClient command structure and arguments is available in the OpenStackClient Commands wiki page.

   Command Objects
       The  list  of  command objects is growing longer with the addition of OpenStack project support.  The object names may consist of multiple words to compose a unique name.  Occasionally when multiple
       APIs have a common name with common overlapping purposes there will be options to select which object to use, or the API resources will be merged, as in the quota object that has  options  referring
       to both Compute and Block Storage quotas.

   Command Actions
       The actions used by OpenStackClient are defined with specific meaning to provide a consistent behavior for each object.  Some actions have logical opposite actions, and those pairs will always match
       for any object that uses them.

CLOUD CONFIGURATION
       Working with multiple clouds can be simplified by keeping the configuration information for those clouds in a local file.  openstack supports using a clouds.yaml configuration file.

   Config Files
       openstack will look for a file called clouds.yaml in the following locations:

       · Current Directory

       · ~/.config/openstack

       · /etc/openstack

       The first file found wins.

       The keys match the openstack global options but without the --os- prefix:

          clouds:
            devstack:
              auth:
                auth_url: http://192.168.122.10:35357/
                project_name: demo
                username: demo
                password: 0penstack
              region_name: RegionOne
            ds-admin:
              auth:
                auth_url: http://192.168.122.10:35357/
                project_name: admin
                username: admin
                password: 0penstack
              region_name: RegionOne
            infra:
              cloud: rackspace
              auth:
                project_id: 275610
                username: openstack
                password: xyzpdq!lazydog
              region_name: DFW,ORD,IAD

       In the above example, the auth_url for the rackspace cloud is taken from clouds-public.yaml:

          public-clouds:
            rackspace:
              auth:
                auth_url: 'https://identity.api.rackspacecloud.com/v2.0/'

   Authentication Settings
       OpenStackClient uses the Keystone authentication plugins so the required auth settings are not always known until the authentication type is selected.  openstack will attempt to detect a  couple  of
       common  auth  types  based  on  the  arguments passed in or found in the configuration file, but if those are incomplete it may be impossible to know which auth type is intended.  The --os-auth-type
       option can always be used to force a specific type.

       When --os-token and --os-url are both present the token_endpoint auth type is selected automatically.  If --os-auth-url and --os-username are present password auth type is selected.

   Logging Settings
       openstack can record the operation history by logging settings in configuration file. Recording the user operation, it can identify the change of the resource and it becomes useful  information  for
       troubleshooting.

       See configuration about Logging Settings for more details.

NOTES
       The command list displayed in help output reflects the API versions selected.  For example, to see Identity v3 commands OS_IDENTITY_API_VERSION must be set to 3.

EXAMPLES
       Show the detailed information for server appweb01:

          openstack \
              --os-project-name ExampleCo \
              --os-username demo --os-password secret \
              --os-auth-url http://localhost:5000:/v2.0 \
              server show appweb01

       The same command if the auth environment variables (OS_AUTH_URL, OS_PROJECT_NAME, OS_USERNAME, OS_PASSWORD) are set:

          openstack server show appweb01

       Create a new image:

          openstack image create \
              --disk-format=qcow2 \
              --container-format=bare \
              --public \
              --copy-from http://somewhere.net/foo.img \
              foo

FILES
       ~/.config/openstack/clouds.yaml
              Configuration file used by the --os-cloud global option.

       ~/.config/openstack/clouds-public.yaml
              Configuration file containing public cloud provider information such as authentication URLs and service definitions.  The contents of this file should be public and sharable.  clouds.yaml may
              contain references to clouds defined here as shortcuts.

       ~/.openstack
              Placeholder for future local state directory.  This directory is intended to be shared among multiple OpenStack-related applications; contents are namespaced with an identifier  for  the  app
              that owns it.  Shared contents (such as ~/.openstack/cache) have no prefix and the contents must be portable.

ENVIRONMENT VARIABLES
       The following environment variables can be set to alter the behaviour of openstack.  Most of them have corresponding command-line options that take precedence if set.

       OS_CLOUD
              The name of a cloud configuration in clouds.yaml.

       OS_AUTH_PLUGIN
              The authentication plugin to use when connecting to the Identity service, its version must match the Identity API version

       OS_AUTH_URL
              Authentication URL

       OS_URL Service URL (when using the service token)

       OS_DOMAIN_NAME
              Domain-level authorization scope (name or ID)

       OS_PROJECT_NAME
              Project-level authentication scope (name or ID)

       OS_PROJECT_DOMAIN_NAME
              Domain name or ID containing project

       OS_USERNAME
              Authentication username

       OS_TOKEN
              Authenticated or service token

       OS_PASSWORD
              Authentication password

       OS_USER_DOMAIN_NAME
              Domain name or ID containing user

       OS_TRUST_ID
              ID of the trust to use as a trustee user

       OS_DEFAULT_DOMAIN
              Default domain ID (Default: 'default')

       OS_REGION_NAME
              Authentication region name

       OS_CACERT
              CA certificate bundle file

       OS_CERT
              Client certificate bundle file

       OS_KEY Client certificate key file

       OS_IDENTITY_API_VERSION
              Identity API version (Default: 2.0)

       OS_XXXX_API_VERSION
              Additional API version options will be available depending on the installed API libraries.

       OS_INTERFACE
              Interface type. Valid options are public, admin and internal.

       NOTE:
          If you switch to openstackclient from project specified clients, like: novaclient, neutronclient and so on, please use OS_INTERFACE instead of OS_ENDPOINT_TYPE.

BUGS
       Bug reports are accepted at the python-openstackclient StoryBoard project "https://storyboard.openstack.org/#!/project/975".

AUTHORS
       Please refer to the AUTHORS file distributed with OpenStackClient.

COPYRIGHT
       Copyright 2011-2014 OpenStack Foundation and the authors listed in the AUTHORS file.

LICENSE
       http://www.apache.org/licenses/LICENSE-2.0

SEE ALSO
       The OpenStackClient page in the OpenStack Docs contains further documentation.

       The individual OpenStack project CLIs, the OpenStack API references.

AUTHOR
       OpenStack contributors

COPYRIGHT
       2012-2013 OpenStack Foundation




3.18.0                                                                                           Mar 12, 2019                                                                                    OPENSTACK(1)
