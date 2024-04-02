swift-dispersion-populate(1)                                                                   OpenStack Swift                                                                   swift-dispersion-populate(1)



NAME
       swift-dispersion-populate - OpenStack Swift dispersion populate


SYNOPSIS
       swift-dispersion-populate [--container-suffix-start] [--object-suffix-start] [--container-only|--object-only] [--insecure] [conf_file]


DESCRIPTION
       This  is  one  of the swift-dispersion utilities that is used to evaluate the overall cluster health. This is accomplished by checking if a set of deliberately distributed containers and objects are
       currently in their proper places within the cluster.


       For instance, a common deployment has three replicas of each object.  The health of that object can be measured by checking if each replica is in its proper place. If only 2 of the 3 is in place the
       object's health can be said to be at 66.66%, where 100% would be perfect.


       We need to place the containers and objects throughout the system so that they are on distinct partitions. The swift-dispersion-populate tool does this by making up random container and object names
       until they fall on distinct partitions. Last, and repeatedly for the life of the cluster, we need to run the swift-dispersion-report tool to check the health of each of these containers and objects.


       These tools need direct access to the entire cluster and to the ring files.  Installing them on a proxy server will probably do or a box used for swift administration purposes that also contains the
       common  swift  packages and ring.  Both swift-dispersion-populate and swift-dispersion-report use the same configuration file, /etc/swift/dispersion.conf . The account used by these tool should be a
       dedicated account for the dispersion stats and also have admin privileges.


OPTIONS
       --insecure
              Allow accessing insecure keystone server. The keystone's certificate will not be verified.

       --container-suffix-start=NUMBER
              Start container suffix at NUMBER and resume population at this point; default: 0

       --object-suffix-start=NUMBER
              Start object suffix at NUMBER and resume population at this point; default: 0

       --object-only
              Only run object population

       --container-only
              Only run container population

       --no-overlap
              Increase coverage by amount in dispersion_coverage option with no overlap of existing partitions (if run more than once)

       -P, --policy-name
              Specify storage policy name


CONFIGURATION
       Example /etc/swift/dispersion.conf:

          [dispersion]
          auth_url = https://127.0.0.1:443/auth/v1.0
          auth_user = dpstats:dpstats
          auth_key = dpstats
          swift_dir = /etc/swift
          # project_name = dpstats
          # project_domain_name = default
          # user_domain_name = default
          # dispersion_coverage = 1.0
          # retries = 5
          # concurrency = 25
          # endpoint_type = publicURL


EXAMPLE
       $ swift-dispersion-populate
        Created 2621 containers for dispersion reporting, 38s, 0 retries
        Created 2621 objects for dispersion reporting, 27s, 0 retries




DOCUMENTATION
       More in depth documentation about the swift-dispersion utilities and also OpenStack Swift as a whole can be found  at  https://docs.openstack.org/swift/latest/admin_guide.html#dispersion-report  and
       https://docs.openstack.org/swift/latest/



SEE ALSO
       swift-dispersion-report(1), dispersion.conf(5)



Linux                                                                                             8/26/2011                                                                      swift-dispersion-populate(1)
