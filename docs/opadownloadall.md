
opadownloadall(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opadownloadall(8)



NAME
       opadownloadall



       (Linux)  Copies  one or more files to a group of hosts from a system. Since the file contents to copy may be different for each host, a separate directory on this system is used for the source files
       for each host. This can also be used in conjunction with opauploadall to upload a host-specific configuration file, edit it for each host, and download the new version to all the hosts.

       NOTE: The tool opadownloadall can only copy from this system to a group of hosts in the cluster. To copy files from hosts in the cluster to this host, use opauploadall.



Syntax
       opadownloadall [-rp] [-f hostfile] [-d download_dir] [-h 'HOSTS']
       [-u user] source_file ... dest_file

Options
       --help    Produces full help text.


       -r        Performs recursive download of directories.


       -p        Performs copy in parallel on all hosts.


       -f hostfile
                 Specifies the file with hosts in cluster. Default is /etc/opa/hosts.


       -d download_dir
                 Specifies the directory to download files from. Default is downloads. If not specified, the environment variable DOWNLOADS_DIR is used. If that is not exported, the default is used.


       -h HOSTS  Specifies the list of hosts to download files to.


       -u user   Specifies the user to perform the copy. Default is the current user code.





       NOTE: The user@ style syntax cannot be used in the arguments to opadownloadall.



       source_file
                 Specifies the list of source files to copy from the system.


                 The option  source_file is relative to  download_dir/hostname. A local directory within download_dir/ must exist for each host being downloaded to. Each  downloaded  file  is  copied  from
                 download_dir/hostname/source_file.

       dest_file Specifies the name of the file or directory on the destination hosts to copy to.


                 If  more  than  one  source  file is specified, dest_file is treated as a directory name. The given directory must already exist on the destination host. The copy fails for hosts where the
                 directory does not exist.

Example
       opadownloadall -h 'arwen elrond' irqbalance vncservers /etc
       # Copies two files to 2 hosts

       opadownloadall -p irqbalance vncservers /etc
       # Copies two files to all hosts

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts; used if -h option not supplied.


       HOSTS_FILE
                 File containing list of hosts; used in absence of -f and -h.


       FF_MAX_PARALLEL
                 When the -p option is used, the maximum concurrent operations are performed.


       DOWNLOADS_DIR
                 Directory to download from, used in absence of -d.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opadownloadall(8)
