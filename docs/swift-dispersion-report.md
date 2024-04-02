swift-dispersion-report(1)                                                                     OpenStack Swift                                                                     swift-dispersion-report(1)



NAME
       swift-dispersion-report - OpenStack Swift dispersion report


SYNOPSIS
       swift-dispersion-report [-d|--debug] [-j|--dump-json] [-p|--partitions] [--container-only|--object-only] [--insecure] [conf_file]


DESCRIPTION
       This  is  one  of the swift-dispersion utilities that is used to evaluate the overall cluster health. This is accomplished by checking if a set of deliberately distributed containers and objects are
       currently in their proper places within the cluster.


       For instance, a common deployment has three replicas of each object.  The health of that object can be measured by checking if each replica is in its proper place. If only 2 of the 3 is in place the
       object's health can be said to be at 66.66%, where 100% would be perfect.


       Once  the  swift-dispersion-populate  has  been used to populate the dispersion account, one should run the swift-dispersion-report tool repeatedly for the life of the cluster, in order to check the
       health of each of these containers and objects.


       These tools need direct access to the entire cluster and to the ring files.  Installing them on a proxy server will probably do or a box used for swift administration purposes that also contains the
       common  swift  packages and ring.  Both swift-dispersion-populate and swift-dispersion-report use the same configuration file, /etc/swift/dispersion.conf . The account used by these tool should be a
       dedicated account for the dispersion stats and also have admin privileges.


OPTIONS
       -d, --debug
              output any 404 responses to standard error


       -j, --dump-json
              output dispersion report in json format


       -p, --partitions
              output the partition numbers that have any missing replicas


       --container-only
              Only run the container report


       --object-only
              Only run the object report


       --insecure
              Allow accessing insecure keystone server. The keystone's certificate will not be verified.


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
          # dump_json = no
          # endpoint_type = publicURL


EXAMPLE
       $ swift-dispersion-report


        Queried 2622 containers for dispersion reporting, 31s, 0 retries
        100.00% of container copies found (7866 of 7866)
        Sample represents 1.00% of the container partition space

        Queried 2621 objects for dispersion reporting, 22s, 0 retries
        100.00% of object copies found (7863 of 7863)
        Sample represents 1.00% of the object partition space




DOCUMENTATION
       More in depth documentation about the swift-dispersion utilities and also OpenStack Swift as a whole can be found  at  https://docs.openstack.org/swift/latest/admin_guide.html#dispersion-report  and
       https://docs.openstack.org/swift/latest/



SEE ALSO
       swift-dispersion-populate(1), dispersion.conf(5)



Linux                                                                                             8/26/2011                                                                        swift-dispersion-report(1)
