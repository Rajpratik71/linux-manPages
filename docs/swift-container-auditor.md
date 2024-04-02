swift-container-auditor(1)                                                                     OpenStack Swift                                                                     swift-container-auditor(1)



NAME
       swift-container-auditor - OpenStack Swift container auditor


SYNOPSIS
       swift-container-auditor [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       The container auditor crawls the local container system checking the integrity of container objects. If corruption is found (in the case of bit rot, for example), the file is quarantined, and repli‐
       cation will replace the bad file from another replica.

       The options are as follows:

           -v
           --verbose
               log to console
           -o
           --once
               only run one pass of daemon



DOCUMENTATION
       More in depth documentation in regards to swift-container-auditor and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       container-server.conf(5)



Linux                                                                                             8/26/2011                                                                        swift-container-auditor(1)
