SLPTOOL(1)                                                                                      User Commands                                                                                      SLPTOOL(1)



NAME
       slptool - SLP command line tool

SYNOPSIS
       slptool [options] command-and-arguments

OPTIONS
              options may be:

       -v (or --version) displays the versions of slptool and OpenSLP.

       -s (or --scope) followed by a comma-separated list of scopes.

       -l (or --language) followed by a language tag.

       -t (or --time) followed by a lifetime tag.

       -i (or --interfaces) followed by a comma-separated list of interfaces.

       -u (or --unicastifc) followed by a single interface.

              command-and-arguments may be:

       findsrvs service-type [filter]

       findattrs url [attrids]

       findsrvtypes [authority]

       findscopes

       register url [attrs]

       deregister url

       getproperty propertyname

EXAMPLES
       slptool register service:myserv.x://myhost.com "(attr1=val1),(attr2=val2)"

       slptool findsrvs service:myserv.x

       slptool findsrvs service:myserv.x "(attr1=val1)"

       slptool -i 10.77.13.240,192.168.250.240 findsrvs service:myserv.x

       slptool -u 10.77.13.237 findsrvs service:myserv.x "(attr1=val1)"

       slptool findattrs service:myserv.x://myhost.com

       slptool findattrs service:myserv.x://myhost.com attr1

       slptool -i 10.77.13.243 findattrs service:myserv.x://myhost.com attr1

       slptool -u 10.77.13.237 findattrs service:myserv.x://myhost.com attr1

       slptool deregister service:myserv.x://myhost.com

       slptool getproperty net.slp.useScopes

slptool 2.0.beta2                                                                                  May 2013                                                                                        SLPTOOL(1)
