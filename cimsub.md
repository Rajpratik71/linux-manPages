cimsub(1)                                                                                                                                                                                           cimsub(1)



NAME
       cimsub - list, enable, disable,remove or create CIM indication subscriptions

SYNOPSIS
       cimsub -l s|f|h [-v][-n namespace][-F [fnamespace:]filtername][-H [hnamespace:][hclassname.]handlername]

       cimsub -e [-n namespace] -F [fnamespace:]filtername -H [hnamespace:][hclassname.]handlername

       cimsub -d [-n namespace] -F [fnamespace:]filtername -H [hnamespace:][hclassname.]handlername

       cimsub -r s|f|h|a [-n namespace][-F [fnamespace:]filtername][-H [hnamespace:][hclassname.]handlername]

       cimsub -c f [fnamespace:]filtername -Q query [-L querylanguage] [-N sourcenamespace(s)]

       cimsub -c h [hnamespace:][hclassname.]handlername [-D destination]|
                   [-M mailto [-C mailcc] -S mailsubject]|
                   [-T snmptargethost [-P snmpportnumber] -V snmpversion] [-U snmpsecurityname] [-E snmpengineid]]

       cimsub -c s [-n namespace] -F [fnamespace:]filtername -H [hnamespace:][hclassname.]handlername


       cimsub --help

       cimsub --version


DESCRIPTION
       The cimsub command provides a command line interface to manage CIM indication subscriptions on the local CIM Server.

       The first form of cimsub lists all or selected indication subscriptions, filters, or handlers, and displays the requested information about the instance(s).

       The  second  form  of  cimsub  enables  the  specified  subscription, i.e. the subscription instance is modified to set the value of the SubscriptionState property to Enabled. When a subscription is
       enabled, the CIM Server attempts to process the subscription if at least one provider is available to serve the subscription.

       The third form of cimsub disables the specified subscription, i.e. the subscription instance is modified to set the value of the SubscriptionState property to Disabled. When a subscription  is  dis‐
       abled, the CIM Server does not attempt to process the subscription, regardless of whether any providers are available to serve the subscription.

       The  fourth  form of cimsub removes the specified subscription, filter, handler, or subscription and its referenced filter and handler, i.e. each instance is deleted from the repository, and the CIM
       Server will no longer have any information about the instance(s). A filter or handler may not be removed if it is referenced by any other subscription.

       The fifth form of cimsub command creates the specified Subscription, filter, or handler. i.e each instance is created into the repository and CIM Server will get the new information about  the  cre‐
       ated Instance(s).


   Options
       The cimsub command recognizes the following options:

              -l             List  and display information about all or selected indication subscriptions ("s"), filters ("f"), or handlers ("h"). It is an error to specify the -F option with -lh. It is an
                             error to specify the -H option with -lf. With the -lf or -lh option, fnamespace or hnamespace takes precedence over the -n namespace option if both are specified.

              -e             Enable the specified subscription (set the SubscriptionState to Enabled).

              -d             Disable the specified subscription (set the SubscriptionState to Disabled).

              -r             Remove the specified subscription ("s"), filter ("f"), handler ("h"), or subscription and its referenced filter and handler ("a") (delete the instance(s) from the  repository).
                             The  -F  and  -H  options  are required with -rs or -ra. It is an error to specify the -F option with -rh. It is an error to specify the -H option with -rf. With the -rf or -rh
                             option, fnamespace or hnamespace takes precedence over the -n namespace option if both are specified.

              -c             Create the specified subscription ("s"), filter ("f") or  handler ("h"). The -F filter and -H handler options are required with -cs. The Filtername and -Q  Query  are  required
                             with -cf. The Handler Name is required with -ch.With the -cf or -ch option, fnamespace or hnamespace takes precedence over the -n namespace option if both are specified.

              -v             Include verbose information in the information displayed for each listed instance.

              -n namespace   Specify  the  namespace. For the -l forms of the command, if no namespace is specified, instances in all namespaces are listed. For all other forms of the command, if no names‐
                             pace is specified, the command operates on an instance in the namespace root/PG_InterOp.

              -F [fnamespace:]filtername
                             Specify the Filter Name. Omission of the filter namespace specifies that it is the same as that of the subscription.

              -H [hnamespace:][classname.]handlername
                             Specify the Handler Name. Omission of the handler namespace specifies that it is the same as that of the subscription. Omission of the handler classname specifies  that  it  is
                             CIM_ListenerDestinationCIMXML.

              -Q             Specify the Query Expression for the Filter.

              -L             Specify the Query Language for the Filter.

              -N             To  Use  SourceNamespaces  property, Specify multiple SourceNamespaces with coma separated or append comma to the single SourceNamespace. By default SourceNamespace property is
                             populated if the single SourceNamespace is specified.

              -D             Specify Destination of a CIM_IndicationHandlerCIMXML Handler. Required option for CIM_IndicationHandlerCIMXML or CIM_ListenerDestinationCIMXML Handler.

              -M             Specify Mailto of a  PG_ListenerDestinationEmail Handler.

              -C             Specify Mailcc of a PG_ListenerDestinationEmail Handler.

              -S             Specify Subject of a PG_ListenerDestinationEmail Handler.

              -T             Specify Target Host of PG_IndicationHandlerSNMPMapper Handler. Required option for SNMPMapper handler.

              -U             Specify Security Name of PG_IndicationHandlerSNMPMapper Handler.

              -P             Specify Port Number of a PG_IndicationHandlerSNMPMapper Handler.(default 162)

              -V             Specify SNMPVersion of a PG_IndicationHandlerSNMPMapper Handler.
                                                2 : SNMPv1 Trap
                                                3 : SNMPv2C Trap
                                                4 : SNMPv2C Inform
                                                5 : SNMPv3 Trap
                                                6 : SNMPv3 Inform
                                                Required option for SNMPMapper Handler

              -E             Specify Engine ID of a PG_IndicationHandlerSNMPMapper Handler.

              --help         Display command usage information.

              --version      Display the CIM Server version.

EXIT STATUS
       When an error occurs, an error message is written to stderr and an error value is returned.  The following return values are returned:

              0      Successful completion
              1      General error
              2      Connection failed
              3      Connection timed out
              4      Access was denied
              5      Namespace does not exist
              6      Object could not be found
              7      Operation is not supported

USAGE NOTES
       The cimsub command requires the CIM Server to be running.

       If the enableSubscriptionsForNonprivilegedUsers configuration property is set to false, only a privileged user may list, enable, disable, remove or create  a subscription, filter, or handler. If the
       enableSubscriptionsForNonprivilegedUsers  configuration  property  is set to true, even a non privileged user or the instance creator may enable, disable, remove or create  a subscription, filter or
       handler.

       Caution should be used when specifying the -r option, since subscriptions, filters or handlers removed may not be easily re-created, and may not be re-created using this command.

EXAMPLES
       List all indication subscriptions in all namespaces on the local CIM Server:

              cimsub -ls

       List all indication subscriptions referencing the Filter with Name 'TestFilter' in all namespaces on the local CIM Server:

              cimsub -ls -F TestFilter

       List all indication subscriptions referencing the CIM_ListenerDestinationCIMXML Handler with Name 'TestHandler' in all namespaces on the local CIM Server:

              cimsub -ls -H TestHandler

       List all indication subscriptions in the root/cimv2 namespace on the local CIM Server, including subscription state, filter query and handler destination (verbose listing output):

              cimsub -ls -v -n root/cimv2

       Display information about the subscription referencing Filter with Name 'TestFilter' and referencing CIM_ListenerDestinationCIMXML Handler with Name 'TestHandler' (all in namespace root/PG_InterOp),
       including subscription state, filter query and handler destination (verbose listing output):

              cimsub -ls -v -n root/PG_InterOp -F TestFilter -H TestHandler

       Display information about the Filter with Name 'TestFilter' in the root/cimv2 namespace (verbose listing output):

              cimsub -lf -v -F root/cimv2:TestFilter

       List all handlers in all namespaces on the local CIM Server:

              cimsub -lh

       Enable the subscription referencing Filter with Name 'TestFilter' and referencing CIM_ListenerDestinationCIMXML Handler with Name 'TestHandler' (all in namespace root/PG_InterOp):

              cimsub -e -F TestFilter -H TestHandler

       Disable  the subscription in namespace root/cimv2, referencing Filter with Name 'TestFilter' in namespace test1/cimv2, and referencing PG_ListenerDestinationSystemLog Handler with Name 'TestHandler'
       in namespace test2/cimv2:

              cimsub -d -n root/cimv2 -F test1/cimv2:TestFilter -H test2/cimv2:PG_ListenerDestinationSystemLog.TestHandler

       Remove the subscription referencing Filter with Name 'TestFilter', and referencing CIM_ListenerDestinationCIMXML Handler with Name 'TestHandler' (all in namespace root/cimv2), also removing the fil‐
       ter and handler instances (if not referenced by any other subscription):

              cimsub -ra -n root/cimv2 -F TestFilter -H TestHandler

       Create filter with Name 'filteraa' with the Query 'select * from IndicationStressTestClass' with SourceNamespaces test/TestProvider and test/testIndSrcNS1.

              cimsub -c f filteraa -Q select * from IndicationStressTestClass -N test/TestProvider,test/testIndSrcNS1

       Create handler with Name 'handler01' and Destination '/Pegasus_IndicationStressTestConsumer'.

              cimsub -c h handler01 -D /Pegasus_IndicationStressTestConsumer

       Create Subscription with referencing Filter with Name 'TestFilter', and referencing CIM_ListenerDestinationCIMXML Handler with Name 'TestHandler'

              cimsub -c s -F filteraa -H handler01

SEE ALSO
       cimserver(1), cimconfig(1M).



                                                                                                                                                                                                    cimsub(1)
