vbnc(1)                                                       General Commands Manual                                                      vbnc(1)

NAME
       vbnc, vbnc2 - Mono Visual Basic Compiler.

SYNOPSIS
       vbnc [option] [source-files]

DESCRIPTION
       (vbnc) is a CIL compiler for the VisualBasic.NET language.

       Applications developed on Windows with vbc can execute on Mono and applications compiled with 'vbnc' can be executed on .NET runtime.

       The  Mono  Visual  Basic compiler accepts the same options as the Microsoft VB.NET compiler. Those options can start with a slash or a dash
       (/checked is the same as -checked).

       Visual Basic.NET source files normally ends with a ".vb" extension.  Compilation of VB.NET source code requires all the files that make  up
       a  library, module or executable to be provided on the command line.  There is no support for partial compilation.  To achieve the benefits
       of partial compilation, you should compile programs into their own assemblies, and later reference them with the "-r" flag.

       The Mono Basic compiler generates images (.exe files) that contain CIL byte code that can be executed by any system that implements a  Com‐
       mon  Language  Infrastructure  virtual machine such as the Microsoft .NET runtime engine on Windows or the Mono runtime engine on Unix sys‐
       tems.  Executables are not bound to a specific CPU or operating system.

       The Mono Basic compiler by  default  only  references  these  assemblies:  mscorlib.dll,  Microsoft.VisualBasic.dll,  System.dll  and  Sys‐
       tem.Xml.dll.  If you want to reference extra libraries you must manually specify them using the the -r: command line option.

       The vbnc compiler is used to compile against the latest available profile (currently the 4.0 profile).

       The vbnc2 compiler is used to compile against the 2.0 profile.

OPTIONS
       -addmodule:MODULE1[,MODULE2]
              Includes the specified modules in the resulting assembly.

       -codepage:ID
              Specifies  the  code  page used to process the input files from the point it is specified on.  By default files will be processed in
              the current code page.  The compiler will also automatically detect Unicode/UTF8 files that have an embedded byte mark at the begin‐
              ning.

       Other popular encodings are 28591 (Latin1), 1252 (iso-8859-1) and 65001 (UTF-8).

       -define:SYMLIST, -d:SYMLIST
              Defines the symbol listed by the semi-colon separeted list SYMLIST SYMBOL.  This can be tested in the source code by the pre-proces‐
              sor, or can be used by methods that have been tagged with the Conditional attribute.

       -debug:AMOUNT
              Specify the amount of debugging information to emit. Possible values for AMOUNT are "full" and "pdbonly".

       -imports:import-list
              Declare global Imports for listed namespaces.

       -ignorewarn:XXXX
              Ignores warning number XXXX.

       -lib:PATHLIST, -libpath:PATHLIST
              Each path specified in the comma-separated list will direct the compiler to look for libraries in that specified path.

       -main:CLASS
              Tells the compiler which CLASS or MODULE contains the entry point. Useful when you are compiling several classes with a Main method.

       -nologo
              Suppress printing copyright information on startup.

       -nostdlib, -nostdlib+
              Use this flag if you want to compile the core library.  This makes the compiler load its internal types from the assembly being com‐
              piled.

       -noconfig, -noconfig+
              Disables the default compiler configuration to be loaded.  The compiler by default has references to the system assemblies.

       -nowarn
              Makes the compiler ignore warnings.

       -optioncompare:binary, -optioncompare:text
              Select between binary and text string comparisons. The default is binary string comparisons.

       -optionexplicit[+|-]
              Require explicit declaration of variables

       -optionstrict[+|-]
              Enforce strict language semantics

       -out:FNAME, -o FNAME
              Names the output file to be generated.

       -q -quiet
              Commands the compiler to show only error messages for syntax-related errors and warnings.

       -resource:RESOURCE[,ID]
              Embeds  to  the  given  resource file.  The optional ID can be used to give a different name to the resource.  If not specified, the
              resource name will be the file name.

       -linkresource:RESOURCE[,ID]
              Links to the specified RESOURCE.  The optional ID can be used to give a name to the linked resource.

       -r:ASSEMBLY1[,ASSEMBLY2], -r ASSEMBLY1[,ASSEMBLY2]
              Reference the named assemblies.  Use this to use classes from the named assembly in your program.  The assembly will be loaded  from
              either the system directory where all the assemblies live, or from the path explicitly given with the -L option.

       You can also use a semicolon to separate the assemblies instead of a comma.

       -sdkpath:PATH
              Sets  the  path to the required framework assemblies (mscorlib.dll and Microsoft.VisualBasic.dll). To compile to a different profile
              than the default, use this option to the path to the mscorlib.dll of the profile you want to compile to.

       -removeintchecks[+|-]
              Remove integer checks. Default off.

       -rootnamespace:namespace
              Specifies the root namespace for all type declarations

       -target:KIND, -t:KIND
              Used to specify the desired target.  The possible values are: exe (plain executable),  winexe  (Windows.Forms  executable),  library
              (component libraries) and module (partial library).

       -utf8output[+|-]
              Emit compiler output in UTF8 character encoding. Currently ignored.

       --version
              Shows the compiler version.

       -warnaserror, -warnaserror+
              Treat warnings as errors.

STABILITY
       As  of early 2011, the Mono Visual Basic compiler is still considered beta software. The compiler is feature-complete (targeting the Micro‐
       soft Visual Basic 8 compiler), however crashes are still occuring, most notably with incorrect code.

AUTHORS
       See the ChangeLog for authors

LICENSE
       The Mono Visual Basic compiler is released under the terms of the GNU LGPL.  Alternative licenses are available from Novell.

SEE ALSO
       mcs(1), mono(1), mint(1), sn(1)

BUGS
       To report bugs in the compiler, you can file bug reports in our bug tracking system: http://bugzilla.ximian.com.

MAILING LIST
       The Mono Basic Mailing List is available at: mono-vb-list-request@ximian.com

                                                                 21 February 2006                                                          vbnc(1)
