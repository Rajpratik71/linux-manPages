CVS-DEBC(1)                                                                              General Commands Manual                                                                              CVS-DEBC(1)

NAME
       cvs-debrelease - upload a cvs-buildpackage/cvs-debuild generated package

SYNOPSIS
       cvs-debrelease [cvs-debrelease options] [--dopts [dupload/dput options]]

DESCRIPTION
       cvs-debrelease  is  run  from  the  CVS  working directory after cvs-buildpackage or cvs-debuild.  It uses the cvs-buildpackage system to locate the .changes file generated in that run.  It then
       uploads the package using debrelease(1), which in turn calls either dupload or dput.  Note that the --dopts option must be specified to distinguish the cvs-debrelease options from the dupload or
       dput options.  Also, the devscripts configuration files will be read, as described in the debrelease(1) manpage.

       Note that unlike cvs-buildpackage, the only way to specify the source package name is with the -P option; you cannot simply have it as the last command-line parameter.

OPTIONS
       All  current  cvs-buildpackage  options  are  silently  accepted; however, only the ones listed below have any effect.  For more details on all of them, see the cvs-buildpackage(1) manpage.  All
       debrelease options (as listed below) are also accepted.

       --dupload, --dput
              This specifies which uploader program to use; the default is dupload.

       -adebian-architecture, -tGNU-system-type
              See dpkg-architecture(1) for a description of these options.  They affect the search for the .changes file.  They are provided to mimic the behaviour of dpkg-buildpackage when determining
              the name of the .changes file.

       -Mmodule
              The name of the CVS module.

       -Ppackage
              The name of the package.

       -Vversion
              The version number of the package.

       -Ttag  The CVS tag to use for exporting sources.

       -Rroot directory
              Root of the original sources archive.

       -Wwork directory
              The full path name for the cvs-buildpackage working directory.

       -xprefix
              This option provides the CVS default module prefix.

       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       --help, --version
              Show help message and version information respectively.

SEE ALSO
       cvs-buildpackage(1), cvs-debuild(1), debrelease(1)

AUTHOR
       cvs-buildpackage  was  written  by  Manoj  Srivastava,  and  the current version of debrelease was written by Julian Gilbey <jdg@debian.org>.  They have been combined into this program by Julian
       Gilbey.

DEBIAN                                                                                       Debian Utilities                                                                                 CVS-DEBC(1)
