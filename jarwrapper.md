JARWRAPPER(1)                                                       Javahelper                                                       JARWRAPPER(1)

NAME
       jarwrapper - wrapper script to run jar files via binfmt.

SYNOPSIS
       jarwrapper <Jar-file> [arguments]

DESCRIPTION
       Wrapper script that handles running executable jar-files via binfmt. Normally you would not run this directly.

       Executes the java program in Jar-file (determined by the Main-Class attribute in the MANIFEST) and passes arguments to the java program.

       jarwrapper looks for a number of other attributes in the MANIFEST, please refer to javahelper's tutorials for more information.

SEE ALSO
       jardetector(1)

       The javahelper tutorials in /usr/share/doc/javahelper. These tutorials are available in the javahelper package.

0.54ubuntu1.1                                                       2016-04-28                                                       JARWRAPPER(1)
