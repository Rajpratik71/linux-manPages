swift-object-auditor(1)                                                                        OpenStack Swift                                                                        swift-object-auditor(1)



NAME
       swift-object-auditor - OpenStack Swift object auditor


SYNOPSIS
       swift-object-auditor [CONFIG] [-h|--help] [-v|--verbose] [-o|--once] [-z|--zero_byte_fps]


DESCRIPTION
       The  object  auditor  crawls  the  local object system checking the integrity of objects.  If corruption is found (in the case of bit rot, for example), the file is quarantined, and replication will
       replace the bad file from another replica.

       The options are as follows:

           -v
           --verbose
               log to console

           -o
           --once
               only run one pass of daemon

           -z ZERO_BYTE_FPS
           --zero_byte_fps=ZERO_BYTE_FPS
               Audit only zero byte files at specified files/sec



DOCUMENTATION
       More in depth documentation in regards to swift-object-auditor and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       object-server.conf(5)



Linux                                                                                             8/26/2011                                                                           swift-object-auditor(1)
