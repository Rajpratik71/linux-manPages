wsgen(1)                                                      Java Web Services Tools                                                     wsgen(1)

NAME
       wsgen - Reads a web service endpoint implementation (SEI) class and generates all of the required artifacts for web service deployment, and
       invocation.

SYNOPSIS
       wsgen [ options ] SEI

       options
              The command-line options. See Options.

       SEI    The web service endpoint implementation class (SEI) to be read.

DESCRIPTION
       The wsgen command generates JAX-WS portable artifacts used in JAX-WS web services. The tool reads a web service endpoint class and
       generates all the required artifacts for web service deployment and invocation. JAXWS 2.1.1 RI also provides a wsgen Ant task, see the
       Tools tab of the JAX-WS (wsgen) page at http://jax-ws.java.net/nonav/2.1.1/docs/wsgenant.html

       To start the wsgen command, do the following:

       export JAXWS_HOME=/pathto/jaxws-ri
       $JAXWS_HOME/bin/wsgen.sh -help

OPTIONS
       -classpath path
              The location of the input class files.

       -cp path
              The location of the input class files.

       -d directory
              The location for where to place generated output files.

       -extension
              Allow vendor extensions. Use of extensions can result in applications that are not portable or that do not work with other
              implementations.

       -help
              Displays a help message about the wsgen command.

       -keep
              Keeps the generated files.

       -r directory
              Uses this option with the -wsdl option to specify where to place generated resource files such as WSDLs.

       -s directory
              The location for where to place generated source files.

       -verbose
              Displays compiler messages.

       -version
              Prints release information.

       -wsdl [ :protocol ]
              An optional command that generates a WSDL file to review before endpoint deployment. The WSDL files contains a machine-readable
              description of how the service can be called, what parameters it expects, and what data structures it returns.

              By default the wsgen command does not generate a WSDL file. The protocol value is optional and is used to specify what protocol
              should be used for the WSDL binding (wsdl:binding). Valid protocols are soap1.1 and Xsoap1.2. The default is soap1.1. The Xsoap1.2
              protocol is not standard and can only be used with the -extension option.

       -servicename name
              Used only with the -wsdl option to specify a particular WSDL service (wsdl:service) name to be generated in the WSDL, for example:
              -servicename "{http://mynamespace/}MyService".

       -portname name
              Used only with the -wsdl option to specify a particular WSDL port (wsdl:port) name to be generated in the WSDL, for example:
              -portname "{http://mynamespace/}MyPort".

EXAMPLES
       The following example generates the wrapper classes for StockService with @WebService annotations inside stock directory.

       wsgen -d stock -cp myclasspath stock.StockService

       The following example generates a SOAP 1.1 WSDL and schema for the stock.StockService class with @WebService annotations.

       wsgen -wsdl -d stock -cp myclasspath stock.StockService

       The following example generates a SOAP 1.2 WSDL.

       wsgen -wsdl:Xsoap1.2 -d stock -cp myclasspath stock.StockService

       Note: You do not have to generate WSDL at development time because the JAXWS run time environment generates a WSDL for you when you deploy
       your service.

SEE ALSO
       · wsimport(1)

       · The Tools tab of the JAX-WS (wsgen) page http://jax-ws.java.net/nonav/2.1.1/docs/wsgenant.html

JDK 8                                                            21 November 2013                                                         wsgen(1)
