wsimport(1)                             Java Web Services Tools                            wsimport(1)

NAME
       wsimport - Generates JAX-WS portable artifacts that can be packaged in a web application
       archive (WAR) file and provides an Ant task.

SYNOPSIS
       wsimport [ options ] wsdl

       options
              The command-line options. See Options.

       wsdl   The file that contains the machine-readable description of how the web service can be
              called, what parameters it expects, and what data structures it returns.

DESCRIPTION
       The wsimport command generates the following JAX-WS portable artifacts. These artifacts can be
       packaged in a WAR file with the WSDL and schema documents and the endpoint implementation to be
       deployed. The wsimport command also provides a wsimport Ant task, see the Tools tab of the
       Wsimport Ant Task page at http://jax-ws.java.net/nonav/2.1.1/docs/wsimportant.html

       • Service Endpoint Interface (SEI)

       • Service

       • Exception class is mapped from wsdl:fault (if any)

       • Async Response Bean is derived from response wsdl:message (if any)

       • JAXB generated value types (mapped java classes from schema types)

       To start the wsgen command, do the following:

       Oracle Solaris/Linux:

       /bin/wsimport.sh -help

       Windows:

       \bin\wsimport.bat -help

OPTIONS
       -d directory
              Specifies where to place generated output files.

       -b path
              Specifies external JAX-WS or JAXB binding files. Multiple JAX-WS and JAXB binding files
              can be specified with the -b option. You can use these files to customize package names,
              bean names, and so on. For more information about JAX-WS and JAXB binding files, see the
              Users Guide tab of WSDL Customization at http://jax-
              ws.java.net/nonav/2.1.1/docs/wsimportant.html

       -B jaxbOption
              Passes the jaxbOption option to the JAXB schema compiler.

       -catalog
              Specifies a catalog file to resolve external entity references. The -catalog option
              supports the TR9401, XCatalog, and OASIS XML Catalog formats. See the Users Guide tab of
              the Catalog Support page at http://jax-ws.java.net/nonav/2.1.1/docs/catalog-support.html

       -extension
              Allows vendor extensions. Use of extensions can result in applications that are not
              portable or that do not work with other implementations.

       -help
              Displays a help message for the wsimport command.

       -httpproxy: host:port
              Specifies an HTTP proxy server. The default is 8080.

       -keep
              Keeps generated files.

       -p name
              Specifies a target package name to override the WSDL and schema binding customizations,
              and the default algorithm defined in the specification.

       -s directory
              Specifies where to place generated source files.

       -verbose
              Displays compiler messages.

       -version
              Prints release information.

       -wsdllocation location
              Specifies the @WebServiceClient.wsdlLocation value.

       -target
              Generates code according to the specified JAX-WS specification version. Version 2.0
              generates compliant code for the JAX-WS 2.0 specification.

       -quiet
              Suppresses the wsimport command output.

       Multiple JAX-WS and JAXB binding files can be specified using the -b option, and they can be
       used to customize various things such as package names and bean names. More information about
       JAX-WS and JAXB binding files can be found in the customization documentation at https://jax-
       ws.dev.java.net/nonav/2.1.1/docs/customizations.html

NONSTANDARD OPTIONS
       -XadditionalHeaders
              Maps headers not bound to a request or response message to Java method parameters.

       -Xauthfile file
              The WSDL URI that specifies the file that contains authorization information. This URI
              is in the following format:

              http://user-name:password@host-name/web-service-name>?wsdl.

       -Xdebug
              Prints debugging information.

       -Xno-addressing-databinding
              Enables binding of W3C EndpointReferenceType to Java.

       -Xnocompile
              Does not compile the generated Java files.

EXAMPLE
       The following example generates the Java artifacts and compiles the artifacts by importing
       http://stockquote.example.com/quote?wsdl

       wsimport -p stockquote http://stockquote.example.com/quote?wsdl

SEE ALSO
       • wsgen(1)

       • The Tools tab of Wsimport Ant Task page http://jax-
         ws.java.net/nonav/2.1.1/docs/wsimportant.html

       • The Users Guide tab of Catalog Support page http://jax-ws.java.net/nonav/2.1.1/docs/catalog-
         support.html

       • The Users Guide tab of WSDL Customization page http://jax-
         ws.java.net/nonav/2.1.1/docs/wsimportant.html

JDK 8                                      21 November 2013                                wsimport(1)
