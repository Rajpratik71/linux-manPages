FSTOBDF(1)                                                    General Commands Manual                                                   FSTOBDF(1)

NAME
       fstobdf - generate BDF font from X font server

SYNOPSIS
       fstobdf [ -server servername ] -fn fontname

       fstobdf -version

DESCRIPTION
       The  fstobdf  program  reads  a font from a font server and prints a BDF file on the standard output that may be used to recreate the font.
       This is useful in testing servers, debugging font metrics, and reproducing lost BDF files.

OPTIONS
       -server servername
               This option specifies the server from which the font should be read.  servername must be specified in one of the formats defined in
               the Font Server Names section of X(7).   If not specified, the server name in the FONTSERVER environment variable is used.

       -fn fontname
               This option specifies the font for which a BDF file should be generated.

       -version
               This option prints the program version and then exits without generating a BDF file.

ENVIRONMENT
       FONTSERVER
               The  default  server  to  use.  The server name must be specified in one of the formats defined in the Font Server Names section of
               X(7).

SEE ALSO
       xfs(1), bdftopcf(1), showfont(1), fslsfonts(1), X(7).

AUTHOR
       Olaf Brandt, Network Computing Devices
       Dave Lemke, Network Computing Devices

       Jim Fulton, MIT X Consortium

X Version 11                                                       fstobdf 1.0.6                                                        FSTOBDF(1)
