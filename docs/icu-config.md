
ICU-CONFIG(1)                                                                                  ICU 50.2 Manual                                                                                  ICU-CONFIG(1)



NAME
       icu-config - output ICU build options

SYNOPSIS
       icu-config [ --bindir ] [ --cc ] [ --cflags ] [ --cppflags ] [ --cppflags-searchpath ] [ --cxx ] [ --cxxflags ] [ --detect-prefix ] [ --exec-prefix ] [ --exists ] [ --help, -?, --usage ] [ --icudata
       ] [ --icudata-install-dir ] [ --icudata-mode ] [ --icudatadir ] [ --invoke ] [ --invoke=prog ] [ --ldflags ] [ --ldflags-layout ] [ --ldflags-libsonly ] [ --ldflags-searchpath ] [ --ldflags-system ]
       [ --ldflags-icuio ] [ --mandir ] [ --prefix ] [ --prefix=prefix ] [ --sbindir ] [ --shared-datadir ] [ --sysconfdir ] [ --unicode-version ] [ --version ] [ --incfile ]




DESCRIPTION
       icu-config  simplifies  the task of building and linking against ICU as compared to manually configuring user makefiles or equivalent.  Because icu-config is an executable script, it also solves the
       problem of locating the ICU libraries and headers, by allowing the system PATH to locate it.

EXAMPLES
       icu-config can be used without a makefile. The command line below is sufficient for building a single-file c++ program against ICU. (For example, icu/source/samples/props/props.cpp)

              `icu-config --cxx --cxxflags --cppflags --ldflags` -o props props.cpp

       More commonly, icu-config will be called from within a makefile, and used to set up variables. The following example also builds the props example.

              CC=$(shell icu-config --cc)

              CXX=$(shell icu-config --cxx)

              CPPFLAGS=$(shell icu-config --cppflags)

              CXXFLAGS=$(shell icu-config --cxxflags)

              LDFLAGS =$(shell icu-config --ldflags)

              all: props

              props.o: props.cpp

       make(1) will automatically use the above variables.

OPTIONS
       --bindir
              Prints the binary (executable) directory path. Normally equivalent to 'bin'.  ICU user-executable applications and scripts are found here.

       --cc   Print the C compiler used.  Equivalent to the $(CC) Makefile variable.

       --cflags
              Print the C compiler flags. Equivalent to the $(CFLAGS) Makefile variable.  Does NOT include preprocessor directives such as include path or defined symbols. Examples include  debugging  (-g)
              and optimization flags

       --cppflags
              Print the C preprocessor flags. Equivalent to the $(CPPFLAGS) Makefile variable. Examples are -I include paths  and -D define directives.

       --cppflags-searchpath
              Print the C preprocessor flags, as above but only -I search paths.

       --cxx  Print the C++ compiler. Equivalent to the $(CXX) Makefile variable.

       --cxxflags
              Print the C++ compiler flags. Equivalent to the $(CXXFLAGS) Makefile variable.

       --detect-prefix
              If  ICU  has been moved from its installed location, prepending this flag to other icu-config calls will attempt to locate ICU relative to where the icu-config script has been located. Can be
              used as a last-chance effort if the ICU install has been damaged.

       --exec-prefix
              Print the prefix used for executable program directories (such as bin, sbin, etc). Normally the same as the prefix.

       --exists
              Script will return with a successful (0) status if ICU seems to be installed and located correctly, otherwise an error message and nonzero status will be displayed.

       --help, -?,--usage
              Print a help and usage message.

       --icudata
              Print the shortname of the ICU data file. This does not include any suffix such as .dat, .dll, .so, .lib, .a, etc nor does it include prefixes such as 'lib'.  It may be in the form icudt21b

       --icudata-install-dir
              Print the directory where ICU packaged data should be installed.   Can use as pkgdata(1)'s --install option.

       --icudata-mode
              Print the default ICU pkgdata mode, such as dll or common.  Can use as pkgdata(1)'s --mode option.

       --icudatadir
              Print the path to packaged archive data.  (should be where $ICU_DATA or equivalent default path points.)  Will NOT point to the libdir.

       --invoke
              If ICU is not installed in a location where the operating system will locate its shared libraries, this option will print out commands so as to set the appropriate  environment  variables  to
              load ICU's shared libraries. For example, on many systems a variable named LD_LIBRARY_PATH or equivalent must be set.

       --invoke=prog
              Same  as the --invoke option, except includes options for invoking a program named prog.  If prog is the name of an ICU tool, such as genrb(1), then icu-config will also include the full path
              to that tool.

       --ldflags
              Print any flags which should be passed to the linker. These may include -L for library search paths, and -l for including ICU libraries. By default, this option will attempt to  link  in  the
              "common"  (libicuuc) and "i18n" (libicui18n) libraries, as well as the data library. If additional libraries are required, any of the following two flags may be added in conjunction with this
              one, for example "--ldflags --ldflags-icuio" if the icuio library is required in addition to the standard ICU libraries.  Equivalent to the $(LDFLAGS) Makefile variable.

       --ldflags-layout
              Prints the link option for the ICU layout library.

       --ldflags-icuio
              Prints the link option to add the ICU I/O package

       --ldflags-libsonly
              Similar to --ldflags but only includes the -l options.

       --ldflags-searchpath
              Similar to --ldflags but only includes the -L search path options.

       --ldflags-system
              Similar to --ldflags but only includes system libraries (such as pthreads) --mandir Prints the location of the installed ICU man pages. Normally (man)

       --prefix
              Prints the prefix (base directory) under which the installed ICU resides.

       --prefix=prefix
              Sets the ICU prefix to prefix for the remainder of this command line.  Does test whether the new prefix is valid.

       --sbindir
              Prints the location of ICU system binaries, normally (sbin)

       --shared-datadir
              Prints the location of ICU shared data, normally (share)

       --sysconfdir
              Prints the location of ICU system configuration data, normally (etc)

       --unicode-version
              Prints the Version of the Unicode Standard which the current ICU uses.

       --version
              Prints the current version of ICU.

       --incfile
              Prints the 'Makefile.inc' path, suitable for use with pkgdata(1)'s -O option.

AUTHORS
       Steven Loomis

VERSION
       50.2

COPYRIGHT
       Copyright (C) 2002-2004 IBM, Inc. and others.




ICU MANPAGE                                                                                      17 May 2004                                                                                    ICU-CONFIG(1)
