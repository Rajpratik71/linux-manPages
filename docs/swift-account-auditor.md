swift-account-auditor(1)                                                                       OpenStack Swift                                                                       swift-account-auditor(1)



NAME
       swift-account-auditor - OpenStack Swift account auditor


SYNOPSIS
       swift-account-auditor [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       The account auditor crawls the local account system checking the integrity of accounts objects. If corruption is found (in the case of bit rot, for example), the file is quarantined, and replication
       will replace the bad file from another replica.

       The options are as follows:

           -v
           --verbose
               log to console
           -o
           --once
               only run one pass of daemon


DOCUMENTATION
       More in depth documentation in regards to swift-account-auditor and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/


SEE ALSO
       account-server.conf(5)



Linux                                                                                             8/26/2011                                                                          swift-account-auditor(1)
