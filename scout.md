SCOUT(1)                                                                                  http://en.opensuse.org/Sco                                                                                 SCOUT(1)



NAME
       scout - A Package Scout

SYNOPSIS
       scout [global_options] {module} {search_term} [module_options]

OPTIONS
       The following options are available:

       global_options, module
           The global options are handled by scout itself.

           --format
               Specify the default output format. Choices are table (default), xml, csv. It´s a replacement of the older scoutcsv, scoutxml links.

           --help
               Print a brief help.

           --version
               Print version.
           The respective module to search for. The following modules are available:

           autoconf
               Search for autoconf macros inside m4 files.

           bin
               Search for binaries contained in packages.

           header
               Search for C/C++/Obj-C/Obj-C++ headers

           java
               Search for Java classes inside packaged JAR files.

           python
               Search for Python modules.

           webpin
               Search in packages using the Webpin webservice.

       search_term
           The term you are looking for.

       module_options
           Additional module options. At the moment these are:

           --listrepos
               list all available repositories

           --repos=REPO, -r REPO
               select a repository to search (use a name from the --listrepos output)

DESCRIPTION
       Scout is a tool to look for uninstalled packages. For example, which binary does a package provide, which Java classes are available and which autoconf macros does a package contain.

       To search for your requested term, you need index data files which are a preconfigured SQLite 3 database. You have to install these in order to get your search request done. Use the Scout OBS data
       repository[1] to get additional index files. See the Wiki page about Scout[2] for more information.

EXAMPLE 1: SEARCH FOR EXECUTABLES
       For example, to search for a sdl-config executable, you need the bin module:

           $ scout bin sdl-config

       You get the following output:

            repository | binary     | path                        | package
           ------------+------------+-----------------------------+-----------------
            suse110    | sdl-config | /usr/bin                    | SDL-devel
            suse110    | sdl-config | /usr/lib/baselibs-32bit/bin | SDL-devel-32bit

EXAMPLE 2: SEARCH FOR JAVA PACKAGES
       If you want to search for a Java package, use the following code:

           $ scout java org.apache.xml.serialize.Serializer

       You get:

            repository | package          | jar                 | class
           ------------+------------------+---------------------+------------------------------------------------
            jpackage17 | jboss4-testsuite | xerces.jar          | org.apache.xml.serialize.Serializer
            jpackage17 | jboss4-testsuite | xerces.jar          | org.apache.xml.serialize.SerializerFactory
            jpackage17 | jboss4-testsuite | xerces.jar          | org.apache.xml.serialize.SerializerFactoryImpl
            jpackage17 | xerces-j2        | xerces-j2-2.9.0.jar | org.apache.xml.serialize.Serializer
            jpackage17 | xerces-j2        | xerces-j2-2.9.0.jar | org.apache.xml.serialize.SerializerFactory
            jpackage17 | xerces-j2        | xerces-j2-2.9.0.jar | org.apache.xml.serialize.SerializerFactoryImpl

EXAMPLE 3: SEARCH THROUGH WEBPIN
       If you want to use the openSUSE Search Webservice[3]—also known as “Webpin”—use the following line:

           $ scout webpin docbook_5.xml

       You get:

            package   | version | arch   | repository URL                                                                    | matched files
           -----------+---------+--------+-----------------------------------------------------------------------------------+------------------------
            docbook_5 | 5.0     | noarch | http://download.opensuse.org/distribution/SL-OSS-factory/inst-source/suse         | /etc/xml/docbook_5.xml
            docbook_5 | 5.0CR7  | noarch | http://download.opensuse.org/repositories/home:/thomas-schraitle/openSUSE_Factory | /etc/xml/docbook_5.xml
            docbook_5 | 5.0     | noarch | http://download.opensuse.org/repositories/XML/xml-factory                         | /etc/xml/docbook_5.xml

BASH COMPLETION
       If you like to complete your options automatically through Bash, insert the following lines into your ~/.bashrc or /etc/bash.bashrc:

           if [ -f /etc/bash_completion.d/scout.sh ]; then
             . /etc/bash_completion.d/scout.sh
           fi

SEE ALSO
       command-not-found(1)

AUTHORS
       Pavol Rusnak <stick@gk2.sk>
           Developer

       Michal Vyskocil <mvyskocil@suse.cz>
           Developer

       Ales Nosek <anosek@suse.cz>
           Index data for Java

       Pascal Bleser <guru@unixtech.be>
           Webpin code

       Marek Stopka <mstopka@opensuse.org>
           Bash completion

       Thomas Schraitle <toms@suse.de>
           Docbook documentation

       Klaus Kaempf <kkaempf@suse.de>
           Help with python-satsolver

NOTES
        1. Scout OBS data repository
           http://download.opensuse.org/repositories/home:/prusnak:/scout/data

        2. Wiki page about Scout
           http://en.opensuse.org/Scout

        3. openSUSE Search Webservice
           http://software.opensuse.org/search



http://gitorious.org/opensus                                                                      08/07/2009                                                                                         SCOUT(1)
