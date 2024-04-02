swift-object-expirer(1)                                                                        OpenStack Swift                                                                        swift-object-expirer(1)



NAME
       swift-object-expirer - OpenStack Swift object expirer


SYNOPSIS
       swift-object-expirer [CONFIG] [-h|--help] [-v|--verbose] [-o|--once]


DESCRIPTION
       The  swift-object-expirer  offers scheduled deletion of objects. The Swift client would use the X-Delete-At or X-Delete-After headers during an object PUT or POST and the cluster would automatically
       quit serving that object at the specified time and would shortly thereafter remove the object from the system.

       The X-Delete-At header takes a Unix Epoch timestamp, in integer form; for example: 1317070737 represents Mon Sep 26 20:58:57 2011 UTC.

       The X-Delete-After header takes an integer number of seconds. The proxy server that receives the request will convert this header into an X-Delete-At header using its current  time  plus  the  value
       given.

       The options are as follows:

           -v
           --verbose
               log to console
           -o
           --once
               only run one pass of daemon



DOCUMENTATION
       More in depth documentation in regards to swift-object-expirer can be found at https://docs.openstack.org/swift/latest/overview_expiring_objects.html and also about OpenStack Swift as a whole can be
       found at https://docs.openstack.org/swift/latest/



SEE ALSO
       object-expirer.conf(5)




Linux                                                                                             3/15/2012                                                                           swift-object-expirer(1)
