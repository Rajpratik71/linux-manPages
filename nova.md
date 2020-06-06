NOVA(1)                                                                                       python-novaclient                                                                                       NOVA(1)



NAME
       nova - OpenStack Nova command line client

       The nova client is the command-line interface (CLI) for the Compute service (nova) API and its extensions.

       For help on a specific nova command, enter:

          $ nova help COMMAND

       NOTE:
          Over  time,  command  line functionality will be phased out of the nova CLI and into the openstack CLI. Using the openstack client where possible is preferred but there is not full parity yet for
          all of the nova commands.  For information on using the openstack CLI, see OpenStackClient.

NOVA USAGE
          usage: nova [--version] [--debug] [--os-cache] [--timings]
                      [--os-region-name <region-name>] [--service-type <service-type>]
                      [--service-name <service-name>]
                      [--os-endpoint-type <endpoint-type>]
                      [--os-compute-api-version <compute-api-ver>]
                      [--os-endpoint-override <bypass-url>] [--profile HMAC_KEY]
                      [--insecure] [--os-cacert <ca-certificate>]
                      [--os-cert <certificate>] [--os-key <key>] [--timeout <seconds>]
                      [--collect-timing] [--os-auth-type <name>]
                      [--os-auth-url OS_AUTH_URL] [--os-system-scope OS_SYSTEM_SCOPE]
                      [--os-domain-id OS_DOMAIN_ID] [--os-domain-name OS_DOMAIN_NAME]
                      [--os-project-id OS_PROJECT_ID]
                      [--os-project-name OS_PROJECT_NAME]
                      [--os-project-domain-id OS_PROJECT_DOMAIN_ID]
                      [--os-project-domain-name OS_PROJECT_DOMAIN_NAME]
                      [--os-trust-id OS_TRUST_ID]
                      [--os-default-domain-id OS_DEFAULT_DOMAIN_ID]
                      [--os-default-domain-name OS_DEFAULT_DOMAIN_NAME]
                      [--os-user-id OS_USER_ID] [--os-username OS_USERNAME]
                      [--os-user-domain-id OS_USER_DOMAIN_ID]
                      [--os-user-domain-name OS_USER_DOMAIN_NAME]
                      [--os-password OS_PASSWORD]
                      <subcommand> ...

       Subcommands:

       add-fixed-ip
              DEPRECATED Add new IP address on a network to server.

       add-secgroup
              Add a Security Group to a server.

       agent-create
              Create new agent build.

       agent-delete
              Delete existing agent build.

       agent-list
              List all builds.

       agent-modify
              Modify existing agent build.

       aggregate-add-host
              Add the host to the specified aggregate.

       aggregate-create
              Create a new aggregate with the specified details.

       aggregate-delete
              Delete the aggregate.

       aggregate-list
              Print a list of all aggregates.

       aggregate-remove-host
              Remove the specified host from the specified aggregate.

       aggregate-set-metadata
              Update the metadata associated with the aggregate.

       aggregate-show
              Show details of the specified aggregate.

       aggregate-update
              Update the aggregate's name and optionally availability zone.

       availability-zone-list
              List all the availability zones.

       backup Backup a server by creating a 'backup' type snapshot.

       boot   Boot a new server.

       cell-capacities
              Get cell capacities for all cells or a given cell.

       cell-show
              Show details of a given cell.

       clear-password
              Clear the admin password for a server from the metadata server. This action does not actually change the instance server password.

       cloudpipe-configure
              DEPRECATED Update the VPN IP/port of a cloudpipe instance.

       cloudpipe-create
              DEPRECATED Create a cloudpipe instance for the given project.

       cloudpipe-list
              DEPRECATED Print a list of all cloudpipe instances.

       console-log
              Get console log output of a server.

       delete Immediately shut down and delete specified server(s).

       diagnostics
              Retrieve server diagnostics.

       evacuate
              Evacuate server from failed host.

       flavor-access-add
              Add flavor access for the given tenant.

       flavor-access-list
              Print access information about the given flavor.

       flavor-access-remove
              Remove flavor access for the given tenant.

       flavor-create
              Create a new flavor.

       flavor-delete
              Delete a specific flavor

       flavor-key
              Set or unset extra_spec for a flavor.

       flavor-list
              Print a list of available 'flavors' (sizes of servers).

       flavor-show
              Show details about the given flavor.

       flavor-update
              Update the description of an existing flavor.  (Supported by API versions '2.55' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       floating-ip-associate
              DEPRECATED Associate a floating IP address to a server.

       floating-ip-disassociate
              DEPRECATED Disassociate a floating IP address from a server.

       force-delete
              Force delete a server.

       get-mks-console
              Get an MKS console to a server. (Supported by API versions '2.8' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       get-password
              Get the admin password for a server. This operation calls the metadata service to query metadata information and does not read password information from the server itself.

       get-rdp-console
              Get a rdp console to a server.

       get-serial-console
              Get a serial console to a server.

       get-spice-console
              Get a spice console to a server.

       get-vnc-console
              Get a vnc console to a server.

       host-action
              DEPRECATED Perform a power action on a host.

       host-describe
              DEPRECATED Describe a specific host.

       host-evacuate
              Evacuate all instances from failed host.

       host-evacuate-live
              Live migrate all instances off the specified host to other available hosts.

       host-list
              DEPRECATED List all hosts by service.

       host-meta
              Set or Delete metadata on all instances of a host.

       host-servers-migrate
              Cold migrate all instances off the specified host to other available hosts.

       host-update
              DEPRECATED Update host settings.

       hypervisor-list
              List hypervisors. (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       hypervisor-servers
              List servers belonging to specific hypervisors.

       hypervisor-show
              Display the details of the specified hypervisor.

       hypervisor-stats
              Get hypervisor statistics over all compute nodes.

       hypervisor-uptime
              Display the uptime of the specified hypervisor.

       image-create
              Create a new image by taking a snapshot of a running server.

       instance-action
              Show an action.

       instance-action-list
              List actions on a server.

       instance-usage-audit-log
              List/Get server usage audits.

       interface-attach
              Attach a network interface to a server.

       interface-detach
              Detach a network interface from a server.

       interface-list
              List interfaces attached to a server.

       keypair-add
              Create a new key pair for use with servers.

       keypair-delete
              Delete keypair given by its name. (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       keypair-list
              Print a list of keypairs for a user (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       keypair-show
              Show details about the given keypair.  (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       limits Print rate and absolute limits.

       list   List servers.

       list-extensions
              List all the os-api extensions that are available.

       list-secgroup
              List Security Group(s) of a server.

       live-migration
              Migrate running server to a new machine.

       live-migration-abort
              Abort an on-going live migration. (Supported by API versions '2.24' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       live-migration-force-complete
              Force on-going live migration to complete.  (Supported by API versions '2.22' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       lock   Lock a server. A normal (non-admin) user will not be able to execute actions on a locked server.

       meta   Set or delete metadata on a server.

       migrate
              Migrate a server. The new host will be selected by the scheduler.

       migration-list
              Print a list of migrations.

       pause  Pause a server.

       quota-class-show
              List the quotas for a quota class.

       quota-class-update
              Update the quotas for a quota class.  (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       quota-defaults
              List the default quotas for a tenant.

       quota-delete
              Delete quota for a tenant/user so their quota will Revert back to default.

       quota-show
              List the quotas for a tenant/user.

       quota-update
              Update the quotas for a tenant/user.  (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       reboot Reboot a server.

       rebuild
              Shutdown, re-image, and re-boot a server.

       refresh-network
              Refresh server network information.

       remove-fixed-ip
              DEPRECATED Remove an IP address from a server.

       remove-secgroup
              Remove a Security Group from a server.

       rescue Reboots a server into rescue mode, which starts the machine from either the initial image or a specified image, attaching the current boot disk as secondary.

       reset-network
              Reset network of a server.

       reset-state
              Reset the state of a server.

       resize Resize a server.

       resize-confirm
              Confirm a previous resize.

       resize-revert
              Revert a previous resize (and return to the previous VM).

       restore
              Restore a soft-deleted server.

       resume Resume a server.

       server-group-create
              Create a new server group with the specified details.

       server-group-delete
              Delete specific server group(s).

       server-group-get
              Get a specific server group.

       server-group-list
              Print a list of all server groups.

       server-migration-list
              Get the migrations list of specified server.  (Supported by API versions '2.23' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       server-migration-show
              Get the migration of specified server.  (Supported by API versions '2.23' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       server-tag-add
              Add one or more tags to a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       server-tag-delete
              Delete one or more tags from a server.  (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       server-tag-delete-all
              Delete all tags from a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       server-tag-list
              Get list of tags from a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       server-tag-set
              Set list of tags to a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       service-delete
              Delete the service.

       service-disable
              Disable the service.

       service-enable
              Enable the service.

       service-force-down
              Force service to down. (Supported by API versions '2.11' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       service-list
              Show a list of all running services. Filter by host & binary.

       set-password
              Change the admin password for a server.

       shelve Shelve a server.

       shelve-offload
              Remove a shelved server from the compute node.

       show   Show details about the given server.

       ssh    SSH into a server.

       start  Start the server(s).

       stop   Stop the server(s).

       suspend
              Suspend a server.

       trigger-crash-dump
              Trigger crash dump in an instance. (Supported by API versions '2.17' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       unlock Unlock a server.

       unpause
              Unpause a server.

       unrescue
              Restart the server from normal boot disk again.

       unshelve
              Unshelve a server.

       update Update the name or the description for a server.

       usage  Show usage data for a single tenant.

       usage-list
              List usage data for all tenants.

       version-list
              List all API versions.

       virtual-interface-list
              DEPRECATED Show virtual interface info about the given server.

       volume-attach
              Attach a volume to a server.

       volume-attachments
              List all the volumes attached to a server.

       volume-detach
              Detach a volume from a server.

       volume-update
              Update the attachment on the server. Migrates the data from an attached volume to the specified available volume and swaps out the active attachment to the new volume.

       x509-create-cert
              DEPRECATED Create x509 cert for a user in tenant.

       x509-get-root-cert
              DEPRECATED Fetch the x509 root cert.

       bash-completion
              Prints all of the commands and options to stdout so that the nova.bash_completion script doesn't have to hard code them.

       help   Display help about this program or one of its subcommands.

NOVA OPTIONAL ARGUMENTS
       --version
              show program's version number and exit

       --debug
              Print debugging output.

       --os-cache
              Use the auth token cache. Defaults to False if env[OS_CACHE] is not set.

       --timings
              Print call timing info.

       --os-region-name <region-name>
              Defaults to env[OS_REGION_NAME].

       --service-type <service-type>
              Defaults to compute for most actions.

       --service-name <service-name>
              Defaults to env[NOVA_SERVICE_NAME].

       --os-endpoint-type <endpoint-type>
              Defaults to env[NOVA_ENDPOINT_TYPE], env[OS_ENDPOINT_TYPE] or publicURL.

       --os-compute-api-version <compute-api-ver>
              Accepts X, X.Y (where X is major and Y is minor part) or "X.latest", defaults to env[OS_COMPUTE_API_VERSION].

       --os-endpoint-override <bypass-url>
              Use this API endpoint instead of the Service Catalog. Defaults to env[OS_ENDPOINT_OVERRIDE].

       --profile HMAC_KEY
              HMAC key to use for encrypting context data for performance profiling of operation. This key should be the value of the HMAC key configured for the OSprofiler middleware in nova; it is speci‐
              fied in the Nova configuration file at "/etc/nova/nova.conf".  Without the key, profiling will not be triggered even if OSprofiler is enabled on the server side.

       --os-auth-type <name>, --os-auth-plugin <name>
              Authentication type to use

   nova add-secgroup
          usage: nova add-secgroup <server> <secgroup>

       Add a Security Group to a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <secgroup>
              Name or ID of Security Group.

   nova agent-create
          usage: nova agent-create <os> <architecture> <version> <url> <md5hash>
                                   <hypervisor>

       Create new agent build.

       Positional arguments:

       <os>   Type of OS.

       <architecture>
              Type of architecture.

       <version>
              Version.

       <url>  URL.

       <md5hash>
              MD5 hash.

       <hypervisor>
              Type of hypervisor.

   nova agent-delete
          usage: nova agent-delete <id>

       Delete existing agent build.

       Positional arguments:

       <id>   ID of the agent-build.

   nova agent-list
          usage: nova agent-list [--hypervisor <hypervisor>]

       List all builds.

       Optional arguments:

       --hypervisor <hypervisor>
              Type of hypervisor.

   nova agent-modify
          usage: nova agent-modify <id> <version> <url> <md5hash>

       Modify existing agent build.

       Positional arguments:

       <id>   ID of the agent-build.

       <version>
              Version.

       <url>  URL

       <md5hash>
              MD5 hash.

   nova aggregate-add-host
          usage: nova aggregate-add-host <aggregate> <host>

       Add the host to the specified aggregate.

       Positional arguments:

       <aggregate>
              Name or ID of aggregate.

       <host> The host to add to the aggregate.

   nova aggregate-create
          usage: nova aggregate-create <name> [<availability-zone>]

       Create a new aggregate with the specified details.

       Positional arguments:

       <name> Name of aggregate.

       <availability-zone>
              The availability zone of the aggregate (optional).

   nova aggregate-delete
          usage: nova aggregate-delete <aggregate>

       Delete the aggregate.

       Positional arguments:

       <aggregate>
              Name or ID of aggregate to delete.

   nova aggregate-list
          usage: nova aggregate-list

       Print a list of all aggregates.

   nova aggregate-remove-host
          usage: nova aggregate-remove-host <aggregate> <host>

       Remove the specified host from the specified aggregate.

       Positional arguments:

       <aggregate>
              Name or ID of aggregate.

       <host> The host to remove from the aggregate.

   nova aggregate-set-metadata
          usage: nova aggregate-set-metadata <aggregate> <key=value> [<key=value> ...]

       Update the metadata associated with the aggregate.

       Positional arguments:

       <aggregate>
              Name or ID of aggregate to update.

       <key=value>
              Metadata to add/update to aggregate. Specify only the key to delete a metadata item.

   nova aggregate-show
          usage: nova aggregate-show <aggregate>

       Show details of the specified aggregate.

       Positional arguments:

       <aggregate>
              Name or ID of aggregate.

   nova aggregate-update
          usage: nova aggregate-update [--name NAME]
                                       [--availability-zone <availability-zone>]
                                       <aggregate>

       Update the aggregate's name and optionally availability zone.

       Positional arguments:

       <aggregate>
              Name or ID of aggregate to update.

       Optional arguments:

       --name NAME
              New name for aggregate.

       --availability-zone <availability-zone>
              New availability zone for aggregate.

   nova availability-zone-list
          usage: nova availability-zone-list

       List all the availability zones.

   nova backup
          usage: nova backup <server> <name> <backup-type> <rotation>

       Backup a server by creating a 'backup' type snapshot.

       Positional arguments:

       <server>
              Name or ID of server.

       <name> Name of the backup image.

       <backup-type>
              The backup type, like "daily" or "weekly".

       <rotation>
              Int parameter representing how many backups to keep around.

   nova boot
          usage: nova boot [--flavor <flavor>] [--image <image>]
                           [--image-with <key=value>] [--boot-volume <volume_id>]
                           [--snapshot <snapshot_id>] [--min-count <number>]
                           [--max-count <number>] [--meta <key=value>]
                           [--key-name <key-name>] [--user-data <user-data>]
                           [--availability-zone <availability-zone>]
                           [--security-groups <security-groups>]
                           [--block-device-mapping <dev-name=mapping>]
                           [--block-device key1=value1[,key2=value2...]]
                           [--swap <swap_size>]
                           [--ephemeral size=<size>[,format=<format>]]
                           [--hint <key=value>]
                           [--nic <auto,none,net-id=net-uuid,net-name=network-name,port-id=port-uuid,v4-fixed-ip=ip-addr,v6-fixed-ip=ip-addr,tag=tag>]
                           [--config-drive <value>] [--poll] [--admin-pass <value>]
                           [--access-ip-v4 <value>] [--access-ip-v6 <value>]
                           [--description <description>] [--tags <tags>]
                           [--return-reservation-id]
                           [--trusted-image-certificate-id <trusted-image-certificate-id>]
                           <name>

       Boot a new server.

       In order to create a server with pre-existing ports that contain a resource_request value, such as for guaranteed minimum bandwidth quality of service support, microversion 2.72 is required.

       Positional arguments:

       <name> Name for the new server.

       Optional arguments:

       --flavor <flavor>
              Name or ID of flavor (see 'nova flavor-list').

       --image <image>
              Name or ID of image (see 'glance image-list').

       --image-with <key=value>
              Image metadata property (see 'glance image-show').

       --boot-volume <volume_id>
              Volume ID to boot from.

       --snapshot <snapshot_id>
              Snapshot ID to boot from (will create a volume).

       --min-count <number>
              Boot at least <number> servers (limited by quota).

       --max-count <number>
              Boot up to <number> servers (limited by quota).

       --meta <key=value>
              Record arbitrary key/value metadata to /meta_data.json on the metadata server. Can be specified multiple times.

       --key-name <key-name>
              Key name of keypair that should be created earlier with the command keypair-add.

       --user-data <user-data>
              user data file to pass to be exposed by the metadata server.

       --availability-zone <availability-zone>
              The availability zone for server placement.

       --security-groups <security-groups>
              Comma separated list of security group names.

       --block-device-mapping <dev-name=mapping>
              Block device mapping in the format <dev-name>=<id>:<type>:<size(GiB)>:<delete-on-terminate>.

       --block-device
              key1=value1[,key2=value2...]   Block device mapping with the keys: id=UUID (image_id, snapshot_id or volume_id only if using source image, snapshot or volume) source=source type (image, snap‐
              shot, volume or blank), dest=destination type of the block device (volume or local), bus=device's bus (e.g. uml, lxc, virtio, ...; if omitted, hypervisor driver chooses  a  suitable  default,
              honoured  only  if  device  type is supplied) type=device type (e.g. disk, cdrom, ...; defaults to 'disk') device=name of the device (e.g. vda, xda, ...; if omitted, hypervisor driver chooses
              suitable device depending on selected bus; note the libvirt driver always uses default device names), size=size of the block device in MiB(for swap) and in GiB(for other formats) (if omitted,
              hypervisor  driver  calculates  size),  format=device  will be formatted (e.g. swap, ntfs, ...; optional), bootindex=integer used for ordering the boot disks (for image backed instances it is
              equal to 0, for others need to be specified), shutdown=shutdown behaviour (either preserve or remove, for local destination set to remove), tag=device metadata tag (optional; supported by API
              versions  '2.42'  -  '2.latest'),  and volume_type=type of volume to create (either ID or name) when source is blank, image or snapshot and dest is volume (optional; supported by API versions
              '2.67' - '2.latest').

       --swap <swap_size>
              Create and attach a local swap block device of <swap_size> MiB.

       --ephemeral
              size=<size>[,format=<format>] Create and attach a local ephemeral block device of <size> GiB and format it to <format>.

       --hint <key=value>
              Send arbitrary key/value pairs to the scheduler for custom use.

       --nic <auto,none,net-id=net-uuid,net-name=network-name,port-id=port-uuid,v4-fixed-ip=ip-addr,v6-fixed-ip=ip-addr,tag=tag>
              Create a NIC on the server. Specify option multiple times to create multiple nics unless using the special 'auto' or 'none' values.  auto: automatically allocate network resources if none are
              available.  This  cannot  be specified with any other nic value and cannot be specified multiple times. none: do not attach a NIC at all. This cannot be specified with any other nic value and
              cannot be specified multiple times. net-id: attach NIC to network with a specific UUID. net-name: attach NIC to network with this name (either port-id or net-id or net-name must be provided),
              v4-fixed-ip:  IPv4  fixed  address  for  NIC  (optional), v6-fixed-ip: IPv6 fixed address for NIC (optional), port-id: attach NIC to port with this UUID tag: interface metadata tag (optional)
              (either port-id or net-id must be provided). (Supported by API versions '2.42' - '2.latest')

       --config-drive <value>
              Enable config drive.

       --poll Report the new server boot progress until it completes.

       --admin-pass <value>
              Admin password for the instance.

       --access-ip-v4 <value>
              Alternative access IPv4 of the instance.

       --access-ip-v6 <value>
              Alternative access IPv6 of the instance.

       --description <description>
              Description for the server. (Supported by API versions '2.19' - '2.latest')

       --tags <tags>
              Tags for the server.Tags must be separated by commas: --tags <tag1,tag2> (Supported by API versions '2.52' - '2.latest')

       --return-reservation-id
              Return a reservation id bound to created servers.

       --trusted-image-certificate-id <trusted-image-certificate-id>
              Trusted image certificate IDs used to validate certificates during the image signature verification process.  Defaults to env[OS_TRUSTED_IMAGE_CERTIFICATE_IDS].   May  be  specified  multiple
              times to pass multiple trusted image certificate IDs. (Supported by API versions '2.63' - '2.latest')

   nova cell-capacities
          usage: nova cell-capacities [--cell <cell-name>]

       Get cell capacities for all cells or a given cell.

       Optional arguments:

       --cell <cell-name>
              Name of the cell to get the capacities.

   nova cell-show
          usage: nova cell-show <cell-name>

       Show details of a given cell.

       Positional arguments:

       <cell-name>
              Name of the cell.

   nova clear-password
          usage: nova clear-password <server>

       Clear the admin password for a server from the metadata server. This action does not actually change the instance server password.

       Positional arguments:

       <server>
              Name or ID of server.

   nova console-log
          usage: nova console-log [--length <length>] <server>

       Get console log output of a server.

       Locale encoding issues

       If you encounter an error such as:

          UnicodeEncodeError: 'ascii' codec can't encode characters in position

       The solution to these problems is different depending on which locale your computer is running in.

       For instance, if you have a German Linux machine, you can fix the problem by exporting the locale to de_DE.utf-8:

          export LC_ALL=de_DE.utf-8
          export LANG=de_DE.utf-8

       If you are on a US machine, en_US.utf-8 is the encoding of choice. On some newer Linux systems, you could also try C.UTF-8 as the locale:

          export LC_ALL=C.UTF-8
          export LANG=C.UTF-8

       Positional arguments:

       <server>
              Name or ID of server.

       Optional arguments:

       --length <length>
              Length in lines to tail.

   nova delete
          usage: nova delete [--all-tenants] <server> [<server> ...]

       Immediately shut down and delete specified server(s).

       Positional arguments:

       <server>
              Name or ID of server(s).

       Optional arguments:

       --all-tenants
              Delete server(s) in another tenant by name (Admin only).

   nova diagnostics
          usage: nova diagnostics <server>

       Retrieve server diagnostics.

       Positional arguments:

       <server>
              Name or ID of server.

   nova evacuate
          usage: nova evacuate [--password <password>] [--force] <server> [<host>]

       Evacuate server from failed host.

       Positional arguments:

       <server>
              Name or ID of server.

       <host> Name or ID of the target host. If no host is specified, the scheduler will choose one.

       Optional arguments:

       --password <password>
              Set the provided admin password on the evacuated server. Not applicable if the server is on shared storage.

       --force
              Force an evacuation by not verifying the provided destination host by the scheduler. (Supported by API versions '2.29' - '2.67')

              WARNING:
                 This  could  result in failures to actually evacuate the server to the specified host. It is recommended to either not specify a host so that the scheduler will pick one, or specify a host
                 without --force.

   nova flavor-access-add
          usage: nova flavor-access-add <flavor> <tenant_id>

       Add flavor access for the given tenant.

       Positional arguments:

       <flavor>
              Flavor name or ID to add access for the given tenant.

       <tenant_id>
              Tenant ID to add flavor access for.

   nova flavor-access-list
          usage: nova flavor-access-list [--flavor <flavor>]

       Print access information about the given flavor.

       Optional arguments:

       --flavor <flavor>
              Filter results by flavor name or ID.

   nova flavor-access-remove
          usage: nova flavor-access-remove <flavor> <tenant_id>

       Remove flavor access for the given tenant.

       Positional arguments:

       <flavor>
              Flavor name or ID to remove access for the given tenant.

       <tenant_id>
              Tenant ID to remove flavor access for.

   nova flavor-create
          usage: nova flavor-create [--ephemeral <ephemeral>] [--swap <swap>]
                                    [--rxtx-factor <factor>] [--is-public <is-public>]
                                    [--description <description>]
                                    <name> <id> <ram> <disk> <vcpus>

       Create a new flavor.

       Positional arguments:

       <name> Unique name of the new flavor.

       <id>   Unique ID of the new flavor. Specifying 'auto' will generated a UUID for the ID.

       <ram>  Memory size in MiB.

       <disk> Disk size in GiB.

       <vcpus>
              Number of vcpus

       Optional arguments:

       --ephemeral <ephemeral>
              Ephemeral space size in GiB (default 0).

       --swap <swap>
              Swap space size in MiB (default 0).

       --rxtx-factor <factor>
              RX/TX factor (default 1).

       --is-public <is-public>
              Make flavor accessible to the public (default true).

       --description <description>
              A free form description of the flavor. Limited to 65535 characters in length. Only printable characters are allowed.  (Supported by API versions '2.55' - '2.latest')

   nova flavor-delete
          usage: nova flavor-delete <flavor>

       Delete a specific flavor

       Positional arguments:

       <flavor>
              Name or ID of the flavor to delete.

   nova flavor-key
          usage: nova flavor-key <flavor> <action> <key=value> [<key=value> ...]

       Set or unset extra_spec for a flavor.

       Positional arguments:

       <flavor>
              Name or ID of flavor.

       <action>
              Actions: 'set' or 'unset'.

       <key=value>
              Extra_specs to set/unset (only key is necessary on unset).

   nova flavor-list
          usage: nova flavor-list [--extra-specs] [--all] [--marker <marker>]
                                  [--min-disk <min-disk>] [--min-ram <min-ram>]
                                  [--limit <limit>] [--sort-key <sort-key>]
                                  [--sort-dir <sort-dir>]

       Print a list of available 'flavors' (sizes of servers).

       Optional arguments:

       --extra-specs
              Get extra-specs of each flavor.

       --all  Display all flavors (Admin only).

       --marker <marker>
              The last flavor ID of the previous page; displays list of flavors after "marker".

       --min-disk <min-disk>
              Filters the flavors by a minimum disk space, in GiB.

       --min-ram <min-ram>
              Filters the flavors by a minimum RAM, in MiB.

       --limit <limit>
              Maximum number of flavors to display. If limit is bigger than 'CONF.api.max_limit' option of Nova API, limit 'CONF.api.max_limit' will be used instead.

       --sort-key <sort-key>
              Flavors list sort key.

       --sort-dir <sort-dir>
              Flavors list sort direction.

   nova flavor-show
          usage: nova flavor-show <flavor>

       Show details about the given flavor.

       Positional arguments:

       <flavor>
              Name or ID of flavor.

   nova flavor-update
          usage: nova flavor-update <flavor> <description>

       Update the description of an existing flavor.  (Supported by API versions '2.55' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 10.0.0.


       Positional arguments

       <flavor>
              Name or ID of the flavor to update.

       <description>
              A free form description of the flavor. Limited to 65535 characters in length. Only printable characters are allowed.

   nova force-delete
          usage: nova force-delete <server>

       Force delete a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova get-mks-console
          usage: nova get-mks-console <server>

       Get an MKS console to a server. (Supported by API versions '2.8' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 3.0.0.


       Positional arguments:

       <server>
              Name or ID of server.

   nova get-password
          usage: nova get-password <server> [<private-key>]

       Get the admin password for a server. This operation calls the metadata service to query metadata information and does not read password information from the server itself.

       Positional arguments:

       <server>
              Name or ID of server.

       <private-key>
              Private key (used locally to decrypt password) (Optional).  When specified, the command displays the clear (decrypted) VM password. When not specified, the ciphered VM password is displayed.

   nova get-rdp-console
          usage: nova get-rdp-console <server> <console-type>

       Get a rdp console to a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <console-type>
              Type of rdp console ("rdp-html5").

   nova get-serial-console
          usage: nova get-serial-console [--console-type CONSOLE_TYPE] <server>

       Get a serial console to a server.

       Positional arguments:

       <server>
              Name or ID of server.

       Optional arguments:

       --console-type CONSOLE_TYPE
              Type of serial console, default="serial".

   nova get-spice-console
          usage: nova get-spice-console <server> <console-type>

       Get a spice console to a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <console-type>
              Type of spice console ("spice-html5").

   nova get-vnc-console
          usage: nova get-vnc-console <server> <console-type>

       Get a vnc console to a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <console-type>
              Type of vnc console ("novnc" or "xvpvnc").

   nova host-evacuate
          usage: nova host-evacuate [--target_host <target_host>] [--force] [--strict]
                                    <host>

       Evacuate all instances from failed host.

       Positional arguments:

       <host> The hypervisor hostname (or pattern) to search for.

              WARNING:
                 Use a fully qualified domain name if you only want to evacuate from a specific host.

       Optional arguments:

       --target_host <target_host>
              Name of target host. If no host is specified the scheduler will select a target.

       --force
              Force an evacuation by not verifying the provided destination host by the scheduler. (Supported by API versions '2.29' - '2.67')

              WARNING:
                 This could result in failures to actually evacuate the server to the specified host. It is recommended to either not specify a host so that the scheduler will pick one, or specify  a  host
                 without --force.

       --strict
              Evacuate host with exact hypervisor hostname match

   nova host-evacuate-live
          usage: nova host-evacuate-live [--target-host <target_host>] [--block-migrate]
                                         [--max-servers <max_servers>] [--force]
                                         [--strict]
                                         <host>

       Live migrate all instances off the specified host to other available hosts.

       Positional arguments:

       <host> Name of host.  The hypervisor hostname (or pattern) to search for.

              WARNING:
                 Use a fully qualified domain name if you only want to live migrate from a specific host.

       Optional arguments:

       --target-host <target_host>
              Name of target host. If no host is specified, the scheduler will choose one.

       --block-migrate
              Enable block migration. (Default=auto) (Supported by API versions '2.25' - '2.latest')

       --max-servers <max_servers>
              Maximum number of servers to live migrate simultaneously

       --force
              Force a live-migration by not verifying the provided destination host by the scheduler. (Supported by API versions '2.30' - '2.67')

              WARNING:
                 This  could  result in failures to actually live migrate the servers to the specified host. It is recommended to either not specify a host so that the scheduler will pick one, or specify a
                 host without --force.

       --strict
              live Evacuate host with exact hypervisor hostname match

   nova host-meta
          usage: nova host-meta [--strict] <host> <action> <key=value> [<key=value> ...]

       Set or Delete metadata on all instances of a host.

       Positional arguments:

       <host> The hypervisor hostname (or pattern) to search for.

              WARNING:
                 Use a fully qualified domain name if you only want to update metadata for servers on a specific host.

       <action>
              Actions: 'set' or 'delete'

       <key=value>
              Metadata to set or delete (only key is necessary on delete)

       Optional arguments:

       --strict
              Set host-meta to the hypervisor with exact hostname match

   nova host-servers-migrate
          usage: nova host-servers-migrate [--strict] <host>

       Cold migrate all instances off the specified host to other available hosts.

       Positional arguments:

       <host> Name of host.  The hypervisor hostname (or pattern) to search for.

              WARNING:
                 Use a fully qualified domain name if you only want to cold migrate from a specific host.

       Optional arguments:

       --strict
              Migrate host with exact hypervisor hostname match

   nova hypervisor-list
          usage: nova hypervisor-list [--matching <hostname>] [--marker <marker>]
                                      [--limit <limit>]

       List hypervisors. (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       Optional arguments:

       --matching <hostname>
              List hypervisors matching the given <hostname>. If matching is used limit and marker options will be ignored.

       --marker <marker>
              The last hypervisor of the previous page; displays list of hypervisors after "marker".

       --limit <limit>
              Maximum number of hypervisors to display. If limit is bigger than 'CONF.api.max_limit' option of Nova API, limit 'CONF.api.max_limit' will be used instead.

   nova hypervisor-servers
          usage: nova hypervisor-servers <hostname>

       List servers belonging to specific hypervisors.

       Positional arguments:

       <hostname>
              The hypervisor hostname (or pattern) to search for.

   nova hypervisor-show
          usage: nova hypervisor-show [--wrap <integer>] <hypervisor>

       Display the details of the specified hypervisor.

       Positional arguments:

       <hypervisor>
              Name or ID of the hypervisor.  Starting with microversion 2.53 the ID must be a UUID.

       Optional arguments:

       --wrap <integer>
              Wrap the output to a specified length. Default is 40 or 0 to disable

   nova hypervisor-stats
          usage: nova hypervisor-stats

       Get hypervisor statistics over all compute nodes.

   nova hypervisor-uptime
          usage: nova hypervisor-uptime <hypervisor>

       Display the uptime of the specified hypervisor.

       Positional arguments:

       <hypervisor>
              Name or ID of the hypervisor.  Starting with microversion 2.53 the ID must be a UUID.

   nova image-create
          usage: nova image-create [--metadata <key=value>] [--show] [--poll]
                                   <server> <name>

       Create a new image by taking a snapshot of a running server.

       Positional arguments:

       <server>
              Name or ID of server.

       <name> Name of snapshot.

       Optional arguments:

       --metadata <key=value>
              Record arbitrary key/value metadata to /meta_data.json on the metadata server. Can be specified multiple times.

       --show Print image info.

       --poll Report the snapshot progress and poll until image creation is complete.

   nova instance-action
          usage: nova instance-action <server> <request_id>

       Show an action.

       Positional arguments:

       <server>
              Name or UUID of the server to show actions for. Only UUID can be used to show actions for a deleted server. (Supported by API versions '2.21' - '2.latest')

       <request_id>
              Request ID of the action to get.

   nova instance-action-list
          usage: nova instance-action-list [--marker <marker>] [--limit <limit>]
                                           [--changes-since <changes_since>]
                                           [--changes-before <changes_before>]
                                           <server>

       List actions on a server.

       Positional arguments:

       <server>
              Name or UUID of the server to list actions for. Only UUID can be used to list actions on a deleted server. (Supported by API versions '2.21' - '2.latest')

       Optional arguments:

       --marker <marker>
              The last instance action of the previous page; displays list of actions after "marker". (Supported by API versions '2.58' - '2.latest')

       --limit <limit>
              Maximum number of instance actions to display. Note that there is a configurable max limit on the server, and the limit that is used will be the minimum of what is requested here and what  is
              configured in the server. (Supported by API versions '2.58' - '2.latest')

       --changes-since <changes_since>
              List  only  instance  actions changed later or equal to a certain point of time. The provided time should be an ISO 8061 formatted time.  e.g. 2016-03-04T06:27:59Z. (Supported by API versions
              '2.58' - '2.latest')

       --changes-before <changes_before>
              List only instance actions changed earlier or equal to a certain point of time. The provided time should be an ISO 8061 formatted time.  e.g. 2016-03-04T06:27:59Z. (Supported by API  versions
              '2.66' - '2.latest')

   nova instance-usage-audit-log
          usage: nova instance-usage-audit-log [--before <before>]

       List/Get server usage audits.

       Optional arguments:

       --before <before>
              Filters  the  response  by  the date and time before which to list usage audits.  The date and time stamp format is as follows: CCYY-MM-DD hh:mm:ss.NNNNNN ex 2015-08-27 09:49:58 or 2015-08-27
              09:49:58.123456.

   nova interface-attach
          usage: nova interface-attach [--port-id <port_id>] [--net-id <net_id>]
                                       [--fixed-ip <fixed_ip>] [--tag <tag>]
                                       <server>

       Attach a network interface to a server.

       Positional arguments:

       <server>
              Name or ID of server.

       Optional arguments:

       --port-id <port_id>
              Port ID.

       --net-id <net_id>
              Network ID

       --fixed-ip <fixed_ip>
              Requested fixed IP.

       --tag <tag>
              Tag for the attached interface.  (Supported by API versions '2.49' - '2.latest')

   nova interface-detach
          usage: nova interface-detach <server> <port_id>

       Detach a network interface from a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <port_id>
              Port ID.

   nova interface-list
          usage: nova interface-list <server>

       List interfaces attached to a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova keypair-add
          usage: nova keypair-add [--pub-key <pub-key>] [--key-type <key-type>]
                                  [--user <user-id>]
                                  <name>

       Create a new key pair for use with servers.

       Positional arguments:

       <name> Name of key.

       Optional arguments:

       --pub-key <pub-key>
              Path to a public ssh key.

       --key-type <key-type>
              Keypair type. Can be ssh or x509. (Supported by API versions '2.2' - '2.latest')

       --user <user-id>
              ID of user to whom to add key-pair (Admin only).  (Supported by API versions '2.10' - '2.latest')

   nova keypair-delete
          usage: nova keypair-delete [--user <user-id>] <name>

       Delete keypair given by its name. (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       Positional arguments:

       <name> Keypair name to delete.

       Optional arguments:

       --user <user-id>
              ID of key-pair owner (Admin only).

   nova keypair-list
          usage: nova keypair-list [--user <user-id>] [--marker <marker>]
                                   [--limit <limit>]

       Print a list of keypairs for a user (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       Optional arguments:

       --user <user-id>
              List key-pairs of specified user ID (Admin only).

       --marker <marker>
              The last keypair of the previous page; displays list of keypairs after "marker".

       --limit <limit>
              Maximum number of keypairs to display. If limit is bigger than 'CONF.api.max_limit' option of Nova API, limit 'CONF.api.max_limit' will be used instead.

   nova keypair-show
          usage: nova keypair-show [--user <user-id>] <keypair>

       Show details about the given keypair. (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       Positional arguments:

       <keypair>
              Name of keypair.

       Optional arguments:

       --user <user-id>
              ID of key-pair owner (Admin only).

   nova limits
          usage: nova limits [--tenant [<tenant>]] [--reserved]

       Print rate and absolute limits.

       Optional arguments:

       --tenant [<tenant>]
              Display information from single tenant (Admin only).

       --reserved
              Include reservations count.

   nova list
          usage: nova list [--reservation-id <reservation-id>] [--ip <ip-regexp>]
                           [--ip6 <ip6-regexp>] [--name <name-regexp>]
                           [--instance-name <name-regexp>] [--status <status>]
                           [--flavor <flavor>] [--image <image>] [--host <hostname>]
                           [--all-tenants [<0|1>]] [--tenant [<tenant>]]
                           [--user [<user>]] [--deleted] [--fields <fields>] [--minimal]
                           [--sort <key>[:<direction>]] [--marker <marker>]
                           [--limit <limit>] [--changes-since <changes_since>]
                           [--changes-before <changes_before>]
                           [--tags <tags>] [--tags-any <tags-any>]
                           [--not-tags <not-tags>] [--not-tags-any <not-tags-any>]

       List servers.

       Note that from microversion 2.69, during partial infrastructure failures in the deployment, the output of this command may return partial results for the servers present in the failure domain.

       Optional arguments:

       --reservation-id <reservation-id>
              Only return servers that match reservation-id.

       --ip <ip-regexp>
              Search with regular expression match by IP address.

       --ip6 <ip6-regexp>
              Search with regular expression match by IPv6 address.

       --name <name-regexp>
              Search with regular expression match by name.

       --instance-name <name-regexp>
              Search with regular expression match by server name.

       --status <status>
              Search by server status.

       --flavor <flavor>
              Search by flavor name or ID.

       --image <image>
              Search by image name or ID.

       --host <hostname>
              Search servers by hostname to which they are assigned (Admin only).

       --all-tenants [<0|1>]
              Display information from all tenants (Admin only).

       --tenant [<tenant>]
              Display information from single tenant (Admin only).

       --user [<user>]
              Display information from single user (Admin only).

       --deleted
              Only display deleted servers (Admin only).

       --fields <fields>
              Comma-separated list of fields to display. Use the show command to see which fields are available.

       --minimal
              Get only UUID and name.

       --sort <key>[:<direction>]
              Comma-separated list of sort keys and directions in the form of <key>[:<asc|desc>].  The direction defaults to descending if not specified.

       --marker <marker>
              The last server UUID of the previous page; displays list of servers after "marker".

       --limit <limit>
              Maximum number of servers to display. If limit == -1, all servers will be displayed. If limit is bigger than 'CONF.api.max_limit' option of Nova API, limit 'CONF.api.max_limit' will  be  used
              instead.

       --changes-since <changes_since>
              List only servers changed later or equal to a certain point of time. The provided time should be an ISO 8061 formatted time. e.g.  2016-03-04T06:27:59Z .

       --changes-before <changes_before>
              List only servers changed earlier or equal to a certain point of time. The provided time should be an ISO 8061 formatted time. e.g.  2016-03-05T06:27:59Z . (Supported by API versions '2.66' -
              '2.latest')

       --tags <tags>
              The given tags must all be present for a server to be included in the list result.  Boolean expression in this case is 't1 AND t2'. Tags must be separated by commas: --tags <tag1,tag2>  (Sup‐
              ported by API versions '2.26' - '2.latest')

       --tags-any <tags-any>
              If  one  of  the  given tags is present the server will be included in the list result. Boolean expression in this case is 't1 OR t2'. Tags must be separated by commas: --tags-any <tag1,tag2>
              (Supported by API versions '2.26' - '2.latest')

       --not-tags <not-tags>
              Only the servers that do not have any of the given tags will be included in the list results. Boolean expression in this case is 'NOT(t1 AND t2)'. Tags must be separated by commas: --not-tags
              <tag1,tag2> (Supported by API versions '2.26' - '2.latest')

       --not-tags-any <not-tags-any>
              Only  the  servers  that  do not have at least one of the given tags will be included in the list result. Boolean expression in this case is 'NOT(t1 OR t2)'. Tags must be separated by commas:
              --not-tags-any <tag1,tag2> (Supported by API versions '2.26' - '2.latest')

   nova list-extensions
          usage: nova list-extensions

       List all the os-api extensions that are available.

   nova list-secgroup
          usage: nova list-secgroup <server>

       List Security Group(s) of a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova live-migration
          usage: nova live-migration [--block-migrate] [--force] <server> [<host>]

       Migrate running server to a new machine.

       Positional arguments:

       <server>
              Name or ID of server.

       <host> Destination host name. If no host is specified, the scheduler will choose one.

       Optional arguments:

       --block-migrate
              True in case of block_migration.  (Default=auto:live_migration) (Supported by API versions '2.25' - '2.latest')

       --force
              Force a live-migration by not verifying the provided destination host by the scheduler. (Supported by API versions '2.30' - '2.67')

              WARNING:
                 This could result in failures to actually live migrate the server to the specified host. It is recommended to either not specify a host so that the scheduler will pick one,  or  specify  a
                 host without --force.

   nova live-migration-abort
          usage: nova live-migration-abort <server> <migration>

       Abort an on-going live migration. (Supported by API versions '2.24' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       For microversions from 2.24 to 2.64 the migration status must be running; for microversion 2.65 and greater, the migration status can also be queued and preparing.

       New in version 3.3.0.


       Positional arguments:

       <server>
              Name or ID of server.

       <migration>
              ID of migration.

   nova live-migration-force-complete
          usage: nova live-migration-force-complete <server> <migration>

       Force on-going live migration to complete. (Supported by API versions '2.22' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 3.3.0.


       Positional arguments:

       <server>
              Name or ID of server.

       <migration>
              ID of migration.

   nova lock
          usage: nova lock <server>

       Lock a server. A normal (non-admin) user will not be able to execute actions on a locked server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova meta
          usage: nova meta <server> <action> <key=value> [<key=value> ...]

       Set or delete metadata on a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <action>
              Actions: 'set' or 'delete'.

       <key=value>
              Metadata to set or delete (only key is necessary on delete).

   nova migrate
          usage: nova migrate [--host <host>] [--poll] <server>

       Migrate a server. The new host will be selected by the scheduler.

       Positional arguments:

       <server>
              Name or ID of server.

       Optional arguments:

       --host <host>
              Destination host name. (Supported by API versions '2.56' - '2.latest')

       --poll Report the server migration progress until it completes.

   nova migration-list
          usage: nova migration-list [--instance-uuid <instance_uuid>] [--host <host>]
                                     [--status <status>] [--marker <marker>]
                                     [--limit <limit>] [--changes-since <changes_since>]
                                     [--changes-before <changes_before>]

       Print a list of migrations.

       Optional arguments:

       --instance-uuid <instance_uuid>
              Fetch migrations for the given instance.

       --host <host>
              Fetch migrations for the given host.

       --status <status>
              Fetch migrations for the given status.

       --marker <marker>
              The last migration of the previous page; displays list of migrations after "marker". Note that the marker is the migration UUID.  (Supported by API versions '2.59' - '2.latest')

       --limit <limit>
              Maximum  number  of migrations to display. Note that there is a configurable max limit on the server, and the limit that is used will be the minimum of what is requested here and what is con‐
              figured in the server.  (Supported by API versions '2.59' - '2.latest')

       --changes-since <changes_since>
              List only migrations changed later or equal to a certain point of time. The provided time should be an ISO 8061 formatted time.  e.g. 2016-03-04T06:27:59Z . (Supported by API versions  '2.59'
              - '2.latest')

       --changes-before <changes_before>
              List  only  migrations  changed  earlier  or  equal to a certain point of time. The provided time should be an ISO 8061 formatted time.  e.g. 2016-03-04T06:27:59Z . (Supported by API versions
              '2.66' - '2.latest')

   nova pause
          usage: nova pause <server>

       Pause a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova quota-class-show
          usage: nova quota-class-show <class>

       List the quotas for a quota class.

       Positional arguments:

       <class>
              Name of quota class to list the quotas for.

   nova quota-class-update
          usage: nova quota-class-update [--instances <instances>] [--cores <cores>]
                                         [--ram <ram>]
                                         [--metadata-items <metadata-items>]
                                         [--key-pairs <key-pairs>]
                                         [--server-groups <server-groups>]
                                         [--server-group-members <server-group-members>]
                                         <class>

       Update the quotas for a quota class. (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       Positional arguments:

       <class>
              Name of quota class to set the quotas for.

       Optional arguments:

       --instances <instances>
              New value for the "instances" quota.

       --cores <cores>
              New value for the "cores" quota.

       --ram <ram>
              New value for the "ram" quota.

       --metadata-items <metadata-items>
              New value for the "metadata-items" quota.

       --key-pairs <key-pairs>
              New value for the "key-pairs" quota.

       --server-groups <server-groups>
              New value for the "server-groups" quota.

       --server-group-members <server-group-members>
              New value for the "server-group-members" quota.

   nova quota-defaults
          usage: nova quota-defaults [--tenant <tenant-id>]

       List the default quotas for a tenant.

       Optional arguments:

       --tenant <tenant-id>
              ID of tenant to list the default quotas for.

   nova quota-delete
          usage: nova quota-delete --tenant <tenant-id> [--user <user-id>]

       Delete quota for a tenant/user so their quota will Revert back to default.

       Optional arguments:

       --tenant <tenant-id>
              ID of tenant to delete quota for.

       --user <user-id>
              ID of user to delete quota for.

   nova quota-show
          usage: nova quota-show [--tenant <tenant-id>] [--user <user-id>] [--detail]

       List the quotas for a tenant/user.

       Optional arguments:

       --tenant <tenant-id>
              ID of tenant to list the quotas for.

       --user <user-id>
              ID of user to list the quotas for.

       --detail
              Show detailed info (limit, reserved, in-use).

   nova quota-update
          usage: nova quota-update [--user <user-id>] [--instances <instances>]
                                   [--cores <cores>] [--ram <ram>]
                                   [--metadata-items <metadata-items>]
                                   [--key-pairs <key-pairs>]
                                   [--server-groups <server-groups>]
                                   [--server-group-members <server-group-members>]
                                   [--force]
                                   <tenant-id>

       Update the quotas for a tenant/user. (Supported by API versions '2.0' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       Positional arguments:

       <tenant-id>
              ID of tenant to set the quotas for.

       Optional arguments:

       --user <user-id>
              ID of user to set the quotas for.

       --instances <instances>
              New value for the "instances" quota.

       --cores <cores>
              New value for the "cores" quota.

       --ram <ram>
              New value for the "ram" quota.

       --metadata-items <metadata-items>
              New value for the "metadata-items" quota.

       --key-pairs <key-pairs>
              New value for the "key-pairs" quota.

       --server-groups <server-groups>
              New value for the "server-groups" quota.

       --server-group-members <server-group-members>
              New value for the "server-group-members" quota.

       --force
              Whether force update the quota even if the already used and reserved exceeds the new quota.

   nova reboot
          usage: nova reboot [--hard] [--poll] <server> [<server> ...]

       Reboot a server.

       Positional arguments:

       <server>
              Name or ID of server(s).

       Optional arguments:

       --hard Perform a hard reboot (instead of a soft one). Note: Ironic does not currently support soft reboot; consequently, bare metal nodes will always do a hard reboot, regardless of the use of  this
              option.

       --poll Poll until reboot is complete.

   nova rebuild
          usage: nova rebuild [--rebuild-password <rebuild-password>] [--poll]
                              [--minimal] [--preserve-ephemeral] [--name <name>]
                              [--description <description>] [--meta <key=value>]
                              [--key-name <key-name>] [--key-unset]
                              [--user-data <user-data>] [--user-data-unset]
                              [--trusted-image-certificate-id <trusted-image-certificate-id>]
                              [--trusted-image-certificates-unset]
                              <server> <image>

       Shutdown, re-image, and re-boot a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <image>
              Name or ID of new image.

       Optional arguments:

       --rebuild-password <rebuild-password>
              Set the provided admin password on the rebuilt server.

       --poll Report the server rebuild progress until it completes.

       --minimal
              Skips flavor/image lookups when showing servers.

       --preserve-ephemeral
              Preserve the default ephemeral storage partition on rebuild.

       --name <name>
              Name for the new server.

       --description <description>
              New description for the server. (Supported by API versions '2.19' - '2.latest')

       --meta <key=value>
              Record arbitrary key/value metadata to /meta_data.json on the metadata server. Can be specified multiple times.

       --key-name <key-name>
              Keypair name to set in the server. Cannot be specified with the '--key-unset' option.  (Supported by API versions '2.54' - '2.latest')

       --key-unset
              Unset keypair in the server. Cannot be specified with the '--key-name' option.  (Supported by API versions '2.54' - '2.latest')

       --user-data <user-data>
              User data file to pass to be exposed by the metadata server.  (Supported by API versions '2.57' - '2.latest')

       --user-data-unset
              Unset user_data in the server. Cannot be specified with the '--user-data' option.  (Supported by API versions '2.57' - '2.latest')

       --trusted-image-certificate-id <trusted-image-certificate-id>
              Trusted  image  certificate  IDs  used to validate certificates during the image signature verification process.  Defaults to env[OS_TRUSTED_IMAGE_CERTIFICATE_IDS].  May be specified multiple
              times to pass multiple trusted image certificate IDs. (Supported by API versions '2.63' - '2.latest')

       --trusted-image-certificates-unset
              Unset trusted_image_certificates in the server. Cannot be specified with the --trusted-image-certificate-id option.  (Supported by API versions '2.63' - '2.latest')

   nova refresh-network
          usage: nova refresh-network <server>

       Refresh server network information.

       Positional arguments:

       <server>
              Name or ID of a server for which the network cache should be refreshed from neutron (Admin only).

   nova remove-secgroup
          usage: nova remove-secgroup <server> <secgroup>

       Remove a Security Group from a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <secgroup>
              Name of Security Group.

   nova rescue
          usage: nova rescue [--password <password>] [--image <image>] <server>

       Reboots a server into rescue mode, which starts the machine from either the initial image or a specified image, attaching the current boot disk as secondary.

       Positional arguments:

       <server>
              Name or ID of server.

       Optional arguments:

       --password <password>
              The admin password to be set in the rescue environment.

       --image <image>
              The image to rescue with.

   nova reset-network
          usage: nova reset-network <server>

       Reset network of a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova reset-state
          usage: nova reset-state [--all-tenants] [--active] <server> [<server> ...]

       Reset the state of a server.

       Positional arguments:

       <server>
              Name or ID of server(s).

       Optional arguments:

       --all-tenants
              Reset state server(s) in another tenant by name (Admin only).

       --active
              Request the server be reset to "active" state instead of "error" state (the default).

   nova resize
          usage: nova resize [--poll] <server> <flavor>

       Resize a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <flavor>
              Name or ID of new flavor.

       Optional arguments:

       --poll Report the server resize progress until it completes.

   nova resize-confirm
          usage: nova resize-confirm <server>

       Confirm a previous resize.

       Positional arguments:

       <server>
              Name or ID of server.

   nova resize-revert
          usage: nova resize-revert <server>

       Revert a previous resize (and return to the previous VM).

       Positional arguments:

       <server>
              Name or ID of server.

   nova restore
          usage: nova restore <server>

       Restore a soft-deleted server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova resume
          usage: nova resume <server>

       Resume a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova server-group-create
          usage: nova server-group-create [--rules <key=value>] <name> <policy>

       Create a new server group with the specified details.

       Positional arguments:

       <name> Server group name.

       <policy>
              Policy for the server groups.

       Optional arguments:

       --rule Policy rules for the server groups. (Supported by API versions '2.64'  -  '2.latest'）.  Currently,  only  the  max_server_per_host  rule  is  supported  for  the  anti-affinity  policy.  The
              max_server_per_host rule allows specifying how many members of the anti-affinity group can reside on the same compute host. If not specified, only one member from the same anti-affinity group
              can reside on a given host.

   nova server-group-delete
          usage: nova server-group-delete <id> [<id> ...]

       Delete specific server group(s).

       Positional arguments:

       <id>   Unique ID(s) of the server group to delete.

   nova server-group-get
          usage: nova server-group-get <id>

       Get a specific server group.

       Positional arguments:

       <id>   Unique ID of the server group to get.

   nova server-group-list
          usage: nova server-group-list [--limit <limit>] [--offset <offset>]
                                        [--all-projects]

       Print a list of all server groups.

       Optional arguments:

       --limit <limit>
              Maximum number of server groups to display. If limit is bigger than 'CONF.api.max_limit' option of Nova API, limit 'CONF.api.max_limit' will be used instead.

       --offset <offset>
              The offset of groups list to display; use with limit to return a slice of server groups.

       --all-projects
              Display server groups from all projects (Admin only).

   nova server-migration-list
          usage: nova server-migration-list <server>

       Get the migrations list of specified server. (Supported by API versions '2.23' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 3.3.0.


       Positional arguments:

       <server>
              Name or ID of server.

   nova server-migration-show
          usage: nova server-migration-show <server> <migration>

       Get the migration of specified server. (Supported by API versions '2.23' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 3.3.0.


       Positional arguments:

       <server>
              Name or ID of server.

       <migration>
              ID of migration.

   nova server-tag-add
          usage: nova server-tag-add <server> <tag> [<tag> ...]

       Add one or more tags to a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 4.1.0.


       Positional arguments:

       <server>
              Name or ID of server.

       <tag>  Tag(s) to add.

   nova server-tag-delete
          usage: nova server-tag-delete <server> <tag> [<tag> ...]

       Delete one or more tags from a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 4.1.0.


       Positional arguments:

       <server>
              Name or ID of server.

       <tag>  Tag(s) to delete.

   nova server-tag-delete-all
          usage: nova server-tag-delete-all <server>

       Delete all tags from a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 4.1.0.


       Positional arguments:

       <server>
              Name or ID of server.

   nova server-tag-list
          usage: nova server-tag-list <server>

       Get list of tags from a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 4.1.0.


       Positional arguments:

       <server>
              Name or ID of server.

   nova server-tag-set
          usage: nova server-tag-set <server> <tags> [<tags> ...]

       Set list of tags to a server. (Supported by API versions '2.26' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 4.1.0.


       Positional arguments:

       <server>
              Name or ID of server.

       <tags> Tag(s) to set.

   nova service-delete
          usage: nova service-delete <id>

       Delete the service.

       IMPORTANT:
          If deleting a nova-compute service, be sure to stop the actual nova-compute process on the physical host before deleting the service with this command. Failing to do so can lead  to  the  running
          service re-creating orphaned compute_nodes table records in the database.

       Positional arguments:

       <id>   ID of service as a UUID. (Supported by API versions '2.53' - '2.latest')

   nova service-disable
          usage: nova service-disable [--reason <reason>] <id>

       Disable the service.

       Positional arguments:

       <id>   ID of the service as a UUID. (Supported by API versions '2.53' - '2.latest')

       Optional arguments:

       --reason <reason>
              Reason for disabling the service.

   nova service-enable
          usage: nova service-enable <id>

       Enable the service.

       Positional arguments:

       <id>   ID of the service as a UUID. (Supported by API versions '2.53' - '2.latest')

   nova service-force-down
          usage: nova service-force-down [--unset] <id>

       Force service to down. (Supported by API versions '2.11' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 2.27.0.


       Positional arguments:

       <id>   ID of the service as a UUID. (Supported by API versions '2.53' - '2.latest')

       Optional arguments:

       --unset
              Unset the forced_down state of the service.

   nova service-list
          usage: nova service-list [--host <hostname>] [--binary <binary>]

       Show a list of all running services. Filter by host & binary.

       Note that from microversion 2.69, during partial infrastructure failures in the deployment, the output of this command may return partial results for the services present in the failure domain.

       Optional arguments:

       --host <hostname>
              Name of host.

       --binary <binary>
              Service binary.

   nova set-password
          usage: nova set-password <server>

       Change the admin password for a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova shelve
          usage: nova shelve <server>

       Shelve a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova shelve-offload
          usage: nova shelve-offload <server>

       Remove a shelved server from the compute node.

       Positional arguments:

       <server>
              Name or ID of server.

   nova show
          usage: nova show [--minimal] [--wrap <integer>] <server>

       Show details about the given server.

       Note that from microversion 2.69, during partial infrastructure failures in the deployment, the output of this command may return partial results for the server if it exists in the failure domain.

       Positional arguments:

       <server>
              Name or ID of server.

       Optional arguments:

       --minimal
              Skips flavor/image lookups when showing servers.

       --wrap <integer>
              Wrap the output to a specified length, or 0 to disable.

   nova ssh
          usage: nova ssh [--port PORT] [--address-type ADDRESS_TYPE]
                          [--network <network>] [--ipv6] [--login <login>] [-i IDENTITY]
                          [--extra-opts EXTRA]
                          <server>

       SSH into a server.

       Positional arguments:

       <server>
              Name or ID of server.

       Optional arguments:

       --port PORT
              Optional flag to indicate which port to use for ssh. (Default=22)

       --address-type ADDRESS_TYPE
              Optional flag to indicate which IP type to use. Possible values includes fixed and floating (the Default).

       --network <network>
              Network to use for the ssh.

       --ipv6 Optional flag to indicate whether to use an IPv6 address attached to a server. (Defaults to IPv4 address)

       --login <login>
              Login to use.

       -i IDENTITY, --identity IDENTITY
              Private key file, same as the -i option to the ssh command.

       --extra-opts EXTRA
              Extra options to pass to ssh. see: man ssh.

   nova start
          usage: nova start [--all-tenants] <server> [<server> ...]

       Start the server(s).

       Positional arguments:

       <server>
              Name or ID of server(s).

       Optional arguments:

       --all-tenants
              Start server(s) in another tenant by name (Admin only).

   nova stop
          usage: nova stop [--all-tenants] <server> [<server> ...]

       Stop the server(s).

       Positional arguments:

       <server>
              Name or ID of server(s).

       Optional arguments:

       --all-tenants
              Stop server(s) in another tenant by name (Admin only).

   nova suspend
          usage: nova suspend <server>

       Suspend a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova trigger-crash-dump
          usage: nova trigger-crash-dump <server>

       Trigger crash dump in an instance. (Supported by API versions '2.17' - '2.latest') [hint: use '--os-compute-api-version' flag to show help message for proper version]

       New in version 3.3.0.


       Positional arguments:

       <server>
              Name or ID of server.

   nova unlock
          usage: nova unlock <server>

       Unlock a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova unpause
          usage: nova unpause <server>

       Unpause a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova unrescue
          usage: nova unrescue <server>

       Restart the server from normal boot disk again.

       Positional arguments:

       <server>
              Name or ID of server.

   nova unshelve
          usage: nova unshelve <server>

       Unshelve a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova update
          usage: nova update [--name <name>] [--description <description>] <server>

       Update the name or the description for a server.

       Positional arguments:

       <server>
              Name (old name) or ID of server.

       Optional arguments:

       --name <name>
              New name for the server.

       --description <description>
              New description for the server. If it equals to empty string (i.g. ""), the server description will be removed. (Supported by API versions '2.19' - '2.latest')

   nova usage
          usage: nova usage [--start <start>] [--end <end>] [--tenant <tenant-id>]

       Show usage data for a single tenant.

       Optional arguments:

       --start <start>
              Usage range start date ex 2012-01-20. (default: 4 weeks ago)

       --end <end>
              Usage range end date, ex 2012-01-20. (default: tomorrow)

       --tenant <tenant-id>
              UUID of tenant to get usage for.

   nova usage-list
          usage: nova usage-list [--start <start>] [--end <end>]

       List usage data for all tenants.

       Optional arguments:

       --start <start>
              Usage range start date ex 2012-01-20. (default: 4 weeks ago)

       --end <end>
              Usage range end date, ex 2012-01-20. (default: tomorrow)

   nova version-list
          usage: nova version-list

       List all API versions.

   nova volume-attach
          usage: nova volume-attach [--tag <tag>] <server> <volume> [<device>]

       Attach a volume to a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <volume>
              ID of the volume to attach.

       <device>
              Name of the device e.g. /dev/vdb. Use "auto" for autoassign (if supported). Libvirt driver will use default device name.

       Optional arguments:

       --tag <tag>
              Tag for the attached volume. (Supported by API versions '2.49' - '2.latest')

   nova volume-attachments
          usage: nova volume-attachments <server>

       List all the volumes attached to a server.

       Positional arguments:

       <server>
              Name or ID of server.

   nova volume-detach
          usage: nova volume-detach <server> <volume>

       Detach a volume from a server.

       Positional arguments:

       <server>
              Name or ID of server.

       <volume>
              ID of the volume to detach.

   nova volume-update
          usage: nova volume-update <server> <src_volid> <dest_volid>

       Update the attachment on the server. Migrates the data from an attached volume to the specified available volume and swaps out the active attachment to the new volume.

       Positional arguments:

       <server>
              Name or ID of server.

       <src_volid>
              ID of the source (original) volume.

       <dest_volid>
              ID of the destination volume.

   nova bash-completion
          usage: nova bash-completion

       Prints all of the commands and options to stdout so that the nova.bash_completion script doesn't have to hard code them.

AUTHOR
       OpenStack Contributors

COPYRIGHT
       OpenStack Contributors




                                                                                                 Jun 17, 2019                                                                                         NOVA(1)
