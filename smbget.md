SMBGET(1)                                                          User Commands                                                         SMBGET(1)

NAME
       smbget - wget-like utility for download files over SMB

SYNOPSIS
       smbget [-a, --guest] [-r, --resume] [-R, --recursive] [-u, --username=STRING] [-p, --password=STRING] [-w, --workgroup=STRING]
        [-n, --nonprompt] [-d, --debuglevel=INT] [-D, --dots] [-P, --keep-permissions] [-o, --outputfile] [-f, --rcfile] [-q, --quiet]
        [-v, --verbose] [-b, --blocksize] [-O, --stdout] [-U, --update] [-?, --help] [--usage] {smb://host/share/path/to/file} [smb://url2/] [...]

DESCRIPTION
       This tool is part of the samba(7) suite.

       smbget is a simple utility with wget-like semantics, that can download files from SMB servers. You can specify the files you would like to
       download on the command-line.

       The files should be in the smb-URL standard, e.g. use smb://host/share/file for the UNC path \\\\HOST\\SHARE\\file.

OPTIONS
       -a, --guest
           Work as user guest

       -r, --resume
           Automatically resume aborted files

       -R, --recursive
           Recursively download files

       -u, --username=STRING
           Username to use

       -p, --password=STRING
           Password to use

       -w, --workgroup=STRING
           Workgroup to use (optional)

       -n, --nonprompt
           Don't ask anything (non-interactive)

       -d, --debuglevel=INT
           Debuglevel to use

       -D, --dots
           Show dots as progress indication

       -P, --keep-permissions
           Set same permissions on local file as are set on remote file.

       -o, --outputfile
           Write the file that is being downloaded to the specified file. Can not be used together with -R.

       -O, --stdout
           Write the file that is being downloaded to standard output.

       -f, --rcfile
           Use specified rcfile. This will be loaded in the order it was specified - e.g. if you specify any options before this one, they might
           get overridden by the contents of the rcfile.

       -q, --quiet
           Be quiet

       -v, --verbose
           Be verbose

       -b, --blocksize
           Number of bytes to download in a block. Defaults to 64000.

       -?, --help
           Show help message

       --usage
           Display brief usage message

       -U, --update
           Download only when remote file is newer than local file or local file is missing.

       -e|--encrypt
           This command line parameter requires the remote server support the UNIX extensions or that the SMB3 protocol has been selected.
           Requests that the connection be encrypted. Negotiates SMB encryption using either SMB3 or POSIX extensions via GSSAPI. Uses the given
           credentials for the encryption negotiation (either kerberos or NTLMv1/v2 if given domain/username/password triple. Fails the connection
           if encryption cannot be negotiated.

SMB URLS
       SMB URL's should be specified in the following format:

           smb://[[[domain;]user[:password@]]server[/share[/path[/file]]]]

           smb:// means all the workgroups

           smb://name/ means, if name is a workgroup, all the servers in this workgroup, or if name is a server, all the shares on this server.

EXAMPLES
           # Recursively download 'src' directory
           smbget -R smb://rhonwyn/jelmer/src
           # Download FreeBSD ISO and enable resuming
           smbget -r smb://rhonwyn/isos/FreeBSD5.1.iso
           # Recursively download all ISOs
           smbget -Rr smb://rhonwyn/isos
           # Backup my data on rhonwyn
           smbget -Rr smb://rhonwyn/

BUGS
       Permission denied is returned in some cases where the cause of the error is unknown (such as an illegally formatted smb:// url or trying to
       get a directory without -R turned on).

VERSION
       This man page is correct for version 3 of the Samba suite.

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open
       Source project similar to the way the Linux kernel is developed.

       The smbget manpage was written by Jelmer Vernooij.

Samba 4.3                                                           05/23/2019                                                           SMBGET(1)
