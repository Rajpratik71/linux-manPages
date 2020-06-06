wx-config(1)                                   wxWidgets                                  wx-config(1)

NAME
       wx-config - wxWidgets configuration search and query tool

SYNOPSIS
       wx-config [ OPTIONS ... ] [ LIB ... ]

DESCRIPTION
       wx-config  returns  information about the wxWidgets libraries available on your system.  It may
       be used to retrieve the information you require to build applications using these libraries.

       Changing the library options you wish to use for an application  previously  involved  managing
       alternative  configurations by a system dependent means.  It is now possible to select from any
       of the configurations installed on your  system  via  this  single  tool.   You  can  view  all
       available  configurations  installed  in  the  system default prefix with the command wx-config
       --list and select from them by using the feature options described below.

       Optional LIB arguments (comma or space separated) may  be  used  to  specify  individually  the
       wxWidgets  component  libraries  that  you wish to use, or to specify additional components not
       usually included by default.  The magic token std may be used  to  import  all  libraries  that
       would be used by default if none were specified explicitly.
       eg.  wx-config --libs std,gizmos

OPTIONS
       wx-config  accepts the following options with no restrictions on their order as was required in
       previous releases:

   Installed root
       These options change or query the filesystem root for the operations listed below.

       --prefix[=PREFIX]
                      Without the optional argument, the current default prefix will  be  output.   If
                      the  argument is supplied, PREFIX will be searched for matching configs in place
                      of the default.  You may use both forms in the same command.

       --exec-prefix[=EXEC-PREFIX]
                      Similar to --prefix, but acts on the exec-prefix.  If not specified will default
                      to the value of prefix.

   Query options
       These  options  return  information  about the wxWidgets default version and installed alterna‐
       tives.

       --list         List all configs in prefix and show those that match any additional feature  op‐
                      tions given.

       --release      Output the wxWidgets release number.

       --version-full Output the wxWidgets version number in all its glory.

       --basename     Output the base name of the wxWidgets libraries.

       --selected-config
                      Output the signature of the selected wxWidgets library.  This is a string of the
                      form "port-unicode-version".

   Feature options
       These options select features which determine which wxWidgets configuration to use.

       --host=HOST    Specify a (POSIX extended) regex of host aliases to  match  for  cross  compiled
                      configurations.  eg. --host=i586-mingw32msvc, --host=.*  If unspecified, the de‐
                      fault is to match only configurations native to the build machine.

       --toolkit=TOOLKIT
                      Specify a (POSIX extended) regex of the toolkits to match.  The toolkit  is  re‐
                      sponsible for the look and feel of the compiled application.  eg. gtk, gtk2, mo‐
                      tif, msw.  If unspecified the default is to prefer the system  default  toolkit,
                      but to match any toolkit in the absence of a stricter specification.

       --version[=VERSION]
                      Without the optional argument, return the wxWidgets version.  If the argument is
                      supplied it specifies a (POSIX extended) regex of the versions to match.  If un‐
                      specified  the default is to prefer the system default version, but to match any
                      version in the absence of a stricter specification.

       --unicode[=yes|no]]
                      Specify the default character type for the  application.   If  unspecified,  the
                      system  default  will  be  preferred, but any type may match in the absence of a
                      stricter specification.

       --debug[=yes|no]]
                      Specify whether to create a debug or release build for the application.  If  un‐
                      specified,  the  system  default  (release)  will be preferred, but any type may
                      match in the absence of a stricter specification.

                      Debug versions are very useful for finding certain common ways of  misusing  the
                      wxWidgets  API,  and you are encouraged to use them during active development of
                      applications.  They are not binary compatible with release versions,  and  pack‐
                      ages built against wxWidgets debug builds should never be uploaded to Debian.

       --static[=yes|no]]
                      Specify  whether to statically or dynamically link wxWidgets libraries into your
                      application.  If unspecified, the system default (dynamic)  will  be  preferred,
                      but any type may match in the absence of a stricter specification.  Static link‐
                      ing is mainly useful still for cross ports not natively supported by Debian, and
                      can  be  hazardous  in  conjunction with the GTK toolkits.  Note that static li‐
                      braries are no longer included in the wxGTK packages.

   Compiler options
       These options generate output required to build an application  using  a  particular  wxWidgets
       configuration.

       --libs         Output link flags required for a wxWidgets application.

       --cppflags     Output parameters required by the C preprocessor.

       --cflags       Output parameters required by the C compiler.

       --cxxflags     Output parameters required by the C++ compiler.

       --cc           Output the name of the C compiler $(CC).

       --cxx          Output the name of the C++ compiler $(CXX).

       --ld           Output the linker command.

COPYRIGHT
       This  manpage  was written by Ron Lee <ron@debian.org> for the Debian GNU/Linux distribution of
       wxWidgets.  It may be freely distributed by anyone who finds it useful.

Debian GNU/Linux                              29 Sep 2004                                 wx-config(1)
