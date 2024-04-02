gacutil(Mono 1.0)                                                                                                                gacutil(Mono 1.0)

NAME
       gacutil - Global Assembly Cache management utility.

SYNOPSIS
       gacutil [-user] [command] [options]

DESCRIPTION
       gacutil  is  a  tool  used  by developers to install versioned assemblies into the system Global Assembly Cache (GAC) to become part of the
       assemblies that are available for all applications at runtime.

       Notice that they are not directly available to the compiler. The convention is that assemblies must also be placed in a separate  directory
       to be accessed by the compiler.  This is done with the -package directive to gacutil.

       The tool allows for installation, removal, and listing of the contents of the assembly cache.

       The GAC is relative to the Mono installation prefix: mono_prefix/lib/mono.

COMMANDS
       -i <assembly_path> [-check_refs] [-package NAME] [-root ROOTDIR] [-gacdir GACDIR]

        Installs an assembly into the global assembly cache. <assembly_path> is the name of the file that contains the assembly manifest

       The  -package  option  can  be  used  to  also  create  a directory in in prefix/lib/mono with the name NAME, and a symlink is created from
       NAME/assembly_name to the assembly on the GAC.  This is used so developers can reference a set of libraries at once.

       The -root option is used to specify the "libdir" value of an installation prefix which differs from the prefix of the system GAC.   Typical
       automake  usage is "-root $(DESTDIR)$(prefix)/lib".  To access assemblies installed to a prefix other than the mono prefix, it is necessary
       to set the MONO_GAC_PREFIX environment variable.

       The -gacdir option is included for backward compatibility but is not recommended for new code. Use the -root option instead.

       The -check_refs option is used to ensure that the assembly being installed into the GAC does not reference any non strong named assemblies.
       Assemblies being installed to the GAC should not reference non strong named assemblies, however the is an optional check.

       -l [assembly_name] [-root ROOTDIR] [-gacdir GACDIR]

       Lists the contents of the global assembly cache. When the <assembly_name> parameter is specified only matching assemblies are listed.

       -u <assembly_display_name> [-package NAME] [-root ROOTDIR] [-gacdir GACDIR]

       Uninstalls an assembly from the global assembly cache.  <assembly_display_name> is the name of the assembly (partial or fully qualified) to
       remove from the global assembly cache. If a partial name is specified all matching assemblies  will  be  uninstalled.  As  opposed  to  the
       install option that takes a filename, this takes as an argument the assembly name, which looks like this:
            MyLibrary.Something, version=1.0.0.0, publicKeyToken=xxxx,culture=neutral

       Notice that you can have spaces in the command line. There is no need to quote them.

       Performs a greedy removal. If you only specify one component like, "MyLibrary.Something", it will remove all versions of the library.

       -us  <assembly_path>  [-package  NAME]  [-root  ROOTDIR]  [-gacdir GACDIR] Uninstalls an assembly using the specified assembly's full name.
       <assembly path> is the path to an assembly. The full assembly name is retrieved from the specified assembly if there is an assembly in  the
       GAC with a matching name, it is removed. Unlike the -u option this option takes a file name, like this:
               Example: -us myDll.dll

       -ul <assembly_list_file> [-package NAME] [-root ROOTDIR] [-gacdir GACDIR] Uninstalls one or more assemblies from the global assembly cache.
       <assembly_list_file> is the path to a test file containing a list of assembly names on separate lines.
       Example -ul assembly_list.txt
       assembly_list.txt contents:
           assembly1,Version=1.0.0.0,Culture=en,PublicKeyToken=0123456789abcdef
           assembly2,Version=2.0.0.0,Culture=en,PublicKeyToken=0123456789abcdef

FILES
       On Unix assemblies are loaded from the installation lib directory.  If you set  `prefix'  to  /usr,  the  assemblies  will  be  located  in
       /usr/lib.  On Windows, the assemblies are loaded from the directory where mono and mint live.

       /etc/mono/config, ~/.mono/config

       Mono runtime configuration file.  See the mono-config(5) manual page for more information.

WEB SITE
       Visit: http://www.go-mono.com for details

SEE ALSO
       mcs(1),mono(1)

                                                                                                                                 gacutil(Mono 1.0)
