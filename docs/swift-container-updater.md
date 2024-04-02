swift-container-updater(1)                                                                     OpenStack Swift                                                                     swift-container-updater(1)



NAME
       swift-container-updater - OpenStack Swift container updater


SYNOPSIS
       swift-container-updater [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       The  container  updater is responsible for updating container information in the account database.  It will walk the container path in the system looking for container DBs and sending updates to the
       account server as needed as it goes along.

       There are times when account data can not be immediately updated. This usually occurs during failure scenarios or periods of high load. This is where an eventual consistency window will most  likely
       come in to play.

       In  practice,  the  consistency  window  is  only as large as the frequency at which the updater runs and may not even be noticed as the proxy server will route listing requests to the first account
       server which responds. The server under load may not be the one that serves subsequent listing requests – one of the other two replicas may handle the listing.

       The options are as follows:

           -v
           --verbose
               log to console
           -o
           --once
               only run one pass of daemon


DOCUMENTATION
       More in depth documentation in regards to swift-container-updater and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       container-server.conf(5)



Linux                                                                                             8/26/2011                                                                        swift-container-updater(1)
