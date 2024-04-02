cimmof(1)                                                                                                                                                                                           cimmof(1)



NAME
       cimmof - compile MOF files into the CIM Repository

SYNOPSIS
       cimmof -h | --help

       cimmof --version

       cimmof [ -w ] [ -E ] [ -uc ] [ -aE | -aV | -aEV ] [ -I path ]
              [ -n namespace ] [ --namespace namespace ] [ --xml ]
              [ --trace ] [ mof_file ... ]

   Remarks
       Only a superuser or user with write access to the default or specified namespace can run the cimmof command to compile MOFs in the CIM Repository.

       Superclasses must be compiled before subclasses, else the compile will fail.

       It is strongly recommended that MOF files include all necessary subclasses, so they can compile properly even if certain classes are not in the CIM Repository.

DESCRIPTION
       The  cimmof  command  is  the command line interface to the Managed Object Format (MOF) Compiler.  The MOF Compiler is a utility that compiles MOF files (using the MOF format defined by the DMTF CIM
       Specification) into CIM classes and instances that are stored in the CIM Repository.

       The cimmof command can be used to compile MOF files at any time after installation.  If no input file is specified, stdin is used as the input.

       The MOF Compiler requires that the input MOF files be in the current directory or that a fully qualified path be given.  To simplify the specification of multiple MOF files  in  the  cimmof  command
       line, the MOF Compiler allows compiling from files containing a list of MOF files using the include pragma (as shown below).

              #pragma include ("application.mof")
              #pragma include ("server.mof")

       MOF files using the include pragma must be in the current directory or in a directory specified by the -I command line option.

       The  -n  option can be used to specify a R namespace in which the CIM classes and instances will be compiled.  If this option is not specified, the default R namespace is root/cimv2 (with the excep‐
       tion of provider registration schemas).

       For provider registration schemas, if the -n option is not specified, the default R namespace is root/PG_InterOp.  If -n option is specified, the R namespace specified must be root/PG_InterOp,  oth‐
       erwise,  the  error message "The requested operation is not supported." is returned.   For provider MOFs, the R namespace specified must match one of the namespaces specified in the PG_ProviderCapa‐
       bilities class schema definition.

   Options
       The cimmof command recognizes the following options:

              -aE            Allow Experimental Schema changes.

              -aEV           Allow both Experimental and Version Schema changes.

              -aV            Allow both Major and Down Revision Schema changes.

              -E             Syntax check only

              -h, --help     Display command usage information.

              -I path        Specify the path to included MOF files.  This path may be relative or absolute.

                             If the input MOF file has include pragmas and the included files do not reside in the current directory, the directive must be used to specify a path to them on the cimmof com‐
                             mand line.

              -n             Override  the  default  CIM  Repository  namespace. The namespace specified  must be a valid CIM namespace name.  For the definition of a valid CIM namespace name, refer to the
                             Administrator's Guide.  For provider registration schemas, the namepace specified must be root/PG_InterOp.

              --namespace    Override the default CIM Repository namespace. The namespace specified  must be a valid CIM namespace name.  For the definition of a valid CIM  namespace  name,  refer  to  the
                             Administrator's Guide.  For provider registration schemas, the namepace specified must be root/PG_InterOp.

              --trace        Trace to file (default to stdout)

              -uc            Allow update of an existing class definition.

              --version      Display CIM Server version.

              -w             Suppress warning messages.

                             When compiling the MOF files, if there are CIM elements (such as classes, instances, properties, or methods) defined in the MOF files which already exist in the CIM Repository,
                             the cimmof command returns warning messages.  The -w option can be used to suppress these warning messages.

              --xml          Output XML only, to stdout. Do not update repository.

EXIT STATUS
       The cimmof command returns one of the following values:

              0      Successful completion
              1      Error

       When an error occurs, an error message is written to stderr and an error value of 1 is returned.

USAGE NOTES
       The cimmof command requires that the CIM Server is running.  If an operation requires more than two minutes to be processed, the cimmof command prints a timeout message and returns an error value.

DIAGNOSTICS
       Error trying to create Repository in path localhost:5988: Cannot connect to: localhost:5988 Failed to set DefaultNamespacePath.

              The CIM Server is not running.  Start the CIM Server with the command and re-run cimmof .

       If the MOF Compiler detects an error in the MOF file while parsing the file, a parsing error is returned with the line number of the MOF file containing the error.

       Operation cannot be carried out since the specified superclass does not exist.

              The MOF Compiler compiled a MOF file with superclasses that were not in the CIM Repository.

       For a list of possible error messages that may be returned, refer to the Chapter on WBEM messages in the Administrator's Guide.

EXAMPLES
       Compile a MOF file into the default namespace in the CIM Repository, issue the cimmof command with no options.

              cimmof processInfo.mof

       Compile the MOF files into the "root/application" namespace.

              cimmof -nroot/application test1.mof test2.mof

       Compile the MOF file defined in the directory ./MOF with the name CIMSchema25.mof, and containing include pragmas for other MOF files also in the ./MOF directory.

              cimmof -w -I./MOF MOF/CIMSchema25.mof

       Display Usage Info for the cimmof command.

              cimmof -h

SEE ALSO
       cimserver(1).



                                                                                                                                                                                                    cimmof(1)
