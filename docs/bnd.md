BND(1)                                                       BND for Debian GNU/Linux                                                       BND(1)

NAME
       bnd - Create and diagnose OSGi bundles.

SYNOPSIS
       bnd [general-options] [cmd] [cmd-options]

       bnd [general-options] <file>.jar

       bnd [general-options] <file>.bnd

DESCRIPTION
       The bnd tool helps you create and diagnose OSGi bundles. The key functions are:

        * Show the manifest and JAR contents of a bundle
        * Wrap a JAR so that it becomes a bundle
        * Create a Bundle from a specification and a class path
        * Verify the validity of the manifest entries

GENERAL OPTIONS
       --failok
           Same as the property --failok. The current run will create a JAR file even if there were errors.

       --exceptions
           Will print the exception when the software has ran into a bad exception and bails out. Normally only a message is printed. For
           debugging or diagnostic reasons, the exception stack trace can be very helpful.

       -f, --full
           Do full

       -p, --project <string>
           Identify another project

       -t, --test
           Build for test

       -o, --output <string>
           Specify the output file path. The default is output.jar in the current directory

COMMANDS
           Available commands:
             action            - Execute an action on a repo, or if no name is give, list
                                 the actions
             add               - Add a workspace, or a project or a plugin to the workspace
             baseline          - Compare a newer bundle to a baselined bundle and provide
                                 versioning advice
             bash              - Generate autocompletion file for bash
             bnd               - The swiss army tool for OSGi
             bootstrap         - Interactive gogo shell
             bsn2url           - From a set of bsns, create a list of urls if found in the repo
             build             - Build a project. This will create the jars defined in the
                                 bnd.bnd and sub-builders.
             buildx            - Build project, is deprecated but here for backward
                                 compatibility
             bump              - Bumps the version of a project
             changes           - Show the changes in this release of bnd
             clean             - Clean a project
             compile           - Compile a project or the workspace
             convert           - Converter to different formats
             copy              -
             create            - Create jar, used to support backward compatible java jar
                                 commands
             debug             - Show a lot of info about the project you're in
             defaults          -
             deliverables      - Show all deliverables from this workspace. with their
                                 current version and path.
             diff              - Diff jars
             digest            - Digests a number of files
             do                - Execute a file based on its extension. Supported
                                 extensions are: bnd (build), bndrun (run), and jar (print)
             eclipse           - Show info about the current directory's eclipse project
             ees               - Show the Execution Environments of a JAR
             enroute           - OSGi enRoute commands to maintain bnd workspaces (create
                                 workspace, add project, etc)
             export            -
             extract           - Extract files from a JAR file, equivalent jar command
                                 x[vf] (syntax supported)
             find              - Go through the exports and/or imports and match the given
                                 exports/imports globs. If they match, print the file,
                                 package and version.
             flatten           - Flatten a bundle by expanding all entries on the
                                 Bundle-ClassPath
             grep              - Grep the manifest of bundles/jar files.
             info              - Show key project variables
             junit             - Test a project with plain JUnit
             macro             - Show macro value
             maven             - Maven bundle command
             nexus             -
             package           - Package a bnd or bndrun file into a single jar that
                                 executes with java -jar <>.jar
             plugins           -
             print             - Printout the JAR
             profile           - Profile management. A profile is a JAR that only contains
                                 packages and capabilities
             project           - Execute a Project action, or if no parms given, show
                                 information about the project
             release           - Release this project
             remote            -
             remove            - Remove a project or a plugin from the workspace
             repo              - Manage the repositories
             resolve           -
             run               - Run a project in the OSGi launcher
             runtests          - Run OSGi tests and create report
             schema            - Highly specialized function to create an overview of
                                 package deltas in ees
             select            - Helps finding information in a set of JARs by filtering on
                                 manifest data and printing out selected information.
             settings          - Set bnd/jpm global variables
             source            - Merge a binary jar with its sources. It is possible to
                                 specify source path
             sync              - Execute a Project action, or if no parms given, show
                                 information about the project
             syntax            - Access the internal bnd database of keywords and options
             test              - Test a project according to an OSGi test
             type              - List files int a JAR file, equivalent jar command t[vf]
                                 (syntax supported)
             verify            - Verify jars
             version           - Show version information about bnd
             view              - View a resource from a JAR file.
             wrap              - Wrap a jar
             xref              - Show a cross references for all classes in a set of jars.

SEE ALSO
       <https://github.com/bndtools/bnd>

bnd-3.5.0                                                           2018-12-19                                                              BND(1)
