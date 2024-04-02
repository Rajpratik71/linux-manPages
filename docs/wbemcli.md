
wbemcli(1)                                                                                 General Commands Manual                                                                                 wbemcli(1)



NAME
       wbemcli - independent command line CIM Client

SYNOPSIS
       wbemcli  gc|gcd|dc|ec|ecn|gi|ci|mi|di|ei|ein|ai|ain|ri|rin|gp|sp|cm|cmx  [-nl]  [-h]  [-t]  [-cte]  [-dx]  [-dr]  [-noverify]  [-cacert file]  [-clientcert file]  [-clientkey file]  [-ac assocClass]
       [-arc resultClass] [-ar role] [-arr resultRole] objectPath [prop=value[,...]]  [prop[,...]]

Alternate formats:
       wbemgc     [-nl] [-h] [-t] [-dx] [-dr] objectPath [prop[,...]]

       wbemgcd    [-nl] [-h] [-t] [-dx] [-dr] objectPath

       wbemdc     [-nl] [-h] [-t] [-dx] [-dr] objectPath

       wbemec     [-nl] [-h] [-t] [-cte] [-dx] [-dr] objectPath [prop[,...]]

       wbemecn    [-nl] [-h] [-t] [-dx] [-dr] objectPath

       wbemgi     [-nl] [-h] [-t] [-dx] [-dr] objectPath [prop[,...]]

       wbemci     [-nl] [-h] [-t] [-dx] [-dr] objectPath [prop=value[,...]]

       wbemmi     [-nl] [-h] [-t] [-dx] [-dr] objectPath [prop=value[,...]]

       wbemdi     [-nl] [-h] [-t] [-dx] [-dr] objectPath

       wbemei     [-nl] [-h] [-t] [-cte] [-dx] [-dr] objectPath [prop[,...]]

       wbemein    [-nl] [-h] [-t] [-dx] [-dr] objectPath

       wbemai     [-nl] [-h] [-t] [-cte] [-dx] [-dr] [-ac assocClass] [-arc resultClass] [-ar role] [-arr resultRole] objectPath [prop[,...]]

       wbemain    [-nl] [-h] [-t] [-dx] [-dr] [-ac assocClass] [-arc resultClass] [-ar role] [-arr resultRole] objectPath

       wbemri     [-nl] [-h] [-t] [-cte] [-dx] [-dr] [-arc resultClass] [-ar role] objectPath [prop[,...]]

       wbemrin    [-nl] [-h] [-t] [-dx] [-dr] [-arc resultClass] [-ar role] objectPath

       wbemgp     [-nl] [-h] [-t] [-dx] [-dr] objectPath prop

       wbemsp     [-nl] [-h] [-t] [-dx] [-dr] objectPath prop=value

       wbemcm     [-nl] [-h] [-t] [-dx] [-dr] objectPath method[.param=value[,...]]

       wbemcmx    [-nl] [-h] [-t] [-dx] [-dr] objectPath method[.param=value[,...]]

DESCRIPTION
       wbemcli is a command line based CIM Client. It uses one of the gc|gcd|dc|ec|ecn|gi|ci|mi|di|ei|ein|ai|ain|ri|rin|gp|sp|cm|cmx operations and the fully qualified path to the CIM Object to get to  the
       host and execute the specified operation.  This implementation is CIMOM library independent and can be used with all WBEM compliant CIMOM implementations.  The objectPath parameter is used to locate
       the CIM object and has the following format:

            <scheme>://[user:pwd@]<host>:<port>/<namespace[/..]>:<classname>[.<key=value[,..]>]

       The objectPath should be enclosed in single quotes so that double quoted
              strings are perserved by the command line shell. Refer to the examples section.

       The only scheme supported is http. Example:
                   http://krz:xyz@localhost:5988/root/cimv2:rpm_package.name=glibc

       The prop=value[,...] parameter is used to specify <Property>=<Value> pairs for the ci, mi and sp operations.  Only one <Property>=<Value> pair must be specified for the sp operation.

       Example:
              stringProp="a string",booleanProp=true,numericProp=25

       Arrays of property values are supported by specifying additional values
              separated by commas

       Example:
              stringProp="a string","another string",numericProp=25,49,12

       The prop[,...] parameter specifies the properties to be returned.  One prop must be specified for the gp operation. For other operations this parameter is optional, if none are specified all proper-
       ties will be returned.

       Example:
              stringProp,booleanProp,numericProp

       The method[.param=value[,...] parameter is used to specify <Parameter>=<Value> pairs for the cm operation.

       Example:
              Method2Execute.stringParam="a string",booleanParam=true,numericParam=25

       Arrays of property values are supported by specifying additional values
              separated by commas

       Example:
              Method2Execute.stringParam="a string","another string",numericParam=25,49,12

OPERATIONS:
       Supported operations are:

       gc     get class

       gcd    get class definition

       dc     delete class

       ec     enumerate classes

       ecn    enumerate class names

       gi     get instance

       ci     create instance

       mi     modify instance

       di     delete instance

       ei     enumerate instances

       ein    enumerate instance names

       ai     enumerate association instances

       ain    enumerate association instance names

       ri     enumerate reference instances

       rin    enumerate reference instance names

       gp     get property

       sp     set property

       cm     call method

       cmx    call method (return XML)

OPTIONS
       -h     Print a help message

       -nl    Start a new line for every property returned

       -t     Append array ([]), reference (&) and key property (#) indicators to property names

       -cte   Enable support for chunked responses from CIMOM

       -v     Show version information

       -dx    Show XML messages payload as received from CIMOM

       -dr    Delineate references with { } pairs

       -noverify
              Do not verify the server certificate for https URLs (useful for testing)

       -cacert
              CA certificate file (required for https URLS unless -noverify is specified)

       -clientcert
              Client certificate file (if the CIM server requires client certificates)

       -clientkey
              Client private key file (required if -clientcert is specified)

       -ac    association class name (ai, ain only)

       -arc   result class name (ai, ain, rin, ri only)

       -ar    role name (ai, ain, rin, ri only)

       -arr   result role name (ai, ain only)

LIBRARIES
       wbemcli requires either libghttp, libwww, or winhttp, depending on build options used.

Example
       To get all instances of rpm_packages, i.e. all installed rpm packages on the local system, the following command can be used:

        wbemcli ei 'http://localhost:5988/root/cimv2:rpm_package'

       The get instance operation can be specified to get more information about a certain package:

        wbemcli  gi  'http://localhost:5988/root/cimv2:rpm_package.name="glibc"'  The  create  instance  (ci) operation can be called using the following format example.  Property values can also be speci-
        fied/add to the sytax.

        wbemcli ci 'http://localhost:5988/root/cimv2:TST_InstanceProperties.CreationClassName="TST_InstanceProperties",Id="Instance #2"'  'CreationClassName="TST_InstanceProperties",Id="Instance  #2",Prop-
        erty_string2="This is instance#2",Property_uint8=250'

        More command line examples can be found from the wbemcli/examples directory.



Host indirection support
       The scheme and host specification in the object path can be replaced by an arbitrary token that will be used to locate the proper scheme and host specification in ./wbemcli.ind or any file specified
       via the WBEMCLI_IND environment variable.  The format of this file is as follows:

            <token>: <scheme>://[user:pwd@]<host>:<port>

       Assuming the following entry in ./wbemcli.ind:

            myCimom: http://localhost:5988

       The example in the previous section can then be specified as:

             wbemcli gi 'myCimom/root/cimv2:rpm_package.name="glibc"'

ENVIRONMENT
       WBEMCLI_CURL_SSLVERSION
              Specifies the SSL protocol that will be used.  Valid values are SSLv2, SSLv3, TLSv1, TLSv1.0 (TLSv1_0), TLSv1.1 (TLSv1_1) or TLSv1.2 (TLSv1_2).  If this variable  is  not  set,  wbemcli  will
              attempt to figure out the remote SSL protocol version.


FILES
       /usr/share/sblim-wbemcli/cacert.pem
              The default CA certificate file. Can be overriden with -cacert.

AUTHOR
       Adrian Schuur <schuur@de.ibm.com>

BUGS
       The SBLIM project maintains a mailing list to which you should direct all questions regarding sfcb, sfcc, wbemcli, or any of the SBLIM providers.  To subscribe to this mailing list visit

              http://lists.sourceforge.net/lists/listinfo/sblim-issues

       The SBLIM Project Bug tracking page can be found at

              http://sourceforge.net/tracker/?group_id=128809&atid=712784

COPYRIGHT
       (C) Copyright IBM Corp. 2002, 2004, 2005, 2009

AVAILABILITY
       wbemcli is a part of the SBLIM project. The most recent version is available on the web at

              http://sblim.sourceforge.net/

SEE ALSO
       cimserver(1)




wbemcli Version 1.6.2                                                                             June 2009                                                                                        wbemcli(1)
