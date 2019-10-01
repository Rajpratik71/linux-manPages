
opauploadall(8)                                                                             IFSFFCLIRG (Man Page)                                                                             opauploadall(8)



NAME
       opauploadall



       (Linux)  Copies  one  or  more  files from a group of hosts to this system. Since the file name is the same on each host, a separate directory on this system is created for each host and the file is
       copied to it. This is a convenient way to upload log files or configuration files for review. This tool can also be used in conjunction with opadownloadall to upload a  host  specific  configuration
       file, edit it for each host, and download the new version to all the hosts.

       NOTE: To copy files from this host to hosts in the cluster, use opascpall or opadownloadall. user@ style syntax cannot be used when specifying filenames.


Syntax
       opauploadall [-rp] [-f hostfile] [-d upload_dir] [-h 'hosts'] [-u user] source_file... dest_file

Options
       --help    Produces full help text.

       -p        Performs copy in parallel on all hosts.

       -r        Performs recursive upload of directories.

       -f hostfile
                 Specifies the file with hosts in cluster.
                 Default is /etc/opa/hosts file.

       -h hosts  Specifies the list of hosts to upload from.

       -u user   Specifies the user to perform copy to. Default is current user code.

       -d upload_dir
                 Specifies the directory to upload to. Default is uploads. If not specified, the environment variable UPLOADS_DIR is used. If that is not exported, the default, /uploads, is used.

       source_file
                 Specifies the name of files to copy to this system, relative to the current directory. Multiple files may be listed.

       dest_file Specifies the name of the file or directory on this system to copy to. It is relative to  upload_dir/HOSTNAME .A local directory within  upload_dir/ is created for each hostname.


                 Each uploaded file is copied to upload_dir/HOSTNAME/dest_file within the local system.

                 If more than one source file is specified or dest_file has a trailing / , a dest_file directory will be created.

Example
       # upload two files from 2 hosts
       opauploadall -h 'arwen elrond' capture.tgz /etc/init.d/ipoib.cfg.

       # upload two files from all hosts
       opauploadall -p capture.tgz /etc/init.d/ipoib.cfg.

       # upload network config files from all hosts
       opauploadall capture.tgz /etc/init.d/ipoib.cfg pre-install

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts; used if -h option not supplied.


       HOSTS_FILE
                 File containing list of hosts; used in absence of -f and -h.


       UPLOADS_DIR
                 Directory to upload to, used in absence of -d.


       FF_MAX_PARALLEL
                 When the -p option is used, maximum concurrent operations are performed.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opauploadall(8)
