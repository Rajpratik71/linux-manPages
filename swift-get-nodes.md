swift-get-nodes(1)                                                                             OpenStack Swift                                                                             swift-get-nodes(1)



NAME
       swift-get-nodes - OpenStack Swift get-nodes tool


SYNOPSIS
       swift-get-nodes  [options] <ring.gz> <account> [<container> [<object>]]

       Or

       swift-get-nodes [options] <ring.gz> -p <partition>

       Or

       swift-get-nodes  [options] -P policy_name <account> <container> <object>


DESCRIPTION
       The  swift-get-nodes  tool  can  be used to find out the location where a particular account, container or object item is located within the swift cluster nodes. For example, if you have the account
       hash and a container name that belongs to that account, you can use swift-get-nodes to lookup where the container resides by using the container ring.


OPTIONS
       -h --help
              Shows the help message and exit

       -a, --all
              Show all handoff nodes

       -p PARTITION, --partition=PARTITION
              Show nodes for a given partition

       -P POLICY_NAME, --policy-name=POLICY_NAME
              Specify storage policy name

       -d SWIFT_DIR, --swift-dir=SWIFT_DIR
              Pass location of swift configuration file if different from the default location /etc/swift


       Example:

           $ swift-get-nodes /etc/swift/account.ring.gz MyAccount-12ac01446be2

           Account     MyAccount-12ac01446be2
           Container   None
           Object      None

           Partition 221082
           Hash d7e6ba68cfdce0f0e4ca7890e46cacce

           Server:Port Device      172.24.24.29:6202 sdd
           Server:Port Device      172.24.24.27:6202 sdr
           Server:Port Device      172.24.24.32:6202 sde
           Server:Port Device      172.24.24.26:6202 sdv    [Handoff]


           curl -I -XHEAD http://172.24.24.29:6202/sdd/221082/MyAccount-12ac01446be2
           curl -I -XHEAD http://172.24.24.27:6202/sdr/221082/MyAccount-12ac01446be2
           curl -I -XHEAD http://172.24.24.32:6202/sde/221082/MyAccount-12ac01446be2
           curl -I -XHEAD http://172.24.24.26:6202/sdv/221082/MyAccount-12ac01446be2 # [Handoff]

           ssh 172.24.24.29 ls -lah /srv/node/sdd/accounts/221082/cce/d7e6ba68cfdce0f0e4ca7890e46cacce/
           ssh 172.24.24.27 ls -lah /srv/node/sdr/accounts/221082/cce/d7e6ba68cfdce0f0e4ca7890e46cacce/
           ssh 172.24.24.32 ls -lah /srv/node/sde/accounts/221082/cce/d7e6ba68cfdce0f0e4ca7890e46cacce/
           ssh 172.24.24.26 ls -lah /srv/node/sdv/accounts/221082/cce/d7e6ba68cfdce0f0e4ca7890e46cacce/ # [Handoff]



DOCUMENTATION
       More documentation about OpenStack Swift can be found at https://docs.openstack.org/swift/latest/




SEE ALSO
       swift-account-info(1), swift-container-info(1), swift-object-info(1), swift-ring-builder(1)



Linux                                                                                             10/25/2016                                                                               swift-get-nodes(1)
