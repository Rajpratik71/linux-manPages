T1LIBCONFIG(8)                                                                             System Manager's Manual                                                                             T1LIBCONFIG(8)



NAME
       t1libconfig - create the t1lib.config and FontDataBase files for t1lib

SYNOPSIS
       t1libconfig [ -v,--version ] [ -h,--help ] --force ] [ fontdirectory...  ]

DESCRIPTION
       t1libconfig  scans  a list of directories for Type 1 fonts and font metric files, and generates a configuration file and font database file for the t1lib rasterizer library accordingly.  By default,
       it looks in all subdirectories of /usr/X11R6/lib/X11/fonts, and in /usr/lib/ghostscript.  Extra directories to search may be specified on the command line.  The t1libconfig script tries not to  scan
       the same directory twice (this is, however, not foolproof, since /usr/X11R6/lib/X11/fonts and /usr/lib/X11/fonts typically point to the same directory on GNU/Linux systems).

OPTIONS
       -v,--version
              Print the version of t1libconfig and exit.

       -h,--help
              Print help about usage and exit.

       --force
              Force the generation of new configuration files even if these files already exist on the system.

FILES
       /etc/t1lib/t1lib.config  Contains  configuration  information  for  t1lib,  including colon-separated lists of paths to Type 1 font files and font metrics files, and the location of the default font
                                database file

       /etc/t1lib/FontDataBase  Contains a list of the names of Type 1 font files to be used by t1lib.

AUTHOR
       David Huggins-Daines <dhd@debian.org>

SEE ALSO
       FontDataBase(5)




                                                                                                                                                                                               T1LIBCONFIG(8)
