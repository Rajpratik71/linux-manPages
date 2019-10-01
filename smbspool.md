SMBSPOOL(8)                                                                              System Administration tools                                                                              SMBSPOOL(8)



NAME
       smbspool - send a print file to an SMB printer

SYNOPSIS
       smbspool {job} {user} {title} {copies} {options} [filename]

DESCRIPTION
       This tool is part of the samba(7) suite.

       smbspool is a very small print spooling program that sends a print file to an SMB printer. The command-line arguments are position-dependent for compatibility with the Common UNIX Printing System,
       but you can use smbspool with any printing system or from a program or script.

       DEVICE URI

       smbspool specifies the destination using a Uniform Resource Identifier ("URI") with a method of "smb". This string can take a number of forms:

              ·   smb://server[:port]/printer

              ·   smb://workgroup/server[:port]/printer

              ·   smb://username:password@server[:port]/printer

              ·   smb://username:password@workgroup/server[:port]/printer


       smbspool tries to get the URI from the environment variable DEVICE_URI. If DEVICE_URI is not present, smbspool will use argv[0] if that starts with “smb://” or argv[1] if that is not the case.

       Programs using the exec(2) functions can pass the URI in argv[0], while shell scripts must set the DEVICE_URI environment variable prior to running smbspool.

OPTIONS
              ·   The job argument (argv[1]) contains the job ID number and is presently not used by smbspool.

              ·   The user argument (argv[2]) contains the print user's name and is presently not used by smbspool.

              ·   The title argument (argv[3]) contains the job title string and is passed as the remote file name when sending the print job.

              ·   The copies argument (argv[4]) contains the number of copies to be printed of the named file. If no filename is provided then this argument is not used by smbspool.

              ·   The options argument (argv[5]) contains the print options in a single string and is currently not used by smbspool.

              ·   The filename argument (argv[6]) contains the name of the file to print. If this argument is not specified then the print file is read from the standard input.

VERSION
       This man page is part of version 4.9.1 of the Samba suite.

SEE ALSO
       smbd(8) and samba(7).

AUTHOR
       smbspool was written by Michael Sweet at Easy Software Products.

       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open Source project similar to the way the Linux kernel is
       developed.



Samba 4.9.1                                                                                       08/09/2019                                                                                      SMBSPOOL(8)
