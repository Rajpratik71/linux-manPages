REPORTER-UPLOAD(1)                                                                             LIBREPORT MANUAL                                                                            REPORTER-UPLOAD(1)



NAME
       reporter-upload - Uploads compressed tarball of problem directory.

SYNOPSIS
       reporter-upload [-c CONFFILE]... [-d DIR] [-u URL] [-b FILE] [-r FILE]

DESCRIPTION
       The tool is used to create a compressed tarball of the problem directory and upload it to a URL. Supported protocols include FTP, FTPS, HTTP, HTTPS, SCP, SFTP, TFTP and FILE.

   Configuration file
       Configuration file contains entries in a format "Option = Value".

       The options are:

       URL
           The URL where tarball should be uploaded.

       SSHPublicKey
           The SSH public key.

       SSHPrivateKey
           The SSH private key.

   Integration with ABRT events
       reporter-upload can be used as a reporter, to allow users to upload compressed tarballs of problem directories to a configured URL. This usage can be configured in /etc/libreport/report_event.conf:

           EVENT=report_Upload reporter-upload

       It can be also used on the post-create event to upload it automatically.

           EVENT=post-create reporter-upload

OPTIONS
       -d DIR
           Path to problem directory.

       -c CONFFILE
           Path to configuration file. When used in ABRT event system, the file contains site-wide configuration. Users can change the values via environment variables.

       -u URL
           The URL where tarball should be uploaded. URL should have form protocol://[user[:pass]@]host/dir/[file.tar.gz] where protocol can be http(s), ftp, scp, or file. File protocol can’t have user and
           host parts: file.tar.gz[1]. If URL ends with a slash, the archive name will be generated and appended to URL; otherwise, URL will be used as full file name.

       -b, --pubkey FILE
           Set SSH public key file.

       -r, --key FILE
           Set SSH private key file.

ENVIRONMENT VARIABLES
       Environment variables take precedence over values provided in the configuration file.

       Upload_URL
           The URL where should be the tarball uploaded.

       Upload_Username
           User name for the upload URL

       Upload_Password
           Password for the upload URL

       Upload_SSHPublicKey
           Path to SSH public key file

       Upload_SSHPrivateKey
           Path to SSH private key file

SEE ALSO
       uploader_event.conf(5)

AUTHORS
       ·   ABRT team

NOTES
        1. file.tar.gz
           file:///dir/



LIBREPORT 2.1.11.1                                                                                08/12/2019                                                                               REPORTER-UPLOAD(1)
