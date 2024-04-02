swift-proxy-server(1)                                                                          OpenStack Swift                                                                          swift-proxy-server(1)



NAME
       swift-proxy-server - OpenStack Swift proxy server.


SYNOPSIS
       swift-proxy-server [CONFIG] [-h|--help] [-v|--verbose]


DESCRIPTION
       The  Swift  Proxy  Server  is  responsible for tying together the rest of the Swift architecture.  For each request, it will look up the location of the account, container, or object in the ring and
       route the request accordingly. The public API is also exposed through the Proxy Server. A large number of failures are also handled in the Proxy Server. For example, if a server is  unavailable  for
       an  object  PUT,  it  will ask the ring for a handoff server and route there instead. When objects are streamed to or from an object server, they are streamed directly through the proxy server to or
       from the user the proxy server does not spool them.


DOCUMENTATION
       More in depth documentation in regards to swift-proxy-server and also about OpenStack Swift as a whole can be found at https://docs.openstack.org/swift/latest/



SEE ALSO
       proxy-server.conf(5)



Linux                                                                                             8/26/2011                                                                             swift-proxy-server(1)
