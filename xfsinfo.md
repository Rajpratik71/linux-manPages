XFSINFO(1)                                                    General Commands Manual                                                   XFSINFO(1)

NAME
       xfsinfo - X font server information utility

SYNOPSIS
       xfsinfo [-server servername]

DESCRIPTION
       Xfsinfo is a utility for displaying information about an X font server.  It is used to examine the capabilities of a server, the predefined
       values for various parameters used in communicating between clients and the server, and the font catalogues and alternate servers that  are
       available.

OPTIONS
       -server servername
              This  option  specifies the X font server to contact.  servername must be specified in one of the formats defined in the Font Server
              Names section of X(7).   If not specified, the server name in the FONTSERVER environment variable is used.

       -version
              This option prints the program version and exits.

HISTORY
       Xfsinfo was originally called fsinfo.  It was renamed to avoid a clash with the fsinfo utility from the Berkeley automounter amd.

EXAMPLE
       The following shows a sample produced by xfsinfo.

       example% xfsinfo -server hansen:7100
       name of server:     hansen:7100
       version number:     1
       vendor string: Font Server Prototype
       vendor release number:   17
       maximum request size:    16384 longwords (65536 bytes)
       number of catalogues:    1
            all
       Number of alternate servers: 2
           #0    hansen:7101
           #1    hansen:7102
       number of extensions:    0

ENVIRONMENT
       FONTSERVER
               To get the default fontserver.  The server name must be specified in one of the formats defined in the Font Server Names section of
               X(7).

SEE ALSO
       xfs(1), fslsfonts(1), X(7).

AUTHOR
       Dave Lemke, Network Computing Devices, Inc

X Version 11                                                       xfsinfo 1.0.5                                                        XFSINFO(1)
