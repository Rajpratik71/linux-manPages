
opascpall(8)                                                                                IFSFFCLIRG (Man Page)                                                                                opascpall(8)



NAME
       opascpall



       (Linux)  Copies  files or directories from the current system to multiple hosts in the fabric. When copying large directory trees, use the -t option to improve performance. This option tars and com‐
       presses the tree, transfers the resulting compressed tarball to each node, and untars it on each node.

       Use this tool for copying data files, operating system files, or applications to all the hosts (or a subset of hosts) within the fabric.

       NOTE:


       ·      This tool can only copy from this system to a group of systems in the cluster. To copy from hosts in the cluster to this host, use opauploadall.

       ·      user@ style syntax cannot be used when specifying filenames.


Syntax
       opascpall [-p] [-r] [-f hostfile] [-h 'hosts'] [-u user]
       source_file ... dest_file



       opascpall [-t] [-p] [-f hostfile] [-h 'hosts'] [-u user]
       [ source_dir[ dest_dir]]



Options
       --help    Produces full help text.

       -p        Performs copy in parallel on all hosts.

       -r        Performs recursive copy of directories.

       -t        Performs optimized recursive copy of directories using tar. dest_dir is optional. If dest_dir is not specified, it defaults to the current directory name. If both source_dir  and  dest_dir
                 are omitted, they both default to the current directory name.


       -h hosts  Specifies the list of hosts to copy to.

       -f hostfile
                 Specifies the file with hosts in cluster. Default is /etc/opa/hosts file.

       -u user   Specifies the user to perform copy to. Default is current user code.

       source_file
                 Specifies the a file or list of source files to copy.


       source_dir
                 Specifies the name of the source directory to copy. If omitted. is used.


       dest_file or dest_dir
                 Specifies the name of the destination file or directory to copy to. If more than one source file, this must be a directory. If omitted current directory name is used.


Example
       # efficiently copy an entire directory tree
       opascpall -t -p /usr/src/opa/mpi_apps /usr/src/opa/mpi_apps

       # copy a group of files
       opascpall a b c /root/tools/

       # copy to an explitly specified set of hosts
       opascpall -h 'arwen elrond' a b c /root/tools
       HOSTS='arwen elrond' opascpall a b c /root/tools

Environment Variables
       The following environment variables are also used by this command:

       HOSTS     List of hosts; used if -h option not supplied.


       HOSTS_FILE
                 File containing list of hosts; used in absence of -f and -h.


       FF_MAX_PARALLEL
                 When the -p option is used, maximum concurrent operations are performed.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                                  opascpall(8)
