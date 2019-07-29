SMBSPOOL(8)                                                 System Administration tools                                                SMBSPOOL(8)

NAME
       smbspool - send a print file to an SMB printer

SYNOPSIS
       smbspool {job} {user} {title} {copies} {options} [filename]

DESCRIPTION
       This tool is part of the samba(7) suite.

       smbspool is a very small print spooling program that sends a print file to an SMB printer. The command-line arguments are
       position-dependent for compatibility with the Common UNIX Printing System, but you can use smbspool with any printing system or from a
       program or script.

       DEVICE URI

       smbspool specifies the destination using a Uniform Resource Identifier ("URI") with a method of "smb". This string can take a number of
       forms:

       ·   smb://server[:port]/printer

       ·   smb://workgroup/server[:port]/printer

       ·   smb://username:password@server[:port]/printer

       ·   smb://domain\username:password@server[:port]/printer

       ·   smb://username:password@workgroup/server[:port]/printer

       smbspool tries to get the URI from the environment variable DEVICE_URI. If DEVICE_URI is not present, smbspool will use argv[0] if that
       starts with “smb://” or argv[1] if that is not the case.

       Programs using the exec(2) functions can pass the URI in argv[0], while shell scripts must set the DEVICE_URI environment variable prior to
       running smbspool.

       smbspool will accept URI escaped characters. This allows setting a domain in the username, or space in the printer name. For example
       smb://domain%5Cusername/printer%20name

OPTIONS
       ·   The job argument (argv[1]) contains the job ID number and is presently not used by smbspool.

       ·   The user argument (argv[2]) contains the print user's name and is presently not used by smbspool.

       ·   The title argument (argv[3]) contains the job title string and is passed as the remote file name when sending the print job.

       ·   The copies argument (argv[4]) contains the number of copies to be printed of the named file. If no filename is provided then this
           argument is not used by smbspool.

       ·   The options argument (argv[5]) contains the print options in a single string and is currently not used by smbspool.

       ·   The filename argument (argv[6]) contains the name of the file to print. If this argument is not specified then the print file is read
           from the standard input.

VERSION
       This man page is correct for version 3 of the Samba suite.

SEE ALSO
       smbd(8) and samba(7).

AUTHOR
       smbspool was written by Michael Sweet at Easy Software Products.

       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open
       Source project similar to the way the Linux kernel is developed.

       The original Samba man pages were written by Karl Auer. The man page sources were converted to YODL format (another excellent piece of Open
       Source software, available at ftp://ftp.icce.rug.nl/pub/unix/) and updated for the Samba 2.0 release by Jeremy Allison. The conversion to
       DocBook for Samba 2.2 was done by Gerald Carter. The conversion to DocBook XML 4.2 for Samba 3.0 was done by Alexander Bokovoy.

Samba 4.3                                                           05/23/2019                                                         SMBSPOOL(8)
