schemagen(1)                                                  Java Web Services Tools                                                 schemagen(1)

NAME
       schemagen - Generates a schema for every name space that is referenced in your Java classes.

SYNOPSIS
       schemagen [ options ] java-files

       options
              The command-line options. See Options.

       java-files
              The Java class files to be processed.

DESCRIPTION
       The schema generator creates a schema file for each name space referenced in your Java classes. Currently, you cannot control the name of
       the generated schema files. To control the schema file names, see Using SchemaGen with Ant at
       http://jaxb.java.net/nonav/2.2.3u1/docs/schemagenTask.html

       Start the schema generator with the appropriate schemagen shell script in the bin directory for your platform. The current schema generator
       can process either Java source files or class files.

       schemagen.sh Foo.java Bar.java ...
       Note: Writing schema1.xsd

       If your java files reference other classes, then those classes must be accessible on your system CLASSPATH environment variable, or they
       need to be specified in the schemagen command line with the class path options. See Options. If the referenced files are not accessible or
       specified, then you get errors when you generate the schema.

OPTIONS
       -d path
              The location where the schemagen command places processor-generated and javac-generated class files.

       -cp path
              The location where the schemagen command places user-specified files.

       -classpath path
              The location where the schemagen command places user-specified files.

       -encoding encoding
              Specifies the encoding to use for apt or javac command invocations.

       -episode file
              Generates an episode file for separate compilation.

       -version
              Displays release information.

       -help
              Displays a help message.

SEE ALSO
       · Using SchemaGen with Ant at http://jaxb.java.net/nonav/2.2.3u1/docs/schemagenTask.html

       · Java Architecture for XML Binding (JAXB) at http://docs.oracle.com/javase/8/docs/technotes/guides/xml/jaxb/index.html

JDK 8                                                            21 November 2013                                                     schemagen(1)
