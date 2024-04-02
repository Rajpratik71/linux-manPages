swift-oldies(1)                                                                                OpenStack Swift                                                                                swift-oldies(1)



NAME
       swift-oldies - OpenStack Swift oldies tool


SYNOPSIS
       swift-oldies [-h|--help] [-a|--age]



DESCRIPTION
       Lists  Swift  processes  that  have been running more than a specific length of time (in hours). This is done by scanning the list of currently executing processes (via ps command) and examining the
       execution time of those python processes whose program names begin with 'swift-'.

       Example (see all Swift processes older than two days): swift-oldies -a 48

       The options are as follows:

           -a HOURS
           --age=HOURS
               Look for processes at least HOURS old; default: 720 (30 days)

           -h
           --help
               Display program help and exit



DOCUMENTATION
       More documentation about OpenStack Swift can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       swift-orphans(1)




Linux                                                                                             8/04/2016                                                                                   swift-oldies(1)
